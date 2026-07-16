# Backend Testing and Validation

## Contents

1. Test selection
2. Core scenario matrix
3. Specialized tests
4. Test realism
5. Static and operational review
6. Unavailable checks
7. Completion evidence

## 1. Test selection

Select the lowest-cost layers that can prove the actual risk: unit/domain, validation, authorization, tenant isolation, database/entity, transaction/concurrency, integration/contract, API, job/event/webhook, migration, security, performance/load, recovery, and end-to-end.

- [MUST] Map every invariant, trust boundary, side effect, compatibility promise, and failure/recovery path to a test or explicit manual evidence.
- [MUST] Follow verified project test conventions and use real platform/database behavior where the guarantee depends on it.
- [BLOCKER] A mocked unit test cannot prove database constraints, isolation, transaction semantics, provider contracts, queue delivery, or platform permissions.
- [SHOULD] Keep pure domain tests fast and exhaustive; add integration tests at risk-bearing boundaries.
- [MUST] Make tests deterministic, isolated by tenant/user/data, and safe to rerun.
- [MUST] Avoid production credentials/data and redact fixtures.

## 2. Core scenario matrix

For every important backend feature test applicable cases:

- [MUST] Happy path and boundary values.
- [MUST] Missing/wrong type/format/range/cross-field invalid input.
- [MUST] Unauthenticated and expired/revoked session.
- [MUST] Forbidden action, wrong owner/resource, cross-tenant access, and forbidden field update.
- [MUST] Not found without information leakage.
- [MUST] Duplicate request/idempotency key and same key with conflicting payload.
- [MUST] Dependency timeout/failure/invalid response and safe error mapping.
- [MUST] Partial failure, retry, compensation/recovery, and audit/telemetry.
- [MUST] Backward compatibility and regression.
- [BLOCKER] Do not test only status/success code; assert state, side effects, absence of forbidden effects, and contracts.

## 3. Specialized tests

### Data and concurrency

- [MUST] Test unique/check/relation constraints and invalid state transitions.
- [MUST] Run concurrent requests for oversell/overdraw/duplicate claim/lost update risks.
- [MUST] Assert one authoritative effect and deterministic conflict behavior.
- [MUST] Test stale version/data and transaction rollback/compensation.
- [MUST] Test pagination maximum, stable ordering, tenant filters, selected fields, N+1/query count where tooling supports it.

### Authorization and tenancy

- [BLOCKER] Test server permission independent of UI.
- [MUST] Test horizontal/vertical escalation, IDOR, cross-tenant read/write/search/count/export/file access, mass assignment, stale permission, and admin/audit behavior.
- [MUST] Test cache/job/event/storage scope for tenant isolation.

### Idempotency, jobs, and webhooks

- [MUST] Test sequential and concurrent duplicates, in-progress duplicate, completed replay, conflicting payload, expiry, and retry after timeout.
- [MUST] Test job retry/max attempts/dead letter/replay/overlap/version compatibility.
- [MUST] Test webhook signature/timestamp/replay, duplicate/out-of-order/late/unknown event, provider retry, and reconciliation.
- [MUST] Assert duplicate delivery does not duplicate email, notification, money, inventory, reward, or fulfillment.

### External integrations and storage

- [MUST] Contract-test request mapping, response validation, error mapping, timeout, retryability, rate-limit, unknown result, and outage fallback.
- [MUST] Test upload size/type/content/path/ownership/tenant, private download/signed URL, cleanup, and malicious inputs.
- [MUST] Treat sandbox success as partial evidence, not production guarantee.

### Migration and recovery

- [MUST] Test empty, representative, boundary, invalid legacy, large-batch, interrupted, rerun, rollback/forward repair, mixed-version, and verification cases.
- [MUST] Test reconciliation dry-run, safe repair, duplicate/concurrent run, authorization/audit, and residual mismatch.
- [BLOCKER] Do not run destructive production migration as a test.

### Performance and security

- [MUST] Test representative load/size/concurrency for changed hot paths when risk warrants it.
- [MUST] Verify bounded memory, page/batch limits, backpressure, query plan/count, latency, and provider quota behavior.
- [MUST] Run applicable injection, SSRF, path traversal, open redirect, file, CORS/CSRF, secret exposure, dependency, and abuse tests.

## 4. Test realism

- [MUST] Use representative data shapes, long values, timezone/money/Unicode boundaries, tenant distribution, and state history.
- [MUST] Include real constraint/transaction/platform permission behavior for integrity/security tests.
- [MUST] Keep provider/network tests controlled with contract fixtures plus selected sandbox/integration evidence.
- [BLOCKER] Do not mock away the invariant or failure being tested.
- [MUST] Assert logs/metrics/audit contain useful safe context and no secrets.
- [MUST] Clean test records/files/jobs and avoid cross-test pollution.
- [SHOULD] Add property/state-machine/fuzz tests for complex validation and transition rules.

## 5. Static and operational review

Run available typecheck, lint, build, unit/integration suites, migration validation, dependency/security audit, and project-specific checks. Search changed/relevant sources for:

- unresolved imports or dead code;
- unfinished stubs, mock data, or demo-only paths in production flow;
- raw error/stack/secret exposure;
- empty catches or success-after-error;
- client-trusted authority/price/status;
- missing server authorization/tenant scope;
- mass assignment;
- unbounded query/batch/retry/timeout;
- unsafe read-check-write and duplicate side effects;
- hard-coded secrets/config/roles/business rules;
- duplicated services/business logic;
- non-versioned durable payloads;
- missing logging/audit/recovery.

- [MUST] Review query plans/counts and migration/deployment order where affected.
- [MUST] Run smoke/health/readiness/alert checks in an available representative environment.
- [BLOCKER] Static search is a supplement, not proof that behavior is safe.

## 6. Unavailable checks

For each unavailable check report:

- exact check and command/environment needed;
- why it could not run;
- guarantee left unverified and affected risk;
- manual/static evidence used;
- compensating control;
- condition/test required before production readiness.

- [BLOCKER] Do not silently omit a relevant check.
- [BLOCKER] Do not reinterpret ?not runnable? as ?passed.?
- [MUST] Keep production readiness provisional when a missing check could reveal a BLOCKER.

## 7. Completion evidence

Report commands, environment/version, pass/fail counts, relevant test names, static findings, migration dry-run/verification, performance/security evidence, manual checks, unavailable checks, residual risk, and regression protection. Resolve failures or explicitly block completion.
