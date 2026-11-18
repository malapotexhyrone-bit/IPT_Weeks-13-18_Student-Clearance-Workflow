# Week 15 Evidence Index

All Week 15 evidence uses fictional controlled data. Source screenshots demonstrate implementation only and are paired with executed results for behavior claims. The central DOCX remains outside Git.

| Evidence ID | Artifact | Requirement or test | What it proves | Status |
| --- | --- | --- | --- | --- |
| W15-DOC-001 | `../assessment/WEEK15-TEST-STRATEGY.md` | Topic 1 and Activity 1 | Records the decision question, alternatives, selected layered approach, contracts, executed traceability matrix, acceptance criteria, and limitations. | complete |
| W15-DOC-002 | `../diagrams/WEEK15-SYSTEM-TEST-DESIGN.md` | Hands-on design | Records actors, workflow, trust boundaries, dependencies, failure paths, human decisions, Flutter flow, failure prediction, and result boundary. | complete |
| W15-DOC-003 | `../activities/ACTIVITY-1-REQUIREMENTS-TO-TESTS.md` | Activity 1 | Provides the concise test record and labeled interpretation separating facts, conclusions, and recommendation. | complete |
| W15-DOC-004 | `../activities/ACTIVITY-2-BOUNDED-HARDENING-REVIEW.md` | Activity 2 | Provides the ranked review, alternatives, before-and-after evidence, residual risk, and labeled interpretation. | complete |
| W15-DOC-005 | `../assessment/IA6-INTEGRATION-TESTING-AND-HARDENING.md` | IA6 | Consolidates strategy, collection, controlled data, results, logs, defects, fixes, regression, limitations, and remaining risk. | complete; student reflection pending |
| W15-LOG-001 | `logs/LABORATORY-LOG.md` | Starting state through evidence gaps | Records the exact build, branch, versions, baseline and final results, scope, failures, approvals, and safe-data boundary. | complete |
| W15-DATA-001 | `api-tests/controlled-data.json` | Controlled fictional data | Defines nonsecret identities, terms, offices, boundary strings, and invalid values for repeatable tests. | complete |
| W15-BASE-001 | `test-results/W15-BASELINE-001.md` | Pre-change baseline | Records the backend, Flutter, formatter, analyzer, and dependency-audit results observed before Week 15 changes. | complete |
| W15-SETUP-001 | `screenshots/setup/W15-SETUP-001-week15-preparation-vscode.png` | Feature branch and preparation structure | Genuine VS Code capture shows the saved Week 15 laboratory log, feature branch name, exact baseline commit, remote comparison, Week 14 tag, and verified environment without exposing secrets. | complete |
| W15-API-001 | `api-tests/week15-student-clearance.postman_collection.json`, `api-tests/week15-local.postman_environment.json`, `test-results/W15-API-RUN-SUMMARY.json` | Functional contract and interoperability | Executed 36 public API requests with 234 passing assertions across normal, invalid, boundary, unauthenticated, forbidden, cross-object, not-found, duplicate, completion, headers, and rate-limit behavior. | committed in `138adc9` |
| W15-FAIL-001 | `test-results/W15-API-RUN-BEFORE.json`, `W15-API-RUN-INFRASTRUCTURE-FAILURE.json`, `W15-API-RUN-NONPERSISTENT-CACHE-FAILURE.json` | Controlled failure, diagnosis, and recovery | Preserves the JSON-escaping defect, sandbox no-response condition, and non-persistent cache finding plus their corrected reruns rather than hiding failed attempts. | committed in `138adc9` |
| W15-HARD-001 | `../assessment/WEEK15-HARDENING-REGISTER.md`, `test-results/W15-HARDENING-BEFORE.xml`, `test-results/W15-HARDENING-AFTER.xml` | Security testing and hardening | Ranks five fixed weaknesses and preserves the transition from 6 failed/20 assertions to 6 passed/52 assertions with residual risks. | complete |
| W15-REG-001 | `test-results/W15-TEST-RESULTS.md`, `test-results/W15-BACKEND-REGRESSION.xml`, `test-results/W15-FLUTTER-REGRESSION.json` | Targeted and complete regression | Records 53 backend tests/254 assertions, Pint, Composer audit, Flutter analysis, 14 Flutter tests, and the passed collection. | complete |
| W15-APP-001 | `screenshots/application/W15-APP-001-login-desktop.jpg` | Genuine desktop Flutter layout | Shows the real local Flutter Web login at desktop width with password, role, HTTPS, and throttling boundaries visible and no credential entered. | complete; committed in `ad55e71` |
| W15-APP-002 | `screenshots/application/W15-APP-002-unavailable-api-narrow.jpg` | Genuine responsive unavailable-service and retry state | Shows the real Flutter build at a responsive width after the controlled local HTTPS API was unavailable. The fictional email is visible, the password remains obscured, and the safe retry action remains available. | complete; committed in `ad55e71` |
| W15-CODE-001 | `screenshots/source-code/W15-CODE-001-api-security-headers-vscode.png` | Selected hardening control | Genuine VS Code capture shows the actual saved `AddApiSecurityHeaders.php` control with the filename and line numbers; paired execution evidence is in W15-HARD-001 and W15-API-001. | committed in `138adc9` |
| W15-TEST-001 | `screenshots/tests/W15-TEST-001-flutter-focused-pass.png` | Executed Flutter verification | A genuine VS Code or terminal capture should show the focused eight-test pass. Machine-readable execution evidence already exists, but the automated UI capture was discarded because terminal input was not reliable. | pending manual capture; exact steps in laboratory log Entry 011 |
| W15-CENTRAL-001 | `C:\Users\Admin\Documents\IPT\Evidence Document\Week-15-Screenshot-Journey-and-Evidence.docx` | Combined weekly journey | Evidence document with exact student identity, baseline/API/Flutter results, traceability, genuine setup/source/browser captures, preserved failures, mappings, limitations, and approval boundaries. Exported as 13 pages and visually inspected page by page after layout corrections. | complete outside Git; final status review pending |

## Evidence rules

- Record expected and actual results; preserve failures and retests.
- Identify the build, environment, controlled data, timestamp, and evidence location.
- Do not expose credentials, tokens, `.env` values, keys, private URLs, or unrelated windows.
- Label controlled simulations and mocks honestly; do not present them as live backend behavior.
- Keep the central DOCX outside Git and original screenshots inside this repository.
