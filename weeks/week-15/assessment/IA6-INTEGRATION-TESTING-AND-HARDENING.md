# IA6 Integration Testing and Hardening

## Identification

- Student: Malapote, Xhyrone Wayne N.
- Course and section: BSIT 3-A
- Project: Project 8 Student Clearance Workflow
- Week: 15 Integration Testing and Security Hardening
- Branch: `week-15-testing-hardening`
- Baseline: `2fe765ac2d82037fda596443339c87db12087f7f`
- Verification period: 10 to 11 November 2026, Asia/Manila

## Executive summary

Week 15 converted the continuing Student Clearance Workflow into a traceable integration test and hardening package. A versioned Postman 2.1 collection covers normal, invalid, boundary, unauthenticated, forbidden, cross-student, cross-office, not-found, duplicate, completion, defensive-header, and rate-limit behavior. Laravel feature tests verify protected database state, automation failures, secure exchange, and the five hardening changes. Flutter tests verify the required client states, and genuine browser captures verify selected desktop and narrow layouts.

Five ranked weaknesses were fixed. The focused suite changed from 6 failed tests and 20 assertions to 6 passed tests and 52 assertions. The final collection passed 36 requests and 234 assertions. The complete Laravel regression passed 53 tests with 254 assertions, and the Flutter regression passed 14 tests. These results support the bounded controlled build; they do not establish production readiness, institutional acceptance, large-scale performance, or external-service reliability.

## Scope and strategy

The workflow under test begins with clearance initiation and continues through office review, deficiency resolution, approval, and completion. Authorization tests include another student attempting an owned action, an office reviewer attempting another office's task, and non-administrators attempting administrator functions. Reliability coverage includes unavailable active offices, timeout behavior, transient retry recovery, exhausted retries, immediate permanent failure, and human-action routing.

The selected strategy uses four layers:

1. The Postman-compatible collection verifies the public HTTP contract.
2. Laravel feature tests verify database state, authorization, transactions, retry bounds, and duplicate-effect protection.
3. Flutter widget tests verify deterministic loading, empty, authentication, authorization, network, timeout, server-error, and recovery presentation.
4. Genuine browser checks verify selected responsive layouts and real user feedback.

A collection-only approach was rejected because it could not reliably prove rollback, no partial records, bounded retry history, or Flutter state rendering. The complete decision, alternatives, ownership, exit criteria, and eighteen-case matrix are recorded in `WEEK15-TEST-STRATEGY.md`.

## Controlled data and environment

Testing used only fictional identities under `example.test`, a controlled academic term, four fictional clearing offices, disposable test databases, and local controlled services. The collection environment template contains blank sensitive values. Generated passwords and tokens were held only for the local run and were not preserved in source, screenshots, or exported evidence.

The verified baseline environment was PHP 8.2.12, Composer 2.10.2, Flutter 3.47.8, Dart 3.13.7, Git 2.55.0.windows.3, Node.js 24.19.0, and npm 11.17.0. The detailed environment and timestamp record is in `../evidence/logs/LABORATORY-LOG.md`.

## API collection

The collection contains 36 requests in five ordered groups:

- authentication and controlled identities;
- initiation, retrieval, and duplicate protection;
- invalid, unauthenticated, forbidden, cross-office, and not-found paths;
- deficiency, cross-student denial, resolution, re-review, approval, completion, and administrator failure review;
- six repeated failed logins ending with the safe `429 RATE_LIMITED` contract.

The collection asserts status codes, standard response envelopes, correlation identifiers, important fields, defensive headers, and the normal workflow sequence. The no-secrets environment and execution guide are stored in `../evidence/api-tests/`.

Timeout and dependency failures are not exposed through a public test endpoint. They remain verified by Laravel feature tests and controlled adapters because adding a public failure switch would expand the application attack surface.

## Requirements and results

| Area | Representative requirement | Expected result | Actual evidence | Outcome |
| --- | --- | --- | --- | --- |
| Normal workflow | Student initiates and completes one clearance | One workflow, one task per active office, final completion after all approvals | Collection and Laravel regression | Pass |
| Validation | Missing, malformed, too short, or over-maximum input | `422`, safe field errors, no partial state | Collection and feature tests | Pass |
| Authentication | Missing, revoked, or invalid credentials | `401` or generic credential response, no protected data | Collection and authentication tests | Pass |
| Function authorization | Student calls office or administrator action | `403`, no privileged effect | Collection and role tests | Pass |
| Object authorization | Peer student or wrong office acts on an owned object | Non-disclosing forbidden outcome, no mutation | Collection and ownership assertions | Pass |
| Not found | Unknown route or route-bound model | Safe correlated `404`, no framework details | Focused hardening and collection | Pass |
| Duplicate | Exact retry and conflicting duplicate | Exact replay returns original result; changed key conflicts; no duplicate effects | Focused hardening and database assertions | Pass |
| Reliability | Timeout, unavailable dependency, transient and permanent failure | Bounded processing, safe signal, recovery or one human-action item | Automation and secure-exchange tests | Pass |
| Security controls | Rate limits and response headers | Safe `429`; defensive headers; HTTPS-only HSTS | Focused hardening and collection | Pass |
| Flutter states | Loading, empty, forbidden, not-found, network, timeout, server failure, recovery | Understandable bounded feedback and retry where appropriate | Eight focused tests | Pass |
| Responsive layout | Desktop login and narrow unavailable-service state | Readable form and actionable safe message | Two genuine browser captures | Executed |

## Defects findings and hardening changes

The pre-fix focused tests established six observable contract gaps across five ranked weaknesses. The implemented changes were:

1. Safe correlated not-found envelopes for unknown API routes and missing route-bound models.
2. Exact idempotent replay returning the existing clearance without duplicate tasks or events.
3. Layered account/IP and broader IP login limits with a standard correlated `429` response.
4. A normalized bounded login request using the project's standard validation envelope.
5. API-only defensive response headers, with HSTS limited to secure requests.

The ranked rationale, test names, and residual risks are in `WEEK15-HARDENING-REGISTER.md`. The same focused suite was rerun after implementation, then the public collection and complete regressions were executed.

## Preserved failures and recovery

Three collection runs were retained instead of hidden:

- The initial run inserted generated passwords into raw JSON without escaping JSON-significant characters. The collection was corrected to derive escaped runtime variables.
- A sandbox run placed the server and runner in separate network contexts, producing no responses. Both processes were restarted in the same controlled context.
- A run passed 231 of 234 assertions but used Laravel's per-request `array` cache, which could not retain rate-limit counters across HTTP requests. The final isolated run used the migrated database cache and passed all 234 assertions.

These were test-tool or environment findings, not relabeled application vulnerabilities. Application weaknesses are recorded separately in the hardening register. The raw reports are retained under `../evidence/test-results/`.

## Regression evidence

| Verification | Actual result |
| --- | --- |
| Focused hardening before | 6 failed, 20 assertions |
| Focused hardening after | 6 passed, 52 assertions |
| Postman 2.1 collection | 36 requests, 234 assertions, 0 failures |
| Complete Laravel suite | 53 passed, 254 assertions |
| Laravel Pint | Pass |
| Composer locked audit | No known vulnerability advisories reported |
| Flutter analysis | No issues found |
| Focused Week 15 Flutter suite | 8 passed |
| Complete Flutter suite | 14 passed |

During the final 18 November review, Composer identified low-severity `CVE-2026-128083` in locked Laravel 12.70.2. The framework was updated within the existing Laravel 12 constraint to 12.73.0, the lockfile validated, and the complete backend regression passed again with 53 tests and 254 assertions. The final Composer audit reported no known advisories.

Machine-readable outputs are stored in `../evidence/test-results/`. The evidence index maps each result, screenshot, source artifact, and limitation.

## Flutter Web verification

The added Week 15 widget file verifies loading-to-empty behavior, an empty assigned-office queue, forbidden role exit, safe correlated not-found presentation, network recovery after retry, bounded timeout feedback, server-failure distinction, and an empty administrator state. The complete Flutter suite contains 14 passing tests.

The genuine desktop capture shows the real Flutter login. The genuine narrow capture shows the running client after the controlled HTTPS API was unavailable: one safe actionable message remained visible after a repeated attempt, the fictional email was visible, and the password remained obscured. This capture proves presentation and retry feedback, not a successful live backend journey.

## Security privacy and evidence integrity

- No production endpoint, live credential, private key, real student record, or populated sensitive environment value is included.
- The final API report contains no bearer token, access-token value, or one-time password.
- Failed results are preserved and distinguished from corrected reruns.
- Source screenshots are paired with executable results and are not treated as behavior proof by themselves.
- The central DOCX remains outside Git, while its source screenshots remain in the repository.

## Remaining risks

- The controlled local environment is not a production university system.
- The fixed-window local limiter is not a distributed gateway.
- Local HTTP does not demonstrate HTTPS; HTTPS-only behavior is verified by focused tests and the prior controlled transport arrangement.
- The notification adapter and secure receiver are classroom substitutes.
- Large-scale concurrency, production monitoring, and deployment readiness belong to later authorized evaluation.
- The missing focused-test terminal screenshot remains a manual evidence gap; machine-readable Flutter results are present and the gap is documented without fabricating a capture.
- Instructor review, student reflection, technical defense, and submission acceptance remain human actions.

## Reproduction guide

Backend regression:

```text
cd backend
php artisan test
vendor/bin/pint --test
composer audit --locked --no-interaction
```

Flutter regression:

```text
cd frontend
flutter analyze
flutter test
```

The API collection requires a freshly seeded disposable local database, a persistent cross-request cache such as the migrated database store, locally entered fictional passwords, and ordered execution. The complete safe procedure is in `../evidence/api-tests/WEEK15-API-TEST-GUIDE.md`.

## Maintainability and next verification

The focused hardening tests should remain part of regression whenever error envelopes, authentication, rate control, idempotency, or middleware changes. The versioned collection should be updated when routes or schemas change. Flutter state tests should remain deterministic and browser screenshots should be recaptured only when visible behavior changes.

Before broader use, an authorized maintainer should verify the same package in a controlled nonproduction deployment, including reverse-proxy behavior, distributed rate limits, operational logs, and concurrency. Those steps are not claimed by this Week 15 local evidence.

## Student reflection and individual contribution

The following prompts require the student's own verified wording before submission:

1. Which Week 15 decision had the greatest effect on reliability or security, and which artifact changed or confirmed your view?
2. Which failure was hardest for you to reproduce, and how would you improve that test?
3. Which exact file or test can you explain and modify independently?
4. What should an authorized maintainer verify next, and why is it outside this evidence?

The student must reproduce selected checks and ensure the answers reflect personal understanding. No completed reflection or viva is claimed here.

## References and acknowledgment

- Postman Learning Center for collection and test-run practices.
- OWASP API Security Top 10 for authorization, authentication, and unsafe-consumption risks.
- OWASP Application Security Verification Standard 4.0.3 for verification coverage.
- Official Laravel and Flutter documentation matching the installed versions.

AI assistance supported planning, code review, implementation support, evidence organization, and drafting. The student remains responsible for inspecting, executing, understanding, personalizing, acknowledging, and defending the submitted work under institutional policy.
