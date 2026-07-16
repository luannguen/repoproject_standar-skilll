# Backend Production Anti-patterns

Every row is prohibited at the indicated severity. BLOCKER prevents completion; MUST requires correction or an approved exception.

| # | Severity | Prohibited behavior |
| ---: | --- | --- |
| 1 | BLOCKER | Ship demo/MVP-grade backend behavior when production quality is required. |
| 2 | MUST | Create a service before searching for an existing equivalent. |
| 3 | MUST | Copy-paste business logic instead of keeping one authoritative owner. |
| 4 | MUST | Put important business logic directly in an API handler when the verified architecture has a domain/service layer. |
| 5 | BLOCKER | Trust client-provided data without server validation and authority checks. |
| 6 | BLOCKER | Trust a client-provided role or permission. |
| 7 | BLOCKER | Enforce permission only in the frontend. |
| 8 | BLOCKER | Access an object without object-level ownership/authorization checks. |
| 9 | BLOCKER | Read or write tenant data without authoritative server tenant scope. |
| 10 | BLOCKER | Run an unbounded production list/query. |
| 11 | BLOCKER | Fetch a growing full dataset and paginate/filter it in the client. |
| 12 | MUST | Hard-code a page limit without an explicit server contract and maximum. |
| 13 | BLOCKER | Return unnecessary or sensitive data fields. |
| 14 | MUST | Return an uncontrolled raw database/entity object. |
| 15 | BLOCKER | Return a raw exception, stack trace, query, or provider diagnostic to the client. |
| 16 | BLOCKER | Use an empty catch or swallow an error. |
| 17 | BLOCKER | Log an error and then pretend the operation succeeded. |
| 18 | BLOCKER | Allow duplicate submission to repeat a material side effect. |
| 19 | BLOCKER | Retry a non-idempotent mutation without duplicate protection. |
| 20 | BLOCKER | Retry indefinitely or without a total budget. |
| 21 | BLOCKER | Call an external API without a finite timeout. |
| 22 | MUST | Spread raw provider errors/contracts instead of mapping them at an integration boundary. |
| 23 | BLOCKER | Accept a webhook without signature verification when the provider supports it. |
| 24 | BLOCKER | Let duplicate webhook delivery create duplicate business transactions. |
| 25 | BLOCKER | Treat a client payment redirect as payment truth. |
| 26 | BLOCKER | Calculate price, discount, tax, fee, reward, or commission in the client as authority. |
| 27 | BLOCKER | Use uncontrolled floating point for monetary values. |
| 28 | BLOCKER | Omit audit evidence for financial or critical privileged actions. |
| 29 | BLOCKER | Perform critical multi-step updates without a proven transaction or explicit compensation/recovery. |
| 30 | BLOCKER | Use unprotected read-check-write for a concurrent invariant. |
| 31 | BLOCKER | Protect uniqueness only with a preflight duplicate query. |
| 32 | BLOCKER | Leave source of truth undefined. |
| 33 | MUST | Use an unstructured JSON field to avoid domain/schema design. |
| 34 | MUST | Scatter hard-coded role, permission, or business-state strings. |
| 35 | BLOCKER | Let a client mass-assign owner, tenant, privileged, price, balance, payment, or system fields. |
| 36 | BLOCKER | Bind unfiltered input directly into persistence/domain updates. |
| 37 | BLOCKER | Use public storage for private data without an approved protection model. |
| 38 | BLOCKER | Download/issue a file URL without current ownership/tenant authorization. |
| 39 | BLOCKER | Permit unbounded file upload size. |
| 40 | BLOCKER | Log a token, password, private key, signing secret, or credential. |
| 41 | BLOCKER | Hard-code or commit a secret. |
| 42 | BLOCKER | Put a privileged credential or server-only configuration in the frontend. |
| 43 | BLOCKER | Use production credentials in development or tests. |
| 44 | BLOCKER | Make a breaking schema change without a compatible migration strategy. |
| 45 | BLOCKER | Remove a field before old code/consumers stop using it. |
| 46 | BLOCKER | Run a large data migration in a user request. |
| 47 | BLOCKER | Allow cron/scheduled jobs to overlap without proving overlap safe or controlling it. |
| 48 | BLOCKER | Retry a non-idempotent background job. |
| 49 | BLOCKER | Let a failed job disappear without trace, terminal state, alert, or replay/recovery path. |
| 50 | BLOCKER | Send duplicate email/notification effects because of retry. |
| 51 | MUST | Add cache without an invalidation/consistency strategy. |
| 52 | BLOCKER | Use a cache key that omits tenant/authorization scope. |
| 53 | MUST | Use cache to conceal an incorrect or unbounded query. |
| 54 | MUST | Add indexes without a real query/invariant and write-cost analysis. |
| 55 | MUST | Ignore a known N+1 issue on a material-load path. |
| 56 | MUST | Add a large dependency for a small capability already available in project/platform. |
| 57 | BLOCKER | Hide a major dependency upgrade inside a feature task. |
| 58 | MUST | Refactor outside task scope without reporting/approval. |
| 59 | MUST | Create a generic abstraction before repeated evidence or a correctness need. |
| 60 | BLOCKER | Create a god service spanning unrelated domains. |
| 61 | BLOCKER | Introduce a circular module dependency. |
| 62 | MUST | Create a microservice when a module in the current deployable meets the need. |
| 63 | BLOCKER | Introduce event-driven flow without delivery semantics, idempotency, observability, compatibility, and replay/recovery. |
| 64 | BLOCKER | Mark a task complete because only the happy path test passes. |
| 65 | BLOCKER | Omit applicable unauthorized, tenant, duplicate, failure, recovery, and regression tests. |
| 66 | MUST | Ignore discovered backend debt instead of recording it. |
| 67 | BLOCKER | Claim atomicity or transaction safety without verified platform/project evidence. |
| 68 | BLOCKER | Claim production readiness without security, failure/recovery, observability, compatibility, and validation evidence. |
| 69 | MUST | Invent a new pattern when a verified project pattern already exists. |
| 70 | BLOCKER | Ignore or fabricate Base44/platform capabilities and limits. |

## Additional review traps

- [MUST] Do not treat memory, comments, examples, or model recollection as stronger than current code/schema/runtime/contracts.
- [MUST] Do not mistake absence of detected defects for evidence of quality when application sources/tests are absent.
- [MUST] Do not keep temporary exception controls past expiry without reapproval.
- [MUST] Do not promote a one-off solution into this shared skill without reusable evidence.
