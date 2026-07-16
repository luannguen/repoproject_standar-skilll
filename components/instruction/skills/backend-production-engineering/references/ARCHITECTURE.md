# Backend Architecture and Boundaries

## Contents

1. Discovery map
2. Boundaries and ownership
3. Dependency direction
4. Reuse and extraction decisions
5. Synchronous, job, and event decisions
6. Distributed-system restraint
7. Architecture change record

## 1. Discovery map

Inspect current manifests, entry points, modules, entities/schema/migrations, data-access code, services/functions, handlers, auth/policy code, integrations, jobs/automations, storage, configuration, tests, deployment, logging, and operational docs.

- [BLOCKER] Do not design around a folder name or assumed framework; trace actual call/data/control paths.
- [MUST] Identify business-rule owners, data owners, public/internal contracts, consumers, trust boundaries, and dependency direction.
- [MUST] Search for duplicate implementations, hard-coded rules/config, unbounded reads, swallowed errors, UI-only permission checks, over-broad responses, N+1, and unsafe multi-step writes.
- [MUST] Separate current implementation, intended contract, historical workaround, and proposal.

## 2. Boundaries and ownership

A module/domain boundary needs a cohesive responsibility, explicit owned data/invariants, public contract, consumers, dependencies, failure behavior, and operational owner.

- [MUST] Keep domain rules in a clear domain/service owner; keep transport parsing, persistence mechanics, provider mapping, and presentation concerns at their boundaries.
- [MUST] Keep API/function handlers thin enough that domain invariants remain independently testable and reusable.
- [MUST] Use adapters to contain provider-specific contracts, credentials, error mapping, timeouts, retries, and reconciliation.
- [SHOULD] Use a repository/data-access abstraction when it protects domain logic from multiple persistence/query details or creates a valuable test boundary; do not wrap every trivial platform operation.
- [MUST] Keep cross-cutting security, observability, configuration, idempotency, and error policy consistent without hiding domain meaning in generic utilities.
- [BLOCKER] Shared modules must not depend on feature modules; feature dependency cycles are prohibited.
- [BLOCKER] Do not scatter the same invariant across handlers/hooks/jobs without one authoritative owner.

## 3. Dependency direction

Prefer domain/policy -> ports/contracts -> infrastructure adapters, adjusted to the verified project architecture.

- [MUST] Dependencies point toward stable contracts and owners.
- [MUST] External SDK/database/platform types stop at an adapter boundary when leakage would couple multiple modules.
- [SHOULD] Keep a provider type when it is the project?s intentional, verified standard and abstraction would erase useful platform capabilities.
- [MUST] Record any boundary exception with affected consumers and migration cost.
- [BLOCKER] Never introduce a generic base service/repository with no proven repeated problem.

## 4. Reuse and extraction decisions

Choose in order:

1. Reuse: behavior and contract already match.
2. Extend: same owner/invariant; compatible extension is possible.
3. Compose domain service: orchestration belongs to one domain or application use case.
4. Add adapter: external/platform contract must be isolated.
5. Add repository/data-access module: query/persistence policy needs one owner.
6. Add job/event: latency, durability, retry, fan-out, or scheduling justifies asynchronous work.
7. Add shared utility: pure, domain-neutral behavior is repeated and stable.

- [BLOCKER] Do not create before recording the closest candidates searched.
- [MUST] Analyze all consumers before changing shared behavior/public API.
- [SHOULD] Wait for at least two real, aligned uses before promoting a shared abstraction unless security/correctness demands centralization.
- [MUST] Keep one-use feature behavior local and named by domain.
- [MUST] Record duplicate/deprecated modules as backlog; do not broaden the current task without approval.

## 5. Synchronous, job, and event decisions

Keep work synchronous when the caller needs an immediate authoritative result and bounded processing fits the request budget.

Use a background job when work is long, rate-limited, retryable, resumable, schedulable, or does not need to block the user.

Use an event when a fact has occurred and independent consumers legitimately need decoupling/fan-out.

- [BLOCKER] Do not use async work without ownership, idempotency, retry limit, timeout, progress/state, failure visibility, replay/recovery, and observability.
- [BLOCKER] Do not emit a success event before the authoritative state is committed when consistency requires both.
- [MUST] Consider an outbox or platform-equivalent when state change and event emission must remain consistent.
- [MUST] Version durable job/event payloads and support old in-flight messages during deployment.
- [SHOULD] Prefer a direct call over an event when there is one local consumer and no durability/fan-out need.
- [MUST] Model user-visible pending/failed/retry/review states for asynchronous business workflows.

## 6. Distributed-system restraint

- [BLOCKER] Do not create a microservice when a module in the current deployable can meet isolation, scale, security, and ownership needs.
- [MUST] Justify service separation with independent scaling/deployment/compliance/failure/ownership requirements and accept network, consistency, observability, migration, and operational cost.
- [BLOCKER] Do not introduce event-driven architecture without durable delivery semantics, idempotent consumers, replay/reconciliation, schema compatibility, monitoring, and operational ownership.
- [MUST] Treat network calls as fallible, slow, duplicated, reordered, and independently deployed.
- [SHOULD] Prefer a modular monolith until measured constraints justify distribution.

## 7. Architecture change record

For a material change record context, problem, constraints, current paths, options (maximum three), selected option, rejected options, data/security/reliability/performance/operations effects, compatibility, migration, rollback, tests, and reversal conditions.

- [MUST] Use Project Memory/ADR for cross-module public-boundary changes.
- [MUST] Keep local refactors local; do not create ADR noise for mechanical edits.
- [BLOCKER] Do not silently change accepted architecture or public contracts.
