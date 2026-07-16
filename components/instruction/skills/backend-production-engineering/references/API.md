# API, Validation, Errors, Integrations, Webhooks, and Storage

## Contents

1. API contracts
2. Validation and normalization
3. Error contracts
4. External integrations
5. Webhooks
6. Files and storage
7. Import/export and synchronization
8. Contract review

## 1. API contracts

Define request, response, error, authentication, authorization, tenant/resource scope, side effects, status/result codes, naming, pagination/filter/sort, idempotency, timeout, retry safety, rate limits, compatibility, deprecation, examples, and observability.

- [BLOCKER] Validate input at the server boundary before side effects.
- [BLOCKER] Authorize action and resource independently of client presentation.
- [MUST] Return explicit response DTOs/projections; do not leak raw database/provider objects or internal fields.
- [MUST] Use stable machine-readable business/error codes separated from user-safe messages and internal diagnostics.
- [MUST] Keep list contracts bounded with server-enforced maximums and deterministic pagination.
- [BLOCKER] Do not silently change request/response/error/event semantics.
- [MUST] Version or migrate breaking contracts and maintain compatible deployment order.
- [MUST] Declare whether mutations are retry-safe and require idempotency where duplicate delivery can repeat effects.
- [MUST] Keep an endpoint/function cohesive; avoid ?do everything? commands.
- [SHOULD] Use protocol-appropriate status semantics consistently with existing project conventions.
- [MUST] Document deprecation owner, replacement, compatibility window, telemetry, and removal condition.

## 2. Validation and normalization

Validate types, presence, format, range, length, enum, cross-field rules, business invariants, references, ownership, dates, money/currency, URLs, files, and duplicates.

- [BLOCKER] Treat declared client types as untrusted runtime input.
- [BLOCKER] Do not trust client-computed price, total, discount, commission, role, permission, owner, tenant, or payment success.
- [MUST] Produce field/path-specific validation errors without exposing internal implementation.
- [MUST] Normalize trimming, case, phone/email, Unicode, URL, date, and identifiers only under an explicit canonicalization rule.
- [BLOCKER] Do not silently ?repair? security-, identity-, money-, or state-critical input.
- [BLOCKER] Reject invalid input before partial side effects; do not swallow and continue.
- [MUST] Validate referential existence and authorization separately.
- [MUST] Apply server-side maximums for strings, arrays, nested depth, batch size, file size, and expensive filters.
- [SHOULD] Preserve original user input separately only when audit/business needs justify it.

## 3. Error contracts

Classify validation, unauthenticated, forbidden, not found, conflict, business rejection, rate limit, dependency failure, timeout, retryable, non-retryable, and internal errors.

- [BLOCKER] Never return raw exceptions, stack traces, SQL/provider internals, secrets, or sensitive configuration.
- [BLOCKER] Never use an empty catch or log-and-pretend-success behavior.
- [MUST] Preserve root cause and contextual identifiers in internal logs without sensitive payloads.
- [MUST] Normalize errors at boundaries into stable codes, safe messages, retry guidance, and correlation/request IDs.
- [MUST] Do not collapse all failures into one generic response when callers need distinct action.
- [MUST] Model partial success explicitly; otherwise a required partial failure is failure.
- [MUST] Distinguish retryable dependency/transient errors from validation/business/permanent errors.
- [MUST] Avoid revealing whether an inaccessible cross-tenant/private resource exists.
- [SHOULD] Keep localization/presentation text outside domain error identity.

## 4. External integrations

For each provider define adapter owner, auth/secret storage, request/response mapping, timeout, retry/backoff/jitter/max attempts, rate-limit handling, idempotency, circuit/fallback when justified, contract test, monitoring, outage behavior, reconciliation, and provider migration.

- [BLOCKER] No external call without a finite timeout or verified platform-enforced equivalent.
- [BLOCKER] No infinite retry or retry of non-idempotent operations without deduplication.
- [BLOCKER] Never log access tokens, credentials, signed payload secrets, or unnecessary sensitive provider data.
- [MUST] Map provider errors at one boundary; do not couple multiple modules to raw provider contracts.
- [MUST] Validate provider responses and handle missing/extra/invalid fields.
- [MUST] Bound provider latency within request/job budgets and define cancellation/unknown-result handling.
- [MUST] Reconcile unknown/time-out results before repeating financial/destructive effects.
- [SHOULD] Add a circuit breaker only when failure volume, provider characteristics, and project infrastructure justify it.
- [MUST] Define degraded behavior and alerting for provider outage.
- [MUST] Use contract/sandbox tests without treating mocks as proof of production behavior.

## 5. Webhooks

- [BLOCKER] Verify signature/authenticity using the provider?s current supported method.
- [MUST] Verify timestamp/nonce and prevent replay when supported.
- [BLOCKER] Validate payload and event type; do not trust event order or completeness.
- [MUST] Persist provider/event ID and processing state for idempotency and investigation.
- [BLOCKER] Duplicate delivery must not duplicate business effects.
- [MUST] Handle late, out-of-order, unknown, retried, and schema-evolved events.
- [MUST] Acknowledge within provider timeout; separate long processing into verified durable work when appropriate.
- [MUST] Store raw event only when needed, encrypted/access-controlled/redacted with retention defined.
- [MUST] Provide dead-letter/manual review/replay and reconciliation for critical failures.
- [BLOCKER] Client redirects cannot establish payment truth.
- [MUST] Trace webhook receipt, validation, deduplication, processing, resulting state, and retries without secrets.
- [BLOCKER] Do not lose important events silently or delete the only evidence before successful processing.

## 6. Files and storage

Define maximum size, allowed content, MIME/extension/signature validation, malware risk, owner/tenant, key/path, metadata, private/public policy, signed URL expiry, upload state, transformation, download authorization, retention, deletion, orphan/failed cleanup, and audit.

- [BLOCKER] Do not trust filename, extension, client MIME, path, owner, or tenant.
- [BLOCKER] Private data cannot use public/guessable access without an approved protection model.
- [BLOCKER] Authorize downloads and signed-URL issuance against current ownership/tenant/permission.
- [MUST] Generate storage keys safely; prevent path traversal, overwrite, and cross-tenant collision.
- [MUST] Keep original filename as sanitized metadata, not authority/path.
- [MUST] Enforce file and request size limits before costly processing.
- [MUST] Validate content signature/type when risk warrants; define malware scanning/quarantine for untrusted executable/office/archive content.
- [MUST] Track upload processing state and clean failed/orphaned records/files.
- [MUST] Define signed URL lifetime, revocation limits, logging, and cache behavior.
- [MUST] Coordinate record/file deletion and recovery; do not leave indefinite orphaned private data.
- [BLOCKER] Never put secrets in URLs, filenames, public metadata, or client-visible storage configuration.

## 7. Import/export and synchronization

- [BLOCKER] Authorize the dataset and fields before import/export/sync.
- [MUST] Bound size, rows, files, duration, concurrency, and provider/API usage.
- [MUST] Validate each row/object and produce safe row-level errors without partial-success ambiguity.
- [MUST] Define atomic batch versus partial progress, checkpoint, idempotency, resume, cancellation, and rollback/compensation.
- [MUST] Stream/batch large data rather than loading it wholly into memory.
- [MUST] Version formats and preserve backward compatibility during active imports/exports.
- [MUST] Protect formula injection, malicious archives, unsafe filenames, and data exfiltration.
- [MUST] Track progress, actor, scope, counts, failures, and result location with retention.
- [MUST] Reconcile synchronization conflicts, deletion semantics, clocks/versions, and source-of-truth ownership.
- [BLOCKER] Do not overwrite newer authoritative data with stale external/client input.

## 8. Contract review

Record contract owner/consumers, schemas/examples, validation/normalization, auth/tenant/resource scope, fields exposed, side effects, idempotency/retry/timeout/rate limits, errors, compatibility/deprecation, provider/storage behavior, observability/audit, tests, migration/rollback, and residual risk.
