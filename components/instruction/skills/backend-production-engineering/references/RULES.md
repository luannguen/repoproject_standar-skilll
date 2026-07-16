# Backend Production Rules

## Contents

1. Severity and evidence
2. Foundational rules
3. Domain and business invariants
4. Trust and authority
5. Change scope and reuse
6. Correctness under real delivery
7. Production readiness
8. Exception record
9. Backend Decision Summary
10. Output report

## 1. Severity and evidence

- BLOCKER: completion or merge is prohibited until resolved or explicitly approved where an exception is legally and technically possible.
- MUST: required; deviation needs an approved exception with compensating controls.
- SHOULD: strong default; explain a material deviation.
- MAY: optional when evidence and context support it.

Implementation reality comes from current code/runtime/schema. Intended behavior comes from approved specifications/contracts. Platform behavior comes from current authoritative platform documentation plus project configuration or reproducible evidence. Project Memory routes evidence but does not outrank it.

- [BLOCKER] Never present an assumption, proposal, undocumented Base44 behavior, or unverified guarantee as current fact.
- [MUST] Mark important claims as verified, supported, provisional, disputed, or unknown and cite the source path/test.
- [MUST] Re-verify high-risk authorization, tenant, payment, transaction, migration, and destructive-operation claims for each affected task.
- [MUST] Stop when missing facts materially change correctness or safety; report the exact source/decision needed.

## 2. Foundational rules

- [BLOCKER] Protect business invariants, not merely request success.
- [BLOCKER] Treat client, webhook, file, queue, cache, and external-provider data as untrusted.
- [BLOCKER] Frontend validation does not replace backend validation.
- [BLOCKER] Hidden or disabled UI does not replace server authorization.
- [MUST] Use database/platform constraints when they can protect an invariant; application checks alone are not race-safe.
- [MUST] Assume requests can duplicate, reorder, time out, retry, partially complete, race, carry stale data, come from modified clients, use expired sessions, or contain forged events.
- [MUST] Design failure, recovery, and observability alongside the happy path.
- [MUST] Prefer the simplest architecture that meets correctness, security, integrity, required scale, maintainability, observability, and recovery needs.
- [MUST] Do not introduce microservices, event-driven flow, queues, caches, or generic abstractions for fashion or hypothetical scale.
- [BLOCKER] Do not claim production readiness because a simple happy path runs.

## 3. Domain and business invariants

Before design or code, identify:

- [BLOCKER] Business goal, actors, roles/capabilities, related entities, and data owner.
- [BLOCKER] Valid states/transitions, invalid transitions, preconditions, postconditions, and rules that must never be violated.
- [BLOCKER] Source of truth versus cache, projection, derived, analytical, temporary, audit, and ledger data.
- [MUST] Reversible versus irreversible actions, approval needs, audit needs, financial impact, multi-user/tenant impact, and mid-workflow failure behavior.
- [MUST] Place each invariant at the strongest appropriate layer: constraint, transaction, state guard, domain service, authorization policy, validation, idempotency control, or audit.
- [BLOCKER] Do not leave an important business invariant only in comments, prompts, UI logic, or duplicated handlers.
- [MUST] For financial/privileged/destructive flows, define approval, reconciliation, recovery, and evidence of completion.

## 4. Trust and authority

- [BLOCKER] Establish trust boundaries for client, authenticated context, server function, database/entity layer, provider, webhook, queue, file store, cache, and operator.
- [BLOCKER] Derive tenant/user/owner context from authenticated server authority when possible; do not trust client-supplied authority.
- [BLOCKER] Authorize the action and object at the server boundary and in every privileged downstream path.
- [MUST] Separate authentication, action permission, resource ownership, tenant scope, and field-level access.
- [BLOCKER] Never let clients set system-owned fields such as owner, tenant, role, permission, price, balance, payment status, audit fields, or privileged workflow state except through an explicitly authorized domain command.
- [MUST] Recheck permission when a long workflow can outlive a session or permission grant.

## 5. Change scope and reuse

Use this order:

1. reuse an existing verified service/module/pattern;
2. extend it without breaking consumers;
3. compose a domain service or adapter at the correct boundary;
4. create a new module only when ownership/responsibility is distinct;
5. create shared infrastructure only after repeated, evidenced use.

- [BLOCKER] Search entities, schemas, services/functions, adapters, repositories, validation, errors, permissions, transactions, pagination, logging, tests, migrations, and utilities before creating equivalents.
- [MUST] State what was searched and why reuse, extension, or creation was selected.
- [MUST] Keep business logic owned by a clear domain/module rather than scattered through UI, handlers, hooks, jobs, or generic utilities.
- [MUST] Isolate provider-specific behavior behind an adapter/service appropriate to verified architecture.
- [BLOCKER] Do not create circular dependencies, reverse shared-to-feature dependencies, god services, or breaking public APIs without impact/migration analysis and approval.
- [MUST] Keep task scope explicit; report useful out-of-scope debt instead of silently refactoring it.
- [BLOCKER] Do not mix major dependency upgrades, broad architecture changes, production migrations, or public-contract breaks into a feature task without authorization.

## 6. Correctness under real delivery

For every meaningful mutation:

- [BLOCKER] Define transaction/atomicity boundary and prove the guarantee from current platform/project evidence.
- [BLOCKER] Define concurrent, duplicate, stale, reordered, timed-out, and partial-failure behavior.
- [MUST] Define idempotency when repeated delivery could repeat a side effect.
- [MUST] Define retryable versus non-retryable failure and bound timeout, attempts, backoff, and jitter where applicable.
- [MUST] Define recovery: rollback, compensation, state-machine continuation, reconciliation, replay, manual review, or forward repair.
- [BLOCKER] Do not call a multi-step flow atomic without a proven transaction.
- [BLOCKER] Do not use read-check-write for a critical invariant without constraint, locking/versioning, compare-and-swap, or equivalent protection.
- [BLOCKER] Do not report success when a required step failed or completion is only partial unless the contract explicitly models partial success.
- [MUST] Preserve diagnostic root cause internally while returning stable, safe boundary errors.

For every read/list/export:

- [BLOCKER] Apply server-side authorization and tenant/ownership scope.
- [BLOCKER] Bound list, batch, search, report, and export work.
- [MUST] Select only required fields and avoid sensitive/internal field exposure.
- [MUST] Review query count, N+1, filter/sort/index fit, count cost, consistency, timeout, and large-result strategy.

## 7. Production readiness

- [BLOCKER] No unmitigated cross-tenant, privilege-escalation, data-loss/corruption, secret exposure, financial duplication, destructive migration, or unrecoverable partial-failure risk may remain.
- [MUST] Validate config at startup/boundary; keep environment separation and secret management explicit.
- [MUST] Provide logs/metrics/audit sufficient to investigate critical flows without recording secrets or unnecessary personal data.
- [MUST] Test happy, invalid, unauthorized, forbidden, duplicate, concurrent when relevant, dependency/timeout, partial-failure/recovery, cross-tenant, boundary, migration, and regression paths.
- [MUST] Define compatibility window, deployment order, migration verification, and rollback/forward-recovery when contracts/data change.
- [MUST] Report every unavailable test/check with residual risk and the evidence needed before production readiness can be established.
- [BLOCKER] ?Production-ready? requires evidence across correctness, security, failure/recovery, observability, compatibility, and validation; documentation existence alone is not evidence.

## 8. Exception record

Every BLOCKER/MUST exception must record:

- rule and severity;
- reason and alternatives considered;
- scope, affected modules, data, tenants/users, and contracts;
- likelihood/impact and security/operational risk;
- compensating control and validation;
- rollback/recovery;
- long-term remediation, owner/approval condition, target date, and expiry;
- whether deployment/merge is allowed and by whom.

- [BLOCKER] Never silently skip, downgrade, or permanently waive a BLOCKER/MUST rule.
- [BLOCKER] A rule that protects legal/security/data integrity may be non-waivable; escalate instead of inventing an exception.
- [MUST] Revalidate temporary exceptions at expiry or when affected code/platform changes.

## 9. Backend Decision Summary

Produce a concise, evidence-backed summary before backend code:

- business goal and actors;
- invariants, state transitions, source of truth, and ownership;
- trust boundaries, authorization, field access, and tenant scope;
- read/write/event paths and external/platform boundaries;
- transaction/consistency, concurrency, idempotency, retry, failure, and recovery;
- observability/audit, performance/load, migration/compatibility/rollback;
- reuse decision, options when material, proposal, non-goals, and main risks;
- unknowns/blockers and the evidence used.

Do not expose private chain-of-thought. Record decisions, evidence, trade-offs, and conclusions only.

## 10. Output report

Report:

1. analyzed scope and verified sources;
2. invariants and authority boundaries protected;
3. architecture/reuse decision;
4. schema/API/event/error and compatibility changes;
5. authorization/tenant/field access;
6. transaction/concurrency/idempotency/retry;
7. failure/recovery/reconciliation;
8. logging/audit/metrics/alerts;
9. created/modified files;
10. tests and validations;
11. migration/deployment/rollback;
12. exceptions, unavailable checks, residual risks, and backend debt;
13. Project Memory and skill updates.
