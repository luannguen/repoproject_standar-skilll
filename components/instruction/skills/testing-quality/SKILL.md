---
name: testing-quality
description: Build a risk-based test and quality strategy across unit, component, integration, contract, end-to-end, security, accessibility, performance, migration, and operational validation.
---

# Testing and Quality Engineering

## Skill contract

- id: testing-quality
- name: Testing and Quality Engineering
- version: 1.0.0
- description: Build a risk-based test and quality strategy across unit, component, integration, contract, end-to-end, security, accessibility, performance, migration, and operational validation.
- purpose: produce trustworthy evidence that changed behavior, invariants, interfaces, failure modes, and recovery meet acceptance criteria without false confidence.
- scope: test strategy, coverage mapping, testability, fixtures, environments, deterministic automation, regression, exploratory testing, quality gates, and result interpretation.
- triggers: any behavior change, bug fix, refactor, migration, dependency upgrade, release, incident remediation, or request for testing or quality review.
- exclusions: does not define product requirements, replace specialist security/performance analysis, or treat line coverage as correctness.
- required_inputs:
  - accepted requirements and changed surfaces
  - risk, invariants, contracts, architecture, failure modes, and prior regressions
  - available frameworks, environments, fixtures, data, and CI quality gates
- expected_outputs:
  - risk-to-test matrix and validation plan
  - maintainable automated tests at appropriate levels
  - manual or exploratory checks for unautomated risk
  - quality result with gaps, confidence, and residual risk
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - requirement-analysis
  - security-threat-modeling
  - performance-scalability
  - migration-compatibility
  - devops-release
- prerequisite_skills:
  - project-memory
- next_skills:
  - documentation-sync
  - devops-release
  - project-memory
- constraints: prefer the lowest test level that proves the behavior; keep tests deterministic and behavior-focused; never label skipped or unavailable checks as passed.
- blockers: changed critical invariant has no feasible validation; test result is non-reproducible; required environment or data is absent and no safe substitute exists; failing relevant gate is unexplained.
- approval_requirements: approval is required only to accept a known high-risk quality gap, disable a required gate, use sensitive production data, or mutate external/production systems.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - map acceptance criteria, invariants, boundaries, regressions, and failure modes to tests
  - inspect existing suites, helpers, fixtures, environments, and CI constraints
  - define pass/fail signals and unavailable-check handling
- post_task_checklist:
  - relevant positive, negative, boundary, permission, concurrency, failure, recovery, and regression cases are covered
  - tests are isolated, deterministic, readable, and prove behavior rather than implementation trivia
  - results, skipped checks, flakiness, and residual risk are explicit
- validation_process: run the narrowest relevant tests first, then broader regression gates; independently inspect failures, false positives, fixture realism, test isolation, and coverage against the risk map.
- completion_criteria: every material risk and acceptance criterion has passing evidence or an explicit approved gap; relevant quality gates pass; the confidence statement matches actual coverage.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Translate requirements, changed code, invariants, contracts, and incidents into a prioritized risk-to-test matrix.
2. Select unit, component, integration, contract, end-to-end, security, accessibility, performance, migration, and operational levels only where they add evidence.
3. Prepare controlled fixtures and environments that cover representative, boundary, malformed, concurrent, duplicate, timeout, and recovery behavior.
4. Implement or update tests using stable public behavior and reusable helpers, avoiding over-mocking critical boundaries.
5. Run focused checks, diagnose failures, then run proportional regression, build, lint, type, and specialist gates.
6. Review gaps, flakiness, skipped checks, environment differences, and evidence quality; report confidence and residual risk.

## Domain gates

- BLOCKER: a test that does not assert the changed invariant cannot close that risk.
- MUST: bug fixes include a regression test that fails before the fix when feasible.
- MUST: mocks at critical integration boundaries are supplemented by contract or real-boundary evidence.

## Completion report

Report outcome, evidence, decisions, validation, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta without private chain-of-thought.
