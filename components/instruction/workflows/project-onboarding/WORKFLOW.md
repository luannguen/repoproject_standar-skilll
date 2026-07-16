# Project Onboarding Workflow

- id: project-onboarding
- version: 1.0.0
- status: ACTIVE
- applies_when: a repository is cloned from the template, remains uninstantiated, or needs an evidence-backed governance and quality baseline.
- goal: establish verified project identity, ownership, controls, commands, conditional gaps, and memory without inventing application-specific truth.
- risk_floor: MEDIUM; raise for sensitive data, external settings, licensing, infrastructure, production, security, destructive migration, or public release.
- required_skills:
  - project-orchestrator
  - project-memory
  - project-bootstrap-governance
  - requirement-analysis
  - testing-quality
  - security-threat-modeling
  - documentation-sync
- optional_skills:
  - system-architecture
  - ui-ux-production
  - backend-production-engineering
  - api-integration
  - data-lifecycle
  - code-review-refactoring
  - dependency-evolution
  - devops-release
  - observability-incident
  - performance-scalability
  - migration-compatibility
  - analytics-telemetry
  - ai-agent-safety
  - domain-skill-framework
- approval_gates:
  - AG-01 scope expansion
  - AG-05 irreversible or external repository mutation
  - AG-08 dependency, service, or platform adoption
  - AG-09 sensitive data access or disclosure
  - AG-10 production, infrastructure, or cost impact
  - AG-11 governance weakening

## Inputs

- user-confirmed project name, purpose, accountable owner, repository URL, and license state
- repository tree, manifests, lockfiles, sources, schemas, tests, deployment artifacts, host settings, and existing memory
- intended users, data sensitivity, environments, operational expectations, and material unknowns

## Outputs

- verified project profile and onboarding classification
- active versus conditional control matrix with owners and triggers
- authoritative command registry, governance checklist, validation evidence, and residual risk
- synchronized documentation, changelog, and durable Project Memory

## Pre-task gate

- [ ] current template/profile state and identity evidence are known
- [ ] task scope, exclusions, risk, approval status, and rollback are explicit
- [ ] manifests, source roots, schemas, tests, deployment files, ownership, and host settings have been inventoried
- [ ] every missing application-specific fact remains unknown or conditional rather than inferred
- [ ] material licensing, security, production, or external-setting decisions have an authorized owner

For MEDIUM or higher risk, the orchestrator must issue a Task Execution Brief. Stop before any action whose approval gate is unsatisfied.

## Execution phases

1. **Retrieve and inventory** ? Read authority, registries, profile, manifest, relevant memory, repository evidence, and host-setting evidence.
2. **Classify** ? Determine template, partial-onboarding, or active-project state and assign the highest applicable risk.
3. **Resolve identity and governance** ? Confirm ownership, purpose, repository, license state, review policy, vulnerability channel, protected branches, and required checks.
4. **Activate evidence-backed controls** ? Register real commands and add stack/domain/data/deployment controls only when their triggers exist.
5. **Validate** ? Run reusable validation and every available registered project check; distinguish pass, fail, unavailable, and conditional.
6. **Synchronize and hand off** ? Update profile, governance docs, registries if changed, changelog, exceptions, and durable memory.

## Validation

- unified repository validation passes on available supported platforms
- profile and manifest parse and agree with repository evidence
- no secret, placeholder identity, invented stack/domain rule, or unsupported readiness claim remains
- each triggered control is active or has an explicit owner, risk, compensating control, and next step
- external host settings are verified from current evidence or marked external-unverified

## Completion criteria

- [ ] identity, purpose, ownership, onboarding state, and license status are explicit
- [ ] authoritative project commands are registered where evidence exists
- [ ] required repository governance is active or transparently pending external configuration
- [ ] conditional application controls have evidence triggers and accountable follow-up
- [ ] validation, documentation, changelog, and Project Memory are synchronized
- [ ] project state is not described as production-ready beyond available evidence

## Rollback or recovery

Profile and documentation edits are reversible through version control. Preserve the prior profile before re-onboarding. External repository settings, published artifacts, license changes, infrastructure, or production actions require their own approval and recovery plan.

## Project Memory write-back

Record only verified durable identity, governance decisions, active controls, accepted exceptions, and onboarding completion. If work is incomplete, create a checkpoint with the exact next action, owner, blockers, commands run, and current repository state.

## Final report

State onboarding state, evidence, decisions, approvals, active and conditional controls, validation results, unavailable checks, external owner actions, recovery, residual risk, documentation changes, memory delta, and next exact safe step.
