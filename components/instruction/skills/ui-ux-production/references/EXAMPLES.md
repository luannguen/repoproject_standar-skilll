# UI/UX Production Examples

These examples demonstrate output shape. Replace illustrative names with current project evidence; never copy them as product requirements.

## Example 1: Existing form modification

### Discovery

- Locate the actual form library, field components, validation schema, submission hook, error mapping, tokens, permission source, and tests.
- Search for analogous create/edit forms and unsaved-change handling.

### UX Decision Summary

- user goal: update one resource without losing existing values;
- primary action: save changes;
- secondary action: cancel/back;
- states: initial, dirty, validating, submitting, field/server error, success, read-only, permission denied;
- responsive: fields stack on narrow viewports; action area remains reachable above the virtual keyboard;
- accessibility: labels, descriptions, error summary, first-error focus, pending/status announcement;
- reuse: extend the verified field/form pattern rather than creating a parallel form system.

### Validation

Test keyboard completion, server error value preservation, double submit, long validation messages, read-only/permission behavior, mobile keyboard, typecheck/lint/build, and relevant tests.

## Example 2: Server-backed admin table

### Decision

- Verify API pagination/filter/sort/search and permission contract.
- Keep filter/sort/page state in URL when deep-link/back behavior benefits.
- Separate first loading, refresh, empty, no-result, partial/stale, error, and denied.
- Use a row action menu for low-frequency actions and explicit bulk-selection scope.
- Choose mobile priority columns plus detail/card representation or intentional horizontal scroll based on the task.

### Avoid

Do not fetch all records, silently cap results, render desktop columns unchanged on mobile, or expose actions before permission is known.

## Example 3: Dialog versus page

Use a dialog only when work is bounded, short, and benefits from retaining background context. Use a page when the task needs deep links, complex validation, multiple sections, long content, or meaningful browser navigation.

Record initial focus, close/Escape behavior, unsaved changes, scroll, focus restoration, responsive full-screen behavior, and error states.

## Example 4: BLOCKER/MUST exception

- exception_id: UI-EX-001
- rule: Dialog must trap and restore focus (BLOCKER)
- reason: third-party widget blocks correct restoration in the current version
- scope: one verified surface and widget version
- risk: keyboard users can lose location
- compensating control: move focus to a stable heading after close; add keyboard regression test
- target resolution: replace/upgrade widget after dependency review
- approval source: required before completion
- memory/debt: create a scoped debt/incident reference

An exception without approval/evidence is not permission to ship.

## Example 5: Final report

- analyzed: current flow, components, tokens, data/permission contract, content states, tests;
- decisions: hierarchy, primary action, state model, responsive adaptation, accessibility;
- reused: named current components/patterns and any bounded extension;
- files: created/modified;
- states: loading/empty/error/etc. handled;
- validation: exact commands and manual viewports/input modes;
- unavailable checks: reason, residual risk, next verification;
- exceptions/debt: IDs and follow-up;
- memory update: entries/checkpoint/task summary changed.
