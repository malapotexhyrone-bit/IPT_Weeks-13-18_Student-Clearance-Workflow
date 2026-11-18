# Activity 1 Requirements to Tests

## Problem and decision

The Student Clearance Workflow already completed its main classroom journey, but one successful demonstration could not prove malformed-input handling, role and ownership boundaries, duplicate protection, dependency recovery, or safe error behavior. The decision was to establish a repeatable test baseline that links every important workflow requirement to controlled data, an expected result, an actual result, and reproducible evidence.

The approved scope remains clearance initiation, office review, deficiency reporting and resolution, approval, completion, automation failure review, and the administrator-only protected exchange. The instructor is the academic acceptance authority. The administrator role may accept only the bounded prototype result; it does not represent institutional production approval.

## Assumptions constraints and dependencies

- All identities, terms, offices, deficiencies, and resolutions are fictional or controlled.
- Laravel owns authentication, role assignment, office assignment, object ownership, state transitions, and validation.
- Flutter Web is a public client and cannot be trusted to hold confidential credentials.
- MariaDB, the database queue, the local notification adapter, and the controlled HTTPS receiver are classroom dependencies.
- Production services, real student records, large-scale load claims, mobile packaging, and production readiness are outside scope.

## Approaches compared

| Criterion | Layered collection and automated tests selected | Collection and manual browser checks rejected |
| --- | --- | --- |
| Functional and contract behavior | Portable Postman-compatible assertions plus Laravel database checks | Good visible request coverage but weak internal-state proof |
| Authorization | External role tests plus server-side ownership assertions | Can observe status codes but may miss partial mutation |
| Reliability | Internal timeout, retry, recovery, and human-action assertions | Public failure injection would add unsafe test-only surface |
| Flutter behavior | Deterministic widget states plus two genuine browser layouts | Manual checks are harder to repeat consistently |
| Maintenance cost | Several artifacts must stay synchronized | Fewer artifacts, but more manual setup drift |
| Evidence quality | Preserves expected and actual outcomes at the correct layer | Risks treating screenshots as proof of internal safety |

The layered approach was selected because it tests each claim where that claim can be observed reliably. Its disadvantage is the need to maintain traceability among the collection, Laravel tests, Flutter tests, and browser evidence.

## Requirements to results summary

The complete matrix is maintained in `../assessment/WEEK15-TEST-STRATEGY.md`. The executed evidence establishes:

- normal initiation and the complete clearance workflow;
- invalid and boundary input handling without partial records;
- unauthenticated, wrong-role, cross-student, and cross-office rejection;
- safe not-found behavior and correlation identifiers;
- exact idempotent replay without duplicate tasks or events;
- login rate control and defensive API headers;
- timeout, unavailable dependency, transient recovery, bounded retry, and permanent human-action routing;
- loading, empty, authorization, not-found, network, timeout, server-error, and recovery Flutter states;
- desktop and narrow browser presentation.

The adverse ownership case used two fictional students. A peer student attempted an action on an object owned by the other student. The expected result was a non-disclosing forbidden response with no mutation; the collection and Laravel ownership assertions produced that result.

## One page interpretation

### Observed facts

The final Postman-compatible run executed 36 requests and passed 234 assertions. The focused hardening suite first failed 6 tests with 20 assertions and later passed 6 tests with 52 assertions. The full Laravel regression passed 53 tests with 254 assertions. The Flutter regression passed 14 tests, including eight Week 15 state scenarios. Two genuine browser captures show the desktop login and a narrow unavailable-service response. Three failed collection runs were preserved and diagnosed rather than deleted.

### Reasoned conclusions

The evidence supports the bounded conclusion that the controlled build enforces the tested workflow, validation, authentication, authorization, duplicate, error-contract, retry, and UI-state expectations. The strongest evidence comes from combining layers: the collection proves the public contract, Laravel tests prove protected state and failure controls, Flutter tests prove deterministic rendering, and browser captures prove selected real layouts. A screenshot alone would not support a database-safety claim, and an internal test alone would not prove responsive presentation.

The result does not establish production security, institutional acceptance, large-scale concurrency, or external-service reliability. The local notification adapter and HTTPS receiver are controlled substitutes. The browser run with the API unavailable proves safe visible recovery feedback, not a live successful backend journey.

### Recommendation

Retain the layered strategy and rerun the focused and complete suites whenever the API contract, role model, external dependency, or Flutter state mapping changes. Before broader use, an authorized maintainer should repeat the collection in a controlled nonproduction environment, add environment-level concurrency and transport observations, and verify operational monitoring without introducing a public failure-injection endpoint.

## Evidence

- Strategy and complete matrix: `../assessment/WEEK15-TEST-STRATEGY.md`
- System and Flutter flows: `../diagrams/WEEK15-SYSTEM-TEST-DESIGN.md`
- Controlled data and collection: `../evidence/api-tests/`
- Executed results and preserved failures: `../evidence/test-results/`
- Evidence mapping: `../evidence/EVIDENCE-INDEX.md`

## Limitation and next improvement

The controlled environment does not reproduce production networking or distributed rate limiting. A realistic next improvement is to run the same versioned collection against an instructor-approved nonproduction deployment while recording exact configuration, network conditions, and result timestamps.
