---
memory_id: TASK-20260716-ui-ux-production-skill
memory_type: task_summary
scope: level-4:task:ui-ux-production-skill
status: verified
confidence: high
trigger_terms: [ui-ux-production, frontend-skill, accessibility, responsive, design-system, routing]
source_references: [AGENTS.md, components/instruction/AI-BOOTSTRAP.md, components/instruction/skills/ui-ux-production/SKILL.md, components/instruction/project-memory/audits/UI-UX-AUDIT.md, components/instruction/project-memory/audits/UI-UX-REMEDIATION-BACKLOG.md]
last_verified_at: 2026-07-16
review_after: 2026-10-16
supersedes: []
superseded_by:
related_memories: [MEM-UI-0001, MEM-CONSTRAINT-0001, MEM-GAP-0001, MEM-DEBT-0001, TASK-20260716-project-memory-onboarding]
---

# Create UI/UX Production skill

## Objective

Create a mandatory project-local UI/UX operating system for production interface analysis, implementation, refactor, review, validation, and safe learning.

## Completed work

- Initialized components/instruction/skills/ui-ux-production with standard skill metadata.
- Kept SKILL.md as a 100-line router/contract and moved detailed guidance into progressive references.
- Added RULES covering product context, IA, hierarchy, design system/components, responsive, WCAG 2.2 AA, forms, tables, states, interactions, navigation, performance, content, security/privacy, roles, and testing.
- Added pre/post gates, UX Decision Summary, exception record, self-review, safe-learning checklist, 40 classified anti-patterns, reusable patterns, examples, and changelog.
- Made UI skill/reuse/UX Decision Summary mandatory in AGENTS.md and AI-BOOTSTRAP.md before UI code.
- Created the UI current-state audit and source-triggered remediation backlog.
- Updated project snapshot, gap/debt/questions, general backlog, stale report, onboarding checkpoint, and Project Memory indexes.

## Structure decision

Use the existing skill convention:

- SKILL.md and agents/openai.yaml at skill root;
- detailed RULES, CHECKLIST, ANTI-PATTERNS, PATTERNS, EXAMPLES, and CHANGELOG under references/.

This follows skill-creator progressive disclosure and avoids a parallel instruction system. Audit/backlog stay in Project Memory because they describe repository state rather than reusable procedure.

## Validation

- skill-creator validation logic: valid;
- required skill files: present;
- skill contract fields: 15/15;
- rule groups A-P: 16/16;
- requested anti-patterns: 40/40;
- routing/enforcement: present in AGENTS and AI-BOOTSTRAP;
- Markdown links: valid;
- TODO placeholders: zero;
- Project Memory lint before summary: 0 BLOCKER, 0 WARN.

The installed Python runtimes lack PyYAML, so quick_validate ran through a temporary flat-frontmatter compatibility shim; the shim was removed and no dependency was added.

## Unverified application-specific areas

No application UI source, framework, token, component, theme, product/user/role contract, frontend test, runtime, or Git history exists. Therefore typecheck, application lint/build/tests, browser/responsive review, automated accessibility, and visual regression could not run. These remain explicit onboarding work in UI-UX-REMEDIATION-BACKLOG.md and TASK-20260716-project-memory-onboarding.

## Memory update

Created MEM-UI-0001, closed the missing-UI-skill row in MEM-GAP-0001, refreshed related memories, and kept the application/Backend onboarding checkpoint active with an exact resume step.
