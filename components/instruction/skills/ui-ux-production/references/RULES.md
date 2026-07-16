# UI/UX Production Rules

## Contents

1. Severity and evidence
2. A. Product context and user intent
3. B. Information architecture
4. C. Visual hierarchy
5. D. Design system and component architecture
6. E. Responsive and adaptive design
7. F. Accessibility
8. G. Form UX
9. H. Tables, lists, and data-dense UI
10. I. Feedback and system states
11. J. Interaction design
12. K. Navigation UX
13. L. Performance UX
14. M. Content design and microcopy
15. N. Security and privacy
16. O. Role-based UI
17. P. Testing and validation

## 1. Severity and evidence

- BLOCKER: do not declare implementation complete.
- MUST: comply unless an explicit technical exception is recorded.
- SHOULD: strong default; explain material deviation.
- MAY: context-dependent option.

Current project evidence overrides generic preference when it is authoritative and does not weaken higher-level production, accessibility, security, privacy, or data-integrity constraints. When sources conflict, use Project Memory conflict handling.

Because application sources are currently absent, rules that refer to existing tokens/components/frameworks mean: discover and verify them when sources appear. Never invent them.

## 2. A. Product context and user intent

- BLOCKER: Identify the user, intended task, success outcome, failure outcome, and primary action before selecting layout, cards, colors, or styling.
- MUST: Establish the workflow immediately before and after the surface, input data, output, priority, secondary actions, destructive actions, roles, target devices/input modes, and technical/business constraints.
- MUST: Distinguish user need from stakeholder request and implementation convenience.
- MUST: Define what the user must understand, decide, enter, compare, or recover from.
- MUST: Identify permission-denied, partial-access, and read-only experiences when roles affect the flow.
- SHOULD: State measurable usability or operational success where evidence permits.
- BLOCKER: Do not infer product/game behavior that is absent from approved sources.

## 3. B. Information architecture

- MUST: Order information and actions by user goal, decision sequence, risk, and frequency rather than database shape.
- MUST: Define grouping, heading hierarchy, navigation, back behavior, and progressive disclosure.
- MUST: Choose intentionally among breadcrumbs, tabs, sidebar, header navigation, search, filters, sorting, and pagination.
- MUST: Consider deep links, URL-backed state, refresh behavior, back navigation, and state preservation.
- MUST: Define empty, no-result, onboarding, partial-content, and permission-aware navigation states.
- MUST: For multi-step flows, expose progress, current step, saved state, validation boundaries, exit/re-entry, and recovery.
- SHOULD: Preserve meaningful search/filter/tab/page state when returning from detail views.
- SHOULD: Keep high-frequency paths direct and move rare/advanced controls behind progressive disclosure.
- BLOCKER: Never expose a route/action that appears available but is predictably inaccessible to the current role without explanation.

## 4. C. Visual hierarchy

- MUST: Make one primary action or decision area visually dominant per context.
- MUST: Differentiate secondary and destructive actions semantically and visually.
- MUST: Use the verified typography and spacing scale; otherwise keep changes local and record the missing-token debt.
- MUST: Use alignment, whitespace, grouping, contrast, density, and visual weight to express hierarchy.
- MUST: Make heading levels structural, not merely visual.
- MUST: Use icons, badges, status colors, and emphasis consistently with existing patterns.
- MUST: Pair status color with text, icon, shape, or accessible name.
- SHOULD: Reduce simultaneous emphasis, decorative containers, and competing CTA styles.
- SHOULD: Adapt density to task and viewport without hiding essential meaning.
- BLOCKER: Do not make every element equally prominent.

## 5. D. Design system and component architecture

### Token rules

- MUST: Discover current CSS variables, theme, Tailwind/configuration, typography, spacing, radius, elevation, breakpoint, motion, and semantic color tokens before styling.
- MUST: Prefer existing semantic tokens over raw color, size, spacing, z-index, or font values.
- MUST: Name new tokens by meaning, not color or screen position.
- BLOCKER: Do not change a global token/system to solve one local case without impact analysis and approval.
- SHOULD: If no token system exists, avoid pretending one exists; use a minimal local solution and add remediation debt.

### Component taxonomy

- primitive: behavior/style building block without feature business logic;
- composite: reusable combination of primitives with a stable interaction contract;
- pattern: repeatable workflow/state composition;
- feature component: domain-specific orchestration near the feature.

### Reuse ladder

1. Reuse an existing component unchanged.
2. Compose existing primitives/composites.
3. Extend an existing API without breaking consumers.
4. Add a justified variant when the semantic behavior is broadly reusable.
5. Create a new composite for a repeated interaction contract.
6. Create a feature-specific component for domain behavior.
7. Refactor shared infrastructure only with consumer/compatibility analysis.

- BLOCKER: Search for similar pages, components, hooks, utilities, state views, and tests before creating new UI.
- MUST: Keep primitive components free of feature-specific business logic.
- MUST: Keep public APIs typed, stable, accessible, and intentionally composable.
- MUST: Avoid prop explosion, boolean combinations with unclear states, and universal components with many feature branches.
- MUST: Do not copy a component/page to change one minor detail; prefer composition or a bounded variant.
- SHOULD: Place feature components near their feature and promote to shared only after reusable evidence.
- SHOULD: Document migration when a shared API changes.

## 6. E. Responsive and adaptive design

- BLOCKER: Analyze mobile, tablet, desktop, wide screens, low-height screens, touch, mouse, and keyboard contexts.
- MUST: Test long/short content, long unbroken strings, long names, large numbers, many columns, orientation changes, virtual keyboards, safe areas, scrolling, zoom, and text scaling.
- MUST: Decide what wraps, stacks, reorders, hides, becomes a drawer/menu, scrolls horizontally, changes to cards, or becomes sticky.
- MUST: Prioritize essential content/actions on mobile rather than shrinking desktop.
- MUST: Keep touch targets usable and prevent critical controls from being obscured by virtual keyboards or safe areas.
- MUST: Define table strategy per use case: horizontal scroll, priority columns, card/list alternative, or task-specific detail view.
- SHOULD: Prefer content-driven breakpoints already present in the project.
- SHOULD: Preserve task continuity when navigation changes across viewports.
- BLOCKER: Do not lock orientation or disable zoom without an approved exceptional need.

## 7. F. Accessibility

Target WCAG 2.2 AA unless current project policy is stronger.

### Semantics and names

- BLOCKER: Use semantic HTML before ARIA.
- BLOCKER: Every form control needs a programmatic label; placeholder is not a label.
- BLOCKER: Every icon-only or ambiguous control needs an accessible name.
- MUST: Use headings, landmarks, lists, buttons, links, tables, captions/descriptions, labels, and fieldsets according to meaning.
- MUST: Use ARIA only to fill semantic gaps and keep state/property values synchronized.

### Keyboard and focus

- BLOCKER: Every interactive function must work by keyboard.
- BLOCKER: Do not remove focus indication without an equal or stronger replacement.
- MUST: Keep logical focus order, visible focus, skip/navigation support where needed, and no keyboard trap.
- MUST: Dialogs manage initial focus, trap, Escape behavior where appropriate, close semantics, and focus restoration.
- MUST: Menus, listboxes, comboboxes, tooltips, drag/drop alternatives, and composite widgets follow established keyboard patterns.

### Perception and announcements

- BLOCKER: Meet contrast requirements and never communicate state by color alone.
- MUST: Announce validation errors, important loading/status changes, and asynchronous results when needed without excessive noise.
- MUST: Support screen readers, browser zoom, text scaling/reflow, reduced motion, and high-content extremes.
- MUST: Keep touch target sizing and spacing suitable for coarse pointers.
- MUST: Provide accessible alternatives for gesture-only, hover-only, drag-only, long-press, or double-click actions.
- SHOULD: Prefer native controls unless a custom widget has a verified need and complete behavior.

## 8. G. Form UX

- MUST: Define field grouping, label, description, required/optional state, defaults, format, and validation timing.
- MUST: Separate inline/client validation from authoritative server validation and map server errors to fields or a useful summary.
- MUST: Preserve entered values after validation/network/server failure.
- MUST: Focus or link to the first actionable error while retaining an accessible error summary for complex forms.
- MUST: Distinguish disabled, read-only, loading, dirty, saving, saved, and error states.
- MUST: Prevent duplicate submission and communicate pending progress.
- MUST: Warn before losing meaningful unsaved changes; do not warn for every trivial change.
- MUST: Design confirmation, recovery, or undo according to destructive impact.
- MUST: Define multi-step persistence, back/forward behavior, validation boundaries, and resume behavior.
- MUST: Handle upload progress, type/size validation, preview, replacement/removal, failure, retry, and accessible status.
- MUST: Use correct input semantics and locale-aware handling for date/time, number, currency, phone, email, and password.
- MUST: Define select, multi-select, relation/search picker, rich text, and JSON editor behavior for keyboard, validation, empty, loading, and error states.
- BLOCKER: Never clear the whole form after an error.
- BLOCKER: Never show only a generic error when actionable detail is safely available.
- BLOCKER: Do not disable submit without a discoverable explanation when the user can fix the condition.

## 9. H. Tables, lists, and data-dense UI

- MUST: Determine client/server pagination, sorting, filtering, and search from dataset scale and API contract.
- MUST: Define loading, skeleton/progressive loading, empty, no-result, partial, stale, refresh, retry, and error states separately.
- MUST: Define selection, bulk actions, row actions/navigation, permissions, status display, and keyboard behavior.
- MUST: Consider column visibility, sticky headers, truncated content disclosure, density, and mobile representation.
- MUST: Use virtualization only when measured/expected scale warrants it and accessibility remains usable.
- MUST: Preserve query state in URL/history when it materially improves deep-linking and back navigation.
- BLOCKER: Do not render an unbounded large dataset.
- BLOCKER: Do not fetch a silent fixed record limit that misrepresents completeness.
- BLOCKER: Do not ship an unchanged desktop table on mobile without an explicit usable strategy.
- SHOULD: Move low-frequency row actions to a menu rather than presenting many equal actions.

## 10. I. Feedback and system states

Every feature must model applicable states:

- initial;
- loading and progressive loading;
- empty and no search result;
- partial and stale data;
- offline;
- error and retry;
- permission denied;
- not found;
- success;
- pending/queued;
- disabled and read-only;
- optimistic and rollback;
- background refresh;
- rate limited;
- session expired.

- BLOCKER: Do not model only the has-data state.
- MUST: Make each state actionable, accessible, and consistent with the user goal.
- MUST: Avoid replacing usable existing content with a full-page spinner during small/background operations.
- MUST: Distinguish no data from no matching results and from failure.
- SHOULD: Preserve stale/partial content with clear status when safer than blanking the screen.

## 11. J. Interaction design

- MUST: Define hover, focus, active/pressed, selected, disabled, drag/drop, swipe, long-press, double-click, and shortcut behavior only where relevant.
- MUST: Provide feedback at the action's location or in a persistent area appropriate to importance.
- MUST: Use confirmation for high-cost/irreversible actions; prefer undo for reversible actions when safe.
- MUST: Keep toast content brief and non-critical; persistent/important information needs a durable location.
- MUST: Make motion explain state change, continuity, confirmation, or attention.
- MUST: respect reduced-motion preferences and avoid motion that delays work or causes distraction.
- SHOULD: Avoid hidden gestures as the only path to a function.

## 12. K. Navigation UX

- MUST: Make current location, available destinations, and primary action understandable.
- MUST: Align visible routes/actions with permission and explain unavailable actions when useful.
- MUST: Preserve meaningful context across back navigation, refresh, deep links, and tab/filter/page state.
- MUST: Define a separate mobile navigation strategy when desktop navigation does not fit.
- MUST: Ensure browser history behaves predictably for overlays, steps, tabs, search, and filters when URL state is used.
- BLOCKER: Do not route users to inaccessible destinations presented as available.

## 13. L. Performance UX

- MUST: Inspect bundle impact, render cost, re-renders, DOM size, images, fonts, route/component loading, network waterfalls, duplicate calls, cache, and interaction latency.
- MUST: Use lazy loading, code splitting, prefetch, debounce, throttle, virtualization, or skeletons only when justified by behavior and measurement.
- MUST: Reserve layout space and stable dimensions to avoid disruptive layout shifts.
- MUST: Fetch only data needed for the current task and page.
- BLOCKER: Do not add a large library for a small function already covered by current code/platform.
- BLOCKER: Do not duplicate API calls, fetch unbounded data, render heavy hidden UI, or use full-page spinners for every local action.
- SHOULD: Optimize perceived performance without masking incorrect or stale state.

## 14. M. Content design and microcopy

- MUST: Make titles, labels, helper text, errors, success messages, confirmations, empty states, CTAs, permission messages, onboarding, and tooltips specific and action-oriented.
- MUST: Avoid unexplained technical language, vague errors, blame, and generic OK/Yes/No when an action label is clearer.
- MUST: Describe destructive impact before confirmation.
- MUST: Use the project's i18n system when present; do not hard-code translatable content or concatenate fragments that break translation.
- MUST: Design for content expansion and long translations.
- SHOULD: Keep placeholders as examples/hints, not labels or required instructions.

## 15. N. Security and privacy

- BLOCKER: UI visibility is not authorization; backend/API enforcement remains required.
- BLOCKER: Do not expose data before permission is verified or trust client data for authorization.
- BLOCKER: Do not store secrets/tokens in source, UI logs, memory, or unsafe client storage.
- MUST: Mask sensitive data when appropriate and prevent technical errors from exposing internals.
- MUST: Confirm dangerous actions and require re-authentication when approved business/security policy requires it.
- MUST: Avoid optimistic disclosure of protected data while permissions are loading.
- MUST: Treat uploads, rich text, URLs, and rendered server content as untrusted.

## 16. O. Role-based UI

- MUST: Define view, edit, field, and action permissions per role from authoritative sources.
- MUST: Decide whether unavailable actions are hidden or disabled with explanation based on discoverability, privacy, and task needs.
- MUST: Prefer permission-aware composition/configuration over copied pages per role.
- MUST: Test direct routes, stale permissions, permission changes, and mixed read/write access.
- BLOCKER: Never copy an entire page per role when composition can preserve one behavior contract.
- BLOCKER: Never infer authorization from the rendered UI.

## 17. P. Testing and validation

Run what the environment supports and report what cannot run.

- MUST: typecheck, lint, build, and relevant unit/interaction tests.
- MUST: test important UI logic, form validation, permission variants, keyboard flow, focus, responsive layouts, loading, empty, error, long content, slow network, double submit, and regression.
- MUST: perform a visual review with representative real-shaped data, content extremes, and relevant viewports.
- MUST: use component tests, E2E, automated accessibility, and visual regression when current project tooling provides them.
- MUST: check unresolved imports, console/runtime errors, duplicated components, raw values that bypass tokens, and unintended shared API changes.
- BLOCKER: Do not claim completion without all checks currently possible.
- MUST: For unavailable checks, record check, reason, residual risk, and exact manual/next verification.
