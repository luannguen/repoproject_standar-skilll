# UI/UX Remediation Backlog

This backlog is source-triggered. Do not create fake components/tokens or close findings from memory alone.

## P0 - On application source arrival

1. Identify framework/runtime, package manifests, routes/pages/layouts, UI libraries, styling system, build/lint/type/test commands, and deployment target.
2. Read approved product users, goals, workflows, roles, permissions, primary devices, localization, and production constraints.
3. Inventory theme, semantic tokens, CSS variables, Tailwind/configuration, typography, breakpoints, motion, radius, elevation, and z-index strategy.
4. Inventory pages, shared primitives/composites, feature components, hooks, forms, tables/lists, navigation, overlays, async state components, and tests.
5. Map UI to API/schema/auth/permission contracts through the routed Backend Production skill once application sources exist; do not invent contracts.
6. Update PROJECT-SNAPSHOT, OPEN-QUESTIONS, MEM-GAP-0001, MEM-DEBT-0001, MEM-UI-0001, and the onboarding checkpoint.

## P1 - Evidence-backed audit and standardization

1. Detect duplicate/near-duplicate components and copied role pages; propose the reuse ladder without broad refactor.
2. Detect raw colors/spacing/type/sizes/z-index and CSS override chains against verified tokens.
3. Audit page/layout hierarchy, navigation, URL/back state, forms, tables, loading/empty/error/denied/offline/session states.
4. Audit mobile/tablet/desktop/wide/low-height/content-extreme behavior and touch/keyboard/mouse input.
5. Audit WCAG 2.2 AA semantics, names, keyboard, focus, contrast, announcements, dialogs, complex widgets, zoom/reflow, and reduced motion.
6. Audit bundle/network/render/DOM/image/font/layout-shift/interaction performance using available evidence.
7. Audit privacy/security/role behavior; never equate hidden UI with authorization.
8. Create scoped debt and remediation proposals; do not refactor the whole UI in the audit task.

## P2 - Validation maturity

1. Establish/route component, interaction, form, permission, responsive, E2E, accessibility, and visual regression tooling when consistent with the project stack.
2. Add representative real-data/content-extreme/slow-network/double-submit regression cases.
3. Promote only repeated or accepted UI patterns into project memory or this skill.
4. Schedule periodic UI drift audits after major shared-component, token, framework, or product-flow changes.

## Exit criteria

Application-specific UI onboarding is complete only when current sources establish user/role context, framework/tooling, component/token architecture, responsive/accessibility baseline, system states, API/permission contracts, tests, deployment constraints, known debt, and active checkpoints with zero memory BLOCKER.
