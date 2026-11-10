# Week 15 Laboratory Log

## Identification

- Student: Malapote, Xhyrone Wayne N.
- Course and section: BSIT 3-A
- Project: Project 8 Student Clearance Workflow
- Week: 15 Integration Testing and Security Hardening
- Local time zone: Asia/Manila UTC+08:00

## Entry 001 Starting state audit

- Timestamp: 2026-11-10 19:26:37 +08:00
- Branch created after audit: `week-15-testing-hardening`
- Baseline branch: `main`
- Exact baseline commit: `2fe765ac2d82037fda596443339c87db12087f7f`
- Remote comparison after fetch: `main...origin/main` = `0 0`
- Week 14 tag: `v14.0.0-week14-secure-integration`
- Week 14 release: not found through the public GitHub release API on 2026-11-10; no release action taken
- Working tree before branch creation: clean
- Project approval: student-confirmed instructor approval and registration recorded on 2026-11-07; official registry not inspected

### Environment

| Component | Verified version or state |
| --- | --- |
| Windows time zone | Singapore Standard Time, UTC+08:00, equivalent to Asia/Manila for this project |
| PHP | 8.2.12 |
| Composer | 2.10.2 |
| Laravel | 12.x from locked project dependencies |
| Flutter | 3.47.8 stable |
| Dart | 3.13.7 |
| Git | 2.55.0.windows.3 |
| Node.js | 24.19.0 |
| npm | 11.17.0 |
| Backend local configuration | `.env` exists and remains ignored; contents were not copied into evidence |
| Backend dependencies | `vendor/autoload.php` present |
| Flutter dependencies | `.dart_tool` present; dependency resolution succeeded |

### Executed baseline results

| Check | Actual result | Interpretation |
| --- | --- | --- |
| `php artisan test` | 47 passed, 201 assertions, 12.56 seconds | Existing Week 14 behavior has a clean backend regression baseline. |
| `vendor/bin/pint --test` | passed | Existing tracked PHP source satisfies the configured formatter. |
| `composer audit --locked --no-interaction` | no security vulnerability advisories found | No known locked Composer advisory was reported at this timestamp. |
| `flutter analyze` | no issues found, 2.0 seconds | Existing Flutter source has a clean analyzer baseline. |
| `flutter test` | 6 passed | Existing login and three role-bound views have a clean widget baseline. |

Five Flutter packages reported newer versions incompatible with the current constraints. This is recorded as dependency awareness, not as a vulnerability or a requirement to upgrade during Week 15.

### Approved Week 15 scope

Create traceable API, backend, Flutter, and browser evidence for normal, invalid, boundary, authentication, authorization, not-found, duplicate, timeout, unavailable-dependency, controlled-failure, and recovery behavior. Rank and correct at least three justified weaknesses, then preserve targeted retests and complete regression results. Use fictional controlled data only.

### Baseline gaps carried into Week 15

- No versioned Postman-compatible Week 15 collection exists.
- No Week 15 requirements-to-test traceability matrix or defect record exists.
- Automated Flutter tests do not yet cover every required loading, empty, authorization, network, server-error, and recovery state.
- API security headers and consistent correlated JSON not-found behavior are not yet covered by dedicated tests.
- Week 14 status documents do not yet reflect the existing tag and missing GitHub Release.

### Secrets and data check

No `.env` value, token, password, cryptographic key, private certificate key, production URL, or real student record was copied into this log. Test identities use the reserved `example.test` domain and fictional names.

## Next entry

Record the preparation checkpoint review and approval decision before implementation and test execution begins.

## Entry 002 Preparation checkpoint assembled

- Genuine setup capture: `screenshots/setup/W15-SETUP-001-week15-preparation-vscode.png`
- Central evidence document: `C:\Users\Admin\Documents\IPT\Evidence Document\Week-15-Screenshot-Journey-and-Evidence.docx`
- Document verification: exported through installed Microsoft Word, rasterized to seven page images, and visually inspected page by page after correcting repeated linked footers and an awkward inventory split
- Repository status: no Week 15 file is staged, committed, pushed, merged, tagged, or released
- Approval status: preparation checkpoint awaiting the student's explicit approval

## Entry 003 Preparation checkpoint approved

- Timestamp: 2026-11-10 19:58:10 +08:00
- Approval: the student replied `go` after reviewing the preparation summary, verification results, exact staging list, proposed commit message, and defense explanation
- Authorized action: stage the listed preparation artifacts, commit them as `docs: prepare Week 15 testing and hardening`, and push `week-15-testing-hardening`
- Excluded actions: merge, tag, GitHub Release creation, and later implementation checkpoints remain unauthorized
- Result location: the resulting commit hash and remote branch state will be reported in the checkpoint handoff

## Entry 004 Preparation checkpoint committed and pushed

- Commit: `6b18a0b5da52a1d582f308aa09ed5c791afb036a`
- Message: `docs: prepare Week 15 testing and hardening`
- Remote: `origin/week-15-testing-hardening`
- Verification: the local and remote branch references matched the exact commit after push
- Boundary: merge, tag, release, and later checkpoint commits remained unauthorized

## Entry 005 Focused hardening and API collection execution

- Timestamp completed: 2026-11-10 20:22:52 +08:00
- Pre-fix focused result: 6 failed tests, 20 assertions; preserved in `test-results/W15-HARDENING-BEFORE.xml`
- Corrections: safe correlated not-found responses, idempotent replay, layered login throttling, standard login validation, and defensive API response headers
- Post-fix focused result: 6 passed tests, 52 assertions; preserved in `test-results/W15-HARDENING-AFTER.xml`
- Final collection result: 36 requests, 234 assertions, 0 failures; preserved in `test-results/W15-API-RUN-SUMMARY.json`
- Complete backend regression: 53 passed, 254 assertions
- Supporting checks: Pint passed; locked Composer audit found no known vulnerability advisories; Flutter analysis found no issues; six existing widget tests passed
- Secret check: exported environment has zero populated sensitive values; final report contains no bearer token, access-token value, or one-time password; no `w15-*.txt` credential file remained

### Preserved collection-run findings

The first collection run exposed unescaped JSON-significant characters in generated runtime passwords. After correcting the collection pre-request scripts, a sandbox network-context run produced no responses and was preserved separately. A subsequent real HTTP run passed 231 of 234 assertions but revealed that Laravel's `array` cache cannot retain rate-limit counters across local HTTP requests. The final disposable run used the migrated database cache and passed all assertions. See `test-results/W15-TEST-RESULTS.md` for the evidence map and limitations.

### Checkpoint boundary

The API/backend hardening milestone is implemented and verified locally but is not staged, committed, or pushed. Flutter required-state expansion, browser captures, Activities 1 and 2, IA6, reflection, and final portfolio work remain later milestones.

## Entry 006 Genuine source evidence

- Capture: `screenshots/source-code/W15-CODE-001-api-security-headers-vscode.png`
- Visible state: the real saved `AddApiSecurityHeaders.php` file in Visual Studio Code with filename and line numbers
- Mapping: W15-H-05 defensive API headers; `ApiHardeningTest`; collection-level header assertions
- Limitation: the source capture proves implementation, while `W15-HARDENING-AFTER.xml` and `W15-API-RUN-SUMMARY.json` provide execution evidence
- Secret review: no credential, token, environment value, private key, or real student record is visible

## Entry 007 Central evidence document updated and verified

- Central document: `C:\Users\Admin\Documents\IPT\Evidence Document\Week-15-Screenshot-Journey-and-Evidence.docx`
- Added evidence: Checkpoint 2 executed results, five hardening decisions, preserved failure findings, and the genuine `W15-CODE-001` source capture with requirement and test mapping
- Verification: exported through installed Microsoft Word, rasterized to nine page images, and visually inspected page by page
- Corrections made during verification: replaced obsolete preparation-only status language and constrained the final mapping table to the portrait-page margins
- Final visual result: all nine pages readable with no clipping, overflow, unexpected blank page, or exposed secret observed
- Repository boundary: the central DOCX remains outside Git; the original source screenshot remains in this repository
