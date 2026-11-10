# Week 15 Hardening Register

## Review boundary

This bounded review covers the public Laravel API contract and duplicate-processing behavior required by Week 15. It does not claim a production penetration test, external infrastructure review, or university-wide security assessment.

## Ranking method

Priority combines likely misuse, confidentiality/integrity impact, exposure through a public API, and the ease of verifying a focused correction. `High` items affect authorization-adjacent information, replay safety, or brute-force controls. `Medium` items improve browser/API defense in depth and consistent client recovery.

| ID | Priority | Weakness observed in the pre-fix test | Risk | Correction | Verification | Status |
| --- | --- | --- | --- | --- | --- | --- |
| W15-H-01 | high | Unknown routes and missing route-bound models used Laravel's generic JSON shape and could disclose framework/model details. | Inconsistent client handling and unnecessary implementation disclosure. | Added minimized `RESOURCE_NOT_FOUND` renderers for API routes and model binding, retaining only a correlation ID and empty field map. | `ApiHardeningTest::test_unknown_api_route_returns_a_safe_correlated_json_error`; `test_missing_route_model_does_not_expose_model_details`. | fixed and pushed in `138adc9` |
| W15-H-02 | high | Repeating the same accepted clearance request and idempotency key returned `409` instead of the original result. | A client retry after an uncertain network response could be treated as a failure even though the workflow already exists. | A matching nonsecret key hash now returns the existing clearance with `meta.replayed = true`; a changed key still returns `409`; no duplicate task or event is created. | `ApiHardeningTest::test_same_idempotency_key_replays_the_existing_clearance_without_duplicates`. | fixed and pushed in `138adc9` |
| W15-H-03 | high | Rate-limit responses used a framework-default body, and the fixed per-IP limiter could let several legitimate controlled roles exhaust one another's five-attempt window. | Clients could not use the standard recovery contract; a shared lab IP could cause avoidable denial of service. | Added a correlated `RATE_LIMITED` response and layered limits of five attempts per account/IP plus thirty attempts per IP. | `ApiHardeningTest::test_rate_limit_response_uses_the_standard_correlated_error_contract`; existing authentication throttle regression. | fixed and pushed in `138adc9` |
| W15-H-04 | medium | Login validation used Laravel's default validation body rather than the project's error envelope. | Flutter/Postman clients needed two incompatible error parsers and lacked body-level correlation. | Added `LoginRequest` with normalized email, bounded validation, standard code/message/correlation/field structure. | `ApiHardeningTest::test_login_validation_uses_the_standard_correlated_error_contract`; updated authentication validation test. | fixed and pushed in `138adc9` |
| W15-H-05 | medium | API responses did not consistently set defensive browser/cache headers. | JSON could be cached or framed contrary to the intended minimized local API boundary; HTTPS responses lacked HSTS. | Added API-only `nosniff`, frame denial, no-referrer, permission denial, no-store/private caching, and HSTS only on secure requests. | `ApiHardeningTest::test_api_responses_include_defensive_headers_and_https_hsts`; collection-level assertions. | fixed and pushed in `138adc9` |

## Preserved before-and-after evidence

- Before: `evidence/week-15/test-results/W15-HARDENING-BEFORE.xml` — six focused tests failed for the six observed contract gaps.
- After: `evidence/week-15/test-results/W15-HARDENING-AFTER.xml` — six focused tests passed with 52 assertions.
- Final collection: `evidence/week-15/test-results/W15-API-RUN-SUMMARY.json` — 36 requests and 234 assertions passed.
- Full regression: `evidence/week-15/test-results/W15-BACKEND-REGRESSION.xml` — 53 tests and 254 assertions passed.
- Supporting verification: Pint passed; the locked Composer audit found no known advisories; Flutter analysis found no issues; six existing widget tests passed.

## Remaining risks

- Response headers do not replace TLS, authorization, safe cookies/tokens, input validation, or infrastructure controls.
- HSTS appears only on HTTPS responses; local HTTP is not presented as HTTPS evidence.
- The local fixed-window rate limiter is not a substitute for a distributed production gateway.
- Idempotent replay is limited to the same student, active term, and exact key hash. A changed key or missing key receives the existing-workflow conflict.
- The public API intentionally has no failure-injection endpoint. Internal timeout and dependency-failure controls are verified through automated tests and controlled services.
- The Postman environment template contains no secrets; a populated local copy remains the student's responsibility and must not be committed.
