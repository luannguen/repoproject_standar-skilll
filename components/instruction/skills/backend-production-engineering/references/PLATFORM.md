# Base44 and Platform Capability Verification

## Contents

1. Current project status
2. Evidence hierarchy
3. Capability matrix
4. Decision procedure
5. Partial/unsupported capability controls
6. Re-verification triggers

## 1. Current project status

No Base44 project source, entity definition, server function, automation, integration, auth configuration, storage configuration, environment configuration, deployment artifact, runtime evidence, or approved platform documentation exists in this repository. Every application-specific Base44 capability is currently unknown.

- [BLOCKER] Do not convert this absence into either ?supported? or ?unsupported.?
- [BLOCKER] Do not claim transaction, query, index, permission, retry, scheduling, logging, storage, webhook, or deployment behavior without evidence.
- [MUST] Rebuild the matrix below when project/platform sources arrive.

## 2. Evidence hierarchy

For each capability collect, in descending relevance:

1. current project configuration/source and reproducible runtime/test evidence;
2. current authoritative Base44/platform documentation applicable to the project version/plan;
3. approved project architecture/contract decisions;
4. provider/library documentation;
5. Project Memory pointers to the above.

- [BLOCKER] Community examples, model recollection, UI labels, or unrelated projects cannot prove a production guarantee.
- [MUST] Record source path/URL, version/date/plan/environment, tested behavior, limits, and unresolved ambiguity.
- [MUST] Distinguish documented guarantee from observed behavior and intended project wrapper behavior.
- [BLOCKER] If evidence conflicts on security, consistency, or data integrity, stop and resolve the conflict before implementation.

## 3. Capability matrix

Complete only relevant rows; add project-specific rows as discovered.

| Capability | Status | Evidence | Limits/semantics | Project use | Compensation | Reverify |
| --- | --- | --- | --- | --- | --- | --- |
| Entities/schema/constraints | unknown | none | unknown | none found | do not invent schema | source arrival |
| Entity permissions/object scope | unknown | none | unknown | none found | server authority required | auth source arrival |
| Authentication/session/revocation | unknown | none | unknown | none found | block auth-dependent design | auth source arrival |
| Server functions/runtime limits | unknown | none | unknown | none found | bound work only after limits known | function source arrival |
| Transactions/atomic operations | unknown | none | unknown | none found | state/idempotency/compensation design required if absent | data source arrival |
| Query/filter/sort/pagination | unknown | none | unknown | none found | no production query claims | entity source arrival |
| Index/uniqueness/concurrency | unknown | none | unknown | none found | do not claim race safety | schema source arrival |
| Automations/cron/scheduling | unknown | none | unknown | none found | overlap/replay must be designed | automation source arrival |
| Queue/event/durable retry | unknown | none | unknown | none found | do not assume delivery semantics | runtime source arrival |
| Integrations/webhooks | unknown | none | unknown | none found | adapter/signature/idempotency required | integration source arrival |
| Storage/private access/signed URLs | unknown | none | unknown | none found | block private-file design | storage source arrival |
| Environment variables/secrets | unknown | none | unknown | none found | never place privileged secret in client | config source arrival |
| Logging/metrics/tracing/audit | unknown | none | unknown | none found | production readiness unverified | operations source arrival |
| Deployment/versioning/rollback | unknown | none | unknown | none found | no deployment claim | deployment source arrival |
| External database/network access | unknown | none | unknown | none found | architecture unresolved | config source arrival |

Allowed status values:

- platform-provided: verified native capability and semantics;
- project-built: verified implementation owned by the project;
- partial: some required semantics/limits are missing;
- unsupported: current authoritative evidence says unavailable;
- unknown: insufficient current evidence;
- compensation-required: native capability is insufficient and a verified project control is required.

## 4. Decision procedure

1. Define the business invariant and guarantee required.
2. Identify the exact platform capability that could provide it.
3. Verify project use, current documentation, runtime limits, plan/version/environment, and failure semantics.
4. Classify the matrix row and cite evidence.
5. Prefer a verified native capability when it fully satisfies the invariant.
6. If partial/unsupported, choose a compensation that can be implemented and observed.
7. Test duplicate, concurrent, timeout, retry, partial-failure, permission, and deployment behavior applicable to the guarantee.
8. Record residual risk and a re-verification trigger.

- [BLOCKER] Never describe sequential updates as atomic without verified atomicity.
- [BLOCKER] Never rely on client-side entity access for operations requiring server authority.
- [BLOCKER] Never expose privileged credentials or server-only configuration to the client.
- [MUST] Preserve useful native capabilities; avoid abstractions that erase security, query, performance, or operational advantages.
- [MUST] Do not rebuild a capability already provided safely by the platform unless evidence shows a real gap.

## 5. Partial/unsupported capability controls

When real transactions are unavailable, evaluate state machines, unique/idempotency records, reservations, optimistic versioning, compensation, recovery jobs, reconciliation, append-only ledger, intermediate states, or manual review queues.

When durable queues/events are unavailable, evaluate bounded synchronous work, platform automations, persisted work records with claimed execution, explicit retry/recovery, or an approved managed service.

When query/index capabilities are limited, redesign access paths, bound datasets, precompute verified projections, batch/stream exports, or use an approved external data system.

When observability is limited, add structured project logs/audit records and operational checks while explicitly stating what remains invisible.

- [BLOCKER] Compensation must match the failure model; a boolean flag is not a substitute for idempotency, durability, or atomicity.
- [MUST] Define owner, alert, repair procedure, and reconciliation for every compensating workflow.
- [MUST] Test the control under the platform?s actual retry/deployment/concurrency behavior.

## 6. Re-verification triggers

Re-run capability verification when Base44/platform plan/version/docs change; project configuration or entities/functions/automations/integrations/storage/auth change; a new limit appears; runtime evidence conflicts; security/consistency behavior is relied on; or deployment architecture changes.

- [MUST] Update Project Memory and this matrix only with reusable, source-backed facts.
- [MUST] Keep volatile platform facts out of generic rules unless tied to an explicit re-verification date/source.
