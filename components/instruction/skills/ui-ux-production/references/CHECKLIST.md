# UI/UX Production Checklists

## Contents

1. Pre-task memory and classification
2. Discovery and reuse gate
3. UX Decision Summary
4. Pre-implementation gate
5. Implementation checks
6. Specialized checks
7. Self-review
8. Validation evidence
9. Exception record
10. Post-task report and learning

## 1. Pre-task memory and classification

- [ ] Read AGENTS.md and AI-BOOTSTRAP.md.
- [ ] Complete Project Memory retrieval, verification, stale/conflict scan, and Memory Context Summary.
- [ ] Read this skill, RULES.md, and relevant patterns/anti-patterns.
- [ ] Classify: page, component, UX flow, visual refinement, responsive, accessibility, performance, form, table, navigation, dashboard, design system, or cross-cutting refactor.
- [ ] Identify risk: permissions/privacy, destructive actions, auth/payment/upload, public/shared API, high-traffic, data-dense, or accessibility-critical.
- [ ] Confirm approved product/business/data sources; mark unknowns rather than inventing behavior.

## 2. Discovery and reuse gate

- [ ] Locate framework, package manifests, UI libraries, styling approach, theme, tokens, breakpoints, typography, motion, and i18n.
- [ ] Search analogous pages, layouts, components, hooks, utilities, forms, tables, state views, permission patterns, and tests.
- [ ] Inspect current component public APIs and consumers before extension/refactor.
- [ ] Classify candidate UI as primitive, composite, pattern, or feature component.
- [ ] Choose reuse, composition, extension, variant, new composite, feature component, or shared refactor with a reason.
- [ ] Confirm a new dependency is not duplicating current/platform capability.
- [ ] If sources are absent, stop project-specific design claims and record the gap/debt.

BLOCKER: no UI code before this gate is complete.

## 3. UX Decision Summary

Record concise conclusions:

- user and context:
- user goal:
- workflow before/after:
- primary action:
- secondary actions:
- destructive actions:
- information hierarchy:
- data/input/output:
- success and failure:
- permission/read-only behavior:
- system states:
- responsive/adaptive strategy:
- keyboard/touch/mouse behavior:
- accessibility considerations:
- content/i18n extremes:
- reuse/extension strategy:
- affected API/data contracts:
- risks:
- proposed implementation:
- non-goals:

Do not include private chain-of-thought.

## 4. Pre-implementation gate

- [ ] Define changed/created files and excluded scope.
- [ ] Define data, state, validation, error, permission, navigation, and URL flow.
- [ ] Define initial/loading/empty/no-result/partial/stale/offline/error/denied/not-found/success/pending/read-only/optimistic/retry/session states as applicable.
- [ ] Define mobile, tablet, desktop, wide, low-height, long-content, long-string, large-number, keyboard, touch, zoom, safe-area, and virtual-keyboard behavior.
- [ ] Verify semantic HTML and focus/keyboard plan.
- [ ] Verify existing token/component usage and compatibility impact.
- [ ] Define tests and manual validation before coding.
- [ ] Record any BLOCKER/MUST exception proposal before implementation.
- [ ] For full-stack work, align UI with current API/schema/permission contract and Backend skill when present.

## 5. Implementation checks

### Architecture and design system

- [ ] Reuse current tokens and components.
- [ ] Avoid raw semantic color/spacing/type/z-index values where tokens exist.
- [ ] Keep business logic out of primitives.
- [ ] Keep component API typed, bounded, accessible, and backward compatible.
- [ ] Avoid prop explosion, copy-paste variants, and unrelated refactor.
- [ ] Avoid a new global token/system for a local issue.

### States and feedback

- [ ] Render distinct loading, empty, no-result, error, permission, and success behavior as applicable.
- [ ] Preserve useful data during refresh and user input after errors.
- [ ] Prevent duplicate requests/submits.
- [ ] Place feedback where users can act on it.
- [ ] Keep critical messages persistent and accessible.

### Responsive and interaction

- [ ] Implement intentional wrap/stack/reorder/hide/drawer/scroll/card/sticky behavior.
- [ ] Keep essential actions reachable on small/low-height screens.
- [ ] Handle mouse, keyboard, touch, and reduced motion.
- [ ] Prevent content clipping, accidental horizontal page scroll, unsafe overlays, and virtual-keyboard obstruction.

### Accessibility

- [ ] Use semantic elements and labels.
- [ ] Give every interactive element an accessible name and keyboard behavior.
- [ ] Keep visible focus, logical order, and focus restoration.
- [ ] Meet contrast and avoid color-only meaning.
- [ ] Announce errors/status when needed.
- [ ] Support zoom/text scaling/reflow and reduced motion.
- [ ] Manage dialog/menu/combobox/tooltip/table semantics correctly.

### Security, permission, content

- [ ] Do not treat hidden/disabled UI as authorization.
- [ ] Avoid protected-data flashes and raw technical errors.
- [ ] Mask sensitive data and avoid unsafe client logging/storage.
- [ ] Use clear action labels, actionable errors, and project i18n when present.
- [ ] Design for long/translatable content.

### Performance

- [ ] Avoid duplicate/unbounded fetch, unnecessary re-render, heavy hidden UI, and large DOM.
- [ ] Use images/fonts/lazy loading/code splitting/cache/debounce/virtualization intentionally.
- [ ] Reserve layout space and minimize interaction latency/waterfalls.

## 6. Specialized checks

### Forms

- [ ] Labels, grouping, descriptions, required/optional state, defaults, formats.
- [ ] Client and server errors mapped; summary and first-error focus when useful.
- [ ] Values preserved after error; dirty/read-only/disabled/loading/saving states clear.
- [ ] Duplicate submit prevented; destructive and unsaved-change behavior intentional.
- [ ] Upload/date/number/currency/phone/email/password/select/rich editor behavior covered as applicable.

### Tables and lists

- [ ] Dataset scale and client/server pagination/sort/filter/search strategy verified.
- [ ] Selection, bulk/row actions, permissions, refresh/retry, and URL state intentional.
- [ ] Column/truncation/sticky/mobile strategy defined.
- [ ] Large data bounded or virtualized when justified.
- [ ] Keyboard and semantic table/list behavior works.

### Navigation and overlays

- [ ] Current location, destinations, primary action, back/refresh/deep-link behavior clear.
- [ ] Mobile navigation strategy exists.
- [ ] Modal/dialog/drawer choice is justified over page/popover/inline.
- [ ] Overlay focus, close, stacking, URL/history, and restoration behavior works.
- [ ] No avoidable nested modal.

## 7. Self-review

Review from each role:

- [ ] UX reviewer: goal, flow, hierarchy, recovery, cognitive load.
- [ ] UI consistency reviewer: tokens, components, density, visual hierarchy.
- [ ] Accessibility reviewer: semantics, names, keyboard, focus, contrast, announcements, zoom.
- [ ] Responsive reviewer: all target viewports, content extremes, input modes.
- [ ] Frontend architecture reviewer: reuse, boundaries, API, duplication, dependency impact.
- [ ] Performance reviewer: network/render/bundle/DOM/layout shift/latency.
- [ ] Permission/privacy reviewer: visibility, data exposure, direct-route assumptions.
- [ ] Content reviewer: labels, errors, CTA, i18n, long copy.
- [ ] Regression reviewer: consumers, neighboring flows, shared components, browser history.

## 8. Validation evidence

Run and record:

- [ ] typecheck:
- [ ] lint:
- [ ] build:
- [ ] unit/component tests:
- [ ] interaction/form/permission tests:
- [ ] E2E:
- [ ] automated accessibility:
- [ ] visual regression:
- [ ] unresolved import/console/runtime scan:
- [ ] keyboard and focus review:
- [ ] responsive viewports and low-height review:
- [ ] loading/empty/error/denied/slow-network review:
- [ ] long-content/large-number/i18n review:
- [ ] double-submit and retry review:
- [ ] real-shaped data visual review:

For each unavailable check, record reason, residual risk, manual check, and exact future command/tool.

## 9. Exception record

Required for every BLOCKER or MUST deviation:

- exception_id:
- rule and severity:
- task/scope:
- technical reason:
- affected users/surfaces:
- accessibility/security/privacy/architecture/performance risk:
- compensating control:
- evidence/validation:
- owner:
- target resolution:
- related debt/memory:
- approval source:

No silent exception is valid.

## 10. Post-task report and learning

Report:

1. analysis performed and project sources read;
2. primary UI/UX decisions;
3. reused/extended/new components or patterns;
4. files created/modified;
5. system states handled;
6. responsive/adaptive strategy;
7. accessibility behavior;
8. validation run and unavailable checks;
9. exceptions and residual risk;
10. UI debt found but not fixed;
11. follow-up only when materially useful;
12. Project Memory entries/checkpoint/task summary updated.

Safe learning review:

- [ ] reusable proven pattern?
- [ ] repeated anti-pattern/root cause?
- [ ] missing/unclear rule or checklist?
- [ ] component now demonstrably shared?
- [ ] design/system standard changed by an approved source?
- [ ] CHANGELOG updated for any skill change?
- [ ] no feature-only detail promoted to global skill?
