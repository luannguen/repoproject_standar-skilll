---
name: ui-ux-production
description: Design, implement, refactor, or review production UI/UX using the repository's actual components, tokens, framework, user flows, accessibility, responsive behavior, system states, permissions, and performance constraints. Use for any page, layout, component, form, table, dashboard, navigation, modal, dialog, drawer, styling, theme, typography, animation, interaction, mobile/PWA, onboarding, search/filter/pagination, upload, authentication/profile/admin/public interface, or visual/accessibility change.
---

# UI/UX Production

Use this skill after Project Memory retrieval and before any UI/UX analysis, code, refactor, or review.

## Skill contract

- id: ui-ux-production
- name: UI/UX Production Engineering
- version: 1.1.0
- description: analyze, design, implement, refactor, and validate production interfaces against current project evidence, user intent, design-system architecture, WCAG 2.2 AA, responsive behavior, system states, permissions, and performance.
- purpose: produce maintainable, accessible, responsive, secure, performant interfaces grounded in current project evidence and user intent.
- scope: interface architecture, information hierarchy, user flows, components, forms, data presentation, system states, responsive/adaptive behavior, accessibility, interaction, content, permissions, frontend performance, and UI regression.
- triggers: any UI, UX, page, layout, component, form, table/list, dashboard, navigation, overlay, styling/theme/type, responsive/mobile/PWA, accessibility, animation/interaction, system-state, onboarding, search/filter/pagination, upload, auth/profile/admin/public-interface, or visual task.
- exclusions: does not invent product rules, backend authorization, frameworks, design tokens, dependencies, or application evidence; does not perform unrelated global redesign.
- required_inputs:
  - user goal, audience, workflow, primary action, risks, and success/failure states
  - current pages, components, hooks, tokens, styles, tests, framework, UI libraries, and project instructions
  - data contract, permissions, validation, target viewports/input modes, content extremes, and production constraints
- expected_outputs:
  - Memory Context and a concise UX Decision Summary
  - reuse/extension/new-component decision
  - scoped implementation or evidence-backed review
  - responsive, accessibility, state, performance, permission, and regression validation
  - explicit exceptions, remaining risk, UI debt, and memory delta
- required_files:
  - ../../PROJECT-CONSTITUTION.md
  - ../../AI-BOOTSTRAP.md
  - ../project-memory/SKILL.md through bootstrap routing
  - references/RULES.md
  - references/CHECKLIST.md
  - relevant current source files and tests
- related_skills:
  - project-memory
  - backend-production-engineering
  - requirement-analysis
  - testing-quality
  - security-threat-modeling
- prerequisite_skills:
  - project-memory
- next_skills:
  - testing-quality
  - security-threat-modeling when trust or permission surfaces change
  - documentation-sync
- constraints: target WCAG 2.2 AA unless stronger evidence exists; never invent application facts; never treat hiding UI as authorization; reuse before create; do not code before context and pre-task gates.
- blockers: missing user goal or authoritative data/permission contract; unresolved accessibility BLOCKER; client-only authorization assumption; critical flow lacks failure/recovery state; application evidence required for implementation is absent.
- approval_requirements: major UI dependency, global redesign, material product-scope expansion, public behavior break, sensitive-data collection, or weakened accessibility/security requires the matching approval gate.
- execution_workflow: follow the Mandatory workflow below in order.
- pre_task_checklist:
  - retrieve and verify relevant Project Memory and current UI evidence
  - identify users, goals, primary action, states, permissions, viewports, input modes, content extremes, and reuse candidates
  - define scope, non-goals, risk, validation, and applicable approvals before code
- post_task_checklist:
  - validate complete states, keyboard/focus, semantics, contrast, responsive behavior, content extremes, permissions, performance, and regression
  - confirm reuse and design-system consistency without accidental duplication
  - report unavailable checks, exceptions, residual risk, documentation, and memory delta
- validation_process: complete role-based self-review and every available check in CHECKLIST.md; report unavailable checks and residual risk.
- completion_criteria: satisfy the Completion gate with no unapproved BLOCKER/MUST exception.
- exception_policy: record rule, reason, scope, affected users, accessibility/security risk, compensating control, approval, expiry, and remediation; never silently downgrade BLOCKER/MUST.
- memory_read_policy: retrieve only task-relevant UI decisions, components, tokens, patterns, incidents, accessibility constraints, and checkpoints; verify against current source.
- memory_write_policy: store only durable verified UI decisions, reusable patterns, accessibility constraints, incidents, debt, and outcomes; never store speculative design-system facts.
- update_policy: add only reusable, evidenced rules/patterns; record every change in CHANGELOG; require approval to weaken BLOCKER/MUST, accessibility, security, production, or instruction architecture.

## Current project baseline

The repository currently has no application source, UI framework, design tokens, shared components, product specification, or UI tests. Treat all application-specific facts as unknown. Run discovery again whenever sources arrive; do not turn this baseline into a default design system.

## Mandatory workflow

1. Classify the UI task: new/modified page or component, UX flow, visual refinement, responsive/accessibility/performance fix, form, table, navigation, dashboard, design system, or cross-cutting refactor.
2. Complete Project Memory retrieval and verify applicable decisions, constraints, incidents, contracts, and checkpoints.
3. Read [RULES.md](references/RULES.md) and the pre-task sections in [CHECKLIST.md](references/CHECKLIST.md).
4. Search the codebase for analogous pages, components, hooks, states, tokens, permissions, utilities, and tests. Search before proposing a new component or dependency.
5. Create a UX Decision Summary:
   - user goal and context;
   - primary/secondary/destructive actions;
   - information hierarchy and workflow;
   - complete state model;
   - responsive/adaptive strategy;
   - accessibility and input-mode considerations;
   - reuse strategy and affected contracts;
   - risks and proposed implementation.
6. If materially different options exist, compare at most three by UX, architecture, accessibility, performance, maintenance, and migration cost; recommend one.
7. Define implementation scope, changed/created files, reuse/extension choices, data/state/permission flow, validation/error behavior, tests, and explicit non-goals.
8. Implement under current project architecture and design system. Follow [PATTERNS.md](references/PATTERNS.md); check [ANTI-PATTERNS.md](references/ANTI-PATTERNS.md).
9. Self-review as UX, consistency, accessibility, responsive, frontend architecture, performance, permission, content, and regression reviewer.
10. Run every available validation in [CHECKLIST.md]. Record unavailable checks, reason, remaining risk, and manual verification.
11. Report outcome, states, responsive/accessibility work, reused patterns, files, validation, exceptions, risk, and UI debt.
12. Review and write back material Project Memory; update this skill only under the safe update policy.

## Severity and exceptions

- BLOCKER: work cannot be declared complete.
- MUST: required; deviation needs an explicit exception.
- SHOULD: strong default; explain a meaningful deviation.
- MAY: optional when context supports it.

For every BLOCKER/MUST exception, record rule, reason, scope, risk, compensating control, owner/follow-up, and target resolution. Never silently downgrade a rule.

## Progressive reference loading

- Read [RULES.md](references/RULES.md) and [CHECKLIST.md](references/CHECKLIST.md) for every UI task.
- Read [PATTERNS.md](references/PATTERNS.md) for component, design-system, form, table, state, navigation, responsive, permission, or feedback decisions.
- Read [ANTI-PATTERNS.md](references/ANTI-PATTERNS.md) during review/refactor or when adding dependencies/components.
- Read [EXAMPLES.md](references/EXAMPLES.md) only when a concrete output shape is useful.
- Read [CHANGELOG.md](references/CHANGELOG.md) before changing the skill.

## Completion gate

Do not declare completion until:

- user intent, reuse, system states, responsive behavior, accessibility, permissions, and content extremes were considered;
- BLOCKER/MUST rules are satisfied or explicitly excepted;
- available typecheck, lint, build, tests, interaction/accessibility/responsive checks, and visual review ran;
- no unresolved import, accidental duplication, token violation, raw backend error, double-submit risk, or authorization assumption remains;
- changes, validation, unavailable checks, risks, debt, and memory update are reported.
