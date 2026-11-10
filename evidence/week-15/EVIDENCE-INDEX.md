# Week 15 Evidence Index

All Week 15 evidence uses fictional controlled data. A status of `planned` does not claim execution or success. Source screenshots demonstrate implementation only and must be paired with executed results for behavior claims.

| Evidence ID | Artifact | Requirement or test | What it proves | Status |
| --- | --- | --- | --- | --- |
| W15-DOC-001 | `../../docs/WEEK15-TEST-STRATEGY.md` | Topic 1 and Activity 1 preparation | Records the decision question, alternatives, selected layered approach, contracts, traceability matrix, acceptance criteria, and limitations. | prepared |
| W15-DOC-002 | `../../docs/WEEK15-SYSTEM-TEST-DESIGN.md` | Hands-on Part 1 design | Records actors, workflow, trust boundaries, dependencies, failure paths, human decisions, Flutter flow, and controlled failure prediction. | prepared |
| W15-LOG-001 | `LABORATORY-LOG.md` | Starting state and environment | Records the exact build, branch, versions, executed baseline results, scope, gaps, and safe-data boundary. | prepared |
| W15-DATA-001 | `api-tests/controlled-data.json` | Controlled fictional data | Defines nonsecret identities, terms, offices, boundary strings, and invalid values for repeatable tests. | prepared |
| W15-BASE-001 | `test-results/W15-BASELINE-001.md` | Pre-change baseline | Records the backend, Flutter, formatter, analyzer, and dependency-audit results observed before Week 15 changes. | prepared |
| W15-SETUP-001 | `screenshots/setup/W15-SETUP-001-week15-preparation-vscode.png` | Feature branch and preparation structure | Genuine VS Code capture shows the saved Week 15 laboratory log, feature branch name, exact baseline commit, remote comparison, Week 14 tag, and verified environment without exposing secrets. | prepared |
| W15-API-001 | `api-tests/week15-student-clearance.postman_collection.json`, `api-tests/week15-local.postman_environment.json`, `test-results/W15-API-RUN-SUMMARY.json` | Functional contract and interoperability | Executed 36 public API requests with 234 passing assertions across normal, invalid, boundary, unauthenticated, forbidden, cross-object, not-found, duplicate, completion, headers, and rate-limit behavior. | committed in `138adc9` |
| W15-FAIL-001 | `test-results/W15-API-RUN-BEFORE.json`, `W15-API-RUN-INFRASTRUCTURE-FAILURE.json`, `W15-API-RUN-NONPERSISTENT-CACHE-FAILURE.json` | Controlled failure, diagnosis, and recovery | Preserves the JSON-escaping defect, sandbox no-response condition, and non-persistent cache finding plus their corrected reruns rather than hiding failed attempts. | committed in `138adc9` |
| W15-HARD-001 | `../../docs/WEEK15-HARDENING-REGISTER.md`, `test-results/W15-HARDENING-BEFORE.xml`, `test-results/W15-HARDENING-AFTER.xml` | Security testing and hardening | Ranks five fixed weaknesses and preserves the transition from 6 failed/20 assertions to 6 passed/52 assertions with residual risks. | committed in `138adc9` |
| W15-REG-001 | `test-results/W15-TEST-RESULTS.md`, `test-results/W15-BACKEND-REGRESSION.xml`, `test-results/W15-FLUTTER-REGRESSION.json` | Targeted and complete regression | Records 53 backend tests/254 assertions, Pint, Composer audit, Flutter analysis, 14 Flutter tests, and the passed collection. | executed; Flutter update pending checkpoint approval |
| W15-APP-001 | `screenshots/application/W15-APP-001-login-desktop.jpg` | Genuine desktop Flutter layout | Shows the real local Flutter Web login at desktop width with password, role, HTTPS, and throttling boundaries visible and no credential entered. | captured; pending checkpoint approval |
| W15-APP-002 | `screenshots/application/W15-APP-002-unavailable-api-narrow.jpg` | Genuine responsive unavailable-service and retry state | Shows the real Flutter build at a responsive width after the controlled local HTTPS API was unavailable. The fictional email is visible, the password remains obscured, and the safe retry action remains available. | captured; pending checkpoint approval |
| W15-CODE-001 | `screenshots/source-code/W15-CODE-001-api-security-headers-vscode.png` | Selected hardening control | Genuine VS Code capture shows the actual saved `AddApiSecurityHeaders.php` control with the filename and line numbers; paired execution evidence is in W15-HARD-001 and W15-API-001. | committed in `138adc9` |
| W15-TEST-001 | `screenshots/tests/W15-TEST-001-flutter-focused-pass.png` | Executed Flutter verification | A genuine VS Code or terminal capture should show the focused eight-test pass. Machine-readable execution evidence already exists, but the automated UI capture was discarded because terminal input was not reliable. | pending manual capture; exact steps in laboratory log Entry 011 |
| W15-CENTRAL-001 | `C:\Users\Admin\Documents\IPT\Evidence Document\Week-15-Screenshot-Journey-and-Evidence.docx` | Combined weekly journey | Checkpoint 3 evidence document with exact student identity, baseline/API/Flutter results, traceability, genuine setup/source/browser captures, preserved failures, mappings, limitations, and approval boundaries. Exported through Microsoft Word as 12 pages; every page was visually inspected, and stale status, table width, and heading-indentation defects were corrected. | updated and verified; pending Checkpoint 3 approval |

## Evidence rules

- Record expected and actual results; preserve failures and retests.
- Identify the build, environment, controlled data, timestamp, and evidence location.
- Do not expose credentials, tokens, `.env` values, keys, private URLs, or unrelated windows.
- Label controlled simulations and mocks honestly; do not present them as live backend behavior.
- Keep the central DOCX outside Git and original screenshots inside this repository.
