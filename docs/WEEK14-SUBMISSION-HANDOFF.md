# Week 14 Submission Handoff

This is the practical file list for submitting Week 14. The exact upload format or platform must still follow the instructor's current direction; the module does not prescribe one fixed ZIP, Word, or PDF package.

## Primary file to pass

1. `C:\Users\Admin\Documents\IPT\Evidence Document\Week-14-Screenshot-Journey-and-Evidence.docx`
   - One combined Week 14 evidence document.
   - Includes the full weekly journey, Activity 1, Activity 2, SA8, IA5, decisions, failures and recovery, tests, limitations, reflection prompts, evidence mapping, and thirteen screenshots with controlled UI simulations clearly labeled.
   - Identifies `Malapote, Xhyrone Wayne N.` and `BSIT 3-A`.
   - Stored outside Git as the primary Word submission artifact.

## Repository materials to provide or demonstrate

Use the continuing repository, not a separate Week 14 repository:

- Repository: `https://github.com/malapotexhyrone-bit/IPT_Weeks-13-18_Student-Clearance-Workflow`
- Branch before release: `week14-secure-integration`
- Week 14 report: `docs/WEEK14-SECURE-INTEGRATION-REPORT.md`
- Evidence index: `evidence/week-14/EVIDENCE-INDEX.md`
- Original screenshots: `evidence/week-14/screenshots/`
- Test and transport records: `evidence/week-14/test-results/`
- Failure and recovery records: `evidence/week-14/logs/`
- Backend source and reproducible setup: `backend/`
- Flutter Web source and dependency records: `frontend/`
- Setup and project history: `README.md`, `CHANGELOG.md`, and `SUBMISSION-CHECKLIST.md`

After separate approval, the final immutable version should be:

- Tag: `v14.0.0-week14-secure-integration`
- Release title: **Week 14 — Secure Data Exchange and Encryption**
- Release/ZIP: use the GitHub release generated from the approved final Week 14 commit.

## Do not submit or upload

- Any real `.env` file.
- Encryption, HMAC, service-authentication, or application keys.
- Private TLS certificate keys or live credentials.
- Temporary plaintext password files.
- `vendor/`, generated builds, caches, editor state, or unrelated personal files.
- Claims of production readiness, instructor grading, stakeholder acceptance, or completed defense that did not occur.

## Student checks before passing

1. Open the central DOCX and verify the student name, section, screenshots, and captions.
2. Personalize and verify the reflection answers in the student's own words.
3. Rehearse the secure-exchange walkthrough and adverse cases so the implementation can be explained and defended.
4. Confirm whether the instructor wants the DOCX only, the GitHub release link, a release ZIP, a PDF export, or a combination.
5. Do not use the final tag or release until the final checkpoint and the separate tag/release action are explicitly approved.
