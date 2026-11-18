# Activity 2 Bounded Hardening Review

## Problem and review boundary

The review examined the public Laravel API contract and duplicate-processing behavior of the Student Clearance Workflow. It was not a penetration test, infrastructure audit, or assessment of university production systems. The instructor remains the academic acceptance authority, and only controlled fictional data was used.

## Ranking method

Weaknesses were ranked by likely misuse, confidentiality or integrity impact, public exposure, and the ability to verify a bounded correction. High-priority items affected information disclosure, client retry safety, or brute-force controls. Medium-priority items improved consistent client behavior and browser defense in depth.

## Approaches compared

| Approach | Advantages | Disadvantages and decision |
| --- | --- | --- |
| Fix only the three highest-ranked gaps | Smallest change set and quick retest | Leaves inconsistent login validation and missing response headers; rejected because both were directly testable and affected every client |
| Fix all five bounded contract gaps | Consistent error handling, retry behavior, throttling, validation, and headers | Larger regression responsibility; selected because focused tests and the collection could verify every change |
| Add public failure-injection routes | Easy external timeout demonstration | Creates dangerous test-only behavior and expands the attack surface; rejected |

## Ranked weaknesses and changes

| ID | Priority | Before | Implemented change | Targeted result |
| --- | --- | --- | --- | --- |
| W15-H-01 | High | Generic not-found bodies could disclose framework or model details | Safe `RESOURCE_NOT_FOUND` envelope with correlation ID | Passed |
| W15-H-02 | High | Exact retry returned conflict after the workflow already existed | Same idempotency key returns the original clearance with `meta.replayed = true` and no duplicate effect | Passed |
| W15-H-03 | High | Default rate-limit body and one shared five-attempt IP bucket | Safe correlated `429` plus account/IP and broader IP limits | Passed |
| W15-H-04 | Medium | Login validation used a different response shape | Normalized bounded `LoginRequest` with the standard field-error contract | Passed |
| W15-H-05 | Medium | API responses lacked consistent defensive headers | API-only no-store, nosniff, frame, referrer, permissions, and HTTPS-only HSTS controls | Passed |

The exact implementation and focused test names are recorded in `../assessment/WEEK15-HARDENING-REGISTER.md`.

## Before and after evidence

The pre-fix focused run produced 6 failed tests and 20 assertions. Those failures established the observable gaps before implementation. The same focused suite then passed 6 tests with 52 assertions. The complete API collection passed 36 requests with 234 assertions, and the complete backend regression passed 53 tests with 254 assertions. Pint passed, the locked Composer audit reported no known advisories, Flutter analysis reported no issues, and 14 Flutter tests passed.

The adverse case selected for interpretation was exact retry after an uncertain client response. Before hardening, the server returned a conflict even when the same nonsecret idempotency key represented the already accepted request. After hardening, the same student, term, and key hash receive the existing clearance and no duplicate task or event is created. A changed or missing key still receives the intended conflict.

## One page interpretation

### Observed facts

All five ranked items were corrected. The focused suite changed from red to green without removing the original failure evidence. The final public collection and full backend suite passed. The genuine source capture shows the saved API security-header middleware, while the focused JUnit file and collection result provide execution proof. Three collection-run failures were also retained: raw JSON password escaping, separated sandbox network contexts, and a nonpersistent cache that could not demonstrate cross-request throttling.

### Reasoned conclusions

The hardening sprint improved consistency and bounded misuse resistance without changing the approved clearance workflow. Safe not-found and validation bodies reduce unnecessary detail and simplify Flutter recovery. Exact idempotent replay protects clients from duplicating work after uncertain network outcomes. Layered throttling is more suitable for a shared classroom IP than one small global bucket. Defensive headers add browser and cache safeguards, but they do not replace HTTPS, authorization, validation, or secure token handling.

The failed collection runs also show why environment defects must be separated from application defects. Correcting the runner setup and cache store was necessary to obtain a valid observation; relabeling those failures as application vulnerabilities would have overstated the evidence.

### Recommendation

Keep the five controls and their focused regression tests. In an instructor-approved nonproduction deployment, verify distributed rate-limit behavior, reverse-proxy header handling, HTTPS HSTS delivery, and idempotency under concurrent requests. Do not add public failure-injection endpoints merely to simplify demonstrations.

## Residual risk

- The local fixed-window limiter is not a distributed production gateway.
- HSTS is asserted only for secure responses; local HTTP is not HTTPS evidence.
- Headers do not replace server-side access control or transport protection.
- Idempotent replay is intentionally narrow to the same student, active term, and exact key hash.
- No production infrastructure, real identities, or operational monitoring were tested.

## Evidence

- Ranked register: `../assessment/WEEK15-HARDENING-REGISTER.md`
- Before and after JUnit files: `../evidence/test-results/W15-HARDENING-BEFORE.xml` and `W15-HARDENING-AFTER.xml`
- Collection summary: `../evidence/test-results/W15-API-RUN-SUMMARY.json`
- Complete regression: `../evidence/test-results/W15-BACKEND-REGRESSION.xml`
- Source capture: `../evidence/screenshots/source-code/W15-CODE-001-api-security-headers-vscode.png`
