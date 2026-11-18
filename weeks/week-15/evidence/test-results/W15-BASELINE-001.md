# Week 15 Pre Change Baseline

- Executed: 2026-11-10 Asia/Manila
- Build: `2fe765ac2d82037fda596443339c87db12087f7f`
- Branch at execution: `main` before creation of `week-15-testing-hardening`
- Data boundary: Laravel test database and controlled fictional Flutter fakes

| Command | Expected result | Actual result | Outcome |
| --- | --- | --- | --- |
| `php artisan test` | Existing regression passes before Week 15 changes | 47 tests passed, 201 assertions, 12.56 seconds | pass |
| `vendor/bin/pint --test` | Existing PHP formatting passes | passed | pass |
| `composer audit --locked --no-interaction` | No known locked dependency advisory | No security vulnerability advisories found | pass |
| `flutter analyze` | No analyzer issue | No issues found in 2.0 seconds | pass |
| `flutter test` | Existing widget suite passes | 6 tests passed | pass |

## Observed limitations

- This baseline proves only the existing suites; it does not prove the new Week 15 collection or planned hardening tests.
- The current Flutter suite covers login validation, generic invalid credentials, and role-bound views but not every required transient state.
- The current backend suite is strong on workflow, ownership, retries, and secure exchange but has no dedicated security-header or correlated JSON not-found assertion.
- Newer Flutter packages were reported but are outside current dependency constraints; no vulnerability was inferred from version availability alone.
