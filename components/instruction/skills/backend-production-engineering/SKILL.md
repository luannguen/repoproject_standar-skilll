---
name: backend-production-engineering
description: Analyze, design, implement, refactor, debug, migrate, secure, operate, or review production backend systems using verified project business invariants, data ownership, Base44/platform capabilities, schemas, services, APIs, authentication, authorization, tenant isolation, transactions, idempotency, integrations, jobs, storage, reliability, observability, performance, and deployment constraints. Use for any backend, API, database, entity/model/schema, repository/data-access, service/server function, business logic, authentication/authorization/RBAC/permission/multi-tenant, webhook/integration/payment/order/inventory/ledger, transaction/concurrency, queue/event/job/cron/automation, storage/upload, notification/email, cache, migration/import/export/synchronization, audit/security/performance/reliability/observability, or production-deployment task.
---

# Backend Production Engineering

Use this skill after Project Memory retrieval and before any backend analysis, code, refactor, debug, migration, or review. Never infer application or platform capabilities that current sources do not prove.

## Skill contract

- id: backend-production-engineering
- name: Backend Production Engineering
- version: 1.1.0
- description: protect business invariants and operate backend changes safely across data, contracts, security, concurrency, failure, performance, observability, migration, and recovery.
- purpose: make every backend task evidence-backed, production-scoped, reusable, secure, recoverable, observable, testable, and explicit about residual risk.
- scope: backend architecture, platform capability analysis, domain/data/API/security/integration/reliability/operations, implementation, review, debugging, migration, and production readiness.
- triggers: any backend, API, database, entity/model/schema, repository/data access, service/function, auth/permission/tenant, transaction, webhook/integration/payment/order/inventory/ledger, queue/event/job/cron, storage/upload, notification/email, cache, migration/import/export/sync, audit/security/performance/reliability/observability/deployment task.
- exclusions: does not invent domain rules, schemas, platform guarantees, infrastructure, production state, or authority; does not execute production, migration, dependency, or contract-breaking actions without approval.
- required_inputs:
  - business goal, actors, invariants, state transitions, data ownership, source of truth, reversibility, approval, and financial/tenant impact
  - current instructions, manifests, architecture, platform configuration, entities/schema/migrations, services/functions, integrations, auth/permissions, tests, deployment, and runtime evidence
  - request/response/error/event contracts, trust boundaries, consistency needs, expected load, failure modes, recovery objectives, and compatibility constraints
- expected_outputs:
  - Memory Context and a concise Backend Decision Summary
  - reuse/extend/create decision plus scoped implementation plan
  - data, authorization, tenant, transaction, concurrency, idempotency, failure, recovery, observability, migration, rollback, and test analysis
  - implementation or evidence-backed review, validation evidence, exceptions, residual risk, backend debt, and memory delta
- required_files:
  - ../../PROJECT-CONSTITUTION.md
  - ../../AI-BOOTSTRAP.md and ../project-memory/SKILL.md through bootstrap routing
  - references/RULES.md, references/CHECKLIST.md, and every task-matched reference listed below
  - relevant current project sources, tests, configuration, and authoritative platform documentation
- related_skills:
  - project-memory
  - ui-ux-production
  - data-lifecycle
  - api-integration
  - security-threat-modeling
- prerequisite_skills:
  - project-memory
- next_skills:
  - testing-quality
  - security-threat-modeling when trust boundaries change
  - migration-compatibility when persisted/public contracts change
  - observability-incident when operational behavior changes
  - documentation-sync
- constraints: do not invent business rules, schemas, permissions, architecture, platform guarantees, or production behavior; do not code before evidence and pre-task gates; prefer the simplest safe architecture; keep gated actions behind approval.
- blockers: missing authoritative facts that determine correctness or safety; unverified transaction/authorization/tenant guarantees; unmitigated data-loss, secret-exposure, financial, cross-tenant, destructive-migration, or unrecoverable partial-failure risk; unresolved BLOCKER exception.
- approval_requirements: production/deployment mutation, destructive or persisted-data migration, major dependency/platform evolution, public-contract break, broad security/identity change, or material scope/cost expansion requires the matching approval gate.
- execution_workflow: follow the Mandatory workflow below in order; every step is a BLOCKER gate when applicable.
- pre_task_checklist:
  - retrieve and verify Project Memory, invariants, ownership, contracts, permissions, incidents, and current sources
  - search for reusable entities, services, adapters, validation, authorization, errors, transactions, observability, tests, and platform evidence
  - define data/contract impact, failure/recovery, compatibility, migration, validation, rollback, risk, and approvals before code
- post_task_checklist:
  - verify invariants, validation, authorization, tenant isolation, concurrency/idempotency, partial failure, recovery, compatibility, and bounded work
  - run available tests and operational, security, migration, and regression checks
  - report unavailable checks, exceptions, residual risk, documentation, backend debt, and memory delta
- validation_process: complete role-based self-review and every available check in CHECKLIST.md; report unavailable checks, reason, manual evidence, production-readiness condition, and residual risk.
- completion_criteria: satisfy the Completion gate with no unapproved BLOCKER/MUST exception and no unsupported production-ready claim.
- exception_policy: record rule, cause, scope, affected data/modules, risk, compensating control, rollback, long-term remediation, owner/approval condition, and expiry; never silently downgrade BLOCKER/MUST.
- memory_read_policy: retrieve only task-relevant invariants, data ownership, contracts, permissions, incidents, patterns, debt, and checkpoints; verify against current sources and platform evidence.
- memory_write_policy: store only durable verified backend facts, decisions, incidents, patterns, risks, debt, and outcomes; never store secrets, production data, unsupported platform claims, or temporary diagnostics.
- update_policy: add only reusable, evidenced rules/patterns; update CHANGELOG; require user approval to weaken BLOCKER/MUST, authorization, tenant isolation, data integrity, security, audit, compatibility, or production requirements, or to change global instruction architecture/core dependencies/contracts.

## Verified project baseline

The repository currently contains instructions only. No application source, Base44 project configuration, manifest, entity/schema, service/function, authentication/authorization, integration, migration, test, deployment, logging, or runtime evidence exists. Treat every application-specific capability and business fact as unknown. Re-run discovery whenever sources arrive; this skill is a production procedure, not proof that the application is production-ready.

## Mandatory workflow

1. Classify the task and risk: schema/entity, API/service, business rule, auth/permission/tenant, integration/webhook/payment, transactional workflow, job/cron/event, storage/import/export, migration, performance/security/reliability, bug/refactor, deployment, or cross-cutting architecture.
2. Complete Project Memory retrieval and verify relevant invariants, ownership, schema/migrations, contracts, permissions, integrations, incidents, operations, debt, and the closest checkpoint.
3. Read [RULES.md](references/RULES.md), [CHECKLIST.md](references/CHECKLIST.md), and the task-matched references in Progressive reference loading.
4. Search current sources for analogous entities, schemas, services/functions, validation, permission, errors, transactions, adapters, pagination, logging, tests, migrations, utilities, configuration, and platform capability evidence. Do not create before completing reuse discovery.
5. Produce a Backend Decision Summary: goal; actors; invariants; source of truth; ownership; trust boundaries; authorization/tenant scope; read/write paths; transaction/consistency; concurrency/idempotency; failure/recovery; observability; migration; reuse; risks; proposed implementation.
6. When options are materially different, compare at most three and recommend one. Mark every capability claim as platform-provided, project-built, unsupported, partial, or requiring compensation, with evidence.
7. Define contract/data impact and an implementation plan: files read/changed/created, reused/extended modules, flow boundaries, request/response/error/event contracts, schema/state/permission/tenant effects, transaction/idempotency/retry/audit, compatibility, migration/rollback, tests, and non-goals.
8. Implement under verified architecture: validate at boundaries, authorize on the server, protect tenant/data invariants, bound work, design duplicate/concurrent/partial failure behavior, preserve compatibility, and add investigation-quality observability.
9. Self-review as domain, data-integrity, security, authorization, tenant, transaction, concurrency, reliability, performance, observability, migration, and regression reviewer.
10. Run every available validation. Report each unavailable check with reason, risk, manual verification, and the condition needed to establish production readiness.
11. Report outcome and material Project Memory delta; record debt/risk; update this skill only under its safe update policy.

## Progressive reference loading

- Every task: [RULES.md](references/RULES.md) and [CHECKLIST.md](references/CHECKLIST.md).
- Boundaries/reuse/platform: [ARCHITECTURE.md](references/ARCHITECTURE.md) and [PLATFORM.md](references/PLATFORM.md).
- Entity/schema/query/money: [DATA.md](references/DATA.md).
- API/validation/error/integration/webhook/storage: [API.md](references/API.md).
- Auth/authorization/tenant/abuse/privacy/config: [SECURITY.md](references/SECURITY.md).
- Transaction/idempotency/jobs/performance/failure recovery: [RELIABILITY.md](references/RELIABILITY.md).
- Logs/metrics/traces/audit/health/alerts: [OBSERVABILITY.md](references/OBSERVABILITY.md).
- Schema/data/API deployment compatibility: [MIGRATIONS.md](references/MIGRATIONS.md).
- Test strategy and validation: [TESTING.md](references/TESTING.md).
- Design choices: [PATTERNS.md](references/PATTERNS.md); review/refactor: [ANTI-PATTERNS.md](references/ANTI-PATTERNS.md).
- Before modifying the skill: [CHANGELOG.md](references/CHANGELOG.md).

## Completion gate

- [BLOCKER] Business invariants, source of truth, trust boundary, authorization, tenant scope, validation, data impact, failure/recovery, and applicable concurrency/idempotency are explicit.
- [BLOCKER] No known mass assignment, cross-tenant access, unbounded production query, sensitive-data exposure, raw error/secret leakage, unsafe duplicate effect, or unsupported atomicity claim remains.
- [MUST] Available typecheck, lint, build, unit/integration/authorization/tenant/validation/idempotency/concurrency/migration/integration/error/regression checks ran.
- [MUST] Migration/rollback or recovery, backward compatibility, observability, changed files/contracts, exceptions, unavailable checks, remaining risks, backend debt, and memory update are reported.
