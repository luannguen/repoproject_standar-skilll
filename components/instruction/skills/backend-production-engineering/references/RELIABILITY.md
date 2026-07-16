# Reliability, Transactions, Idempotency, Jobs, and Performance

## Contents

1. Failure model
2. Transaction and consistency
3. Concurrency
4. Idempotency and retry
5. Jobs, queues, cron, and events
6. Caching
7. Performance and scalability
8. Recovery and reconciliation
9. Reliability gate

## 1. Failure model

Analyze database/platform unavailable, provider unavailable, timeout/unknown result, partial update, duplicate/stale/concurrent request, expired session, changed permission, job crash, duplicate/out-of-order webhook/event, incomplete upload, network interruption, deployment during work, schema-version mismatch, cache/queue unavailable, and detected inconsistency.

For each, define fail-fast/degraded/pending behavior, retry eligibility, timeout/attempt/backoff, fallback, compensation, recovery, reconciliation, manual intervention, alert, and user-visible state.

- [BLOCKER] Do not design a critical workflow that is correct only when every dependency succeeds.
- [MUST] Model unknown outcome separately from confirmed failure when a timeout may occur after a side effect.
- [MUST] Preserve enough state/evidence to continue, compensate, or reconcile interrupted work.
- [MUST] Define recovery time/data-loss expectations when the project has them; otherwise record them as unknown.
- [BLOCKER] Never swallow partial failure or mark a workflow complete prematurely.

## 2. Transaction and consistency

For each mutation list steps that must succeed together, source of truth, atomic capability/evidence, isolation, reads/writes, external effects, eventual steps, commit point, and recovery.

- [BLOCKER] Use the verified database/platform transaction/atomic operation for inseparable writes when available and sufficient.
- [BLOCKER] Never claim a real transaction, isolation level, lock, or atomic multi-entity update without evidence.
- [MUST] Keep external network calls outside/around database transactions unless a verified pattern controls latency and consistency.
- [MUST] Use an outbox/platform-equivalent when a committed state change and durable event must agree.
- [MUST] If no transaction exists, use explicit states plus idempotency, reservation, compensation, reconciliation, or manual review matching the invariant.
- [BLOCKER] A sequence of awaits is not atomic.
- [MUST] Define what callers observe during eventual consistency and how convergence is detected.
- [MUST] Avoid holding locks/transactions across slow work.

## 3. Concurrency

Review lost update, double submission, check-then-act races, duplicate creation, oversell/overdraw, hot records, lock contention, and stale writes.

- [BLOCKER] Protect critical read-check-write with unique/check constraints, atomic conditional update, compare-and-swap/version field, lock, reservation, or another proven mechanism.
- [BLOCKER] A preflight duplicate query alone is not uniqueness protection.
- [MUST] Define conflict behavior and return a stable conflict/business response.
- [MUST] Use optimistic concurrency when conflicts are uncommon and callers can refresh/retry safely.
- [MUST] Use serialization/locking only with bounded scope, timeout/deadlock handling, and measured need.
- [MUST] Avoid global/distributed locks unless no simpler invariant-preserving design works.
- [MUST] Test concurrent cases for inventory, capacity, money, unique claims, state transitions, rewards, and approvals when relevant.

## 4. Idempotency and retry

Require idempotency for payment, order, gift/reward/redemption, inventory, balance/commission, webhook, important notification/email, import/batch, scheduled job, and synchronization where duplicate delivery repeats effects.

Define key source, scope (actor/tenant/operation/resource), payload fingerprint, storage/uniqueness, in-progress behavior, completed result, failed/retryable state, expiry, replay response, and conflicting reuse.

- [BLOCKER] A process-local boolean or UI disable is not durable idempotency.
- [BLOCKER] Idempotency must cover the authoritative side effect, not only the handler entry.
- [MUST] Reject or conflict when the same key is reused with a different material payload.
- [MUST] Handle concurrent first requests atomically.
- [MUST] Return/reconstruct the prior compatible result for completed duplicates.
- [MUST] Choose expiry longer than the credible delivery/retry window or preserve permanent business uniqueness.
- [BLOCKER] Retry only operations proven idempotent or protected against repeated effects.
- [MUST] Bound attempts, timeout, exponential backoff, jitter, and total retry budget.
- [MUST] Do not retry validation, authorization, deterministic business rejection, or permanent contract failures.
- [MUST] Reconcile unknown outcomes before replaying financial/destructive provider operations.

## 5. Jobs, queues, cron, and events

Define payload/version, owner, authorization snapshot/current check, idempotency, timeout, retry/backoff/max attempts, concurrency/order, progress/checkpoints, cancellation/resume, partial completion, dead-letter/poison handling, replay, audit, monitoring, and deployment compatibility.

- [BLOCKER] Retried jobs/handlers that cause side effects must be idempotent.
- [BLOCKER] Cron/scheduled work must control overlap or prove overlap is safe.
- [MUST] Long jobs checkpoint progress and resume/recover without restarting unsafe effects.
- [MUST] Keep durable job/event payloads minimal, versioned, non-secret, and compatible with in-flight work.
- [MUST] Acknowledge/delete a message only after the required durable effect/transition succeeds under verified delivery semantics.
- [MUST] Handle duplicate and out-of-order events.
- [MUST] Provide dead-letter/review/replay for critical exhausted failures.
- [MUST] Give every job/event an ID/correlation and observable state.
- [BLOCKER] Do not emit an event before authoritative commit when consumers would observe false state.
- [MUST] Prevent duplicate email/notification/financial effects caused by retry.
- [MUST] Verify current permission for delayed privileged actions when policy can change; do not rely blindly on stale client authority.

## 6. Caching

Define purpose, source of truth, key including tenant/scope/version, value schema, TTL, invalidation, consistency tolerance, stampede control, size, privacy, failure behavior, metrics, and warm/cold behavior.

- [BLOCKER] Cache keys must not allow cross-tenant/user data mixing.
- [BLOCKER] Cache is not authorization; authorize before serving or encode a safe verified scope.
- [MUST] Define invalidation before introducing cache.
- [MUST] Do not use cache to hide an unbounded/incorrect query.
- [MUST] Treat cache as disposable unless explicitly designed as durable source of truth.
- [MUST] Handle cache unavailable/stale/corrupt values safely.
- [SHOULD] Add cache only after evidence identifies a useful latency/cost/load problem or when the verified architecture already standardizes it.
- [MUST] Prevent stampede on expensive hot keys when relevant.
- [MUST] Version cache keys/values across incompatible deployments.

## 7. Performance and scalability

Review request/query count, query plan/cost, index, payload, serialization, latency budget, N+1, batching/streaming, CPU/memory, provider latency/cost, concurrency, hot records, locks, backpressure, and horizontal-scaling assumptions.

- [BLOCKER] Bound list, batch, import/export, queue concurrency, uploads, and provider calls.
- [MUST] Do not load a large dataset wholly in memory when streaming/batching is feasible.
- [MUST] Select only needed fields and avoid repeated provider/database calls.
- [MUST] Use maximum batch/page limits independent of client input.
- [MUST] Add backpressure/concurrency limits for scarce dependencies and expensive work.
- [MUST] Optimize from query plans/metrics/load shape when available; document estimates when not.
- [SHOULD] Avoid speculative caching/indexing/distribution while fixing evident unbounded/N+1 behavior immediately.
- [MUST] Include tenant fairness and noisy-neighbor risk for shared limits.
- [MUST] Review external service quotas and financial cost.
- [BLOCKER] Do not claim scalability without representative load/runtime evidence.

## 8. Recovery and reconciliation

- [MUST] Define the authoritative record and mismatch detection.
- [MUST] Make recovery/reconciliation operations idempotent, bounded, authorized, auditable, and resumable.
- [MUST] Separate automated safe repair from manual-review cases.
- [MUST] Preserve original evidence before destructive repair.
- [MUST] Alert on repeated mismatches, stuck intermediate states, exhausted retries, queue backlog, and recovery failure.
- [MUST] Test repair against duplicate/concurrent execution.
- [MUST] Document operator input, dry-run/preview, rollback/forward repair, and verification for high-risk repair.
- [BLOCKER] Do not silently ?fix? financial, tenant, permission, or audit data without approved rules and traceability.

## 9. Reliability gate

- [BLOCKER] Transaction guarantees, duplicate/concurrent behavior, partial failure, retries, and recovery must match verified capabilities.
- [BLOCKER] No unbounded retry, overlap, unknown-outcome replay, premature success, or invisible critical job failure remains.
- [MUST] Run applicable idempotency, concurrency, timeout, retry, job/event, failure, recovery, and load tests.
- [MUST] Record unavailable infrastructure tests and production-readiness conditions.
