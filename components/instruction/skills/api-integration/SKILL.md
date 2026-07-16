---
name: api-integration
description: Design, implement, or review internal and external APIs, webhooks, events, SDK boundaries, and third-party integrations for contract clarity, security, compatibility, idempotency, resilience, and observability.
---

# API and Integration Engineering

## Skill contract

- id: api-integration
- name: API and Integration Engineering
- version: 1.0.0
- description: Design, implement, or review internal and external APIs, webhooks, events, SDK boundaries, and third-party integrations for contract clarity, security, compatibility, idempotency, resilience, and observability.
- purpose: make integration behavior explicit, compatible, secure, replay-safe, diagnosable, and recoverable.
- scope: HTTP/RPC APIs, events, webhooks, callbacks, authentication, validation, error models, versioning, pagination, retries, rate limits, idempotency, third-party lifecycle, and contract tests.
- triggers: new or changed endpoint, webhook, event, external provider, synchronization, import/export, SDK, API client, or integration incident.
- exclusions: does not own domain invariants, database physical design, vendor purchasing, or production credential mutation.
- required_inputs:
  - consumer and provider contracts or documentation
  - domain operations, authorization rules, data classification, and consistency needs
  - current clients, compatibility window, quotas, SLAs, and failure evidence
- expected_outputs:
  - versioned contract and error semantics
  - auth, validation, idempotency, retry, timeout, and rate-limit design
  - compatibility and rollout plan
  - contract/integration tests and operational telemetry
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - backend-production-engineering
  - data-lifecycle
  - security-threat-modeling
  - observability-incident
  - migration-compatibility
- prerequisite_skills:
  - project-memory
- next_skills:
  - backend-production-engineering
  - security-threat-modeling
  - testing-quality
  - observability-incident
- constraints: treat external systems as unreliable; minimize shared secrets and data; never rely on undocumented provider behavior.
- blockers: unknown consumer or authorization boundary; unversioned breaking change; replayable side effect without idempotency; no recovery for partial synchronization; secret exposure.
- approval_requirements: public contract break, new paid provider, production credential or webhook mutation, and sensitive-data export require their explicit gates.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - identify contract owners, consumers, environments, and data classification
  - inspect existing conventions, clients, error models, and provider limits
  - define compatibility, delivery, ordering, and consistency requirements
- post_task_checklist:
  - contract, errors, auth, validation, pagination, limits, timeout, retry, idempotency, and replay behavior are explicit
  - consumer migration and provider failure paths are tested
  - correlation, metrics, audit, runbook, and recovery are present where risk requires
- validation_process: run schema/contract tests, negative auth and validation cases, duplicate/reorder/retry simulations, timeout and provider-failure cases, compatibility checks, and redaction review.
- completion_criteria: all integration boundaries have explicit contracts and owners; failure and replay are safe; compatibility and operations are validated; secrets and sensitive data are protected.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Inventory producers, consumers, authority boundaries, data classes, quotas, and current contracts.
2. Specify request/event schemas, validation, authentication, authorization, response/error taxonomy, and compatibility version.
3. Design timeouts, retry eligibility, backoff, circuit behavior, idempotency, deduplication, ordering, and reconciliation.
4. Implement through an isolated adapter or boundary that prevents provider details leaking into domain logic.
5. Add contract, integration, security, duplicate, failure, and backward-compatibility tests.
6. Instrument correlation, latency, error, retry, quota, and reconciliation signals; document runbook and rollout.

## Domain gates

- BLOCKER: side-effecting retries require a stable idempotency or deduplication key and defined retention.
- BLOCKER: webhook authenticity and replay protection must be verified before processing.
- MUST: errors distinguish caller correction, authentication, authorization, conflict, rate limit, transient provider failure, and permanent failure.

## Completion report

Report the outcome, evidence inspected, decisions made, validation performed, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta. Do not expose private chain-of-thought.
