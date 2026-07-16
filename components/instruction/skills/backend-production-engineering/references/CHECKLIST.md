# Backend Task Checklist

Severity: every applicable checklist item is MUST; an incomplete pre-implementation/safety gate is BLOCKER. Non-applicable items require a concise reason.

## Contents

1. Memory and classification
2. Discovery and reuse
3. Backend Decision Summary
4. Contract and data impact
5. Implementation plan
6. Pre-implementation gate
7. Implementation controls
8. Specialized checks
9. Role-based self-review
10. Validation evidence
11. Post-implementation gate
12. Output report
13. Exception record
14. Safe learning

## 1. Memory and classification

- [ ] Read AI-BOOTSTRAP, Project Memory Skill, this skill, RULES, and this checklist.
- [ ] Classify task and risk: entity/schema, API/service, business rule, auth/tenant, integration/webhook/payment, transaction, job/event/cron, storage/import/export, migration, security/performance/reliability, bug/refactor, deployment, or cross-cutting.
- [ ] Build retrieval terms from domain, entities, modules, paths, integrations, permissions, errors, migration, and task/checkpoint IDs.
- [ ] Retrieve and verify project constraints, invariants, source of truth, ownership, schema/migrations, contracts, permissions, platform capability, incidents, debt/questions, and closest checkpoint.
- [ ] Mark stale/conflicting/unknown items and produce concise MEMORY CONTEXT.
- [ ] Stop if an unknown materially changes correctness/security/data integrity and cannot be safely bounded.

## 2. Discovery and reuse

Search current sources for:

- [ ] analogous entity/schema/relation/constraint/index;
- [ ] domain/service/function/handler/repository/data access;
- [ ] validation/normalization/error mapping;
- [ ] auth/policy/permission/tenant/ownership/field access;
- [ ] transaction/concurrency/idempotency/retry/compensation/reconciliation;
- [ ] integration adapter/webhook/storage/job/event/cron/notification;
- [ ] query/pagination/search/filter/batch/cache;
- [ ] logging/metrics/audit/health/alerts;
- [ ] migration/backfill/config/deployment;
- [ ] unit/integration/security/performance/regression tests;
- [ ] duplicate/hard-coded/deprecated/out-of-scope debt.

Record candidates and choose reuse -> extend -> compose domain service/adapter/repository -> create. Do not create before this gate is complete.

## 3. Backend Decision Summary

Complete before backend code:

- [ ] Business goal, actors, affected users/tenants, and success outcome.
- [ ] Domain invariants, valid/invalid states/transitions, pre/postconditions.
- [ ] Source of truth, data owner, cache/projection/ledger status.
- [ ] Trust boundaries and untrusted inputs.
- [ ] Authentication, action/resource/field authorization, ownership, and tenant scope.
- [ ] Read path, write path, event/job/provider/storage path.
- [ ] Platform/Base44 capability status and evidence.
- [ ] Transaction/atomicity boundary and consistency requirement.
- [ ] Concurrency/stale/duplicate/order risks and protection.
- [ ] Idempotency key/scope/state/expiry/result behavior when applicable.
- [ ] Failure modes, retry classification, timeout, compensation/recovery/reconciliation.
- [ ] Logging, metrics, audit, alert, health/operation needs.
- [ ] Performance/load/cost/query/batch limits.
- [ ] Migration, compatibility, deployment order, rollback/forward recovery.
- [ ] Reuse decision, options (maximum three when material), recommendation, non-goals, and main risks.

Do not disclose private chain-of-thought; provide decisions, evidence, trade-offs, and conclusions.

## 4. Contract and data impact

- [ ] Entity/schema/constraint/index/state changes.
- [ ] Request/response/error/event/job/file/import/export contract.
- [ ] Fields accepted, derived, exposed, sensitive, system-controlled, and deprecated.
- [ ] Authorization, tenant, ownership, field-level scope, and audit.
- [ ] Validation/normalization/boundary/error mapping.
- [ ] Transaction/consistency/concurrency/idempotency/retry.
- [ ] Query/pagination/max limits/N+1/index.
- [ ] Retention/deletion/privacy/financial/ledger effects.
- [ ] Integration/webhook/provider/storage behavior.
- [ ] Backward compatibility, migration/backfill, rollback/recovery.
- [ ] Tests and operational verification.

## 5. Implementation plan

Record:

- [ ] Files to read, modify, and create.
- [ ] Reused modules and services to extend.
- [ ] Data/control/authorization/error flows.
- [ ] Domain, transaction, trust, integration, and job boundaries.
- [ ] Logs, metrics, audit, alerts, health.
- [ ] Tests/commands/environments.
- [ ] Deployment/migration/rollback steps.
- [ ] Explicit non-goals and out-of-scope debt.
- [ ] Approval required for public contract, production data, dependency, architecture, destructive, or security changes.

## 6. Pre-implementation gate

No backend code until all applicable items are confirmed:

- [ ] Skill and bootstrap routing read.
- [ ] Similar modules/patterns searched.
- [ ] Business invariants and source of truth identified.
- [ ] Trust boundary, server authorization, ownership, field access, and tenant scope identified.
- [ ] Validation and system-controlled fields identified.
- [ ] Data/schema/API/event impact identified.
- [ ] Transaction capability/boundary and consistency verified.
- [ ] Concurrency and duplicate delivery assessed.
- [ ] Idempotency strategy identified where needed.
- [ ] Failure, timeout, retry, compensation/recovery/reconciliation identified.
- [ ] Error contract and observability/audit identified.
- [ ] Query/pagination/performance limits assessed.
- [ ] Migration/compatibility/rollback and tests identified.
- [ ] Unknowns, exceptions, approvals, and non-goals recorded.

## 7. Implementation controls

- [ ] Follow verified architecture and naming/folder conventions.
- [ ] Keep invariant ownership clear; avoid duplication.
- [ ] Validate/normalize at the authoritative boundary.
- [ ] Authorize on server; enforce object/tenant/field scope.
- [ ] Prevent mass assignment and sensitive output.
- [ ] Bound query/page/batch/file/retry/timeout/concurrency.
- [ ] Protect duplicate/concurrent/stale mutation effects.
- [ ] Handle partial failure and preserve recoverable state.
- [ ] Use safe stable error mapping.
- [ ] Add investigation-quality logs/metrics/audit without secrets.
- [ ] Preserve backward compatibility or follow approved migration.
- [ ] Do not add unfinished stubs, mock data, or demo-only paths to production flow.
- [ ] Do not broaden refactor/dependency/contract scope silently.

## 8. Specialized checks

### Entity/query

- [ ] Required/optional/default/type/enum/timezone/money/ID semantics.
- [ ] Unique/relation/check/tenant/owner/version/audit constraints.
- [ ] Soft/hard delete, retention, derived data, reconciliation.
- [ ] Server filters, selected fields, stable sort, max page/batch, N+1/index.

### Auth/security

- [ ] Unauthenticated, forbidden, wrong owner, cross-tenant, stale/revoked, field-level and mass-assignment cases.
- [ ] Injection, SSRF, path traversal, open redirect, CORS/CSRF, upload, replay, rate-limit/abuse.
- [ ] Secrets/config/environment separation/redaction/dependency risk.

### Integration/webhook/storage

- [ ] Adapter, timeout, retryability, rate limit, error mapping, provider outage, unknown outcome, reconciliation.
- [ ] Signature/timestamp/replay/event ID/duplicate/order/schema/dead-letter.
- [ ] File type/size/content/path/private access/signed URL/cleanup/retention.

### Transaction/job/performance

- [ ] Atomic guarantee proven or compensation state documented.
- [ ] Concurrent first execution, unique/idempotency record, stale update/conflict.
- [ ] Job version/timeout/retry/max attempts/overlap/checkpoint/replay/dead-letter.
- [ ] Cache scope/invalidation/failure; provider quota; backpressure; representative load.

### Migration/deployment

- [ ] Expand-migrate-contract and mixed-version compatibility.
- [ ] Bounded idempotent backfill, invalid legacy handling, counts/invariants.
- [ ] Config/secrets/prerequisites, readiness, cutover, monitoring, rollback/forward repair.

## 9. Role-based self-review

Review separately as:

- [ ] Domain reviewer: invariants, states, ownership, business authority.
- [ ] Data-integrity reviewer: schema, constraints, money/time, concurrency, retention.
- [ ] Security reviewer: trust, injection, secrets, privacy, abuse.
- [ ] Authorization reviewer: action/resource/field checks and privilege escalation.
- [ ] Multi-tenant reviewer: every read/write/cache/job/file/export scope.
- [ ] Transaction reviewer: real guarantee, commit point, external effects.
- [ ] Concurrency reviewer: duplicates, stale writes, races, ordering.
- [ ] Reliability reviewer: timeouts, retries, partial failure, recovery/reconciliation.
- [ ] Performance reviewer: bounds, queries, N+1, memory, backpressure, cost.
- [ ] Observability reviewer: safe logs/metrics/audit/alerts and investigation path.
- [ ] Migration reviewer: compatibility, backfill, deployment, rollback/recovery.
- [ ] Regression reviewer: consumers, old behavior, tests, unresolved imports/debt.

## 10. Validation evidence

Run available:

- [ ] Typecheck, lint, build.
- [ ] Unit/domain/validation tests.
- [ ] Database/integration/API contract/error mapping tests.
- [ ] Authorization/ownership/tenant/field/mass-assignment tests.
- [ ] Idempotency/duplicate/concurrency/transaction tests.
- [ ] Webhook/provider/storage/job/event tests.
- [ ] Migration/backfill/mixed-version/rollback or recovery tests.
- [ ] Security/dependency/static-secret checks.
- [ ] Query plan/count/N+1/unbounded query review.
- [ ] Performance/load/backpressure tests when risk warrants.
- [ ] Logging/metrics/audit/health/alert checks.
- [ ] Regression and representative smoke/E2E checks.

For every unavailable check record name, reason, guarantee left unverified, risk, manual evidence, compensating control, and production-readiness condition.

## 11. Post-implementation gate

- [ ] Invariants and state transitions remain protected.
- [ ] Input is server-validated; system fields are controlled.
- [ ] Server authorization, object ownership, field access, and tenant isolation pass.
- [ ] No mass assignment, unbounded query/batch/retry/upload, sensitive over-fetch, raw error/stack, or secret leakage.
- [ ] Pagination/batch maximum and deterministic ordering exist.
- [ ] Transaction/compensation and duplicate/concurrency/stale behavior are implemented and tested.
- [ ] External calls have timeout/safe retry/error mapping; webhooks verified/idempotent; jobs safe to retry/overlap-controlled.
- [ ] Logs/metrics/audit support investigation and recovery.
- [ ] Migration/compatibility/deployment/rollback or forward recovery are explicit.
- [ ] Happy, invalid, unauthorized, forbidden, not-found, duplicate, failure, cross-tenant, boundary, and regression cases pass as applicable.
- [ ] No accidental duplication, unresolved import, silent out-of-scope refactor, or weakened security/reliability.
- [ ] New debt/risk/exceptions are recorded.

## 12. Output report

Report:

1. analyzed scope/evidence;
2. invariants;
3. architecture/reuse decision;
4. schema/API/event changes;
5. authorization/tenant isolation;
6. transaction/concurrency/idempotency;
7. failure/recovery;
8. observability/audit;
9. files created/modified;
10. validation;
11. migration/deployment/rollback;
12. exceptions/unavailable checks/residual risk;
13. backend debt and justified follow-up;
14. Memory Update and skill update.

## 13. Exception record

- [ ] Rule/severity and reason.
- [ ] Scope, data/modules/contracts/users/tenants affected.
- [ ] Likelihood/impact and security/operational risk.
- [ ] Alternatives and why unavailable.
- [ ] Compensating control and validation.
- [ ] Rollback/recovery.
- [ ] Long-term remediation, owner/approval condition, expiry.
- [ ] Merge/deploy decision and approver.

## 14. Safe learning

After each task ask whether a reusable business, data-access, transaction, authorization, integration, error, observability, migration, test, or anti-pattern was verified.

- [ ] Add only reusable evidence, not feature-specific trivia.
- [ ] Keep first-use patterns provisional until repeated/accepted.
- [ ] Update appropriate reference and CHANGELOG with version/date/files/rule or pattern/reason/task/scope/migration/breaking status.
- [ ] May add examples/checks/clarification/verified patterns and platform guidance.
- [ ] Must obtain approval before deleting/downgrading BLOCKER/MUST; weakening authorization, tenant isolation, integrity, security, audit, compatibility, or production rules; changing global instruction architecture; adding core dependency; or creating breaking schema/public contract changes.
- [ ] Update Project Memory atomically and run memory lint.
