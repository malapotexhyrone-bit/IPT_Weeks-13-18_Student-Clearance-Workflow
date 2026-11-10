# PFEBSIT 002 Weeks 13-18 Student Clearance Workflow

This repository is the continuing Project 8 Student Clearance Workflow for PFEBSIT 002 Weeks 13-18. Each completed week is preserved as a named Git tag and GitHub release so its submitted source and evidence remain reproducible while the system advances in later weeks.

## Weekly versions

| Week | Version | Module title | Status |
| --- | --- | --- | --- |
| 13 | `v13.0.0-week13-automation` | Advanced Automation and Scripting | Complete |
| 14 | `v14.0.0-week14-secure-integration` | Secure Data Exchange and Encryption | Tagged; GitHub Release missing |
| 15 | `v15.0.0-week15-testing-hardening` | Integration Testing and Security Hardening | API hardening checkpoint ready for review |
| 16 | `v16.0.0-week16-performance-deployment` | Performance Reliability and Deployment Evaluation | Not started |
| 17 | `v17.0.0-week17-uat-documentation` | Final Integration UAT Documentation and Evaluation | Not started |
| 18 | `v18.0.0-week18-final-defense` | Final Integration Review Examination and Technical Defense | Not started |

Week 13 and Week 14 are preserved by immutable tags. The public GitHub release endpoint reports no release for the Week 14 tag, so this repository does not claim that release exists. Week 15 continues from the synchronized Week 14 baseline on `week-15-testing-hardening`.

## Current status

Week 15, **Integration Testing and Security Hardening**, has a pushed preparation checkpoint and a locally verified API hardening checkpoint ready for student review. Five ranked weaknesses were corrected. The focused suite now passes 6 tests with 52 assertions, the Postman-compatible collection passes 36 requests with 234 assertions, and the complete backend suite passes 53 tests with 254 assertions. Pint, the locked Composer audit, Flutter analysis, and six existing Flutter widget tests also pass.

The API hardening result is local and not yet staged, committed, or pushed. Required Flutter state expansion, genuine hardening/browser screenshots, Activity 1, Activity 2, IA6, reflection, and the final evidence document remain subject to later checkpoints. The student confirmed instructor approval and registration for Project 8; the official registry itself was not inspected.

## Approved stack

- Flutter 3.47.8 and Dart 3.13.7 for the browser client
- Laravel 12 on PHP 8.2.12 for the API and automation
- XAMPP MariaDB 10.4.32 using the MySQL driver
- Git tags and GitHub releases preserving one verified version for each completed week

Laravel 12 was selected because it supports PHP 8.2. Laravel 13 requires PHP 8.3 and is therefore not used in this environment.

## Repository layout

```text
backend/                       Laravel API and automation
frontend/                      Flutter Web client
docs/                          decisions, activities, and weekly report
evidence/
  week-15/
    api-tests/                 controlled data and planned collection
    logs/                      failure injection and recovery records
    screenshots/               genuine setup, source, test and application captures
    test-results/              executed baseline and regression evidence
  week-14/
    screenshots/source-code/  real VS Code captures
    screenshots/application/  real browser captures
    screenshots/setup/        setup proof
    screenshots/tests/        real verification captures
    api-tests/                 repeatable request evidence
    logs/                      sanitized execution logs
    test-results/              saved test output
```

## Local setup

1. Start MySQL from XAMPP.
2. Create a controlled local database named `student_clearance_workflow`.
3. In `backend`, copy `.env.example` to `.env` and run `php artisan key:generate`.
4. Keep local credentials only in `.env`; never commit that file.
5. Run `composer install`, then `php artisan migrate --seed` to create the schema and fictional demonstration records.
6. Generate the controlled localhost certificate and ignored secrets by following `docs/WEEK14-SECURE-EXCHANGE-DESIGN.md` and the scripts under `tools/`.
7. Start the certificate-validated HTTPS endpoint on `https://localhost:8443` with the Week 14 local HTTPS script.
8. Run the sender/receiver demonstration only with fictional seeded data.
9. Run `php tools/reset-demo-password.php <fictional-email>` to generate a one-time-displayed local password; only its hash is stored.
10. In `frontend`, run `flutter pub get`, then `flutter run -d chrome --web-port=7357 --dart-define=API_BASE_URL=https://localhost:8443/api/v1`. The browser must trust the controlled localhost certificate; do not bypass certificate warnings for final evidence.

## Verification

```text
cd backend
php artisan test

cd ../frontend
flutter analyze
flutter test
```

The current backend regression result is 47 passing tests with 201 assertions. This includes five authentication tests with 31 assertions and 12 secure-exchange tests. The authentication suite covers server-owned role selection, password hashing, generic wrong/unknown-account errors, validation, throttling, logout, and revoked-token rejection. Laravel Pint and Flutter analysis pass; all six Flutter widget tests pass. Composer reports no known advisories after the affected Symfony packages were updated to 7.4.23. Six real end-to-end browser states and five additional controlled Flutter UI states were visually inspected without exposing passwords. The controlled states use intercepted fictional responses to verify validation, loading, empty, authorization, and network-error presentation; they are not represented as live backend results.

## Data and safety

Only fictional test data is permitted. No production university system, real student record, live credential, or production endpoint is connected. Logs must use correlation identifiers and exclude passwords, tokens, keys, and unnecessary personal data.

## AI acknowledgment

AI assistance is used for planning, implementation support, documentation, and review. The student must inspect, run, understand, and defend the submitted work under institutional policy.
