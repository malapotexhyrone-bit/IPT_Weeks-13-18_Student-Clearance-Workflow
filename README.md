# PFEBSIT 002 Weeks 13-18 Student Clearance Workflow

This repository is the continuing Project 8 Student Clearance Workflow for PFEBSIT 002 Weeks 13-18. Each completed week is preserved as a named Git tag and GitHub release so its submitted source and evidence remain reproducible while the system advances in later weeks.

## Weekly versions

| Week | Version | Module title | Status |
| --- | --- | --- | --- |
| 13 | `v13.0.0-week13-automation` | Advanced Automation and Scripting | Complete |
| 14 | `v14.0.0-week14-secure-integration` | Secure Data Exchange and Encryption | Tagged; GitHub Release missing |
| 15 | `v15.0.0-week15-testing-hardening` | Integration Testing and Security Hardening | Technical package ready for final student review; not tagged or released |
| 16 | `v16.0.0-week16-performance-deployment` | Performance Reliability and Deployment Evaluation | Not started |
| 17 | `v17.0.0-week17-uat-documentation-evaluation` | Final Integration UAT Documentation and Evaluation | Not started |
| 18 | `v18.0.0-week18-final-review-defense` | Final Integration Review Examination and Technical Defense | Not started |

Week 13 and Week 14 are preserved by immutable tags. The public GitHub release endpoint reports no release for the Week 14 tag, so this repository does not claim that release exists. Week 15 continues from the synchronized Week 14 baseline on `week-15-testing-hardening`.

## Current status

Week 15, **Integration Testing and Security Hardening**, is technically implemented and verified in the controlled local environment. Five ranked weaknesses were corrected. The focused suite passes 6 tests with 52 assertions, the Postman-compatible collection passes 36 requests with 234 assertions, and the complete backend suite passes 53 tests with 254 assertions. Pint, the locked Composer audit, and Flutter analysis pass. The Flutter regression passes 14 tests, including eight focused Week 15 loading, empty, authorization, not-found, network, timeout, server-error, and recovery scenarios.

The complete Week 15 package is committed and pushed at `ec402134e297671b8aace89c938193fbd12b0ae2`. Activity 1, Activity 2, IA6, the weekly summary, and the mapped evidence package are organized under `weeks/week-15/`. The final audit remediated `CVE-2026-128083` by updating Laravel from 12.70.2 to 12.73.0; the post-update audit is clean and the backend regression still passes. The immutable tag and GitHub Release require separate later approval. The student reflection and one optional manual terminal screenshot remain student actions. The student confirmed instructor approval and registration for Project 8; the official registry itself was not inspected.

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
docs/                          preserved earlier-week decisions and reports
weeks/
  week-15/
    activities/                Activity 1 and Activity 2 interpretations
    assessment/                IA6, strategy, and hardening register
    diagrams/                  system, trust-boundary, and Flutter flow design
    evidence/
      api-tests/               controlled data and executed collection
      logs/                    laboratory and recovery record
      screenshots/             genuine setup, source, test, and application captures
      test-results/            baseline, failures, targeted, and regression evidence
    WEEK-15-SUMMARY.md
    SUBMISSION-CHECKLIST.md
evidence/week-14/
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

The current Week 15 backend regression result is 53 passing tests with 254 assertions. The focused hardening suite passes 6 tests with 52 assertions after a preserved six-failure pre-fix run. The executed API collection passes 36 requests with 234 assertions. Laravel Pint, Flutter analysis, and the locked Composer audit pass; the complete Flutter regression passes 14 tests. Genuine Week 15 browser evidence covers the desktop login and a narrow unavailable-service state. Machine-readable results and limitations are indexed under `weeks/week-15/evidence/`.

## Data and safety

Only fictional test data is permitted. No production university system, real student record, live credential, or production endpoint is connected. Logs must use correlation identifiers and exclude passwords, tokens, keys, and unnecessary personal data.

## AI acknowledgment

AI assistance is used for planning, implementation support, documentation, and review. The student must inspect, run, understand, and defend the submitted work under institutional policy.
