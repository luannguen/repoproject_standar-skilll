# UI/UX Anti-patterns

Severity: BLOCKER prevents completion; MUST-FIX requires correction or an approved exception; WARN records quality/debt risk.

| # | Severity | Prohibited behavior |
| ---: | --- | --- |
| 1 | BLOCKER | Ship demo/MVP-grade UI when production quality is required. |
| 2 | BLOCKER | Create a component before searching for an existing equivalent. |
| 3 | MUST-FIX | Copy a page/component without analyzing reuse or composition. |
| 4 | MUST-FIX | Hard-code color, spacing, or type size when a project token exists. |
| 5 | MUST-FIX | Introduce styling inconsistent with the verified design system. |
| 6 | BLOCKER | Design only the happy path. |
| 7 | BLOCKER | Omit applicable loading, empty, and error states. |
| 8 | BLOCKER | Ignore mobile/responsive behavior. |
| 9 | BLOCKER | Skip keyboard operation checks. |
| 10 | BLOCKER | Skip focus visibility/order/restoration checks. |
| 11 | BLOCKER | Leave a form/control without an accessible label/name. |
| 12 | BLOCKER | Use an ambiguous icon without a tooltip and/or accessible name appropriate to context. |
| 13 | BLOCKER | Use placeholder text as the label. |
| 14 | WARN | Use confirmation dialogs for every small operation. |
| 15 | MUST-FIX | Put long or critical information only in a toast. |
| 16 | BLOCKER | Communicate status/error using color alone. |
| 17 | MUST-FIX | Present too many primary CTAs on one surface. |
| 18 | WARN | Expose many equal actions instead of menus or progressive disclosure. |
| 19 | MUST-FIX | Use a modal when page, popover, drawer, or inline interaction better fits the task. |
| 20 | BLOCKER | Nest modals without an unavoidable, reviewed need. |
| 21 | MUST-FIX | Use infinite scroll for precise/revisitable data without position/navigation strategy. |
| 22 | BLOCKER | Fetch or render unbounded data. |
| 23 | BLOCKER | Allow duplicate submit/request effects. |
| 24 | BLOCKER | Lose user input when a request fails. |
| 25 | BLOCKER | Delete immediately without confirmation or safe undo when impact warrants protection. |
| 26 | BLOCKER | Show raw backend/internal errors to users. |
| 27 | MUST-FIX | Patch stacking problems with arbitrary z-index values. |
| 28 | MUST-FIX | Layer CSS overrides without finding the root cause. |
| 29 | BLOCKER | Add a UI dependency when current libraries/platform already satisfy the need. |
| 30 | BLOCKER | Change the global design system to fix one local case. |
| 31 | MUST-FIX | Refactor outside task scope without reporting/approval. |
| 32 | BLOCKER | Break a shared component public API without consumer impact and migration analysis. |
| 33 | BLOCKER | Copy a full page per role instead of permission-aware composition. |
| 34 | BLOCKER | Hide a button and treat that as authorization. |
| 35 | BLOCKER | Declare completion because the UI merely looks attractive. |
| 36 | BLOCKER | Change UI without testing real-shaped data, long content, and failure states. |
| 37 | MUST-FIX | Invent a new pattern when a verified project pattern already exists. |
| 38 | BLOCKER | Match a reference image by sacrificing accessibility, responsiveness, security, or architecture. |
| 39 | MUST-FIX | Make a local UI inconsistent with other surfaces of the same type without a justified exception. |
| 40 | WARN | Ignore discovered UI debt instead of recording it in the remediation backlog/memory. |

## Additional review traps

- Treat the current application implementation as correct when it conflicts with approved requirements.
- Invent tokens/components/framework behavior when project sources are missing.
- Use ARIA to imitate a native control without implementing its full interaction model.
- Disable zoom, lock orientation, or make gesture-only interaction.
- Replace useful stale content with a full-page spinner during background work.
- Promote a one-off feature solution to a verified shared pattern without evidence.
