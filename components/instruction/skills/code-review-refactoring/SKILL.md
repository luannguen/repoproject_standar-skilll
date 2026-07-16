---
name: code-review-refactoring
description: Review and improve code for correctness, invariants, readability, coupling, duplication, testability, security, performance, compatibility, and maintainability while preserving verified behavior.
---

# Code Review and Refactoring

## Skill contract

- id: code-review-refactoring
- name: Code Review and Refactoring
- version: 1.0.0
- description: Review and improve code for correctness, invariants, readability, coupling, duplication, testability, security, performance, compatibility, and maintainability while preserving verified behavior.
- purpose: find consequential defects and reduce structural cost through small, behavior-preserving, evidence-backed changes.
- scope: code review, static reasoning, defect prioritization, maintainability assessment, decomposition, duplication removal, API cleanup, test seams, and incremental refactoring.
- triggers: pull request or diff review, quality audit, technical-debt work, refactor request, complex code, duplication, coupling, or unsafe change.
- exclusions: does not redesign product behavior, perform unrelated cleanup, or claim behavior preservation without tests or equivalent evidence.
- required_inputs:
  - accepted behavior and change intent
  - current diff, surrounding code, contracts, tests, call sites, and runtime evidence
  - known invariants, compatibility promises, debt, and constraints
- expected_outputs:
  - prioritized actionable findings with evidence
  - bounded refactoring plan and preserved invariants
  - small reviewable implementation changes when requested
  - regression validation and residual-debt record
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - requirement-analysis
  - system-architecture
  - testing-quality
  - security-threat-modeling
  - performance-scalability
- prerequisite_skills:
  - project-memory
- next_skills:
  - testing-quality
  - documentation-sync
  - project-memory
- constraints: prioritize correctness and risk over style; keep scope bounded; preserve public behavior unless explicitly changed; avoid speculative abstraction.
- blockers: behavior or contract cannot be determined; critical path lacks validation; proposed refactor mixes incompatible product changes; unsafe finding remains unresolved.
- approval_requirements: material behavior, public contract, architecture, dependency, data, or security changes discovered during refactor require reclassification and the matching approval gate.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - understand intent, acceptance criteria, invariants, consumers, and risk
  - inspect the full affected call/data path rather than the diff alone
  - identify existing tests, conventions, and safe change seams
- post_task_checklist:
  - findings are specific, reproducible, prioritized, and free of style-only noise
  - refactor preserves required behavior and improves a named quality attribute
  - tests and broader regression checks support preservation claims
- validation_process: trace inputs, state, outputs, errors, concurrency, permissions, resources, and call sites; run characterization/regression tests and compare observable behavior before and after.
- completion_criteria: all blocker findings in scope are resolved or explicitly accepted; refactoring is coherent and reviewable; behavior preservation and quality improvement have evidence.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Establish the intended behavior, changed surfaces, invariants, public contracts, and risk level.
2. Read surrounding callers, dependencies, state transitions, error paths, tests, and historical debt; reproduce defects where possible.
3. Report only actionable findings, ordered by impact, with exact evidence, consequence, and a bounded remedy.
4. For refactoring, add characterization tests around uncertain behavior and choose the smallest sequence of reversible transformations.
5. Apply one coherent structural change at a time, keeping behavior changes separate and avoiding premature abstractions.
6. Run focused and proportional regression validation; compare complexity, coupling, duplication, readability, testability, and operational effects.

## Domain gates

- BLOCKER: do not refactor behavior that is neither specified nor characterized when regression impact is material.
- MUST: review findings explain user/system consequence, not merely preference.
- MUST: extracted abstractions need at least two evidence-backed consumers or a clear architectural boundary.

## Completion report

Report outcome, evidence, decisions, validation, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta without private chain-of-thought.
