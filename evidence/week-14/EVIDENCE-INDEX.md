# Week 14 Evidence Index

All entries use fictional controlled data. Source screenshots show implementation; test, transport, or application evidence is required for behavior claims. No `.env`, private key, token, plaintext deficiency detail, or live credential is included.

| Evidence ID | Artifact | Requirement/test | What it proves | Status |
| --- | --- | --- | --- | --- |
| EVID-W14-CODE-001 | `screenshots/source-code/EVID-W14-CODE-001-authenticated-encryption-vscode.png` | Authenticated encryption | Real saved `SecureClearanceExchange.php` in VS Code defines AES-256-GCM and constructs fresh metadata/nonce. | complete |
| EVID-W14-TEST-001 | `screenshots/tests/EVID-W14-TEST-001-security-regression-vscode.png` | Focused and regression verification | Real VS Code view of the saved test record and its executed counts. | complete |
| EVID-W14-SEC-001 | `test-results/EVID-W14-SEC-001-backend-security-tests.txt` | Success and adverse cases | Records the focused 12-test/44-assertion result, full 44-test/178-assertion result, formatting, and test boundaries. | complete |
| EVID-W14-HTTPS-001 | `test-results/EVID-W14-HTTPS-001-controlled-transport.txt` | HTTPS and invalid certificate | Records negotiated TLS, successful CA-validated health check, failed untrusted-root request, and controlled exchange receipt. | complete |
| EVID-W14-AUDIT-001 | `test-results/EVID-W14-AUDIT-001-dependency-audit.txt` | Dependency review | Preserves the initial advisory finding, package remediation, final clean audit, and regression result. | complete |
| EVID-W14-SETUP-FAIL-001 | `logs/EVID-W14-SETUP-FAILURES-001.txt` | Failure and recovery | Records the stopped-database and detached-HTTPS startup failures and their bounded recovery. | complete |
| EVID-W14-AUTH-001 | `test-results/EVID-W14-AUTH-001-password-and-flutter-tests.txt` | Password authentication and role-bound UI | Records five authentication tests, full backend regression, Flutter analysis, and six widget tests. | complete |
| EVID-W14-AUTH-FAIL-001 | `logs/EVID-W14-AUTH-FAILURES-001.txt` | Verification failure and correction | Preserves the guard-cache, off-screen widget, and missing-import findings with corrected retests. | complete |
| EVID-W14-BROWSER-001 | `test-results/EVID-W14-BROWSER-001-real-role-journey.txt` | Real HTTPS Flutter journey | Records trusted-browser login for all three roles, generic invalid credentials, accepted secure exchange, and credential cleanup. | complete |
| EVID-W14-APP-001 | `screenshots/application/EVID-W14-APP-001-login-desktop.png` | Password login, desktop | Real 1440×900 Flutter sign-in screen explaining hashing, server-owned roles, HTTPS, and throttling. | complete |
| EVID-W14-APP-002 | `screenshots/application/EVID-W14-APP-002-invalid-credentials.png` | Invalid credentials | Real generic error with cleared password field and no account-existence disclosure. | complete |
| EVID-W14-APP-003 | `screenshots/application/EVID-W14-APP-003-student-role.png` | Student least privilege | Real student dashboard showing Ari Santos's clearance and four office states. | complete |
| EVID-W14-APP-004 | `screenshots/application/EVID-W14-APP-004-library-role.png` | Office least privilege | Real Library reviewer dashboard showing the assigned task and permitted actions. | complete |
| EVID-W14-APP-005 | `screenshots/application/EVID-W14-APP-005-admin-secure-exchange.png` | Administrator secure exchange | Real administrator view with an accepted protected record, message ID, and safe status. | complete |
| EVID-W14-APP-006 | `screenshots/application/EVID-W14-APP-006-login-narrow.png` | Responsive login | Real 480×900 one-column sign-in layout with every security control retained. | complete |
| EVID-W14-APP-007 | `screenshots/application/EVID-W14-APP-007-validation-state.png` | Client-side validation | Real empty-form submission showing required email and password feedback before an API call. | complete |
| EVID-W14-APP-008 | `screenshots/application/EVID-W14-APP-008-loading-state.png` | Loading state | Controlled browser response delay showing the actual Flutter assigned-task loading skeleton. | complete |
| EVID-W14-APP-009 | `screenshots/application/EVID-W14-APP-009-empty-office-state.png` | Empty state | Controlled fictional office response showing the actual Flutter no-assigned-tasks state. | complete |
| EVID-W14-APP-010 | `screenshots/application/EVID-W14-APP-010-authorization-state.png` | Authorization state | Controlled 403 response showing the actual Flutter access-not-permitted state. | complete |
| EVID-W14-APP-011 | `screenshots/application/EVID-W14-APP-011-network-error-state.png` | Network failure state | Controlled aborted login request showing the actual Flutter trusted-HTTPS-API-unreachable feedback. | complete |
| EVID-W14-UI-STATES-001 | `test-results/EVID-W14-UI-STATES-001-controlled-browser-states.txt` | Flutter browser-state boundary | Records which screenshots are live end-to-end evidence and which are controlled UI-state simulations. | complete |
| DOC-W14-REPORT-001 | `../../docs/WEEK14-SECURE-INTEGRATION-REPORT.md` | Activity 1, Activity 2, SA8, IA5, risks, decisions, and defense preparation | Consolidates requirement interpretation, architecture, tests, limitations, reproduction steps, and evidence mapping. | complete |
| DOC-W14-CENTRAL-001 | `C:\Users\Admin\Documents\IPT\Evidence Document\Week-14-Screenshot-Journey-and-Evidence.docx` | Combined weekly journey and screenshot evidence | Embeds eight selected real screenshots and maps the complete Week 14 journey to activities, assessments, tests, source artifacts, and commits. This primary DOCX is intentionally outside Git. | complete |

## Journey status

Real end-to-end Flutter captures cover password login, generic invalid credentials, student and Library role boundaries, administrator secure-send success, desktop layout, and narrow layout. Five additional controlled captures cover validation, loading, empty, authorization, and network-error presentation against the actual Flutter build. The latter use intercepted fictional responses and are not represented as live backend outcomes. Alteration, replay, expiry, invalid HMAC, wrong key, missing CA, malformed input, and unavailable key remain preserved as executed backend test evidence rather than falsely represented as browser screens. The main Week 14 report maps the activities and assessments to these artifacts. The completed central `Week-14-Screenshot-Journey-and-Evidence.docx` embeds selected screenshots while the original image files remain in this repository.
