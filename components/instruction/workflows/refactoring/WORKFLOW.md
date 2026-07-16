# Refactoring Workflow

- id: refactoring
- version: 1.0.0
- status: ACTIVE
- applies_when: the intended outcome is structural improvement without a material product-behavior change.
- goal: improve named maintainability qualities while preserving characterized external behavior.
- risk_floor: MEDIUM; raise when public contracts, architecture, security, persisted data, or critical paths are affected.
- required_skills:
  - project-orchestrator
  - project-memory
  - code-review-refactoring
  - testing-quality
  - documentation-sync
- optional_skills:
  - system-architecture
  - ui-ux-production
  - backend-production-engineering
  - security-threat-modeling
  - performance-scalability
- approval_gates:
  - AG-01 scope expansion
  - AG-05 security boundary
  - AG-06 public contract break

## Inputs

- named structural problem, affected paths, desired quality improvement, and non-goals
- current callers, contracts, invariants, tests, complexity/coupling/duplication evidence, and memory
- compatibility and performance constraints

## Outputs

- characterized behavior and refactor safety net
- incremental transformation plan
- reviewable behavior-preserving changes
- before/after structural evidence and residual debt

## Pre-task gate

- [ ] behavior and public contracts are understood or characterized
- [ ] the structural objective is measurable enough to review
- [ ] scope excludes opportunistic product changes and unrelated cleanup
- [ ] safe seams, validation, and revert strategy are defined

For MEDIUM or higher risk, the orchestrator must issue a Task Execution Brief. Stop before any action whose approval gate is unsatisfied.

## Execution phases

1. **Characterize** ? Map observable behavior, invariants, contracts, callers, side effects, and regression coverage.
2. **Diagnose** ? Identify the actual coupling, duplication, complexity, ownership, or testability problem.
3. **Sequence** ? Plan small reversible transformations with compiling/testing checkpoints.
4. **Transform** ? Apply one coherent change at a time; keep behavior changes in separate work.
5. **Simplify** ? Remove obsolete indirection and temporary shims only after consumers move safely.
6. **Compare** ? Run regression checks and compare complexity, coupling, duplication, readability, testability, performance, and operations.
7. **Document** ? Update architecture or developer guidance and record remaining debt without overstating improvement.

## Validation

- characterization and regression evidence support behavior preservation
- public contracts and persisted formats remain compatible unless separately approved
- the named quality attribute improved without security, performance, accessibility, or operability regression

## Completion criteria

- [ ] external behavior and invariants are preserved
- [ ] the structural objective is achieved in a coherent reviewable scope
- [ ] tests, docs, cleanup, residual debt, and memory are complete

## Rollback or recovery

Every transformation should be independently revertible. Retain compatibility adapters until callers and regression evidence prove removal is safe.

## Project Memory write-back

Record only reusable structural decisions, patterns, rejected approaches, and remaining debt; ordinary code movement does not merit a durable fact.

## Final report

State outcome, scope, changed artifacts, validation evidence, unavailable checks, approvals, rollback/recovery readiness, residual risk, documentation, memory delta, and next safe action.
