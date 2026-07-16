# Dependency Upgrade Workflow

- id: dependency-upgrade
- version: 1.0.0
- status: ACTIVE
- applies_when: a library, runtime, framework, platform, or managed service is added, upgraded, replaced, or removed.
- goal: reach a supported, reproducible, secure-enough dependency state with understood compatibility, lifecycle, ownership, and rollback.
- risk_floor: HIGH for major versions, runtimes, platforms, transitive security changes, or new managed services.
- required_skills:
  - project-orchestrator
  - project-memory
  - dependency-evolution
  - testing-quality
  - security-threat-modeling
  - devops-release
  - documentation-sync
- optional_skills:
  - system-architecture
  - migration-compatibility
  - code-review-refactoring
  - performance-scalability
- approval_gates:
  - AG-03 production action
  - AG-05 security boundary
  - AG-08 material cost
  - AG-10 major dependency/platform evolution

## Inputs

- manifests, lockfiles, runtime/build/deploy state, actual usage, owners, and current support posture
- authoritative release notes, migration guides, advisories, license, maintenance, compatibility, and EOL evidence
- test environments, artifact requirements, rollout, rollback, performance, and cost constraints

## Outputs

- stay/upgrade/replace/remove decision
- usage-based compatibility and migration matrix
- minimal deterministic dependency and code changes
- clean-build, quality, security, rollout, rollback, and docs evidence

## Pre-task gate

- [ ] current and target dependency graphs and actual API usage are inventoried
- [ ] primary release/security/license/support evidence was reviewed
- [ ] breaking, transitive, build, runtime, config, data, and deployment effects are mapped
- [ ] approval, staged rollout, compatibility, cleanup, and rollback are defined

The orchestrator must issue a Task Execution Brief. Stop before any action whose approval gate is unsatisfied.

## Execution phases

1. **Inventory** ? Capture direct/transitive graph, versions, sources, scripts, integrity, usage, owners, advisories, licenses, and support windows.
2. **Decide** ? Compare stay, upgrade, replace, or remove using necessity, compatibility, security, maintenance, cost, lock-in, and reversibility.
3. **Map** ? Trace breaking changes through source, types, tests, config, build, artifacts, runtime, contracts, data, and operations.
4. **Change** ? Update one coherent dependency set, migrate APIs/config, and time-bound any compatibility shim.
5. **Reproduce** ? Run clean restore/install and review lockfile/artifact changes for unexpected packages, sources, scripts, or integrity.
6. **Validate** ? Run build, types, lint, tests, integration, security, license, performance, and rollback checks proportional to impact.
7. **Release** ? Document support horizon, rollout, monitoring, rollback, ownership, and removal of temporary compatibility.

## Validation

- clean environment produces the intended deterministic artifact
- affected API/config/runtime behavior and representative integrations pass
- advisory, license, transitive, bundle/resource, and performance changes are reviewed

## Completion criteria

- [ ] dependency state is supported, owned, reproducible, compatible, and documented
- [ ] required quality/security gates and rollout/recovery evidence pass
- [ ] no unintended package, stale shim, or unapproved platform/cost action remains

## Rollback or recovery

Retain the previous lockfile/artifact and any required backward-compatible configuration. Major runtime/platform transitions use staged coexistence and the migration workflow.

## Project Memory write-back

Record durable platform/dependency decisions, support windows, major compatibility lessons, rejected alternatives, and follow-up debt; ordinary patch bumps need only the task summary.

## Final report

State outcome, scope, changed artifacts, validation evidence, unavailable checks, approvals, rollback/recovery readiness, residual risk, documentation, memory delta, and next safe action.
