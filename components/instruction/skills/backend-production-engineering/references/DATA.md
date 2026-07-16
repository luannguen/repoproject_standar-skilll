# Data Modeling and Data Access

## Contents

1. Data classification and ownership
2. Entity/schema design
3. Integrity and state
4. Time, money, and identifiers
5. Deletion, history, and derived data
6. Queries and pagination
7. Index and performance review
8. Financial and ledger data
9. Data review output

## 1. Data classification and ownership

Classify each dataset as operational, audit, analytical, cache, projection, immutable ledger, temporary, personal, or sensitive. Identify source of truth, owner module, tenant/owner scope, retention, consumers, write authority, consistency, and recovery.

- [BLOCKER] Do not mix source-of-truth and cache/projection semantics.
- [BLOCKER] Tenant and ownership fields must be server-controlled and consistently enforced.
- [MUST] Minimize sensitive/personal data and define purpose, access, retention, deletion, and audit.
- [MUST] Separate operational updates from audit history and analytical transformations.
- [MUST] Identify immutable records and prohibit in-place edits that erase material history.

## 2. Entity/schema design

For every entity/field review name, semantic type, required/optional, default, allowed values, unique rule, relation, referential behavior, validation, write authority, privacy, indexing, history, and compatibility.

- [MUST] Schema and constraints should express business invariants where the platform supports them.
- [BLOCKER] Application validation alone cannot protect uniqueness/relationship/concurrency invariants when a constraint or atomic guard is required.
- [MUST] Prefer domain-specific fields over an unstructured JSON dumping ground.
- [MUST] Use enums/state representations with controlled values for important workflows; plan compatible evolution.
- [MUST] Distinguish public IDs from internal IDs when exposure/guessability/coupling matters.
- [SHOULD] Add a version field when optimistic concurrency or stale-write detection is needed.
- [MUST] Keep system fields (owner, tenant, role, price, balance, payment state, audit timestamps/actors) out of uncontrolled mass assignment.
- [MUST] Define relation deletion behavior: restrict, cascade, nullify, archive, or domain workflow.
- [BLOCKER] Do not add required fields or tighten constraints without compatible migration/backfill analysis.
- [SHOULD] Avoid premature normalization/denormalization dogma; select based on invariants, query paths, write consistency, and operational cost.

## 3. Integrity and state

- [BLOCKER] Define valid state transitions and enforce guards at the authoritative write path.
- [BLOCKER] Invalid transitions must fail deterministically without partial side effects.
- [MUST] Use constraints, transactions, compare-and-swap/versioning, or idempotency records to protect concurrent state changes.
- [MUST] Define preconditions and postconditions for multi-record changes.
- [MUST] Identify the consistency requirement: strong within a transaction/atomic operation, read-your-write, or eventual with bounded repair.
- [MUST] For eventual consistency, define intermediate states, convergence signal, reconciliation, and user-visible behavior.
- [BLOCKER] Do not trust cached/stale client values to authorize or calculate a critical mutation.

## 4. Time, money, and identifiers

- [MUST] Store timestamps with a documented timezone/instant convention; convert display-local time at the appropriate boundary.
- [MUST] Define calendar/business-time semantics separately from absolute instants.
- [MUST] Handle DST, locale, expiry boundaries, and clock skew where relevant.
- [BLOCKER] Do not use uncontrolled binary floating point for money.
- [MUST] Represent monetary amounts with fixed-precision decimal or integer minor units consistent with currency rules.
- [MUST] Store currency for multi-currency or ambiguous monetary values.
- [MUST] Define rounding mode, rounding stage, tax/discount/commission order, and source of exchange rates.
- [MUST] Generate identifiers server-side or through a verified platform mechanism when identity affects authority/integrity.
- [SHOULD] Avoid embedding mutable business meaning in identifiers.

## 5. Deletion, history, and derived data

- [MUST] Choose soft delete only when restoration, references, audit, legal retention, or user workflow requires it; define filtering and uniqueness behavior.
- [BLOCKER] Do not hard-delete data that must remain auditable/recoverable without approved retention policy.
- [MUST] Define cascading cleanup for related records, files, caches, projections, search indexes, and provider objects.
- [MUST] Treat audit/ledger history as append-only or tamper-evident where risk requires.
- [SHOULD] Compute stable derived values on read when cost is reasonable.
- [MUST] If persisting derived/denormalized data, identify source of truth, update mechanism, failure state, reconciliation, and backfill.
- [MUST] Define retention and purge behavior for temporary, personal, and sensitive data.
- [BLOCKER] Deletion workflows must enforce authorization, tenant scope, legal/business holds, and destructive-action safeguards.

## 6. Queries and pagination

For each production read, define owner, authorization/tenant filter, selected fields, filters, sorting with deterministic tie-breaker, page/batch maximum, pagination strategy, consistency, index expectations, timeout, and load shape.

- [BLOCKER] No unbounded production list, search, batch, report, or export query.
- [BLOCKER] Do not fetch an entire growing dataset and paginate/filter in the client.
- [BLOCKER] Enforce maximum page/batch/export size on the server; do not trust a client limit.
- [BLOCKER] Apply tenant/ownership/permission scope in the server query or authoritative filtering layer.
- [BLOCKER] Do not use client-provided tenant identity as the authority for the query.
- [MUST] Select only required fields and map results to an explicit boundary response.
- [MUST] Use stable ordering; cursor pagination is preferred for large/mutable sequences when supported and needed.
- [MUST] Document offset pagination drift/cost where used.
- [MUST] Prevent N+1 with batching, joins, prefetching, or a bounded alternative verified against the platform.
- [MUST] Review expensive count/aggregation/report queries separately from page reads.
- [MUST] Move long exports/reports to bounded batch/stream/background processing with progress and authorization where synchronous timeout is plausible.
- [MUST] Apply query timeout/budget when the platform supports it and define cancellation/recovery behavior.

## 7. Index and performance review

Base index decisions on actual filter, sort, join/relation, cardinality, selectivity, tenant prefix, write volume, storage, and maintenance evidence.

- [MUST] Explain the query each new index supports and verify it with plan/metrics when tooling exists.
- [SHOULD] Prefer composite indexes aligned with real query prefixes over indexing every field.
- [MUST] Account for uniqueness, null semantics, collation/case, and tenant scope.
- [MUST] Measure or estimate write amplification and storage cost.
- [BLOCKER] An index cannot substitute for missing authorization or unbounded query contracts.
- [MUST] Record known N+1 or heavy-query debt when it cannot be fixed in scope.

## 8. Financial and ledger data

- [BLOCKER] Calculate price, discount, tax, fee, balance, reward, and commission from authoritative server data.
- [BLOCKER] Do not accept payment success, amount, currency, entitlement, balance, or commission state solely from client redirects/input.
- [MUST] Use stable provider/payment references and idempotency protection.
- [MUST] Model relevant states such as pending, confirmed, failed, cancelled, expired, refunded, disputed, and reconciled.
- [MUST] Link refund/reversal/adjustment to the original transaction.
- [BLOCKER] Prevent duplicate charge, fulfillment, inventory movement, reward, or commission.
- [MUST] Prefer append-only ledger entries for material balance history; corrections use compensating entries rather than erasure.
- [MUST] Define balance source of truth, aggregation/reconciliation, rounding, audit, approval, and recovery.
- [BLOCKER] Do not grant irreversible value before trusted confirmation unless the explicitly accepted business risk and compensation are recorded.
- [MUST] Reconcile provider and internal state and alert/review mismatches.

## 9. Data review output

Record changed entities/fields/constraints/indexes, ownership and source of truth, state/invariant effects, read/write paths, authorization/tenant scope, query bounds, concurrency/transaction behavior, retention/privacy, migration/backfill/verification, rollback/recovery, tests, and residual debt.
