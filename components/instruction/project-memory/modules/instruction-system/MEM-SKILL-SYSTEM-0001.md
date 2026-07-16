---
memory_id: MEM-SKILL-SYSTEM-0001
title: Project Engineering Skill System is active
memory_type: project_fact
scope: level-0:project:instruction-system
summary: The repository has a validated Constitution, Orchestrator, 21-Standard-Skill registry, 12-workflow registry, separate 27-module Custom Skill library, approval gates, routing fixtures, and executable lint.
status: verified
confidence: high
tags: [instruction-system, skills, workflows, routing, governance, validation]
trigger_terms: [skill, workflow, orchestrator, constitution, approval, routing, bootstrap, validation]
affected_modules: [instruction-system]
affected_paths: [AGENTS.md, components/instruction]
related_entities: []
related_features: [project-engineering-agent, project-onboarding]
source_references: [components/instruction/PROJECT-CONSTITUTION.md, components/instruction/SKILL-REGISTRY.json, components/instruction/WORKFLOW-REGISTRY.json, components/instruction/custom-skills/CUSTOM-SKILL-REGISTRY.json, components/instruction/project-custom-skills/ACTIVE-CUSTOM-SKILLS.json, components/instruction/PROJECT-ONBOARDING.md, components/instruction/tests/routing-cases.json, components/instruction/tests/custom-skill-routing-cases.json, components/instruction/reports/CUSTOM-SKILL-SYSTEM-READINESS.md]
evidence: [21 Standard Skills and 12 workflows pass their linters, 27 reusable Custom Skills pass quick validation and custom lint, stack/domain manifests match repository evidence, 24 Standard and 12 Custom routing fixtures pass]
decision_or_fact: implementation_fact
rationale: Future agents need one durable fact describing the available instruction architecture without reading every skill.
consequences: [Every task starts with Constitution and Orchestrator routing, Standard Skills remain separate and higher-authority, Custom Skills require active task/path-scoped bindings, Cloned templates start with project-onboarding, Application production readiness remains unverified]
risks: [The registry and memory become stale if future instruction changes are not synchronized]
valid_from: 2026-07-16
last_verified_at: 2026-07-16
review_after: 2026-10-16
created_at: 2026-07-16
updated_at: 2026-07-16
created_by_task: TASK-20260716-project-engineering-skill-system
supersedes: []
superseded_by:
related_memories: [MEM-PROJECT-0001, MEM-CONSTRAINT-0001, MEM-GAP-0001, MEM-TEMPLATE-STANDARD-0001, MEM-CUSTOM-SKILL-SYSTEM-0001, TASK-20260716-project-engineering-skill-system, TASK-20260716-template-production-standard, TASK-20260716-reusable-custom-skill-system]
detail_path: components/instruction/project-memory/modules/instruction-system/MEM-SKILL-SYSTEM-0001.md
---

# Project Engineering Skill System is active

## Claim

The project-local instruction architecture integrates Constitution, Orchestration, 21 Standard Skills, 12 Workflows, a separate 27-module Custom Skill library, Project Memory, and repository onboarding/governance. The Orchestrator selects one primary workflow and minimum Standard Skills, then filters Custom Skills through project bindings by task and package/path scope.

## Evidence

- `PROJECT-CONSTITUTION.md` defines authority, risk, pre/post gates, exceptions, context, and controlled self-update.
- `SKILL-REGISTRY.json` contains 21 active skills with paths, dependencies, risk usage, task classes, and workflow use.
- `WORKFLOW-REGISTRY.json` contains 12 active primary workflows with required/optional Standard Skills and approval gates.
- `CUSTOM-SKILL-REGISTRY.json` contains 14 technology and 13 domain reusable modules; the project activation manifest currently binds only GitHub CI.
- Stack/domain detectors and 12 custom fixtures prevent unproven or out-of-scope activation.
- The unified suite validates repository hygiene, Standard Skills, workflows, Custom Skills, stack/domain synchronization, 24 Standard routing fixtures, 12 Custom routing fixtures, routes/links, anti-patterns, and Project Memory.
- Project Memory lint passes after this write-back.

## Boundary

This is evidence of instruction and template-layer readiness only. It is not evidence of an application framework, domain, business rules, schema, auth, integrations, deployment, runtime, or production readiness.

## Re-verification

Run `components/instruction/scripts/validate.ps1`, then run every application command registered in `PROJECT-PROFILE.json` after onboarding.
