# Week 15 API Collection Guide

## Purpose and boundary

The Postman 2.1 collection exercises the Student Clearance Workflow through the public API. It covers the normal journey, validation, boundary values, unauthenticated requests, wrong-role and cross-office actions, another student's attempted action, safe not-found responses, idempotent replay, conflicting duplicates, completion, administrator boundaries, security headers, correlation identifiers, and rate limiting.

Timeout, unavailable-dependency, bounded retry, recovered transient failure, and permanent failure routed for human action remain in the Laravel automation and secure-exchange suites. The application intentionally has no public endpoint that injects failures or changes database state for a test tool.

## Files

- `week15-student-clearance.postman_collection.json`: versioned collection with request assertions.
- `week15-local.postman_environment.json`: no-secrets template. Passwords and tokens are blank.
- `controlled-data.json`: readable fictional-data inventory shared with the traceability matrix.

## Preconditions

1. Use only the local controlled database. Do not point the collection at production or real student records.
2. From `backend/`, run `php artisan migrate:fresh --seed` only when resetting the authorized disposable local database.
3. Use a cache store that persists across HTTP requests, such as the migrated `database` store. Laravel's `array` store resets on each local request and cannot demonstrate the sixth-request rate limit.
4. Start the API with `php artisan serve --host=127.0.0.1 --port=8000`.
5. Import the collection and environment template into Postman.
6. Duplicate the environment locally before entering secrets. Do not commit the populated copy.
7. For each fictional identity, run `php tools/reset-demo-password.php <email>` from the repository root and copy the one-time displayed password into only the local Postman environment:
   - `student.demo@example.test`
   - `student.peer@example.test`
   - `registrar.reviewer@example.test`
   - `library.reviewer@example.test`
   - `accounting.reviewer@example.test`
   - `student.affairs.reviewer@example.test`
   - `clearance.admin@example.test`
8. Delete any ignored private credential file after the controlled run. Never copy passwords or tokens into screenshots, logs, the exported environment template, Git, or the evidence document.

## Execution order

Run the whole collection from top to bottom against a freshly seeded database. The collection stores tokens, workflow identifiers, the idempotency key, office task identifiers, and the deficiency identifier only in the active local environment.

The rate-limit folder must run last because its sixth request intentionally receives `429 RATE_LIMITED`. Wait for the one-minute window or reset the test cache before repeating that folder.

## Expected summary

- Normal initiation returns `201`; identical replay returns `200` with `meta.replayed = true`; a changed duplicate returns `409`.
- Unauthenticated, role-forbidden, office-forbidden, peer-student, validation, and not-found requests do not mutate the workflow.
- A 1,000-character deficiency description is accepted while the too-short case is rejected.
- The owning student resolves the deficiency; re-review and all office approvals complete the clearance.
- Every API response includes a correlation header and defensive response headers.
- The sixth repeated failed login for the same fictional account and IP returns the safe correlated `429` contract.

## Evidence record

Export the Postman run or CLI result without its populated environment. Record the build/commit, date/time, database reset, expected and actual counts, failures, rerun results, and evidence path. A collection definition alone is not execution evidence.
