# Repository Governance

## Baseline ownership

`.github/CODEOWNERS` establishes a default accountable reviewer for every path. Replace or extend it after cloning so ownership maps to real teams and high-risk areas have explicit specialists.

## Required host settings after clone

These controls live on the repository host and cannot be proven by files alone. An authorized owner must configure and verify them:

- protect the default branch from direct and force pushes;
- require pull requests and at least one approval;
- require CODEOWNERS review for owned paths;
- dismiss stale approvals after material changes;
- require both operating-system jobs from the `Quality Gates` workflow;
- require branches to be current before merge when practical;
- block unresolved review conversations;
- restrict bypass and deletion permissions;
- enable private vulnerability reporting, secret scanning, and push protection when the hosting plan supports them;
- define who may administer settings, publish releases, and access production.

Record the repository URL, owner, verification date, and any accepted exception in `PROJECT-PROFILE.json` or Project Memory. A workflow file does not prove these settings are enforced.

## Pull requests

Every material pull request states scope, exclusions, risk, approval gates, validation evidence, compatibility, recovery, documentation, and conditional gaps. Prefer small changes with one dominant outcome. High-risk changes require reviewers able to assess the affected trust, data, release, or operational boundary.

## License decision

The reusable template layer is licensed under Apache-2.0. A project created from the template must still select and document the distribution terms for its application code; that project decision may differ while preserving the Apache-2.0 notices and obligations for reused template material.

## Exceptions

An exception records the unmet control, evidence, impact, compensating control, approver, owner, review date, and removal trigger. Exceptions never silently convert an unavailable check into a pass.
