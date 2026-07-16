# Bug Fix Workflow

- id: bug-fix
- version: 1.0.0
- status: ACTIVE
- applies_when: observed behavior contradicts an accepted requirement, contract, invariant, or prior working state.
- goal: reproduce and remove the root cause with the smallest safe change and a durable regression guard.
- risk_floor: MEDIUM; raise for production impact, security, data loss, public contracts, recurrence, or uncertain blast radius.
- required_skills:
  - project-orchestrator
  - project-memory
  - requirement-analysis
  - testing-quality
  - documentation-sync
- optional_skills:
  - ui-ux-production
  - backend-production-engineering
  - api-integration
  - data-lifecycle
  - security-threat-modeling
  - observability-incident
  - performance-scalability
  - code-review-refactoring
- approval_gates:
  - AG-02 destructive recovery
  - AG-03 production hotfix
  - AG-05 security boundary
  - AG-06 contract break

## Inputs

- symptom, expected behavior, environment, frequency, impact, timeline, and reproduction evidence
- recent changes, logs/traces, related incidents, contracts, tests, and affected source path
- known workarounds, data impact, and recovery constraints

## Outputs

- minimal deterministic reproduction
- ranked hypotheses and verified root cause
- bounded fix with regression test
- impact, validation, recovery, docs, and memory update

## Pre-task gate

- [ ] expected and actual behavior are explicit
- [ ] reproduction or strongest available evidence is preserved
- [ ] blast radius, data/security/contract impact, and recent changes are assessed
- [ ] diagnostic and fix actions have stop and rollback conditions

For MEDIUM or higher risk, the orchestrator must issue a Task Execution Brief. Stop before any action whose approval gate is unsatisfied.

## Execution phases

1. **Reproduce** ? Reduce the failure to a deterministic test or preserve the strongest correlated runtime evidence.
2. **Localize** ? Trace the full input/state/output path and rank falsifiable hypotheses without changing multiple variables.
3. **Prove** ? Demonstrate the root cause or clearly label a containment-only fix when proof is unavailable.
4. **Guard** ? Add a regression test that fails before the fix when feasible, plus boundary and failure cases.
5. **Fix** ? Apply the smallest coherent correction at the authoritative boundary; avoid unrelated cleanup.
6. **Regress** ? Run focused tests first, then proportional surrounding, contract, security, data, and operational checks.
7. **Close** ? Document cause, impact, recovery, residual risk, stale artifacts, and verified memory delta.

## Validation

- reproduction and regression test demonstrate the defect and correction
- the fix addresses root cause rather than only hiding the symptom, or containment is explicitly labeled
- adjacent paths, permissions, data integrity, concurrency, integration failures, and recurrence signals were checked as applicable

## Completion criteria

- [ ] reported behavior is corrected and regression-protected
- [ ] blast radius and any affected data are reconciled
- [ ] no relevant test failure, unresolved blocker, or unapproved hotfix action remains

## Rollback or recovery

Keep the fix reversible. If production state or data was affected, separate containment, repair, and permanent fix; define reconciliation and rollback/forward-fix.

## Project Memory write-back

Record a durable incident or failed-approach entry only when root cause or recurrence value is material; otherwise record the completed-task summary and no speculative cause.

## Final report

State outcome, scope, changed artifacts, validation evidence, unavailable checks, approvals, rollback/recovery readiness, residual risk, documentation, memory delta, and next safe action.
