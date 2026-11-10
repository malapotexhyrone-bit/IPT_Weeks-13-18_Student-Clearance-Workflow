<?php

namespace App\Providers;

use App\Contracts\NotificationGateway;
use App\Services\LocalAuditNotificationGateway;
use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Str;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->bind(NotificationGateway::class, LocalAuditNotificationGateway::class);
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        RateLimiter::for('login', function (Request $request): array {
            $email = Str::lower(trim((string) $request->input('email')));
            $ip = $request->ip();

            return [
                Limit::perMinute(5)->by("login-account:{$email}|{$ip}"),
                Limit::perMinute(30)->by("login-ip:{$ip}"),
            ];
        });
    }
}
