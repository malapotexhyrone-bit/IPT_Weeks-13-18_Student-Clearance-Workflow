# Project Progress

## Active Week 15 work

- Week: 15 Integration Testing and Security Hardening
- Project: Project 8 Student Clearance Workflow
- Branch: `week-15-testing-hardening`
- Baseline commit: `2fe765ac2d82037fda596443339c87db12087f7f`
- Previous tag: `v14.0.0-week14-secure-integration`
- Planned tag: `v15.0.0-week15-testing-hardening`
- Project approval: student-confirmed instructor approval and registration on 2026-11-07; official registry not inspected

### Verified starting point

- Fetched `origin` and tags on 2026-11-10.
- Verified `main` and `origin/main` are zero commits ahead or behind at `2fe765a`.
- Verified the Week 14 annotated tag exists at the current baseline.
- GitHub's public release endpoint returned `404 Not Found` for the Week 14 tag. The tag exists, but the matching GitHub Release is absent; no release action was taken.
- Verified the working tree was clean before creating `week-15-testing-hardening`.

### Executed baseline

| Check | Result |
| --- | --- |
| Laravel tests | 47 passed, 201 assertions, 12.56 seconds |
| Laravel Pint | passed |
| Composer locked dependency audit | no known security advisories found |
| Flutter analysis | no issues found |
| Flutter widget tests | 6 passed |

The verified environment is PHP 8.2.12, Composer 2.10.2, Flutter 3.47.8, Dart 3.13.7, Git 2.55.0.windows.3, Node.js 24.19.0, and npm 11.17.0.

### Preparation checkpoint work

- Created the Week 15 evidence directory structure.
- Added the Week 15 test-strategy decision record and requirements-to-test traceability matrix.
- Added the bounded workflow, trust-boundary diagram, Flutter flow, failure prediction, controlled data, evidence index, laboratory log, and pre-change baseline record.
- Updated the active-week README, changelog, progress record, and checklist without claiming planned tests have passed.

### Current approval status

- Preparation checkpoint: explicitly approved by the student on 2026-11-10 at 19:58 +08:00
- Commit and push: authorized for the approved preparation scope; resulting commit and remote state will be reported in the checkpoint handoff
- Merge, tag, and release: not authorized
- Central evidence DOCX: preparation version completed with a genuine VS Code capture and seven-page visual inspection after layout correction

### Next milestone after approval

Implement the versioned API collection and new contract, boundary, authorization, not-found, dependency-failure, recovery, security-header, and Flutter-state tests. Preserve actual failures, rank and fix at least three justified weaknesses, then run targeted and complete regression checks.

### Week 15 constraints

- New collection and hardening tests are not yet executed.
- Controlled local services do not represent production university systems.
- The Week 14 Git tag exists, but the matching GitHub Release is absent.
- No instructor grade, stakeholder acceptance, production readiness, completed viva, or completed student reflection is claimed.

## Preserved Week 14 record

- Week: 14 — Secure Data Exchange and Encryption
- Project: Project 8, Student Clearance Workflow
- Repository: `https://github.com/malapotexhyrone-bit/IPT_Weeks-13-18_Student-Clearance-Workflow`
- Local folder: `C:\Users\Admin\Documents\IPT\IPT_Weeks-13-18_Student-Clearance-Workflow`
- Branch: `week14-secure-integration`
- Week 13 baseline: commit `6a73790b433ec65d34189aa3e3d7add80280b761`, tag `v13.0.0-week13-automation`
- Checkpoint 1: approved, committed as `7cf96482235715d81f6b99dea45d21b44cf6fe98`, and preserved on `origin/week14-secure-integration`
- Checkpoint 2: approved, committed as `5f7bbc030578bd557b94ee342bd65f7a23be54eb`, and pushed to `origin/week14-secure-integration`
- Checkpoint 3: approved, committed as `d6d65e8`, and pushed to `origin/week14-secure-integration`
- Final evidence and submission handoff checkpoint: approved, committed as `298f6efedca30653478bea76c12d75ebdff8ccf9`, and pushed to `origin/week14-secure-integration`
- Approval: student confirmed instructor approval and registration for Project 8 on 2026-11-07; official registry not inspected

## Checkpoint 1 completed locally

- Added minimized AES-256-GCM clearance envelopes and a controlled receiver.
- Added HMAC service authentication, freshness checks, expiry checks, and replay prevention.
- Added administrator authorization to the sender and safe receipt storage.
- Added controlled localhost HTTPS scripts, ignored secret/certificate paths, and safe configuration examples.
- Ran a real TLS 1.3 sender/receiver demonstration with fictional data.
- Expanded secure-exchange coverage to 12 tests / 44 assertions.
- Passed the complete backend suite: 44 tests / 178 assertions.
- Updated affected Symfony packages to 7.4.23 after an initial seven-advisory audit; the final audit reports no known advisories.
- Preserved real setup failures and recovery rather than converting them into successful first-attempt claims.

## Checkpoint 2 completed locally

- Replaced the active Week 13 demo-session route and role selector with email/password authentication.
- Added generic credential errors, a dummy hash check for unknown accounts, five-attempt-per-minute throttling, two-hour Sanctum tokens, and logout revocation.
- Added a safe tool that generates a one-time-displayed password for an existing fictional account while storing only its hash.
- Updated Flutter to derive student, assigned-office, or administrator navigation only from the authenticated server response.
- Added the administrator protected-exchange form and HTTPS API client default.
- Focused authentication result: 5 tests / 31 assertions.
- Complete backend result: 47 tests / 201 assertions.
- Flutter result: analysis reports no issues; 6 widget tests pass.
- Preserved the failed guard-cache test, off-screen widget interactions, and missing test import as corrected verification findings.
- Captured six real Chrome views: desktop login, generic invalid-credential response, student dashboard, assigned Library-office dashboard, accepted administrator secure exchange, and narrow login.
- Used a trusted controlled localhost certificate without disabling certificate checks; the Flutter page remained on local HTTP while its credential-bearing API requests used verified HTTPS.
- Permanently deleted all three temporary plaintext browser-credential files after capture; only Laravel password hashes remain in the database.

## Evidence locations

- Week 14 index: `evidence/week-14/EVIDENCE-INDEX.md`
- Test and transport records: `evidence/week-14/test-results/`
- Setup/recovery record: `evidence/week-14/logs/`
- Real VS Code captures: `evidence/week-14/screenshots/source-code/` and `evidence/week-14/screenshots/tests/`
- Real Flutter browser captures: `evidence/week-14/screenshots/application/`
- Main Week 14 assessment report: `docs/WEEK14-SECURE-INTEGRATION-REPORT.md`
- Central combined evidence document: `C:\Users\Admin\Documents\IPT\Evidence Document\Week-14-Screenshot-Journey-and-Evidence.docx` (outside Git)
- Week 14 submission handoff: `docs/WEEK14-SUBMISSION-HANDOFF.md`

## Checkpoint 3 completed locally

- Reconciled the module's authenticated-encryption laboratory with the Project 8 requirement to justify every cryptographic control.
- Completed Activity 1 with five corrected cryptographic uses, alternatives, assumptions, one adverse case, limitations, and a labeled one-page interpretation.
- Completed Activity 2 with source, configuration, HTTPS, tamper, secret, dependency, browser, and residual-risk review plus a labeled one-page interpretation.
- Completed the SA8 architecture case with threat summary, trust boundaries, control selection, alternatives, decision consequences, and review conditions.
- Completed the IA5 build record with code excerpts, protected configuration, verification results, failure recovery, evidence map, and reproduction steps.
- Prepared reflection prompts for the student's own verified wording and a Week 14 technical-defense question set.

## Final evidence checkpoint completed

- Created one combined 39-page Week 14 DOCX with the exact student identification, the full weekly journey, requirement mapping, and thirteen screenshots. Four transient UI states are clearly labeled controlled simulations rather than live backend outcomes.
- Rendered the complete document through Microsoft Word and visually inspected the content and evidence pages; corrected the alternating-page clipping found during QA.
- Ran document audits: eight inline images were detected, heading order was corrected, and no high-severity accessibility finding remains. The remaining medium notices concern the eight screenshot layout tables, which intentionally have no data-table header row.
- Kept the original screenshot files in `evidence/week-14/screenshots/` and kept the central DOCX outside Git as required.
- Added five accurately labeled Flutter Web states for validation, loading, empty, authorization, and network-error presentation. Four use controlled intercepted fictional responses and are not represented as live backend results.

## Pending milestones

1. Student personalizes and verifies the reflection worksheet in their own words and rehearses the defense questions.
2. Propose the exact Week 14 tag, release title, target commit, and release notes for separate approval.

## Known constraints and honest gaps

- The student confirmed instructor approval/registration for Project 8; the official instructor registry has not been inspected.
- The receiver is a controlled localhost integration, not a production university service.
- The controlled localhost certificate is trusted only in the current user's Windows certificate store and is not a production deployment certificate.
- The Flutter development page is served over local HTTP; credential-bearing application API calls were verified over HTTPS. This does not claim a production all-HTTPS deployment.
- The Week 13 tag exists, but no GitHub release was found during the Week 14 starting-state inspection; no release was created without separate approval.
- No final Week 14 submission or defense readiness is claimed.
