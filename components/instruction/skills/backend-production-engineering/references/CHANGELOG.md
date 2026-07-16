# Backend Production Engineering Changelog

Severity: every update-record field below is MUST when the skill changes; using changelog text as application evidence is prohibited.

## 1.1.0 - 2026-07-16

- Files: SKILL.md, registries, workflows, AGENTS.md, and AI-BOOTSTRAP.md.
- Change: added the project-wide 26-field contract and Orchestrator/workflow integration; separated cross-cutting data, API, security, migration, test, performance, observability, and release ownership through related skills.
- Evidence: instruction-system audit found no application sources and no shared orchestration/contract layer.
- Compatibility: process-only additive change; no application API, schema, runtime, or data exists to migrate.
## 1.0.0 - 2026-07-16

- Files: SKILL.md; agents/openai.yaml; all files under references/.
- Change: created the mandatory Backend Production Engineering operating system, progressive reference routing, production gates, four-level severity model, 70 anti-patterns, Base44 capability verification matrix, pre/post checklists, role-based review, exception policy, and controlled learning policy.
- Reason: TASK-20260716-backend-production-engineering-skill required a project-local production backend procedure and mandatory bootstrap integration.
- Scope: all future backend/full-stack analysis, implementation, refactor, debug, migration, review, and deployment work.
- Migration: no application/data migration; repository instruction routing is updated separately.
- Breaking change: process change for agents (backend gates become mandatory); no application API/schema/runtime exists to break.

## Update record template

For every future update record:

- version and date;
- changed files;
- rule/pattern/check/example added, changed, or removed;
- evidence and task/incident that motivated it;
- affected task types/modules/platform versions;
- migration/compatibility impact;
- security/data/reliability impact;
- breaking status and approval when required.

Never use changelog text as proof of current application behavior; verify the referenced source.
