# Changelog

This changelog follows the continuing Weeks 13-18 Student Clearance Workflow. Each completed week is preserved by its own version tag and GitHub release.

## Unreleased - Week 15 Integration Testing and Security Hardening

### Prepared

- Created `week-15-testing-hardening` from the fetched and synchronized Week 14 baseline at `2fe765a`.
- Verified the existing baseline: 47 Laravel tests with 201 assertions, Laravel Pint, locked Composer audit, Flutter analysis, and six Flutter widget tests pass.
- Added a layered test-strategy decision record, eighteen-case requirements-to-test traceability matrix, measurable acceptance criteria, and honest pre-execution limitations.
- Added system and Flutter flow diagrams covering trust boundaries, credentials, sensitive data, dependencies, logs, failure paths, recovery, and human decisions.
- Added a Week 15 laboratory log, controlled fictional dataset, evidence index, and pre-change baseline record.
- Recorded that the Week 14 tag exists while its matching public GitHub Release is absent; no release was created without approval.

### Added

- Added a Postman 2.1 collection with 36 requests, a no-secrets local environment template, and 234 passing assertions against a disposable local database.
- Added six focused API hardening tests, a ranked five-item hardening register, and preserved before/after JUnit evidence.
- Added safe correlated API not-found and rate-limit responses, standard login validation, defensive response headers, and exact idempotent replay without duplicate workflow records.
- Added a second fictional student to verify cross-student object authorization.
- Preserved collection execution failures and corrected reruns without exposing generated credentials or tokens.
- Added eight focused Flutter widget scenarios for loading, empty, forbidden, not-found, network, timeout, server-error, and retry/recovery states.
- Added genuine desktop login and responsive unavailable-HTTPS-API browser captures from the actual Flutter Web build.

### Verified

- Focused hardening: 6 passed, 52 assertions after the preserved 6-failure pre-fix run.
- Full backend regression: 53 passed, 254 assertions.
- Pint, Composer locked audit, and Flutter analysis pass; the complete Flutter regression passes 14 tests.
- The API hardening checkpoint was approved, committed as `138adc9eab16f2cd0a7dc1c42eac69e7b30cb43b`, and pushed to `origin/week-15-testing-hardening`.

### Pending

- Approval before staging, committing, or pushing the Flutter/browser evidence checkpoint.
- Activities, IA6, reflection, central evidence completion, test-result screenshot, and final portfolio.

## Unreleased - Week 14 Secure Data Exchange and Encryption

### Added

- Administrator-only secure-exchange sender and HMAC-authenticated controlled receiver.
- Minimized clearance payload protected with AES-256-GCM authenticated encryption.
- Certificate-validated local HTTPS scripts, ignored key material, and safe configuration placeholders.
- Short request and message validity windows, unique receipt storage, and replay rejection.
- Safe receipt records containing message metadata and a payload hash without plaintext or ciphertext.
- Twelve focused security tests covering the success path and eleven adverse or authorization cases.
- Password login with Laravel hashing, generic invalid-credential responses, five-attempt-per-minute throttling, two-hour Sanctum tokens, and token revocation on logout.
- Responsive Flutter sign-in screen whose dashboard is selected only from the server-owned role and office assignment.
- Administrator Flutter action for the protected clearance exchange plus a safe local fictional-password reset tool.
- Five authentication tests and six Flutter widget tests; the full backend suite now passes 47 tests and 201 assertions.
- Six visually inspected real Flutter browser captures covering desktop/narrow login, invalid credentials, student role, Library role, and an accepted administrator secure exchange.
- Consolidated Week 14 report covering both activities, SA8, IA5, threat and risk records, decisions, reproduction, limitations, and defense preparation.
- Added controlled Flutter Web evidence for validation, loading, empty, authorization, and network-error presentation, with the simulation boundary recorded separately from live backend evidence.

### Security

- Updated Symfony HTTP Foundation, HTTP Kernel, Routing, and YAML from 7.4.22 to 7.4.23 after Composer reported seven advisories published on 4 November 2026.
- Re-ran Composer audit with no known advisories, Laravel Pint, and the complete 47-test, 201-assertion regression suite.

### Pending

- Student-verified reflection, final tag, and release. The combined central evidence DOCX is complete outside Git, and the final evidence/handoff checkpoint is pushed.

## v13.0.0-week13-automation - Week 13 Advanced Automation and Scripting

### Added

- Fresh Week 13 repository connected to the supplied GitHub remote.
- Laravel 12 backend scaffold compatible with the installed PHP 8.2 runtime.
- Flutter Web-only frontend scaffold.
- MariaDB/MySQL example configuration without secrets.
- Week 13 scope, trigger decision, retry policy, screen flow, API draft, activity record, and evidence index.
- Laravel Sanctum token-authentication foundation and student role middleware.
- MariaDB migrations for offices, academic terms, role assignments, clearances, office tasks, and correlated clearance events.
- Fictional seed records for four clearing offices, one active term, and the three bounded roles.
- Transactional `POST /api/v1/clearances` with validation, correlation identifiers, idempotency-key hashing, duplicate protection, and safe errors.
- Seven clearance-initiation feature tests covering the normal path and six adverse paths.
- Deficiency records with open/resolved states and controlled resolution notes.
- Assigned-office deficiency reporting and approval APIs plus owning-student resolution API.
- Transactional task state transitions, correlated audit events, and single final clearance completion.
- Nine office-workflow feature tests covering normal, unauthorized, invalid, and completion paths.
- Scheduled office reminders, stalled-task escalation, and idempotent completion-notification records.
- Database-backed delivery attempts with structured safe logs, bounded backoff, and duplicate-effect guards.
- Controlled transient recovery and permanent-failure routing to a human-action item.
- Administrator-only failure inspection and eligible manual retry with preserved history.
- Ten automation feature tests; the full regression suite now passes 28 tests and 117 assertions.
- Responsive Flutter Web role selection and student, office-reviewer, and administrator dashboards.
- Flutter API client with in-memory demo tokens and safe loading, empty, validation, unavailable-service, and authorization states.
- Local-only fictional demo-session endpoint plus role-scoped current-user, current-clearance, and assigned-office task reads.
- CORS configuration for the controlled local Flutter origins.
- Four Flutter widget tests and four Laravel integration tests; the full backend suite now passes 32 tests and 134 assertions.
- Labeled real application screenshots for role selection, normal creation, validation, authorization failure, and unavailable-service recovery.

### Student-owned follow-up

- Personalize the reflection, reproduce the checks, rehearse the defense walkthrough, and confirm the instructor's required submission format.

### Future versions

- Week 14 through Week 18 are not implemented in this version. They will be added only through their respective approved weekly work.
