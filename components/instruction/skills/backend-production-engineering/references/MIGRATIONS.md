# Migrations, Compatibility, and Deployment

## Contents

1. Migration classification
2. Expand-migrate-contract
3. Data migration/backfill
4. API/event/job compatibility
5. Deployment and rollback
6. Verification and audit
7. Migration blockers

## 1. Migration classification

Classify schema, data, backfill, API/contract, state/enum, permission, provider, configuration/secret, storage, cache, search/projection, job/event payload, or runtime dependency migration. Record affected versions/environments, consumers, data volume, lock/load risk, compatibility window, reversibility, and owner.

- [BLOCKER] Do not run or imply a production migration without explicit authorization and environment evidence.
- [MUST] Separate code change, schema expansion, backfill, cutover, contraction, and cleanup.
- [MUST] Treat migration scripts/jobs as production code: versioned, reviewed, observable, bounded, retry-safe/idempotent when rerunnable, and tested.
- [MUST] Define backup or verified recovery for important data changes.
- [BLOCKER] Do not make destructive/incompatible changes while old code/workers/messages may still run.

## 2. Expand-migrate-contract

Default sequence:

1. Expand schema/contract compatibly.
2. Deploy code that tolerates old and new representations.
3. Backfill/migrate in bounded batches.
4. Verify counts/invariants/mismatches.
5. Switch reads/writes or feature flag.
6. Observe compatibility window.
7. Contract/remove old representation.
8. Clean up only after proof.

- [MUST] Add nullable/defaulted/new fields compatibly before requiring them.
- [MUST] Keep old readers/writers and in-flight jobs/events compatible during rolling deployment.
- [BLOCKER] Do not remove/rename a field before every consumer stops using it.
- [BLOCKER] Do not change field/state meaning without migrating historical data and contracts.
- [MUST] Use feature flags/cutover controls when they materially reduce risk; define removal.
- [SHOULD] Prefer forward-fix/forward-only for migrations whose rollback would corrupt or lose new data; document why.

## 3. Data migration/backfill

- [MUST] Estimate rows/bytes/duration/locks/write amplification/provider cost and production traffic interaction.
- [MUST] Batch/stream large changes with bounded concurrency, checkpoints, resume, cancellation, rate control, and progress.
- [BLOCKER] Do not migrate large data in a user request.
- [MUST] Make reruns idempotent or persist exact progress and duplicate protection.
- [MUST] Validate source and target schemas, transformations, timezone/money/enum semantics, ownership/tenant scope, and invalid legacy cases.
- [MUST] Define quarantine/manual review for records that cannot migrate safely.
- [MUST] Verify pre/post counts, checksums/aggregates, invariants, samples, and reconciliation.
- [MUST] Protect sensitive data in temporary files/logs/backups and clean them under retention policy.
- [BLOCKER] Never silently drop malformed/unknown data to make a migration pass.
- [MUST] Monitor latency/error/locks/backlog and pause safely when thresholds breach.

## 4. API/event/job compatibility

- [MUST] Inventory consumers, deployment order, cached clients, integrations, old workers, scheduled jobs, queued events, and webhooks.
- [MUST] Maintain tolerant readers and explicit versioning for incompatible changes.
- [MUST] Version durable event/job payloads and support old in-flight versions until drained/expired/migrated.
- [BLOCKER] Do not silently change error codes, pagination semantics, idempotency behavior, field meaning, or authorization scope.
- [MUST] Define deprecation telemetry, communication, deadline, and removal condition.
- [MUST] Test old client/new server and new client/old server where rolling compatibility requires it.
- [MUST] Version cache/projection/search formats and invalidate/rebuild safely.

## 5. Deployment and rollback

Define environment, prerequisites, configuration/secrets, migration order, code version compatibility, health/readiness, feature flags, traffic switch, smoke/contract checks, monitoring window, owner, rollback trigger, and recovery steps.

- [BLOCKER] A rollback plan cannot assume the old code can read a newly incompatible schema.
- [MUST] Distinguish code rollback, feature disable, data restoration, compensating migration, and forward repair.
- [MUST] Test rollback/recovery or dry-run it at a representative level for high-risk changes.
- [MUST] Avoid mixed-version side effects that duplicate jobs/events or violate invariants.
- [MUST] Coordinate scheduler/worker deployment and pause/drain when needed.
- [MUST] Keep deployment repeatable and record the applied version/result.
- [BLOCKER] Do not expose traffic before required schema/config/permission/readiness conditions pass.
- [MUST] Define abort thresholds and who can initiate rollback/recovery.

## 6. Verification and audit

Record migration ID/version, plan/approval, source/target, start/end, actor/automation, batches/progress, counts, errors/quarantine, verification, deployment versions, rollback/recovery, and final status.

- [MUST] Validate schema and data invariants before and after.
- [MUST] Compare expected/actual rows, mismatches, failures, and unresolved records.
- [MUST] Monitor application errors, latency, queue/backlog, database/platform load, and business safety metrics after cutover.
- [MUST] Preserve audit evidence without secrets/private payloads.
- [MUST] Keep cleanup as a separate verified step after the compatibility window.

## 7. Migration blockers

- [BLOCKER] Direct destructive schema change while old versions may run.
- [BLOCKER] Field removal before consumers migrate.
- [BLOCKER] Large migration in a user request or unbounded one-shot job.
- [BLOCKER] Important data migration without backup/recovery.
- [BLOCKER] State/enum/meaning change without historical-data handling.
- [BLOCKER] Untested production migration on representative data/scale.
- [BLOCKER] Rerunnable environment with non-idempotent migration and no progress guard.
- [BLOCKER] Missing tenant/permission/privacy controls during migration.
- [BLOCKER] No verification or recovery for partial completion.
