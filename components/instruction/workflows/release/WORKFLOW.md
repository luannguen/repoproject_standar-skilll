# Release Workflow

- id: release
- version: 1.0.0
- status: ACTIVE
- applies_when: a tested artifact is to be promoted, deployed, published, rolled out, or rolled back.
- goal: release one identified artifact safely with explicit authority, readiness evidence, progressive verification, and recovery.
- risk_floor: HIGH; CRITICAL for destructive migrations, broad traffic/security changes, or emergency production action.
- required_skills:
  - project-orchestrator
  - project-memory
  - testing-quality
  - devops-release
  - observability-incident
  - documentation-sync
- optional_skills:
  - ui-ux-production
  - backend-production-engineering
  - data-lifecycle
  - security-threat-modeling
  - code-review-refactoring
  - dependency-evolution
  - migration-compatibility
  - performance-scalability
  - analytics-telemetry
- approval_gates:
  - AG-03 production/release
  - AG-04 data migration
  - AG-05 security boundary
  - AG-06 contract break
  - AG-07 external communication
  - AG-08 material cost

## Inputs

- immutable artifact identity/provenance, changes, environment, owners, release window, and approvals
- quality/security/compatibility/migration evidence, SLOs, telemetry, runbook, and incident contacts
- rollout cohorts/stages, health and business signals, stop, rollback, and forward-fix

## Outputs

- signed-off release readiness record
- authorized staged promotion and verification log
- release notes and operational handoff
- rollback/forward-fix readiness and final memory

## Pre-task gate

- [ ] artifact is immutable, traceable, reproducible, and approved for target environment
- [ ] all required tests, security, compatibility, migration, and configuration gates pass
- [ ] health/business signals, alerting, ownership, stop criteria, rollback/forward-fix, and communication are ready
- [ ] deployment approval is exact for artifact, environment, action, and window

The orchestrator must issue a Task Execution Brief. Stop before any action whose approval gate is unsatisfied.

## Execution phases

1. **Freeze** ? Identify artifact, scope, dependencies, configuration, migrations, release notes, owners, and approvals.
2. **Verify** ? Run final target-like smoke, quality, security, compatibility, recovery, and environment checks.
3. **Promote** ? Move the same artifact through authorized stages; never rebuild between environments.
4. **Observe** ? At each stage inspect technical and user/business signals for the defined soak period.
5. **Decide** ? Continue, pause, rollback, or forward-fix using predeclared thresholds and incident authority.
6. **Confirm** ? Verify full rollout, migrations, contracts, telemetry, support handoff, and release communication.
7. **Record** ? Store artifact, approvals, evidence, timeline, outcome, incidents, recovery status, docs, and memory delta.

## Validation

- artifact identity, environment configuration, migrations, permissions, and smoke behavior match the release record
- quality, security, compatibility, SLO, user/business, and regression signals remain within declared thresholds
- rollback or forward-fix is executable at the actual post-release state

## Completion criteria

- [ ] authorized artifact is at the intended stage and independently verified
- [ ] no active release-related degradation or unresolved blocker remains
- [ ] release notes, runbook, ownership, recovery, evidence, and memory are complete

## Rollback or recovery

Use the declared rollback until the last reversible boundary. After irreversible data/contract change, preserve compatibility and execute the rehearsed forward-fix. Any degradation enters incident-response.

## Project Memory write-back

Record material release decisions, artifact/outcome evidence, incidents, new constraints, and durable operational lessons; do not duplicate transient deployment logs.

## Final report

State outcome, scope, changed artifacts, validation evidence, unavailable checks, approvals, rollback/recovery readiness, residual risk, documentation, memory delta, and next safe action.
