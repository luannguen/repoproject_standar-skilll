---
name: data-lifecycle
description: Design, implement, or review data ownership, modeling, validation, persistence, consistency, retention, deletion, privacy, migration, backup, and recovery across the full lifecycle.
---

# Data Lifecycle Engineering

## Skill contract

- id: data-lifecycle
- name: Data Lifecycle Engineering
- version: 1.0.0
- description: Design, implement, or review data ownership, modeling, validation, persistence, consistency, retention, deletion, privacy, migration, backup, and recovery across the full lifecycle.
- purpose: protect data meaning, integrity, ownership, privacy, compatibility, recoverability, and operational fitness from creation through deletion.
- scope: logical models, ownership, invariants, validation, transactions, concurrency, retention, archival, deletion, privacy, audit, backup, restore, migration, and data-quality controls.
- triggers: schema/entity/model change, persisted state, transaction, backfill, import/export, retention, deletion, privacy, backup/restore, synchronization, or data-quality work.
- exclusions: does not invent domain invariants, replace storage-specific implementation expertise, or authorize production migration or data deletion.
- required_inputs:
  - authoritative domain rules and data owners
  - current schema, access paths, volumes, growth, sensitivity, retention, and consumers
  - consistency, availability, audit, backup, restore, and migration requirements
- expected_outputs:
  - data ownership and invariant map
  - model, validation, transaction, concurrency, lifecycle, and privacy design
  - migration/backfill and compatibility plan
  - data-quality, backup/restore, and validation evidence
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - backend-production-engineering
  - api-integration
  - security-threat-modeling
  - migration-compatibility
  - analytics-telemetry
- prerequisite_skills:
  - project-memory
- next_skills:
  - backend-production-engineering
  - migration-compatibility
  - testing-quality
  - observability-incident
- constraints: minimize sensitive data; enforce invariants at authoritative boundaries; preserve compatibility and recoverability; never infer destructive retention rules.
- blockers: unknown owner or invariant; destructive operation without backup/recovery; cross-tenant ambiguity; unbounded migration; no validation for transformed data; privacy obligation unresolved.
- approval_requirements: production migration, retention purge, destructive transform, sensitive-data export, and weakened integrity or privacy controls require the matching approval gate.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - classify data, owner, authority, consumers, lifecycle, volume, and growth
  - inspect schemas, constraints, transactions, access patterns, backups, and prior migrations
  - identify legal, privacy, retention, and deletion obligations
- post_task_checklist:
  - invariants, ownership, isolation, validation, consistency, and concurrency are enforced
  - retention, deletion, audit, backup, restore, migration, and rollback are operationally defined
  - data-quality and reconciliation checks demonstrate expected outcomes
- validation_process: test invariants, boundary validation, concurrent writes, duplicate/replay behavior, migration counts and checksums, privacy/redaction, retention, backup restore, and old/new compatibility where applicable.
- completion_criteria: data remains correct, owned, isolated, minimized, compatible, auditable, recoverable, and validated through every affected lifecycle stage.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Map data sources, owners, classifications, consumers, lifecycle states, invariants, volumes, and growth.
2. Inspect the current logical and physical model, constraints, access paths, transactions, backups, retention, and known quality issues.
3. Design the smallest model change plus authoritative validation, concurrency, consistency, privacy, audit, retention, and deletion behavior.
4. Plan expand/migrate/contract sequencing, batching, idempotency, checkpoints, reconciliation, backup, restore, and rollback or forward-fix.
5. Implement through owned data-access boundaries and prevent bypass of invariants or tenant rules.
6. Validate representative and adversarial data, migration integrity, recovery, compatibility, and operational telemetry.

## Domain gates

- BLOCKER: every persisted record needs an owner, authoritative write path, and explicit isolation rule where multiple principals exist.
- BLOCKER: destructive transformations require verified backup/recovery or an approved forward-only strategy.
- MUST: deletion semantics cover primary, derived, cached, indexed, exported, audit, and backup copies according to policy.

## Completion report

Report outcome, evidence, decisions, validation, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta without private chain-of-thought.
