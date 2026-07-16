# Instruction Architecture Audit

Date: 2026-07-16

## Before

The project had a root `AGENTS.md`, an `AI-BOOTSTRAP.md`, and direct routes to Project Memory, UI/UX Production, and Backend Production Engineering.

Material gaps:

- no project-local constitutional authority or conflict hierarchy;
- no task/risk Orchestrator;
- no machine-readable skill or workflow registry;
- no approval gate matrix;
- no common skill contract;
- no general feature/bug/refactor/migration/release/incident workflow;
- no validation for unused skills, broken routes, duplicate IDs, dependency cycles, or workflow/skill mismatch;
- no context strategy beyond Memory's own progressive retrieval;
- no rule governing evidence thresholds for domain skills.

## Current four-layer architecture

1. **Constitution** ? `PROJECT-CONSTITUTION.md`, authority order, risk model, pre/post gates, exceptions, context, self-update, completion.
2. **Orchestration** ? Project Orchestrator, Skill Registry, Workflow Registry, Approval Gates, AI Bootstrap, Task Execution Brief.
3. **Capabilities** ? 20 registered skills: three upgraded foundations, Orchestrator, and 16 missing capability/framework skills.
4. **Workflows** ? 11 primary workflow contracts covering feature, bug, refactor, migration, dependency, release, incident, documentation, performance, security, and AI work.

## Routing lifecycle

`Constitution ? registries ? Orchestrator/classification/risk ? Task Execution Brief ? approval evaluation ? Project Memory ? primary workflow ? selected skills ? pre-task gate ? execution ? validation ? documentation ? memory/checkpoint`.

Only registry metadata is loaded globally. Workflow, skill references, memory entries, and sources load progressively by task and risk.

## Authority and conflict behavior

Platform/system/developer/safety constraints remain above project-local rules. User intent and approval remain above the Constitution. Within project-local instructions, Constitution and Bootstrap govern approval/workflow selection; workflow owns sequence; specialist skills own domain checks; current evidence outranks stale memory.

An unresolved conflict involving safety, authorization, data integrity, compatibility, accessibility, approval, or correctness is a blocker.

## Application-specific conclusion

No application architecture can be audited yet. Domain, framework, data, auth, deployment, and Base44/platform capabilities remain unknown by design.
