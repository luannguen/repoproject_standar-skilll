---
name: project-bootstrap-governance
description: Instantiate a cloned repository template from verified project evidence, establish repository governance and quality ownership, and keep project-specific controls explicitly unconfigured until the real stack, domain, deployment, and risk are known. Use for first-run onboarding, repository standardization, project-profile creation, governance audits, or converting template mode into an active project.
---

# Project Bootstrap and Governance

Turn the reusable template into an evidence-backed project baseline. Preserve safe defaults, make unknowns visible, and leave application-specific controls conditional until current repository evidence supports them.

## Skill contract

- id: project-bootstrap-governance
- name: Project Bootstrap and Governance
- version: 1.1.0
- description: Instantiate and govern a cloned project without inventing project-specific truth.
- purpose: establish project identity, ownership, repository controls, validation entry points, and an auditable onboarding state.
- scope: first-run onboarding, project profile, repository governance, contributor/security/release baselines, quality-gate registration, and template-readiness audits.
- triggers: clone, initialize project, bootstrap repository, production standard, governance baseline, template adoption, repository readiness.
- exclusions: application architecture, domain rules, schemas, production infrastructure, credentials, legal license selection, external repository settings, and stack-specific tooling without evidence.
- required_inputs: repository tree and history, user-stated project identity and intent, current manifests/configuration, ownership evidence, and available local validation commands.
- expected_outputs: classified template state, populated project profile, synchronized stack/domain/activation manifests, evidence-backed overlays where applicable, gap register, governance artifacts, registered validation commands, conditional follow-up plan, and Project Memory delta.
- required_files: PROJECT-CONSTITUTION.md, AI-BOOTSTRAP.md, APPROVAL-GATES.md, TEMPLATE-MANIFEST.json, PROJECT-PROFILE.json, SKILL-REGISTRY.json, WORKFLOW-REGISTRY.json, custom-skills/CUSTOM-SKILL-REGISTRY.json, project-custom-skills/PROJECT-STACK-MANIFEST.json, project-custom-skills/PROJECT-DOMAIN-MANIFEST.json, project-custom-skills/ACTIVE-CUSTOM-SKILLS.json.
- related_skills: project-orchestrator, project-memory, requirement-analysis, testing-quality, security-threat-modeling, devops-release, documentation-sync.
- prerequisite_skills: project-orchestrator, project-memory.
- next_skills: requirement-analysis, system-architecture, testing-quality, security-threat-modeling, dependency-evolution, devops-release, documentation-sync.
- constraints: treat the repository as uninstantiated until identity and application evidence are verified; use the smallest cross-stack baseline; preserve portability; label every conditional control.
- blockers: missing owner decision for a material governance boundary, conflicting identity evidence, secret exposure, or a request to claim production readiness without application evidence.
- approval_requirements: apply AG-01 for scope expansion, AG-05 for irreversible/external repository changes, AG-08 for new dependencies or services, AG-09 for sensitive data, AG-10 for production/cost impact, and AG-11 for weakened governance.
- execution_workflow: select project-onboarding, inventory evidence, classify state, resolve required decisions, instantiate the profile, enable only supported controls, validate, document residual conditions, and write durable memory.
- pre_task_checklist: confirm repository/template state, goal, identity evidence, owner, scope, exclusions, risk, selected workflow, approval status, existing application evidence, and rollback path.
- post_task_checklist: confirm profile consistency, governance coverage, portable validation, no secrets, no invented project facts, conditional gaps, documentation synchronization, and memory lint.
- validation_process: run the unified repository validator, registry linters, route fixtures, link/path checks, secret heuristics, JSON parsing, and any verified application commands registered after onboarding.
- completion_criteria: repository identity and ownership are explicit, reusable controls pass, project-specific unknowns remain visible, applicable commands are registered, and residual setup has an owner and trigger.
- exception_policy: document the unmet rule, evidence, risk, compensating control, owner, expiry or review trigger, and approval; never silently downgrade a blocker.
- memory_read_policy: retrieve current project identity, architecture, security, release, quality, ownership, and closest onboarding checkpoint, then verify material facts against the working tree.
- memory_write_policy: store only verified durable project identity, governance decisions, active controls, accepted exceptions, and exact checkpoints; never store credentials or speculative stack/domain claims.
- update_policy: update this skill only for reusable cross-project learning supported by repeated evidence; keep project-specific commands and rules in the project profile or dedicated evidence-backed skills.

## Evidence states

Classify each capability as one of:

- `template-default`: safe and reusable before application code exists.
- `verified-active`: supported by current repository evidence and validated.
- `conditional`: required when a documented trigger appears, but not yet configured.
- `unsupported`: intentionally unavailable with impact and owner recorded.
- `unknown`: evidence is insufficient; do not infer readiness.

Production-ready is not a valid repository-wide state until application behavior, security, deployment, recovery, and operations have task-matched evidence.

## Workflow

1. Read the Constitution, Bootstrap, registries, template manifest, project profile, and relevant memory.
2. Inventory repository roots, manifests, lockfiles, schemas, deployment files, tests, ownership, and existing policies. Do not install or generate stack tooling during discovery.
3. Decide whether the repository is still `template/uninstantiated`, partially onboarded, or `project/active`. Conflicting evidence blocks transition.
4. Confirm project name, repository URL, accountable owner, purpose, license decision, data sensitivity, deployment intent, and supported environments. Keep unanswered material fields explicit.
5. Preserve the cross-stack baseline. Run stack and domain detection, review confidence/evidence, and update project manifests. Activate only detected HIGH/MEDIUM technology bindings whose scope is known; domain bindings additionally require evidence-cited verified rules. Add project overlays without copying reusable bases.
6. Register authoritative build, lint, test, security, migration, and release commands in `PROJECT-PROFILE.json`; never use example commands as proof.
7. Configure repository-host settings only with explicit authorization. Otherwise emit a checklist for branch protection, required checks, reviews, secret scanning, and private vulnerability reporting.
8. Run all available reusable and project-specific validation. Report unavailable checks as conditional gaps.
9. Synchronize contributor, security, release, onboarding, registry, changelog, and memory artifacts.

## Conditional control matrix

| Trigger discovered after clone | Required follow-up |
|---|---|
| Language/runtime manifest | Pin supported versions; add dependency, build, lint, test, vulnerability, and license checks |
| Web/API surface | Add contract, authorization, abuse, accessibility where applicable, and integration tests |
| Persisted data/schema | Add migration policy, backup/restore evidence, retention/deletion, and recovery tests |
| External service or queue | Add timeout, retry, idempotency, reconciliation, ownership, and outage handling |
| Deployment target | Add environment promotion, immutable artifact, rollback, observability, and incident runbook |
| Sensitive or regulated data | Add data classification, least privilege, threat model, audit, retention, and legal review |
| AI/agent behavior | Add authority boundaries, prompt/tool/data controls, evals, monitoring, and cost limits |
| Detected technology and version | Bind only the relevant reusable technology skill to its package/path scope; verify official sources for version-sensitive work |
| Repeated stable domain knowledge | Use `domain-skill-framework`; create an overlay only from independent authoritative evidence and never from a single feature/name |

## Required handoff

Report:

- onboarding state and evidence;
- decisions completed and approvals used;
- controls active versus conditional;
- validation results and unavailable checks;
- external repository settings still requiring an owner action;
- residual risks and next exact safe step;
- Project Memory entries created or changed.
