# Week 15 Summary

## Outcome

Week 15 Integration Testing and Security Hardening is technically implemented and verified in the controlled local environment. The workflow is traced from clearance initiation through office review, deficiency resolution, approval, and completion. Authorization tests cover another student, another office, and wrong-role actions. A Postman-compatible collection, Laravel feature tests, Flutter tests, browser evidence, failure records, hardening changes, and IA6 report are organized in this folder.

The package was approved, committed as `ec402134e297671b8aace89c938193fbd12b0ae2`, and pushed to `origin/week-15-testing-hardening`. It is not merged, tagged, released, submitted, or accepted by the instructor.

## Implemented hardening

- Safe correlated not-found responses without framework or model disclosure.
- Exact idempotent replay without duplicate tasks or events.
- Layered login throttling with a standard safe `429` response.
- Standard bounded login validation errors.
- Defensive API headers with HSTS only for secure requests.

## Verification results

| Check | Result |
| --- | --- |
| Focused hardening before | 6 failed, 20 assertions, preserved |
| Focused hardening after | 6 passed, 52 assertions |
| API collection | 36 requests, 234 assertions, 0 failures |
| Complete Laravel regression | 53 passed, 254 assertions |
| Laravel Pint | Pass |
| Composer locked audit | No known advisories reported |
| Flutter analysis | No issues found |
| Focused Week 15 Flutter tests | 8 passed |
| Complete Flutter tests | 14 passed |
| Browser checks | Genuine desktop login and narrow unavailable-service state captured |

## Required outputs

- Activity 1: `activities/ACTIVITY-1-REQUIREMENTS-TO-TESTS.md`
- Activity 2: `activities/ACTIVITY-2-BOUNDED-HARDENING-REVIEW.md`
- IA6 report: `assessment/IA6-INTEGRATION-TESTING-AND-HARDENING.md`
- Test strategy and traceability: `assessment/WEEK15-TEST-STRATEGY.md`
- Hardening register: `assessment/WEEK15-HARDENING-REGISTER.md`
- System and Flutter flow design: `diagrams/WEEK15-SYSTEM-TEST-DESIGN.md`
- Evidence index: `evidence/EVIDENCE-INDEX.md`
- Laboratory log: `evidence/logs/LABORATORY-LOG.md`
- Collection and controlled data: `evidence/api-tests/`
- Machine-readable results: `evidence/test-results/`
- Genuine screenshots: `evidence/screenshots/`
- Central evidence document: `C:\Users\Admin\Documents\IPT\Evidence Document\Week-15-Screenshot-Journey-and-Evidence.docx` outside Git

## Honest gaps and limitations

- A genuine focused Flutter terminal screenshot is still a manual evidence gap. Machine-readable test evidence is present, and the exact capture steps are in the laboratory log. No false screenshot was created.
- The final audit found and remediated `CVE-2026-128083` by updating Laravel 12.70.2 to 12.73.0; the post-update audit is clean and the 53-test regression still passes.
- The student must personalize and verify the reflection in their own words and rehearse the technical defense.
- The local controlled services do not establish production readiness, stakeholder acceptance, large-scale concurrency, or deployment reliability.
- The Week 14 tag exists, but its matching GitHub Release is absent; no release action was taken.
- The final Week 15 commit and push are complete. The Week 15 tag and GitHub Release require separate later approval.

## Defense explanation

Week 15 uses the right test layer for each claim. The collection proves the public API contract, Laravel tests prove state and failure safety, Flutter tests prove deterministic UI states, and genuine browser captures prove selected real layouts. The student should be able to explain why cross-student and cross-office actions are rejected, why exact idempotent replay prevents duplicate effects, why public failure-injection routes were not added, and what the retained failed runs taught about the test environment.

## Student actions before submission

1. Reproduce at least one backend hardening test, the full backend suite, and the focused Flutter suite.
2. Review the IA6 report and replace the reflection prompts with truthful personal answers.
3. If possible, manually capture `evidence/screenshots/tests/W15-TEST-001-flutter-focused-pass.png` using the instructions in the laboratory log, then update the evidence index.
4. Review `git status` and `git diff --staged` after the proposed files are staged for the final Week 15 commit.
5. Review the pushed commit and separately authorize the Week 15 tag and GitHub Release only when ready.
