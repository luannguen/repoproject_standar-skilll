# Backend Remediation Backlog

This backlog is source-triggered. Do not fabricate entities, Base44 behavior, permissions, business rules, or production defects to close it.

## P0 - On authoritative source arrival

1. Identify language/runtime/manifests, entry points, module boundaries, package/dependency rules, commands, and deployment target.
2. Read approved product/domain actors, states, invariants, ownership, financial/value rules, approvals, retention, and recovery expectations.
3. Inventory Base44 entities, permissions, functions, automations, integrations, auth, storage, environment, scheduling, queries/indexes, logging/retry/deployment, plan/version, and authoritative documentation.
4. Complete the PLATFORM capability matrix with source paths, docs/version/date, limits, runtime tests, and compensation.
5. Map entities/schema/relations/constraints/indexes, source of truth, tenant/owner/system fields, state transitions, time/money/ledger semantics, deletion/retention, and migrations.
6. Map services/functions/handlers/repositories/data access, business-rule ownership, dependency direction, shared modules, duplicates, and provider adapters.
7. Map authentication/session, authorization/capabilities, object/field access, tenant isolation, admin/impersonation, rate limiting, secrets, privacy, and audit.
8. Map APIs/errors/pagination, integrations/webhooks/payments, jobs/cron/events, storage/uploads, notifications, import/export/sync, caches, and reconciliation.
9. Map transactions/atomic operations, concurrency guards, idempotency, retries/timeouts, partial-failure states, compensation, recovery, and manual review.
10. Map logs/metrics/traces/health/alerts/runbooks, test architecture, deployment/migration compatibility, incidents, and Git history.
11. Update snapshot, open questions, gap/debt/staleness reports, MEM-BACKEND-0001, production risks, indexes, and onboarding checkpoint.

## P1 - Evidence-backed audit and remediation proposals

1. Detect duplicate/god/circular services and scattered/hard-coded business rules; propose scoped ownership/refactor.
2. Detect client-trusted authority, UI-only checks, mass assignment, IDOR, cross-tenant paths, unsafe CORS/CSRF/SSRF/upload/redirect, secret exposure, and sensitive over-fetch.
3. Detect unbounded queries/batches/exports/uploads, N+1, poor index fit, cache scope/invalidation gaps, provider timeout/retry issues, memory/load/backpressure risks.
4. Detect unsafe read-check-write, false atomicity, duplicate effects, non-idempotent jobs/webhooks, scheduled overlap, partial-failure loss, and missing reconciliation.
5. Audit API/error/event/job compatibility, migrations/backfills, deployment order, rollback/forward recovery, environment separation, and dependency posture.
6. Audit critical-flow structured logs/metrics/audit/alerts, detection, investigation, runbook, and recovery.
7. Produce prioritized, scoped fixes with owner/evidence/test/migration/rollback; do not refactor the whole backend during audit.

## P2 - Validation and operating maturity

1. Establish/route unit, domain, database, integration, API contract, auth/tenant, concurrency/idempotency, webhook/job/storage, migration, security, performance/load, recovery, and regression tests consistent with the actual stack.
2. Add representative data scale, tenant distribution, time/money/Unicode boundaries, provider failures, duplicate/reordered delivery, rolling deployment, and recovery drills.
3. Establish operational SLO/SLI, dashboards, actionable alerts, runbooks, reconciliation cadence, audit retention, backup/recovery validation, and incident linkage.
4. Promote only repeated/accepted project patterns to Project Memory or Backend Production references.
5. Schedule backend drift/risk audits after shared-boundary, schema/auth/platform, dependency, deployment, or critical-workflow changes.

## Exit criteria

Application-specific backend onboarding is complete only when authoritative sources establish domain invariants, data ownership/schema, Base44 capabilities/limits, module/service boundaries, API/integration contracts, authentication/authorization/tenant controls, transaction/concurrency/idempotency, failure/recovery, observability/audit, security/configuration, migrations/deployment, tests/runtime evidence, debt/incidents/checkpoints, and every remaining P0 risk is resolved or explicitly accepted with zero memory BLOCKER.
