# Project Memory Index

Read this file first, then filter memory-index.json. Open detail files only when their metadata matches the task.

## Retrieval route

1. Load matching level-0 constraints.
2. Match module, path, feature, entity, dependency, integration, and trigger terms.
3. Prefer verified/current entries and closest scope.
4. Include incidents/checkpoints/debt/questions only when actionable.
5. Verify detail claims against current sources before use.

## Active entries

| ID | Type | Scope | Status | Summary | Detail |
| --- | --- | --- | --- | --- | --- |
| MEM-PROJECT-0001 | project_fact | level-0:project | verified | A validated 21-Standard-Skill/12-workflow plus 27-Custom-Skill template baseline exists; application source does not. | PROJECT-SNAPSHOT.md |
| MEM-CONSTRAINT-0001 | technical_constraint | level-0:project | verified | Every task uses selective, evidence-backed memory with no secrets or private reasoning. | CONSTRAINTS.md |
| MEM-GAP-0001 | documentation_gap | level-0:project | supported | Both specialist skills are routed; application/business/Base44/schema/test/deployment sources remain unavailable. | audits/MEMORY-GAP-REPORT.md |
| MEM-QUESTION-0001 | open_question | level-0:project | provisional | Product, domain, stack, Base44 capabilities, contracts, and deployment remain unknown. | OPEN-QUESTIONS.md |
| MEM-DEBT-0001 | technical_debt | level-0:project | supported | Project-specific semantic and episodic memory remains unpopulated until application sources arrive. | DEBT.md |
| MEM-UI-0001 | project_fact | level-0:project:ui-ux | verified | UI/UX Production is routed; application UI architecture remains absent. | audits/UI-UX-AUDIT.md |
| MEM-BACKEND-0001 | project_fact | level-0:project:backend | verified | Backend Production Engineering is routed; application/Base44 backend evidence remains absent. | audits/BACKEND-AUDIT.md |
| DEC-0001 | architecture_decision | level-0:project | verified | Use a deterministic JSON index and Markdown detail; do not add a vector database. | decisions/DEC-0001-deterministic-memory-index.md |
| MEM-SKILL-SYSTEM-0001 | project_fact | level-0:project:instruction-system | verified | Constitution, Orchestrator, separate Standard/Custom registries, 12 workflows, routing fixtures, and executable lint are active. | modules/instruction-system/MEM-SKILL-SYSTEM-0001.md |
| MEM-CUSTOM-SKILL-SYSTEM-0001 | project_fact | level-0:project:instruction-system:custom-skills | verified | 27 reusable Custom Skills use evidence detection and scoped project bindings; only GitHub CI is active. | modules/instruction-system/MEM-CUSTOM-SKILL-SYSTEM-0001.md |
| MEM-TEMPLATE-STANDARD-0001 | project_fact | level-0:project:template-governance | verified | Evidence-gated onboarding, repository governance, and cross-platform reusable validation are active. | modules/instruction-system/MEM-TEMPLATE-STANDARD-0001.md |
| TASK-20260716-project-engineering-skill-system | task_summary | level-4:task | verified | Full Project Engineering Skill System created, integrated, reported, and validated. | tasks/completed/TASK-20260716-project-engineering-skill-system.md |
| TASK-20260716-template-production-standard | task_summary | level-4:task | verified | Reusable onboarding, governance, security/release, routing-fixture, and CI baseline added and validated. | tasks/completed/TASK-20260716-template-production-standard.md |
| TASK-20260716-reusable-custom-skill-system | task_summary | level-4:task:reusable-custom-skill-system | verified | Two-layer Custom Skills, detection, activation, overlays, routing, validation, and reports added without app assumptions. | tasks/completed/TASK-20260716-reusable-custom-skill-system.md |
| PAT-0001 | design_pattern | level-0:project | supported | Retrieve index -> summary -> detail -> source verification. | patterns/PAT-0001-progressive-retrieval.md |
| TASK-20260716-project-memory-bootstrap | task_summary | level-4:task | verified | Project Memory OS bootstrap phase created and validated. | tasks/completed/TASK-20260716-project-memory-bootstrap.md |
| TASK-20260716-ui-ux-production-skill | task_summary | level-4:task | verified | UI/UX Production skill created, routed, audited, and validated. | tasks/completed/TASK-20260716-ui-ux-production-skill.md |
| TASK-20260716-backend-production-engineering-skill | task_summary | level-4:task | verified | Backend Production Engineering skill created, routed, audited, and validated. | tasks/completed/TASK-20260716-backend-production-engineering-skill.md |
| TASK-20260716-project-memory-onboarding | task_checkpoint | level-4:task | provisional | Blocked until authoritative application and Base44/project sources arrive. | tasks/blocked/TASK-20260716-project-memory-onboarding.md |

## Repository snapshot and shared registers

- PROJECT-SNAPSHOT.md: verified repository baseline.
- GLOSSARY.md: controlled vocabulary for memory operations.
- CONSTRAINTS.md: project-wide memory constraints.
- OPEN-QUESTIONS.md: unresolved project context.
- DEBT.md: known memory and documentation debt.
- audits/: knowledge, gap, staleness, and remediation reports.
- decisions/, modules/, patterns/, incidents/, migrations/, integrations/: scoped durable memory.
- tasks/active/, tasks/blocked/, tasks/completed/: working-memory lifecycle.
- archive/: inactive history excluded from default retrieval.

## Index maintenance

The JSON index is the deterministic routing source; this Markdown file is the human summary. Update detail and JSON atomically, then refresh this table for added/removed/renamed active entries. Do not duplicate entry narratives here.

Run the linter after every index or detail change.
