# Documentation Workflow

- id: documentation
- version: 1.0.0
- status: ACTIVE
- applies_when: the task is documentation-only or documentation synchronization is the dominant outcome.
- goal: make verified current behavior and operations discoverable for the intended audience without creating duplicate sources of truth.
- risk_floor: LOW; raise for public publication, sensitive material, operational safety, or constitutional changes.
- required_skills:
  - project-orchestrator
  - project-memory
  - documentation-sync
- optional_skills:
  - requirement-analysis
  - system-architecture
  - ui-ux-production
  - backend-production-engineering
  - api-integration
  - data-lifecycle
  - testing-quality
  - security-threat-modeling
- approval_gates:
  - AG-07 external publication
  - AG-09 sensitive data
  - AG-11 constitutional weakening

## Inputs

- audience, intended task, verified source artifacts, current docs, links, examples, and ownership
- changed behavior, contracts, setup, architecture, operations, release, or incident evidence

## Outputs

- accurate minimal documentation set
- validated commands, links, examples, diagrams, and registry references
- stale/conflicting documentation report and memory delta

## Pre-task gate

- [ ] audience and success path are known
- [ ] authoritative source for each material claim is identified
- [ ] affected documentation surfaces and duplicate/stale sources are inventoried

For MEDIUM or higher risk, the orchestrator must issue a Task Execution Brief. Stop before any action whose approval gate is unsatisfied.

## Execution phases

1. **Audit** ? Compare docs, examples, diagrams, registries, runbooks, and memory to authoritative artifacts.
2. **Resolve** ? Choose one source for each fact and reconcile contradictions before editing.
3. **Write** ? Update the smallest coherent set using current/proposed/deprecated/historical labels.
4. **Verify** ? Test commands, paths, links, snippets, schemas, versions, and clean-reader navigation.
5. **Synchronize** ? Update changelog, registry, runbook, and durable memory only where reality changed.

## Validation

- claims trace to current evidence and status language is accurate
- commands, paths, examples, links, diagrams, and machine-readable contracts agree
- no secret, personal data, unsupported readiness claim, or stale route is introduced

## Completion criteria

- [ ] the intended audience can complete the documented task from current instructions
- [ ] known stale/conflicting references are fixed or explicitly owned as debt
- [ ] documentation and memory agree with authoritative evidence

## Rollback or recovery

Documentation edits are reversible; retain historical material only when labeled and valuable. For public disclosure errors, use the external-communication gate and remove sensitive exposure through authorized incident handling.

## Project Memory write-back

Update durable facts and decisions only when verified reality changed. A prose clarification with no durable knowledge delta should record no memory update.

## Final report

State outcome, scope, changed artifacts, validation evidence, unavailable checks, approvals, rollback/recovery readiness, residual risk, documentation, memory delta, and next safe action.
