---
memory_id: MEM-SKILL-SYSTEM-0001
title: Project Engineering Skill System is active
memory_type: project_fact
scope: level-0:project:instruction-system
summary: The repository has a validated Constitution, Orchestrator, 20-skill registry, 11-workflow registry, approval gates, routing, and executable instruction lint.
status: verified
confidence: high
tags: [instruction-system, skills, workflows, routing, governance, validation]
trigger_terms: [skill, workflow, orchestrator, constitution, approval, routing, bootstrap, validation]
affected_modules: [instruction-system]
affected_paths: [AGENTS.md, components/instruction]
related_entities: []
related_features: [project-engineering-agent]
source_references: [components/instruction/PROJECT-CONSTITUTION.md, components/instruction/SKILL-REGISTRY.json, components/instruction/WORKFLOW-REGISTRY.json, components/instruction/reports/INSTRUCTION-ARCHITECTURE-AUDIT.md, components/instruction/reports/DEFINITION-OF-DONE.md]
evidence: [20 registered skills passed skill lint with zero blockers and warnings, 11 workflows passed workflow lint with zero blockers and warnings, routing and link validation passed with 35 anti-patterns]
decision_or_fact: implementation_fact
rationale: Future agents need one durable fact describing the available instruction architecture without reading every skill.
consequences: [Every task starts with Constitution and Orchestrator routing, Concrete domain skills remain evidence-gated, Application production readiness remains unverified]
risks: [The registry and memory become stale if future instruction changes are not synchronized]
valid_from: 2026-07-16
last_verified_at: 2026-07-16
review_after: 2026-10-16
created_at: 2026-07-16
updated_at: 2026-07-16
created_by_task: TASK-20260716-project-engineering-skill-system
supersedes: []
superseded_by:
related_memories: [MEM-PROJECT-0001, MEM-CONSTRAINT-0001, MEM-GAP-0001, TASK-20260716-project-engineering-skill-system]
detail_path: components/instruction/project-memory/modules/instruction-system/MEM-SKILL-SYSTEM-0001.md
---

# Project Engineering Skill System is active

## Claim

The project-local instruction architecture now has four integrated layers: Constitution, Orchestration, Capability Skills, and Workflows. The registries are the routing sources; Project Orchestrator selects one primary workflow and the minimum skills before implementation.

## Evidence

- `PROJECT-CONSTITUTION.md` defines authority, risk, pre/post gates, exceptions, context, and controlled self-update.
- `SKILL-REGISTRY.json` contains 20 active skills with paths, dependencies, risk usage, task classes, and workflow use.
- `WORKFLOW-REGISTRY.json` contains 11 active primary workflows with required/optional skills and approval gates.
- Skill lint, workflow lint, and route test each passed with zero blockers and warnings on 2026-07-16.
- Project Memory lint passed after this write-back.

## Boundary

This is evidence of instruction-system readiness only. It is not evidence of an application framework, domain, business rules, schema, auth, integrations, deployment, runtime, or production readiness. No concrete domain skill is justified until application evidence satisfies the Domain Skill Framework.

## Consequences

- Read registries first; do not preload every skill.
- Produce a Task Execution Brief for MEDIUM+ work.
- Route gated actions through Approval Gates.
- Synchronize registries, bootstrap, validation, documentation, changelog, and memory when instructions change.

## Re-verification

Run:

- `components/instruction/scripts/skill-lint.ps1`
- `components/instruction/scripts/workflow-lint.ps1`
- `components/instruction/scripts/instruction-route-test.ps1`
- `components/instruction/skills/project-memory/scripts/memory-lint.ps1`
