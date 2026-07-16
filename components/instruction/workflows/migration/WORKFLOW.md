# Migration Workflow

- id: migration
- version: 1.0.0
- status: ACTIVE
- applies_when: data, schema, API, event, configuration, runtime, provider, or platform must transition between versions or representations.
- goal: complete a compatible, observable, resumable transition without corrupting data, breaking consumers, or making recovery fictional.
- risk_floor: HIGH; CRITICAL for irreversible production transforms, cross-tenant/data-loss risk, or unavailable recovery.
- required_skills:
  - project-orchestrator
  - project-memory
  - migration-compatibility
  - data-lifecycle
  - testing-quality
  - devops-release
  - observability-incident
  - documentation-sync
- optional_skills:
  - system-architecture
  - backend-production-engineering
  - api-integration
  - security-threat-modeling
- approval_gates:
  - AG-02 destructive change
  - AG-03 production action
  - AG-04 persisted-data migration
  - AG-05 security boundary
  - AG-06 public contract break
  - AG-10 platform evolution

## Inputs

- current/target schemas, formats, versions, consumers, producers, deployment order, volumes, and ownership
- compatibility horizon, downtime, consistency, privacy, retention, backup/restore, and performance constraints
- representative data, rehearsal environment, telemetry, change window, and incident authority

## Outputs

- compatibility matrix and phase invariants
- expand/migrate/contract plan and implementation
- rehearsal, reconciliation, cutover, and recovery evidence
- deprecation, cleanup, runbook, and memory update

## Pre-task gate

- [ ] all producers, consumers, versions, owners, and mixed states are inventoried
- [ ] backup/restore or forward-only recovery has been verified
- [ ] migration is idempotent, resumable, throttled, observable, and reconcilable
- [ ] approval, cutover, stop, rollback, forward-fix, and cleanup criteria are explicit

The orchestrator must issue a Task Execution Brief. Stop before any action whose approval gate is unsatisfied.

## Execution phases

1. **Matrix** ? Map old/new producer-consumer, schema, format, configuration, and deployment combinations.
2. **Expand** ? Add compatible target fields/contracts/read paths without removing old support.
3. **Rehearse** ? Run representative dry runs, interruption/resume, scale, security, and reconciliation checks.
4. **Migrate** ? Execute bounded idempotent batches with checkpoints, throttling, telemetry, and stop conditions only when authorized.
5. **Cut over** ? Switch reads/writes or consumers incrementally and verify independent business and integrity signals.
6. **Contract** ? Remove old state only after consumer confirmation, retention window, recovery readiness, exit criteria, and approval.
7. **Close** ? Reconcile all data/contracts, document final state, archive temporary compatibility, and write durable memory.

## Validation

- old/new compatibility matrix passes throughout mixed-version phases
- counts, checksums, invariants, samples, duplicates, failures, interruption/resume, and tenant/privacy boundaries reconcile
- cutover and recovery are verified using representative scale and independent signals

## Completion criteria

- [ ] target state is authoritative and consumers are confirmed
- [ ] migration integrity and compatibility evidence pass with no orphan state
- [ ] cleanup, recovery, monitoring, docs, approvals, and memory lifecycle are complete

## Rollback or recovery

State the last reversible phase. If rollback cannot safely read new writes, use a verified forward-fix and preserve expanded compatibility until reconciliation closes.

## Project Memory write-back

Record durable target contracts, phase decisions, evidence, incidents, compatibility windows, cleanup criteria, and residual debt; never store production data or credentials.

## Final report

State outcome, scope, changed artifacts, validation evidence, unavailable checks, approvals, rollback/recovery readiness, residual risk, documentation, memory delta, and next safe action.
