# Approval Gates

Version: 1.0.0

Use these gates after risk classification and before the affected action. A user request authorizes normal, reversible implementation inside its stated scope; it does not silently authorize a materially different or externally consequential action.

## Gate matrix

| Gate | Trigger | Minimum approval | Required evidence before asking |
|---|---|---|---|
| AG-01 Scope expansion | New product behavior, system, dependency, party, or deliverable beyond the accepted request | Explicit user direction | Why current scope cannot meet the goal; bounded options |
| AG-02 Destructive or irreversible change | Deletion, overwrite, reset, purge, irreversible transform, or unrecoverable operation | Explicit approval immediately before action | Exact target, blast radius, backup/recovery, dry-run evidence |
| AG-03 Production or release action | Deploy, promote, rollback, publish, release, change production config or traffic | Explicit approval unless the request specifically authorizes that exact action | Artifact identity, checks, rollout, observability, rollback |
| AG-04 Persisted-data migration | Schema/data migration, backfill, re-key, retention purge, destructive import/export | Explicit approval for HIGH/CRITICAL execution | Compatibility, backup, rehearsal, validation, rollback/forward-fix |
| AG-05 Security or identity boundary | Auth, authorization, tenant isolation, keys, secrets, permissions, WAF, trust policy | Explicit approval for weakening, rotation, or production mutation | Threat model, least privilege, exposure analysis, recovery |
| AG-06 Public contract break | Breaking API, event, schema, CLI, file format, or integration behavior | Explicit approval | Consumers, version strategy, migration window, rollback |
| AG-07 External communication | Send email/message, create public issue/PR, contact a person, or publish content | Explicit approval unless directly requested for that exact destination/content | Recipient, content, visibility, reversibility |
| AG-08 Financial or material cost | Purchase, paid resource, quota increase, or action likely to create material spend | Explicit approval | Cost estimate, cap, duration, alternatives |
| AG-09 Sensitive data handling | Export, expose, copy, or broaden access to secrets, credentials, personal or regulated data | Explicit approval plus applicable policy | Data classification, necessity, minimization, destination, deletion plan |
| AG-10 Major dependency/platform evolution | Major version, runtime/platform replacement, new managed service, lock-in increase | Explicit approval for implementation when blast radius is HIGH | compatibility matrix, security/maintenance evidence, staged rollback |
| AG-11 Constitutional weakening | Reduce project-wide safety, quality, approval, compatibility, accessibility, or validation rules | Explicit approval | Exact diff, rationale, risk, compensating controls |
| AG-12 Critical incident action | Emergency production mutation with CRITICAL impact or incomplete evidence | Named incident authority or explicit user approval | hypothesis, stop condition, live telemetry, rollback, action log |

## Approval rules

- Approval must be specific to action, target, environment, and material risk. Approval for analysis is not approval for mutation.
- LOW and MEDIUM read-only checks and reversible workspace edits inside the requested scope do not need extra approval.
- HIGH work may proceed through analysis, design, local implementation, and non-destructive validation while an execution gate remains pending.
- CRITICAL execution pauses at the gate. Do not bundle approval with unrelated choices.
- A dry run, backup, or rollback plan reduces risk but does not replace approval.
- If authority is unclear, preserve state and present the smallest decision needed.
- Record granted, denied, expired, or bypassed gates in the Task Execution Brief and final report.

## Exception handling

Only a higher authority may grant an exception. Record gate ID, approver, timestamp or task context, scope, expiry, compensating control, rollback, and residual risk. Emergency exceptions must be reviewed after stabilization.
