# Week 15 Test Strategy Scope and Traceability

## Decision question

How should the Student Clearance Workflow combine API collection tests, Laravel feature tests, Flutter widget tests, and controlled browser checks so that normal behavior, role and ownership boundaries, dependency failures, recovery, and hardening changes are reproducible without exposing secrets or using real student data?

## Context and approved scope

Week 15 continues the tagged Week 14 build at commit `2fe765ac2d82037fda596443339c87db12087f7f`. The bounded workflow remains clearance initiation, parallel office review, deficiency reporting and resolution, office approval, completion, automation review, and the administrator-only secure exchange. The backend is authoritative for identity, role, office assignment, object ownership, state transitions, and validation. The Flutter Web client is a testable public client and never stores server secrets.

The Week 15 increment will add traceable integration evidence, an executable API collection, controlled failure cases, at least three justified hardening changes, targeted retests, and a full regression result. It will not connect to production systems, use real university records, introduce mobile packaging, or claim production readiness.

## Actors and acceptance authority

| Actor | Week 15 test responsibility or permitted action |
| --- | --- |
| Student | Initiate and view only their own clearance; resolve only their own deficiency; verify student-facing Flutter states. |
| Clearing-office reviewer | View and act only on tasks assigned to their office; verify office queue and decision boundaries. |
| Authorized administrator | Inspect automation failures, retry eligible deliveries, and send the protected exchange; accept the bounded technical test result for the prototype. |
| Student developer | Prepare controlled data, execute repeatable checks, preserve actual outcomes, fix justified weaknesses, and state limitations. |
| Instructor | Final academic acceptance authority; may require reproduction, explanation, or additional evidence. |

## Approaches considered

### Approach A selected layered verification

Use a versioned Postman-compatible collection for externally visible API behavior, Laravel feature tests for database state and internal failure controls, Flutter widget tests for deterministic client states, and a small number of genuine browser checks for responsive and accessibility behavior.

Advantages:

- Gives the instructor a portable API artifact while retaining strong database and authorization assertions.
- Separates provider defects, client assumptions, and environment failures.
- Supports targeted retests and a repeatable regression suite.
- Preserves adverse cases without pretending every condition is best demonstrated through a browser.

Disadvantages and responsibilities:

- The same requirement may appear at more than one layer and must be kept traceable without redundant claims.
- Collection data and tokens must remain controlled and must not be committed with live values.
- Browser checks require careful capture and cannot replace executable assertions.

### Approach B rejected collection-only verification

Use only a Postman collection and manual browser checks.

Advantages:

- Easy to demonstrate externally visible requests and responses.
- Familiar request-by-request workflow.

Reasons rejected:

- Cannot reliably prove database rollback, absence of partial records, bounded retry history, or duplicate side-effect prevention.
- Produces weaker regression coverage for authorization and Flutter state rendering.
- Encourages manual setup drift and makes failure reproduction more dependent on the current database state.

## Decision

Use Approach A. The collection will verify the public contract, Laravel tests will prove server-owned state and internal safety properties, Flutter tests will cover client rendering and validation, and genuine browser evidence will cover the final responsive workflow. Each result will identify its environment, build, controlled data, expected outcome, actual outcome, and evidence path.

## Consequences and review condition

The project gains a stronger, reproducible evidence chain but must maintain several test artifacts and avoid double-counting results. The decision must be reviewed if the API contract changes, a real external dependency replaces the local adapter, the authentication model changes, or the instructor requires a different collection runner.

## Boundaries ownership and contracts

| Boundary | Owner | Success contract | Failure contract | Evidence |
| --- | --- | --- | --- | --- |
| Flutter Web to Laravel API | Student developer for prototype | Valid JSON request receives documented status and schema; UI shows an understandable state. | Network, validation, authentication, authorization, and server errors remain bounded and do not expose diagnostic detail. | Widget tests, collection results, browser screenshots. |
| Laravel API to MariaDB | Backend service | Valid state change is atomic and auditable. | Invalid or interrupted work creates no partial or unauthorized state. | Laravel feature tests and database assertions. |
| Queue worker to local notification gateway | Backend automation | Delivery records one intended effect with a correlation identifier. | Timeout or unavailable dependency stops within the configured attempt limit and routes permanent failure for human action. | Failure-injection tests, attempt records, sanitized logs. |
| Laravel sender to controlled HTTPS receiver | Backend integration | Certificate, service authentication, freshness, and authenticated encryption checks succeed. | Altered, stale, replayed, unauthenticated, or unavailable requests are rejected safely. | Secure-exchange tests and controlled transport evidence. |

## Test layers and ownership

| Layer | Primary purpose | Tool | Exit condition |
| --- | --- | --- | --- |
| Static and dependency checks | Formatting, analyzer findings, known advisories | Pint, Composer audit, Flutter analyze | No unexplained failure or known locked-package advisory. |
| API contract collection | Methods, resources, status codes, schema, validation, authentication, authorization, duplicate, not-found, and recovery behavior | Postman-compatible collection and CLI runner | Every in-scope request records an unambiguous assertion result. |
| Backend integration | Transactions, ownership, state transitions, idempotency, dependency failures, concurrency where applicable | Laravel PHPUnit | Targeted and complete suites pass after justified fixes. |
| Flutter component | Form validation and loading, success, empty, authentication, authorization, network, server-error, and recovery states | Flutter widget tests | Required states are deterministic and accessible to test. |
| Browser journey | Real API interaction, keyboard use, responsive layout, status feedback | Flutter Web in a supported browser | Desktop and narrow journeys remain readable, operable, and accurately evidenced. |

## Requirements to test traceability matrix

Status values are `baseline`, `planned`, `executed`, `failed`, or `passed`.

| Test ID | Requirement or risk | Type | Preconditions and controlled data | Expected result | Planned evidence | Status |
| --- | --- | --- | --- | --- | --- | --- |
| W15-TC-001 | Valid student clearance initiation | Positive and contract | Authenticated fictional student, active term, active offices | `201`; one clearance and one task per active office; correlation header and documented schema | API collection plus Laravel assertion | baseline |
| W15-TC-002 | Missing or malformed term code | Negative validation | Authenticated fictional student | `422`; safe field error; no partial records | API collection plus Laravel assertion | baseline |
| W15-TC-003 | Maximum and over-maximum input boundaries | Boundary | Controlled term, deficiency, and resolution strings | Maximum accepted where valid; over-maximum rejected with `422` and no state change | API collection and targeted tests | planned |
| W15-TC-004 | Missing or revoked authentication | Authentication | No token or revoked fictional token | `401`; no protected data or state change | API collection and authentication tests | baseline |
| W15-TC-005 | Student attempts another student's object | Object authorization | Two fictional students and one owned deficiency or clearance | `403` or intentionally non-disclosing outcome; no state change | API collection and Laravel ownership assertion | baseline |
| W15-TC-006 | Wrong role calls protected function | Function authorization | Student or office token on administrator route | `403`; no privileged action | API collection and role tests | baseline |
| W15-TC-007 | Office attempts another office's task | Object authorization | Two fictional offices and assigned task | `403`; task and clearance unchanged | API collection and workflow test | baseline |
| W15-TC-008 | Unknown route-bound object | Not found | Valid token and nonexistent controlled identifier | JSON `404` with correlation identifier and no stack trace | API collection and hardening test | planned |
| W15-TC-009 | Repeated clearance creation | Duplicate and idempotency | Same student and term or repeated idempotency key | `409` or same intended effect; no duplicate tasks or events | API collection and database assertions | baseline |
| W15-TC-010 | Login rate control | Security boundary | Repeated wrong password for fictional account | Bounded attempts followed by `429`; generic credential message before limit | API collection and authentication test | baseline |
| W15-TC-011 | API security headers | Security hardening | Any API response | Required defensive headers present without weakening CORS or caching expectations | Contract test before and after fix | planned |
| W15-TC-012 | Controlled dependency timeout | Reliability | Local notification adapter configured to time out | Bounded attempts, observable safe failure, no duplicate effect | Failure-injection log and Laravel test | planned |
| W15-TC-013 | Dependency unavailable | Reliability | Local gateway or active-office dependency unavailable | Safe `503` or bounded human-action route; consistent data | API collection and Laravel test | baseline |
| W15-TC-014 | Recovery after transient failure | Recovery | First controlled delivery attempt fails, next succeeds | Same correlation context; success within limit; one final effect | Failure-injection log and Laravel test | baseline |
| W15-TC-015 | Permanent failure | Recovery and human action | Controlled non-retryable or exhausted failure | Processing stops; one human-action item; no secret leakage | Laravel test and sanitized log | baseline |
| W15-TC-016 | Flutter required states | UI behavior | Controlled API fakes or intercepts | Loading, success, empty, validation, authentication, authorization, network, server-error, and recovery feedback are understandable | `frontend/test/week15_state_test.dart`; `W15-FLUTTER-REGRESSION.json` | passed |
| W15-TC-017 | Responsive and keyboard operation | Accessibility and usability | Desktop and responsive browser; semantics-enabled controls | Login and retry actions remain visible and operable with an understandable status message | `W15-APP-001`; `W15-APP-002` | executed; broader role journey inherited from Week 14 |
| W15-TC-018 | Full regression after hardening | Regression | Current Checkpoint 3 working tree | 53 backend tests/254 assertions, 14 Flutter tests, formatting, analysis, audit, and 234 API assertions pass | Saved backend, API, and Flutter result files | passed |

## Measurable acceptance criteria

- Every listed API case has controlled preconditions, exact expected status or state, actual outcome, timestamp, and evidence path.
- No test uses real personal data, a production endpoint, a committed token, or a committed secret.
- Authentication and object or function authorization failures produce no protected data and no state change.
- Invalid, duplicate, timeout, and unavailable-dependency behavior is bounded and observable.
- At least three ranked weaknesses are corrected, each with a failing or gap-demonstrating baseline, a justified fix, a targeted retest, and regression evidence.
- The collection and automated suites are repeatable from documented setup instructions.
- Flutter Web presents the required normal and adverse states at desktop and narrow widths; tablet is checked where practical.
- Conclusions distinguish executed results from planned, simulated, or unverified behavior.

## Preparation checkpoint evidence

The preparation checkpoint is complete only when the feature branch, Week 15 evidence structure, laboratory log, controlled dataset, architecture and screen-flow diagram, this strategy, the evidence index, progress record, and checklist can be inspected before implementation begins.

## Residual limitations before execution

- The collection and new Week 15 tests have not yet been executed.
- Timeout and server-error UI behavior still require a controlled, accurately labeled test arrangement.
- Concurrency testing will be included only where the current local environment can produce repeatable results without overstating scale.
- The Week 14 tag exists, but its matching GitHub Release is absent and is outside this checkpoint's authority.
- Final academic acceptance belongs to the instructor; the prototype is not production ready.
