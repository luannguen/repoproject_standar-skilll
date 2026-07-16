---
name: dependency-evolution
description: Evaluate, add, upgrade, replace, or remove libraries, runtimes, frameworks, platforms, and managed services using compatibility, security, lifecycle, cost, migration, and rollback evidence.
---

# Dependency and Platform Evolution

## Skill contract

- id: dependency-evolution
- name: Dependency and Platform Evolution
- version: 1.0.0
- description: Evaluate, add, upgrade, replace, or remove libraries, runtimes, frameworks, platforms, and managed services using compatibility, security, lifecycle, cost, migration, and rollback evidence.
- purpose: evolve dependencies deliberately without avoidable supply-chain, compatibility, operational, lock-in, or maintenance risk.
- scope: dependency inventory, version constraints, advisories, licenses, support windows, transitive risk, runtime/platform compatibility, migration, lockfiles, rollout, and removal.
- triggers: dependency add/update/removal, major version, runtime/framework/platform change, vulnerability remediation, deprecation, end-of-life, or managed-service adoption.
- exclusions: does not select technology by popularity, make purchases, deploy production changes, or treat a version bump as a complete migration.
- required_inputs:
  - current manifests, lockfiles, runtime, build, deploy, and usage evidence
  - release notes, migration guides, advisories, support policy, license, and maintenance signals
  - compatibility, performance, security, cost, ownership, rollout, and rollback constraints
- expected_outputs:
  - dependency decision and compatibility matrix
  - upgrade/replacement/removal sequence
  - code, config, lockfile, test, and documentation changes
  - validation, rollout, rollback, and follow-up plan
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - system-architecture
  - security-threat-modeling
  - testing-quality
  - migration-compatibility
  - devops-release
- prerequisite_skills:
  - project-memory
- next_skills:
  - migration-compatibility
  - testing-quality
  - devops-release
  - documentation-sync
- constraints: prefer existing or platform-native capability; pin deterministically; use primary sources for technical claims; minimize new transitive and operational burden.
- blockers: unsupported runtime or peer constraint; unresolved critical advisory; unknown license or ownership; no representative validation; major transition without rollback or staged compatibility.
- approval_requirements: new paid service, major platform/runtime replacement, material lock-in or cost, production rollout, or acceptance of unresolved HIGH/CRITICAL supply-chain risk requires explicit approval.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - inventory direct/transitive versions, usage, owners, constraints, advisories, and support windows
  - read primary release, migration, security, and compatibility sources
  - identify affected APIs, build/deploy surfaces, data formats, and rollback limits
- post_task_checklist:
  - manifests and lockfiles are deterministic and minimal
  - deprecated APIs, compatibility shims, configuration, types, tests, docs, licenses, and advisories are resolved
  - staged rollout, monitoring, rollback, and removal of temporary compatibility code are defined
- validation_process: perform clean install/restore, build, type/lint/test, affected integration and performance checks, advisory/license scans, artifact diff, and rollback rehearsal where applicable.
- completion_criteria: the dependency state is supported, secure enough for accepted risk, reproducible, compatible, documented, owned, validated, and safely deployable or removable.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Inventory current dependency graph, runtime constraints, actual usage, ownership, support window, advisories, and alternatives.
2. Use authoritative release notes, migration guides, security advisories, and license/support sources to compare stay, upgrade, replace, or remove.
3. Map breaking changes and transitive effects across code, configuration, build, deployment, data, contracts, operations, and rollback.
4. Plan the smallest staged transition with deterministic lockfile changes, compatibility shims only where time-bounded, and explicit cleanup.
5. Apply changes incrementally, removing unused packages and avoiding unrelated bulk updates.
6. Run clean reproducibility and full affected validation; document rollout signals, rollback, support horizon, and remaining debt.

## Domain gates

- BLOCKER: never upgrade a major dependency without a usage-based breaking-change and rollback analysis.
- MUST: every new dependency has an owner, necessity, support signal, license posture, security posture, and removal strategy.
- MUST: lockfile changes are reviewed for unexpected package, source, script, and integrity changes.

## Completion report

Report outcome, evidence, decisions, validation, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta without private chain-of-thought.
