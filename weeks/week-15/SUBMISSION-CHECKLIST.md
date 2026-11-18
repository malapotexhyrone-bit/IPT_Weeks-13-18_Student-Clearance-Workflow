# Week 15 Submission Checklist

Status values are `complete`, `pending student`, `pending approval`, or `not applicable with justification`.

| Requirement | Status | Evidence or action |
| --- | --- | --- |
| Continuing repository and Week 14 history preserved | complete | Week 15 continues from `2fe765a`; existing Week 13 and Week 14 tags were not moved or recreated. |
| Project 8 approval and registration | complete with stated boundary | Student confirmation is recorded; official registry was not inspected. |
| Bounded clearance workflow traced end to end | complete | Strategy, system design, collection, and regression cover initiation, review, deficiency, resolution, approval, and completion. |
| Another student's clearance or deficiency action rejected | complete | Collection and Laravel ownership assertions use two fictional students. |
| Different-role and different-office actions rejected | complete | Wrong-role, administrator-route, and cross-office cases pass without mutation. |
| Repeatable Postman or equivalent collection | complete | 36 requests and 234 assertions pass; collection and no-secrets environment are versioned. |
| Normal, invalid, unauthorized, forbidden, not-found, duplicate, timeout, and dependency-failure cases | complete | Public contract plus internal failure suites cover every required category. |
| Requirements linked to preconditions, data, expected, actual, and evidence | complete | Eighteen-case matrix, controlled dataset, results record, and evidence index. |
| Failure prediction, controlled execution, safe handling, and recovery | complete | System design prediction, automation tests, preserved failed runs, and laboratory log. |
| At least three justified weaknesses fixed | complete | Five ranked weaknesses fixed and retested. |
| Targeted retests and complete regression | complete | 6/52 focused pass; 53/254 backend; 36/234 collection; 14 Flutter. |
| Flutter loading, success, empty, validation, authentication, authorization, network, and server-error behavior | complete | Existing role journeys plus eight focused Week 15 states and complete Flutter regression. |
| Responsive browser evidence | complete | Genuine desktop login and narrow unavailable-service captures. |
| Desktop and narrow workflow verified | complete with limitation | Selected real states captured; successful role journeys are inherited from Week 14 and API behavior is independently tested. |
| Activity 1 and one-page interpretation | complete | `activities/ACTIVITY-1-REQUIREMENTS-TO-TESTS.md`. |
| Activity 2 and one-page interpretation | complete | `activities/ACTIVITY-2-BOUNDED-HARDENING-REVIEW.md`. |
| IA6 strategy, collection, data, results, logs, defects, fixes, regression, and remaining risk | complete | `assessment/IA6-INTEGRATION-TESTING-AND-HARDENING.md`. |
| Exact environment, build, time, and scope | complete | `evidence/logs/LABORATORY-LOG.md`. |
| Failed results preserved | complete | Three collection failures plus pre-fix focused JUnit evidence remain indexed. |
| Secret and personal-data boundary | complete | Fictional controlled data, blank sensitive environment values, and documented scans. |
| Source, configuration example, setup, and run instructions | complete | Repository source, `.env.example`, README, collection guide, and IA6 reproduction commands. |
| Central Week 15 evidence DOCX | complete | Primary copy remains outside Git; 13 pages were rendered and visually inspected. |
| Final dependency advisory review | complete | Laravel 12.70.2 was updated to 12.73.0 for `CVE-2026-128083`; lockfile valid, final audit clean, 53/254 regression passes. |
| Genuine focused Flutter terminal screenshot | pending student | Machine-readable pass exists; manual capture steps are in laboratory log Entry 011. This gap does not convert an unexecuted screenshot into a pass. |
| Student reflection and individual contribution wording | pending student | Student must answer the four IA6 prompts truthfully and reproduce selected checks. |
| Final Week 15 package review | complete | Student approved the complete package after reviewing the summary and verification results. |
| Final Week 15 commit and push | complete | Pushed as `ec402134e297671b8aace89c938193fbd12b0ae2` to `origin/week-15-testing-hardening`. |
| Week 15 tag and GitHub Release | pending separate approval | Proposed tag: `v15.0.0-week15-testing-hardening`; release title: `Week 15 — Integration Testing and Security Hardening`. |
| Week 16 work | not applicable with justification | Not authorized and not started. |

## Final review commands

```text
git status --short
git diff --check
git diff --stat
git diff --staged
```

Stage only the explicit Week 15 paths and the root status documents after approval. Do not use a blanket stage that could include unrelated files.
