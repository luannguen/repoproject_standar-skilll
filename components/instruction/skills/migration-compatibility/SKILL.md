---
name: migration-compatibility
description: Plan, implement, and validate backward- and forward-compatible transitions across schemas, data, APIs, events, configuration, runtime, dependencies, and deployments.
---

# Migration and Compatibility Engineering

## Skill contract

- id: migration-compatibility
- name: Migration and Compatibility Engineering
- version: 1.0.0
- description: Plan, implement, and validate backward- and forward-compatible transitions across schemas, data, APIs, events, configuration, runtime, dependencies, and deployments.
- purpose: change live systems incrementally without breaking consumers, corrupting data, blocking rollback, or creating uncontrolled transition states.
- scope: compatibility matrix, expand/migrate/contract sequencing, dual read/write, adapters, backfills, checkpoints, cutover, rollback/forward-fix, deprecation, and cleanup.
- triggers: schema/data/API/event/config/runtime migration, breaking change, import/export, provider replacement, version transition, deprecation, or compatibility review.
- exclusions: does not execute production cutover or destructive cleanup without approval, preserve compatibility forever, or assume rollback is possible.
- required_inputs:
  - current and target contracts, schemas, formats, versions, consumers, and deployment order
  - data volume/quality, write/read patterns, consistency, downtime, retention, and recovery constraints
  - monitoring, ownership, change window, compatibility horizon, and prior migration evidence
- expected_outputs:
  - compatibility matrix and phased migration plan
  - idempotent migration/backfill/cutover implementation
  - validation, reconciliation, checkpoints, and observability
  - rollback or forward-fix plan plus deprecation and cleanup criteria
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - data-lifecycle
  - api-integration
  - dependency-evolution
  - devops-release
  - testing-quality
- prerequisite_skills:
  - project-memory
- next_skills:
  - testing-quality
  - devops-release
  - observability-incident
  - documentation-sync
- constraints: prefer expand/migrate/contract; support mixed versions during rollout; checkpoint long work; preserve old readers until verified cutover; time-bound compatibility code.
- blockers: unknown consumer or deployment order; destructive step precedes verified backup/cutover; old/new versions cannot coexist; no reconciliation; rollback claim contradicted by transformed data.
- approval_requirements: production migration/cutover, destructive contract phase, downtime, public break, or irreversible data transform requires explicit approval.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - inventory producers, consumers, versions, schemas, deployment order, data volume, and compatibility promises
  - inspect prior migrations, backups, restore, quality issues, and observability
  - define mixed-version window, invariants, checkpoints, stop, rollback, and forward-fix
- post_task_checklist:
  - old and new paths coexist for the required window
  - migration is resumable/idempotent and reconciliation proves completeness/correctness
  - cutover, deprecation, cleanup, monitoring, rollback or forward-fix are explicit
- validation_process: rehearse on representative copies; test old/new producer-consumer matrices, interrupted resume, duplicates, partial failure, counts/checksums/samples, performance, rollback boundaries, and cleanup preconditions.
- completion_criteria: the transition is compatible and observable; data/contracts reconcile; execution is resumable and recoverable; cleanup occurs only after verified exit criteria and approval.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Build a matrix of current/target producers, consumers, schemas, formats, versions, deployment order, and compatibility guarantees.
2. Choose expand/migrate/contract or another staged strategy; identify mixed-version states and precise invariants for each phase.
3. Design idempotent batches, checkpoints, throttling, retries, reconciliation, backup, observability, stop, rollback, and forward-fix.
4. Implement additive compatibility first, migrate or backfill safely, switch reads/writes with telemetry, then verify cutover.
5. Rehearse interruption, resume, partial failure, old/new combinations, scale, and recovery on representative data/environment.
6. Remove compatibility code or destructive old state only after exit criteria, retention window, consumer confirmation, and approval.

## Domain gates

- BLOCKER: contract/destructive phase cannot precede verified consumer cutover and recovery readiness.
- BLOCKER: long-running migration requires idempotency, checkpoints, throttling, and reconciliation.
- MUST: rollback claims state the last reversible phase and how new writes/data are handled.

## Completion report

Report outcome, evidence, decisions, validation, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta without private chain-of-thought.
