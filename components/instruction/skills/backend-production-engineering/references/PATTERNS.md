# Backend Production Patterns

Severity: pattern selection is MAY; once selected, the stated safety/correctness steps are MUST unless a labeled BLOCKER or stronger project rule applies.

## Contents

1. Invariant placement
2. Capability evidence card
3. Reuse ladder
4. State machine with compensation
5. Idempotent command record
6. Optimistic concurrency
7. Transactional outbox
8. Webhook inbox
9. Bounded pagination
10. Provider adapter
11. Error boundary
12. Durable job
13. Private file workflow
14. Expand-migrate-contract
15. Reconciliation loop
16. Safe pattern promotion

Use only after verifying current project/platform fit. A pattern is a decision aid, not a license to add infrastructure.

## 1. Invariant placement

Write the invariant, violating races/failures, authoritative state, and strongest available enforcement.

1. Database/platform constraint for structural truth.
2. Atomic conditional update/transaction for multi-value truth.
3. Domain service/state guard for business transition.
4. Authorization policy for actor/resource scope.
5. Idempotency/uniqueness for repeated delivery.
6. Audit/reconciliation for detection and repair.

Do not rely on a weaker outer layer when a stronger authoritative layer is necessary.

## 2. Capability evidence card

For any Base44/platform-dependent decision record:

- required guarantee;
- capability status: platform-provided/project-built/partial/unsupported/unknown/compensation-required;
- project source and authoritative docs/version/date;
- tested semantics and limits;
- failure/retry/concurrency/deployment behavior;
- compensation and residual risk;
- re-verification trigger.

Unknown blocks guarantees that determine safety; it does not prove absence.

## 3. Reuse ladder

Search and record candidates, then choose:

- reuse unchanged when owner/invariant/contract match;
- extend compatibly when the same owner gains a coherent behavior;
- compose a domain/application service for a use case spanning existing ports;
- add provider adapter for external contract isolation;
- add repository/data access for repeated policy/query ownership;
- extract shared utility only for pure repeated stable behavior.

Keep feature-specific behavior local until evidence supports promotion.

## 4. State machine with compensation

Use when a multi-step workflow lacks one real transaction.

- Persist explicit states such as pending, reserved, applying, confirmed, compensating, failed, and review-required.
- Guard transitions atomically where possible.
- Assign one idempotency/business reference.
- Make each step retry-safe or uniquely recorded.
- Persist provider references and outcomes.
- Compensate only reversible completed steps.
- Reconcile stuck/unknown states and alert.
- Keep user-visible state honest.

Do not call this atomic; document its consistency and recovery window.

## 5. Idempotent command record

Use a unique key scoped by tenant/actor/operation, plus a canonical payload fingerprint.

State model: started -> completed or failed-retryable/failed-final.

On duplicate:

- same key/payload + started: return pending/conflict under contract;
- same key/payload + completed: return stored/reconstructed result;
- same key + different payload: reject conflict;
- retryable failure: claim/retry under bounded ownership;
- final failure: return stable final result.

The command record and authoritative effect must be protected against concurrent first execution.

## 6. Optimistic concurrency

Use a version/updated token and conditional update:

1. Read state/version under authorization.
2. Validate transition.
3. Update only where ID, tenant, and version still match.
4. Increment version.
5. Return conflict if zero rows/failed compare.
6. Re-read/reconcile side effects as needed.

Use for uncommon conflicts; do not blindly retry user decisions against new state.

## 7. Transactional outbox

Use when a durable event must correspond to committed authoritative state and a real transaction can atomically write both.

- Write domain change and outbox record in one transaction.
- Claim/publish records idempotently.
- Persist attempt/result/provider event ID.
- Consumers deduplicate.
- Monitor backlog/age/failures.
- Replay safely.
- Version event payload.
- Delete/archive only under retention/reconciliation policy.

If the platform cannot provide the atomic write, use an explicit compensation/reconciliation design and state that limitation.

## 8. Webhook inbox

- Verify signature/timestamp.
- Persist unique provider event ID and safe raw/reference data.
- Acknowledge within deadline.
- Claim processing idempotently.
- Validate event/version and re-fetch trusted provider state when needed.
- Apply guarded domain transition.
- Record outcome/retry/dead-letter.
- Reconcile provider/internal state.

Never establish payment truth from a client redirect.

## 9. Bounded pagination

Define stable sort plus unique tie-breaker, server maximum, selected fields, authorization/tenant filters, and cursor encoding/version.

Use cursor pagination for large mutable streams where supported. Use offset for small/stable/admin cases when drift and cost are acceptable. Never accept unlimited limits.

## 10. Provider adapter

Expose domain-shaped operations and errors. Internally own credentials, mapping, validation, timeout, retry classification, rate limits, idempotency/reference IDs, telemetry, contract tests, and reconciliation.

Keep provider types outside consumers unless the project deliberately standardizes them.

## 11. Error boundary

Domain code returns typed/stable errors. Boundary maps to safe status/code/message/retry guidance and correlation ID. Internal log keeps cause, operation, safe actor/tenant/resource context, provider reference, and version.

Do not map forbidden private resources in a way that leaks existence.

## 12. Durable job

Persist or use verified queue state for job ID, type/version, tenant/authority scope, payload reference, attempts, schedule, progress/checkpoint, lease/claim, result/error, and dead-letter/review.

Handlers are idempotent, bounded, timeout-aware, deployment-compatible, and observable. Cron creation uses a unique schedule window or verified overlap control.

## 13. Private file workflow

Create authorized upload intent -> generate safe storage key -> enforce size/type/content -> upload/quarantine -> verify/process -> mark ready -> authorize signed download -> expire/revoke within platform limits -> delete record/file with orphan reconciliation.

Do not trust original filename or client MIME.

## 14. Expand-migrate-contract

Expand schema -> deploy tolerant code -> bounded idempotent backfill -> verify -> switch reads/writes -> observe -> contract -> clean.

Support old jobs/events/clients through the compatibility window and prefer forward repair when data rollback is unsafe.

## 15. Reconciliation loop

- Select bounded candidate states by authoritative criteria.
- Fetch trusted external/source state with timeout/rate controls.
- Compare normalized state.
- Auto-repair only approved deterministic cases.
- Route ambiguous/financial/security cases to review.
- Record before/after/reference/reason.
- Emit mismatch/repair/failure metrics.
- Resume and rerun idempotently.

## 16. Safe pattern promotion

Promote a pattern only when repeated successful uses or an accepted security/correctness need provides evidence. Record applicability, non-applicability, trade-offs, failure modes, validation, platform constraints, and successful examples. A first success remains provisional.
