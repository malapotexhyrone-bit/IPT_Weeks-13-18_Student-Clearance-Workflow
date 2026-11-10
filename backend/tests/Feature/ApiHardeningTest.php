<?php

namespace Tests\Feature;

use App\Models\AcademicTerm;
use App\Models\Office;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Str;
use Laravel\Sanctum\Sanctum;
use Tests\TestCase;

class ApiHardeningTest extends TestCase
{
    use RefreshDatabase;

    public function test_api_responses_include_defensive_headers_and_https_hsts(): void
    {
        $response = $this->withServerVariables(['HTTPS' => 'on'])
            ->getJson('/api/v1/me');

        $response
            ->assertUnauthorized()
            ->assertHeader('X-Content-Type-Options', 'nosniff')
            ->assertHeader('X-Frame-Options', 'DENY')
            ->assertHeader('Referrer-Policy', 'no-referrer')
            ->assertHeader('Permissions-Policy', 'camera=(), microphone=(), geolocation=()')
            ->assertHeader('Cache-Control', 'no-store, private')
            ->assertHeader(
                'Strict-Transport-Security',
                'max-age=31536000; includeSubDomains',
            );
    }

    public function test_unknown_api_route_returns_a_safe_correlated_json_error(): void
    {
        $correlationId = (string) Str::ulid();

        $this->withHeader('X-Correlation-ID', $correlationId)
            ->getJson('/api/v1/does-not-exist')
            ->assertNotFound()
            ->assertHeader('X-Correlation-ID', $correlationId)
            ->assertJsonPath('error.code', 'RESOURCE_NOT_FOUND')
            ->assertJsonPath('error.message', 'The requested resource was not found.')
            ->assertJsonPath('error.correlation_id', $correlationId)
            ->assertJsonMissingPath('message');
    }

    public function test_missing_route_model_does_not_expose_model_details(): void
    {
        $office = Office::query()->create([
            'code' => 'LIBRARY',
            'name' => 'Library',
            'sort_order' => 10,
            'is_active' => true,
        ]);
        Sanctum::actingAs(User::factory()->create([
            'role' => User::ROLE_OFFICE,
            'office_id' => $office->id,
        ]));

        $response = $this->postJson('/api/v1/office-tasks/999999/approve');

        $response
            ->assertNotFound()
            ->assertJsonPath('error.code', 'RESOURCE_NOT_FOUND')
            ->assertJsonPath('error.message', 'The requested resource was not found.');
        $this->assertStringNotContainsString('App\\Models', $response->getContent());
        $this->assertStringNotContainsString('999999', $response->getContent());
    }

    public function test_login_validation_uses_the_standard_correlated_error_contract(): void
    {
        $correlationId = (string) Str::ulid();

        $this->withHeader('X-Correlation-ID', $correlationId)
            ->postJson('/api/v1/auth/login', [
                'email' => 'not-an-email',
                'password' => '',
            ])
            ->assertUnprocessable()
            ->assertHeader('X-Correlation-ID', $correlationId)
            ->assertJsonPath('error.code', 'VALIDATION_FAILED')
            ->assertJsonPath('error.correlation_id', $correlationId)
            ->assertJsonValidationErrors(['email', 'password'], 'error.fields');
    }

    public function test_rate_limit_response_uses_the_standard_correlated_error_contract(): void
    {
        for ($attempt = 1; $attempt <= 5; $attempt++) {
            $this->withServerVariables(['REMOTE_ADDR' => '198.51.100.88'])
                ->postJson('/api/v1/auth/login', [
                    'email' => 'missing@example.test',
                    'password' => 'incorrect',
                ])
                ->assertUnauthorized();
        }

        $response = $this->withServerVariables(['REMOTE_ADDR' => '198.51.100.88'])
            ->postJson('/api/v1/auth/login', [
                'email' => 'missing@example.test',
                'password' => 'incorrect',
            ]);

        $response
            ->assertTooManyRequests()
            ->assertHeader('Retry-After')
            ->assertJsonPath('error.code', 'RATE_LIMITED')
            ->assertJsonPath('error.message', 'Too many requests. Try again later.');
        $this->assertNotEmpty($response->json('error.correlation_id'));
    }

    public function test_same_idempotency_key_replays_the_existing_clearance_without_duplicates(): void
    {
        $term = AcademicTerm::query()->create([
            'code' => '2026-2027-1',
            'name' => 'First Semester 2026-2027',
            'is_active' => true,
        ]);
        foreach ([
            ['code' => 'LIBRARY', 'name' => 'Library', 'sort_order' => 10],
            ['code' => 'REGISTRAR', 'name' => 'Registrar', 'sort_order' => 20],
        ] as $data) {
            Office::query()->create([...$data, 'is_active' => true]);
        }
        Sanctum::actingAs(User::factory()->create(['role' => User::ROLE_STUDENT]));
        $headers = ['Idempotency-Key' => 'week15-replay-001'];

        $created = $this->withHeaders($headers)
            ->postJson('/api/v1/clearances', ['term_code' => $term->code])
            ->assertCreated();

        $this->withHeaders($headers)
            ->postJson('/api/v1/clearances', ['term_code' => $term->code])
            ->assertOk()
            ->assertJsonPath('data.id', $created->json('data.id'))
            ->assertJsonPath('meta.replayed', true);

        $this->assertDatabaseCount('clearances', 1);
        $this->assertDatabaseCount('office_tasks', 2);
        $this->assertDatabaseCount('clearance_events', 1);

        $this->withHeader('Idempotency-Key', 'week15-conflict-001')
            ->postJson('/api/v1/clearances', ['term_code' => $term->code])
            ->assertConflict()
            ->assertJsonPath('error.code', 'CLEARANCE_ALREADY_EXISTS');
    }
}
