# Week 15 API Hardening and Regression Results

## Identification and boundary

- Student: Malapote, Xhyrone Wayne N.
- Course and section: BSIT 3-A
- Project: Project 8 Student Clearance Workflow
- Executed: 2026-11-10, Asia/Manila
- Branch: `week-15-testing-hardening`
- Controlled data: fictional `example.test` identities and disposable SQLite databases only

This record covers the API collection, focused hardening tests, and complete regression checks for the second Week 15 checkpoint. It does not claim production, external-service, UAT, or stakeholder evidence.

## Results

| Check | Actual result | Evidence |
| --- | --- | --- |
| Pre-fix hardening suite | 6 failed, 20 assertions | `W15-HARDENING-BEFORE.xml` |
| Post-fix hardening suite | 6 passed, 52 assertions | `W15-HARDENING-AFTER.xml` |
| Postman 2.1 / Newman API run | 36 requests, 234 assertions, 0 failed | `W15-API-RUN-SUMMARY.json` |
| Complete Laravel regression | 53 passed, 254 assertions | `W15-BACKEND-REGRESSION.xml` |
| Laravel Pint | passed | `LABORATORY-LOG.md` |
| Composer locked audit | no known vulnerability advisories | `LABORATORY-LOG.md` |
| Flutter analysis | no issues | `LABORATORY-LOG.md` |
| Existing Flutter widget regression | 6 passed | `LABORATORY-LOG.md` |

## Preserved failed runs and corrections

1. `W15-API-RUN-BEFORE.json` preserves the first collection run. Runtime passwords containing JSON-significant characters were inserted into raw JSON without escaping, so login requests failed and caused cascading failures. The collection now derives an escaped runtime variable before each login.
2. `W15-API-RUN-INFRASTRUCTURE-FAILURE.json` preserves a no-response run caused by the approved runner and local server occupying different sandbox network contexts. Both were restarted in the same controlled context.
3. `W15-API-RUN-NONPERSISTENT-CACHE-FAILURE.json` preserves a 231/234 assertion run. The server used Laravel's per-request `array` cache, so the sixth failed login could not observe the previous five counters. The final isolated run used the migrated database cache and the safe `429 RATE_LIMITED` contract passed.

These are test-tool and controlled-environment findings; they are not relabeled as application defects. The application weaknesses and corrections are ranked separately in `../../../docs/WEEK15-HARDENING-REGISTER.md`.

## Security and limitations

- The committed environment template contains zero populated passwords, tokens, or secrets.
- The final JSON report contains no bearer token, access-token value, or one-time password.
- No temporary credential file remained after execution; generated credentials were held only in process memory.
- Timeout, unavailable-dependency, transient recovery, bounded retry, and permanent human-action paths remain covered by the Laravel automation and secure-exchange suites. No public failure-injection endpoint was added.
- Local HTTP on port 8015 is not HTTPS or production evidence. HTTPS-specific HSTS behavior is asserted by the focused Laravel test.
