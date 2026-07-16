# Observability and Audit

## Contents

1. Observability design
2. Structured logs
3. Metrics
4. Tracing and correlation
5. Health and readiness
6. Alerts and dashboards
7. Audit records
8. Operational completion gate

## 1. Observability design

Start from business/invariant failure modes and operator questions: what failed, for whom/which tenant safely, where, when, after what input/event/version, whether it duplicated/partially completed/retried, current state, and how to recover.

- [MUST] Define success, failure, latency, retry, duplicate, reconciliation mismatch, queue/backlog, and stuck-state signals for critical workflows.
- [MUST] Give each request, command, job, webhook, integration call, and reconciliation run a stable operation name and correlation identifier.
- [MUST] Separate debugging telemetry, security events, and immutable business audit.
- [BLOCKER] Observability must not expose secrets, credentials, private keys, payment data, or unnecessary personal/sensitive payloads.
- [MUST] Define retention, access, sampling, redaction, and cost/cardinality limits.
- [BLOCKER] Do not claim a critical flow operable when failures leave no durable trace or detection path.

## 2. Structured logs

Include timestamp, level, environment/service/module, operation, request/correlation ID, safe actor/tenant/resource identifiers, duration, result/error class, dependency, retry count, job/event ID, and deployment/version when applicable.

- [MUST] Use the verified project logger/structured format; do not scatter ad hoc console output when a standard exists.
- [MUST] Preserve root error/cause internally with stack where safe while returning sanitized boundary errors.
- [MUST] Log transitions and decisions needed to investigate critical state changes, not full sensitive objects.
- [MUST] Redact by field/type before serialization; avoid blacklist-only string replacement.
- [MUST] Keep log levels meaningful and avoid high-volume success noise.
- [MUST] Record external provider, operation, duration, normalized result/error, and safe provider request/reference ID.
- [MUST] Record webhook event ID and job ID through every processing stage.
- [BLOCKER] Never log password, token, cookie, authorization header, OTP, signing secret, private key, full payment credential, or complete environment.
- [MUST] Avoid user-controlled log injection and unbounded payload logging.

## 3. Metrics

Use bounded-cardinality dimensions such as operation, normalized result/error, provider, environment, queue/job type, and deployment version.

- [MUST] Track throughput, success/failure rate, latency distribution, retries, timeouts, duplicates, idempotency conflicts, queue depth/age, dead letters, reconciliation mismatches, and stuck workflows when relevant.
- [MUST] Add business safety metrics for payment/fulfillment/inventory/permission workflows when present.
- [BLOCKER] Never use raw user ID, request ID, email, URL, filename, arbitrary error text, or unbounded tenant/resource ID as a metric label.
- [MUST] Define units and counter/gauge/histogram semantics.
- [SHOULD] Prefer service-level indicators tied to user/business outcome over infrastructure-only charts.
- [MUST] Verify metric emission under success and failure paths.

## 4. Tracing and correlation

- [MUST] Propagate correlation across handler, service, data access, provider, job/event, and reconciliation boundaries using verified project/platform mechanisms.
- [MUST] Create spans around meaningful operations and dependencies when tracing infrastructure exists.
- [MUST] Record timing/result without sensitive payloads.
- [MUST] Link asynchronous work to its initiating request/business object safely.
- [SHOULD] Sample routine traces while retaining errors/slow critical paths according to cost/privacy policy.
- [BLOCKER] Do not invent tracing support; if unavailable, use structured IDs/logs and record the gap.

## 5. Health and readiness

- [MUST] Liveness answers whether the process/runtime should be restarted; readiness answers whether it can serve safely.
- [MUST] Avoid destructive/heavy health checks and avoid exposing sensitive topology/configuration.
- [MUST] Include critical dependency readiness only when failure truly makes the service unsafe/unavailable; otherwise report degraded state separately.
- [MUST] Verify startup configuration and migration compatibility before readiness.
- [MUST] Define job/consumer/scheduler health separately from HTTP health where applicable.
- [BLOCKER] A shallow ?200 OK? health endpoint is not proof that critical workflows work.

## 6. Alerts and dashboards

- [MUST] Alert on actionable symptoms with owner, severity, runbook/recovery path, deduplication, and escalation.
- [MUST] Cover sustained error/latency, dependency outage, exhausted retries/dead letters, queue backlog/age, stuck intermediate state, reconciliation mismatch, security abuse, and critical audit failure as relevant.
- [MUST] Use windows/thresholds that limit noise and detect meaningful impact.
- [MUST] Dashboard critical flow volume, success, latency, failures, duplicates, retries, backlog, provider health, and deployment comparison.
- [SHOULD] Validate alerts through test/simulation where safe.
- [BLOCKER] Do not call a workflow production-ready when no one can detect or investigate its critical failure.

## 7. Audit records

Audit privileged/admin/impersonation, permission/role, financial, destructive, data export/disclosure, security configuration, recovery/reconciliation, and other business-critical actions.

Record actor/auth context, action, subject/resource, tenant/scope, prior/new state or safe change summary, reason/approval, time, result, correlation/reference, source/channel, and immutable linkage.

- [MUST] Keep audit separate from debug logs and apply stricter access/retention/tamper controls.
- [BLOCKER] The actor must not be able to silently edit/delete the only evidence.
- [MUST] Avoid storing secrets or excessive personal payloads in audit.
- [MUST] Record failed privileged attempts where useful for security.
- [MUST] Define audit write failure behavior for critical actions; do not silently proceed if audit is a required invariant.
- [MUST] Test audit emission, authorization, tenant isolation, and retention behavior.

## 8. Operational completion gate

- [BLOCKER] Critical operations have correlation, failure evidence, detection, and a recovery/reconciliation path.
- [MUST] Logs, metrics, traces (when available), health, alerts, and audit match the actual failure model.
- [MUST] Telemetry is redacted, access-controlled, bounded-cardinality, and cost-aware.
- [MUST] Report unavailable platform observability and the manual/compensating operational control.
