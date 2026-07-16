---
memory_id: TASK-20260716-project-memory-onboarding
memory_type: task_checkpoint
scope: level-4:task:project-onboarding
status: provisional
confidence: high
trigger_terms: [onboarding, continue, resume, application-source, frontend-skill, backend-skill]
source_references: [components/instruction/project-memory/PROJECT-SNAPSHOT.md, components/instruction/project-memory/audits/MEMORY-GAP-REPORT.md, components/instruction/project-memory/audits/MEMORY-REMEDIATION-BACKLOG.md, components/instruction/project-memory/audits/UI-UX-AUDIT.md, components/instruction/project-memory/audits/BACKEND-AUDIT.md, components/instruction/skills/ui-ux-production/SKILL.md, components/instruction/skills/backend-production-engineering/SKILL.md]
last_verified_at: 2026-07-16
review_after: 2026-08-16
supersedes: []
superseded_by:
related_memories: [TASK-20260716-project-memory-bootstrap, TASK-20260716-ui-ux-production-skill, TASK-20260716-backend-production-engineering-skill, MEM-PROJECT-0001, MEM-GAP-0001, MEM-QUESTION-0001, MEM-DEBT-0001, MEM-UI-0001, MEM-BACKEND-0001]
task_id: TASK-20260716-project-memory-onboarding
current_status: blocked
---

# Onboard application sources and project-specific evidence

## Objective and scope

Complete the remaining source-backed portions of Project Memory onboarding: survey application code, Base44 usage, UI/backend architecture, modules, dependencies, schema, workflows, permissions, tests, deployment, decisions, incidents, migrations, checkpoints, debt, and stale/conflicting documentation; then populate selected semantic and episodic memory.

Do not create application business rules, architecture, permissions, schemas, incidents, or patterns without authoritative evidence.

## Completed work

- Built and validated the complete Project Memory infrastructure.
- Audited and recorded the initial empty workspace.
- Created gap, stale-documentation, and remediation reports.
- Created and routed the mandatory UI/UX Production skill without fabricating application UI sources.
- Created and routed the mandatory Backend Production Engineering skill, Base44 verification matrix, audit, risk report, and remediation backlog without fabricating application sources.

## Files

- created: AGENTS.md, the components/instruction memory system, components/instruction/skills/ui-ux-production, and components/instruction/skills/backend-production-engineering.
- modified: AGENTS.md, AI-BOOTSTRAP.md, project snapshot/gap/debt/questions/backlogs, structured/human memory indexes, and this checkpoint.
- inspected: workspace root, Project Memory, user-supplied memory/UI/backend skill specifications, and all current repository paths.

## Decisions and assumptions

- decisions_made: use deterministic JSON/Markdown memory and progressive retrieval.
- assumptions: none about the application; missing context remains explicit.

## Commands and tests

- commands_run: recursive inventory, rg discovery, Git status, Project Memory/UI/backend skill initialization, memory lint, skill validation, link audit, routing/contract/anti-pattern structural audits.
- tests_passed: memory lint; UI and backend skill-creator validation; UI 15 contract fields/16 rule groups/40 anti-patterns; backend 19 contract fields/70 anti-patterns/required references; routing enforcement; Markdown links; no unfinished markers.
- tests_failed: direct quick_validate runtimes lacked PyYAML; validation logic for both specialist skills passed through temporary flat-frontmatter compatibility shims; shims were removed and no dependency was added.

## Current state

- current_errors: []
- blockers:
  - application source tree and manifests are absent;
  - application-specific Base44/backend architecture, entities/schema, auth/permission, integration, test, migration, observability, and deployment sources are absent;
  - approved business, schema, test, deployment, decision, incident, migration, and task sources are absent;
  - the workspace is not a Git repository.
- unresolved_questions: see MEM-QUESTION-0001.

## Resume

- next_exact_step: After authoritative application sources are added, read AGENTS.md and AI-BOOTSTRAP.md, run rg --files to locate manifests, Base44/entity/function/auth/integration/UI/test/deployment sources, read them in routed order, execute the P0 memory, UI, and backend remediation backlogs, update PROJECT-SNAPSHOT.md and all affected audit/gap/risk entries, then add only source-backed module/contract/decision/incident/checkpoint entries. Success means every remaining P0 gap/risk is linked to a current approved source or explicitly accepted as out of scope, and memory lint has zero BLOCKER.
- next_files_to_read: AGENTS.md, components/instruction/AI-BOOTSTRAP.md, both specialist SKILL.md files, project manifests/entry points, Base44 configuration/entities/functions/auth/integrations, UI/token/component sources, specifications, schema/migrations, tests, deployment/observability config, ADR/incidents/checkpoints.
- next_commands_to_run: rg --files; git status --short when Git exists; components/instruction/skills/project-memory/scripts/memory-lint.ps1.
- resume_instruction: Use the closest blocked checkpoint with task ID TASK-20260716-project-memory-onboarding; verify the missing-source evidence before continuing the P0 remediation backlog.

## Risk and rollback

- risks: fabricated project knowledge, stale baseline after source arrival, or mistaking procedural skills for application production evidence.
- rollback_notes: the memory system is additive instruction/documentation; remove only with explicit approval because it defines project routing.
- related_memories: TASK-20260716-project-memory-bootstrap, TASK-20260716-ui-ux-production-skill, TASK-20260716-backend-production-engineering-skill, MEM-PROJECT-0001, MEM-GAP-0001, MEM-QUESTION-0001, MEM-DEBT-0001, MEM-UI-0001, MEM-BACKEND-0001.
