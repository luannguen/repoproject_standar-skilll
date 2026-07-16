---
name: devops-release
description: Design, implement, or review reproducible build, CI/CD, configuration, infrastructure change, artifact promotion, rollout, rollback, environment, and release-readiness practices.
---

# DevOps and Release Engineering

## Skill contract

- id: devops-release
- name: DevOps and Release Engineering
- version: 1.0.0
- description: Design, implement, or review reproducible build, CI/CD, configuration, infrastructure change, artifact promotion, rollout, rollback, environment, and release-readiness practices.
- purpose: deliver verified artifacts safely and repeatably across environments with controlled configuration, observability, rollback, and ownership.
- scope: builds, CI gates, artifacts, configuration, secrets references, infrastructure-as-code, environments, deployment, promotion, rollout, rollback, release notes, and operational readiness.
- triggers: CI/CD, build, deployment, environment, infrastructure, container, release, rollout, rollback, configuration, secret reference, or production-readiness task.
- exclusions: does not deploy, publish, buy infrastructure, rotate secrets, or mutate production without explicit authority.
- required_inputs:
  - current build/deploy/configuration/infrastructure evidence
  - target environments, artifact strategy, quality gates, availability and recovery requirements
  - ownership, secret management, change window, observability, and rollback constraints
- expected_outputs:
  - reproducible build and promotion design
  - CI/CD or infrastructure changes with least-privilege controls
  - release checklist, rollout, verification, rollback, and communication plan
  - deployment evidence and operational handoff
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - testing-quality
  - security-threat-modeling
  - dependency-evolution
  - observability-incident
  - migration-compatibility
- prerequisite_skills:
  - project-memory
- next_skills:
  - testing-quality
  - observability-incident
  - documentation-sync
  - project-memory
- constraints: build once and promote immutable artifacts; separate configuration from code; least privilege; no secrets in source or logs; production actions require exact authorization.
- blockers: non-reproducible artifact; environment drift unknown; missing ownership; failed required gate; no rollback or forward-fix for high-risk change; unobservable release.
- approval_requirements: production deploy/promote/rollback, infrastructure mutation, secret or traffic change, paid resource, destructive operation, and critical incident action use the explicit approval gates.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - identify artifact, environments, owners, dependencies, config, secrets references, gates, SLOs, and change window
  - inspect current pipelines, permissions, drift, prior failures, and rollback capability
  - define rollout stages, stop signals, verification, recovery, and communication
- post_task_checklist:
  - artifact identity and provenance are immutable and traceable
  - required quality/security/migration gates passed in the target-like environment
  - rollout, telemetry, rollback, release notes, runbook, and ownership are complete
- validation_process: run clean build, pipeline/config lint, least-privilege and secret checks, artifact integrity/SBOM where available, environment verification, smoke tests, rollout simulation, and rollback rehearsal proportional to risk.
- completion_criteria: a known artifact can be promoted repeatably; gates and approvals are satisfied; release is observable and recoverable; documentation and handoff match deployed reality.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Map source-to-artifact-to-environment flow, configuration ownership, permissions, dependencies, quality gates, and current deployment evidence.
2. Define immutable artifacts, deterministic builds, environment separation, secret references, least-privilege identities, and traceability.
3. Design CI stages that fail fast on relevant quality, security, compatibility, migration, and packaging evidence.
4. Plan canary, phased, blue/green, or equivalent rollout according to risk with explicit health, stop, rollback, and forward-fix signals.
5. Implement pipeline or infrastructure changes in reviewable increments and keep production execution behind approval.
6. Validate artifact and environment, execute only authorized stages, observe results, record release evidence, and update runbooks.

## Domain gates

- BLOCKER: production release requires an identified artifact, owner, approvals, health checks, stop conditions, and rollback or forward-fix.
- BLOCKER: secrets must be referenced from an authorized store and redacted from all output.
- MUST: the same artifact, not a rebuild, moves through promotion stages.

## Completion report

Report outcome, evidence, decisions, validation, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta without private chain-of-thought.
