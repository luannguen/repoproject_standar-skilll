---
name: project-memory
description: Operate the repository's evidence-based Project Memory and continuity system. Use for every project task before specialist analysis or implementation, and after work to retrieve, verify, reconcile, write back, lint, checkpoint, resume, or archive reusable project knowledge without relying on chat history.
---

# Project Memory

Use this skill as the mandatory memory router. Keep memory selective, evidenced, and subordinate to current authoritative sources.
## Skill contract

- id: project-memory
- name: Project Memory
- version: 1.1.0
- description: retrieve, verify, reconcile, write, compact, lint, checkpoint, and archive durable project knowledge without treating chat history or memory as authoritative implementation evidence.
- purpose: preserve trustworthy cross-task continuity while minimizing context and preventing stale or speculative knowledge from steering work.
- scope: explicit separation of Semantic Memory (indexed facts, constraints, decisions, incidents, architecture graphs) and Procedural Memory (compiled VOPL habits, execution traces, reflex parameters).
- triggers: every project task before specialist work and after material analysis or change; any request to retrieve, reconcile, update, validate, compact, resume, or audit Project Memory.
- exclusions: does not replace current code, configuration, runtime evidence, user intent, specialist analysis, or store secrets, raw transcripts, private chain-of-thought, speculation, and temporary logs.
- required_inputs:
  - task class, goal, scope, affected paths, domain terms, errors, dependencies, and risk
  - project-memory index plus current authoritative source evidence
  - relevant constraints, decisions, incidents, debt, questions, and nearest checkpoint
- expected_outputs:
  - concise verified Memory Context
  - stale, conflicting, missing, or superseded knowledge findings
  - durable indexed memory delta or explicit no-update decision
  - linted checkpoint or completed-task summary when lifecycle requires it
- required_files:
  - ../../PROJECT-CONSTITUTION.md
  - ../../SKILL-REGISTRY.json
  - ../../AI-BOOTSTRAP.md
  - ../../project-memory/INDEX.md
  - ../../project-memory/memory-index.json
- related_skills:
  - project-orchestrator
  - documentation-sync
  - every task-selected capability skill
- prerequisite_skills:
  - none
- next_skills:
  - task-selected capability skills
  - documentation-sync
  - project-orchestrator
- constraints: retrieve progressively; keep memory subordinate to authoritative current evidence; update index and detail atomically; retain provenance, status, confidence, and lifecycle.
- blockers: malformed index; duplicate active ID; missing indexed target; secret or sensitive data; unresolved conflict on a material fact; required source verification unavailable for a high-risk claim.
- approval_requirements: ordinary verified memory updates inside scope need no extra approval; weakening memory policy, deleting durable history, changing global contracts, or recording sensitive material requires the matching approval.
- execution_workflow: follow the Pre-task and Post-task workflows plus the referenced memory policies.
- pre_task_checklist:
  - classify the task and build a focused retrieval query
  - scan constraints and path/trigger-matched active entries
  - verify material memory against current authoritative sources
  - report stale, conflicting, or uncertain entries
- post_task_checklist:
  - identify only durable material deltas
  - choose update, supersede, checkpoint, complete, archive, merge, or no-write lifecycle
  - synchronize detail and index, then run memory lint
- validation_process: apply references/VALIDATION.md and references/CONFLICT-RESOLUTION.md, then run scripts/memory-lint.ps1 with zero blockers before claiming validity.
- completion_criteria: relevant context is concise and verified; durable deltas are correctly indexed and lifecycle-managed; no secret, dangling reference, duplicate active fact, or lint blocker remains.
- exception_policy: record rule, reason, scope, source, risk, compensating control, approval, expiry, and remediation; never allow memory to override a higher-authority current source.
- memory_read_policy: use index metadata, then summaries, then detail, then source verification only as relevance and risk require; do not read the whole store.
- memory_write_policy: explicitly classify writes as Semantic (facts/decisions) or Procedural (compiled VOPL habits). Only compile a Procedural Habit when an execution trace demonstrates high success rate and stability.
- update_policy: version policy changes, update CHANGELOG, validate templates and index contracts, and require approval before weakening source authority, secret protection, verification, conflict, or deletion rules.


## Pre-task workflow

1. Read `../../AI-BOOTSTRAP.md` and classify the task.
2. Build a retrieval query from task type, goal, domain, module, feature, entity, affected paths, dependency, error text, integration, migration, permission, security scope, and business terms.
3. Read `../../project-memory/INDEX.md`, then filter `../../project-memory/memory-index.json` before opening detail files.
4. Retrieve in order: project constraints, domain, module, feature, similar incidents, closest checkpoint, then relevant debt/open questions.
5. Verify material entries against current sources. Use [VALIDATION.md](references/VALIDATION.md); use [CONFLICT-RESOLUTION.md](references/CONFLICT-RESOLUTION.md) for disagreement.
6. Produce a short Memory Context Summary with task classification, verified facts, constraints, decisions, incidents, checkpoint, stale/conflicting items, items needing verification, and source paths.
7. Only then load the relevant FE, BE, or other specialist instructions. For cross-stack work, follow [SPECIALIST-INTEGRATION.md](references/SPECIALIST-INTEGRATION.md).

For a trivial task, perform the same flow as a lightweight scan: project constraints plus path-, module-, and trigger-matched active entries.

## Source authority

Separate implementation reality, intended contract, historical behavior, and future proposal. Memory is a navigation and synthesis layer, never the highest authority. Apply the source-specific precedence in [MEMORY-POLICY.md](references/MEMORY-POLICY.md).

Never store secrets, private production data, credentials, or chain-of-thought. Store concise decisions, evidence, outcomes, risks, unknowns, and next steps.

## Progressive retrieval

Use four stages only as needed:

1. index metadata;
2. entry summary;
3. detail file;
4. source verification.

Do not read the whole memory store. Rank candidates using [RETRIEVAL.md](references/RETRIEVAL.md).

## Post-task workflow

1. Review new verified facts, decisions, patterns, failures, root causes, incidents, debt, open questions, changed contracts, and stale entries.
2. Apply the materiality and lifecycle rules in [WRITE-POLICY.md](references/WRITE-POLICY.md).
3. Copy the appropriate file from `assets/templates/`; never omit required contract fields.
4. Update `../../project-memory/memory-index.json` in the same change as the detail entry.
5. If incomplete, create an exact task checkpoint. If complete, compact working memory into a task summary and move it under `tasks/completed/`.
6. Run `scripts/memory-lint.ps1`. Do not claim the memory system is valid while a BLOCKER remains.

## Load details only when needed

- Core types, scope, source authority, lifecycle, and controlled learning: [MEMORY-POLICY.md](references/MEMORY-POLICY.md)
- Query construction, scoring, and context packs: [RETRIEVAL.md](references/RETRIEVAL.md)
- Write-back, checkpoints, and approval boundaries: [WRITE-POLICY.md](references/WRITE-POLICY.md)
- Contracts and field requirements: [CONTRACTS.md](references/CONTRACTS.md)
- Verification, staleness, and lint severity: [VALIDATION.md](references/VALIDATION.md)
- Disputes and supersession: [CONFLICT-RESOLUTION.md](references/CONFLICT-RESOLUTION.md)
- Compaction, archive, merge, and deletion: [GARBAGE-COLLECTION.md](references/GARBAGE-COLLECTION.md)
- Pre/post-task gates: [CHECKLIST.md](references/CHECKLIST.md)
- Reusable approaches: [PATTERNS.md](references/PATTERNS.md)
- Prohibited behavior: [ANTI-PATTERNS.md](references/ANTI-PATTERNS.md)
- Skill changes: [CHANGELOG.md](references/CHANGELOG.md)
