# UI/UX Production Patterns

These patterns are production defaults, not claims about an absent application. Verify current code, tokens, libraries, and contracts before use. Record a one-off project use as provisional; promote only after reuse, strong evidence, or explicit acceptance.

## Contents

1. Reuse ladder
2. Component taxonomy
3. Complete async state model
4. Responsive adaptation matrix
5. Accessible form submission
6. Server-backed data view
7. Overlay decision and focus lifecycle
8. Permission-aware composition
9. URL-backed navigation state
10. Durable feedback
11. Content-extreme validation
12. Performance budget by behavior
13. Shared pattern promotion

## 1. Reuse ladder

### Use when

Adding or modifying any page/component.

### Decision

Search first, then prefer:

1. reuse unchanged;
2. compose existing building blocks;
3. extend a stable API;
4. add a semantically reusable variant;
5. create a composite;
6. create a feature component;
7. refactor shared code after consumer analysis.

### Avoid

Copy-paste, prop explosion, a universal component, or premature promotion to shared.

### Validate

Search results, consumer impact, API typing, accessibility behavior, visual consistency, and tests.

## 2. Component taxonomy

### Primitive

Generic behavior/style; no feature business rule. Examples in an actual project might include button, input, or dialog primitives only when verified.

### Composite

Stable combination with a reusable interaction contract, such as a field group or filtered list header.

### Pattern

A cross-component workflow/state model, such as async data handling or destructive confirmation.

### Feature component

Domain behavior and orchestration located with the feature.

### Rule

Move upward toward shared scope only when multiple consumers and a stable contract are evidenced.

## 3. Complete async state model

Model state as explicit, distinguishable conditions:

- initial;
- first loading;
- content;
- empty;
- no result;
- partial/stale;
- background refresh;
- optimistic/pending;
- error/retry;
- offline/rate-limited/session-expired;
- permission denied/not found.

Keep useful content during background refresh where safe. Place retry and recovery near the failed operation. Announce important changes accessibly.

Validate slow network, retry, stale content, cancellation/navigation, duplicate request, and optimistic rollback.

## 4. Responsive adaptation matrix

Before CSS, write a compact matrix:

| Element | Mobile | Tablet | Desktop/wide | Low height/content extremes |
| --- | --- | --- | --- | --- |
| navigation | strategy | strategy | strategy | overflow/sticky behavior |
| hierarchy | priority/order | grouping | density | clipping/scroll |
| actions | stack/menu/sticky | layout | inline/menu | keyboard reachability |
| data | card/priority/scroll | selected columns | table/grid | long strings/numbers |
| overlay | full-screen/drawer | dialog/drawer | dialog/popover | max-height/focus |

Use content-driven project breakpoints. Do not merely scale down desktop.

## 5. Accessible form submission

### Flow

1. Preserve values and dirty state.
2. Validate format locally only when reliable.
3. Submit once with visible pending state.
4. Map server validation to fields and a useful summary.
5. Focus/link to the first actionable error.
6. Announce result without excessive interruption.
7. Keep user input after failure.
8. Confirm/undo destructive outcomes based on risk.

Support read-only/disabled distinction, unsaved-change protection, upload progress/retry, and correct input semantics.

## 6. Server-backed data view

Use API scale/contract to choose server or client pagination/filter/sort/search.

Keep query state stable across refresh/back/deep link when useful. Separate:

- first loading from refresh;
- no data from no result;
- partial/stale from error;
- row permission from data absence.

Use row menus for low-frequency actions, bulk selection with explicit scope, and a deliberate mobile representation. Virtualize only with scale evidence and accessible behavior.

## 7. Overlay decision and focus lifecycle

Choose:

- inline for local, low-disruption edits/details;
- popover for contextual transient choices;
- drawer for supplemental work that benefits from context retention;
- dialog for focused, bounded decisions;
- page for complex, navigable, deep-linkable work.

For any overlay define open trigger, initial focus, containment, Escape/close, backdrop behavior, unsaved changes, scroll lock, URL/history, nested interaction, and focus restoration.

Avoid nested modal. If unavoidable, record exception and test all focus/escape layers.

## 8. Permission-aware composition

Use one page/flow composed from authoritative capabilities:

- route access;
- section/field visibility;
- read/write state;
- available actions;
- explanation for unavailable actions where safe.

Never rely on composition for authorization. Test direct route/API attempts and permission changes. Avoid copied role-specific pages unless workflows are truly different and approved.

## 9. URL-backed navigation state

Use URL state for filters, search, sort, page, tabs, selected resource, and steps when it improves deep links, refresh, back navigation, or sharing.

Avoid URL state for secrets, oversized transient drafts, or rapidly changing controls with no navigation value.

Define defaults, invalid/stale parameters, permission-sensitive parameters, history push/replace, and return-state behavior.

## 10. Durable feedback

Use:

- inline feedback for field/action-specific outcomes;
- persistent banners/panels for important recoverable state;
- toast for short, non-critical confirmation;
- status region for asynchronous updates;
- confirmation for high-cost irreversible actions;
- undo for safely reversible actions.

Do not hide critical instructions in transient feedback.

## 11. Content-extreme validation

Test every changed surface with:

- empty and maximum realistic collections;
- short and long labels/names;
- unbroken identifiers/URLs;
- large/negative/decimal numbers and localized date/currency;
- verbose error and permission messages;
- 200 percent zoom/text scaling;
- translation expansion if i18n applies.

Choose wrapping, truncation plus disclosure, min/max sizing, and overflow intentionally.

## 12. Performance budget by behavior

Before adding optimization, identify user-visible risk:

- delayed interaction;
- route/startup delay;
- network waterfall;
- layout shift;
- heavy hidden DOM;
- image/font cost;
- repeated render/fetch.

Select the smallest project-native response: stable dimensions, request deduplication, caching, code splitting, lazy rendering, debounce, pagination, or virtualization. Measure or use defensible scale evidence; avoid dependency-heavy fixes.

## 13. Shared pattern promotion

A project pattern record should include:

- problem shape and applicable/non-applicable contexts;
- source components/paths;
- API/state/accessibility/responsive contract;
- tests and successful uses;
- failure modes and trade-offs;
- migration for older variants;
- promotion status.

First use is provisional. Promote after successful reuse, strong evidence, or explicit review. Keep feature-only detail in feature memory, not this skill.
