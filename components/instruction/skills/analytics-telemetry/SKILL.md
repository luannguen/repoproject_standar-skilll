---
name: analytics-telemetry
description: Design and govern product analytics and operational telemetry with explicit decisions, stable event contracts, identity semantics, quality controls, privacy, retention, cost, and trustworthy interpretation.
---

# Analytics and Telemetry Engineering

## Skill contract

- id: analytics-telemetry
- name: Analytics and Telemetry Engineering
- version: 1.0.0
- description: Design and govern product analytics and operational telemetry with explicit decisions, stable event contracts, identity semantics, quality controls, privacy, retention, cost, and trustworthy interpretation.
- purpose: collect the minimum reliable data needed for named product or operational decisions without creating privacy, quality, or cost debt.
- scope: measurement plans, events, properties, identity/session semantics, consent, schemas, validation, taxonomy, pipelines, dashboards, experiments, retention, deletion, governance, and telemetry quality.
- triggers: analytics event, tracking, dashboard, funnel, experiment, KPI, product metrics, telemetry schema, attribution, consent, or data-quality task.
- exclusions: does not collect data without purpose, infer causal claims from correlation, bypass consent/privacy rules, or choose business metrics without an owner.
- required_inputs:
  - decision or question, audience, owner, metric definition, and action threshold
  - user journeys, event sources, identity model, data classification, consent, retention, and deletion rules
  - current taxonomy, pipeline, volume, quality, cost, and downstream consumers
- expected_outputs:
  - measurement plan and metric contract
  - versioned event/property taxonomy and identity semantics
  - instrumentation and validation controls
  - quality, privacy, retention, dashboard, and ownership documentation
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - requirement-analysis
  - data-lifecycle
  - security-threat-modeling
  - observability-incident
  - ui-ux-production
- prerequisite_skills:
  - project-memory
- next_skills:
  - testing-quality
  - documentation-sync
  - project-memory
- constraints: data minimization, purpose limitation, consent, stable naming, explicit units/denominators, versioned schemas, and separation of product analytics from diagnostic telemetry.
- blockers: no named decision or owner; undefined identity/denominator; prohibited sensitive attribute; consent or retention unresolved; metric cannot be validated end to end.
- approval_requirements: new sensitive collection, broader sharing/access, external analytics provider, retention expansion, experiment with material user impact, or production telemetry mutation uses the matching gate.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - state decision, owner, audience, metric formula, threshold, and expected action
  - map journey, event source, identity/session, consent, classification, retention, deletion, and consumers
  - inspect existing taxonomy, duplicates, pipeline quality, volume, and cost
- post_task_checklist:
  - event schemas, properties, units, identity, timestamps, version, source, and deduplication are explicit
  - collection is minimized and consent/retention/deletion controls are enforced
  - end-to-end validation, quality monitoring, dashboard semantics, and ownership are documented
- validation_process: verify events from source through transport, storage, transformation, and query; test schema rejection, duplicate/order/time semantics, consent, deletion, sampling, volume/cost, and metric reconciliation.
- completion_criteria: the metric answers a named decision reliably; event contracts and governance are stable; privacy and quality controls pass; consumers understand limitations.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Translate the question into a decision, owner, metric formula, denominator, segments, threshold, cadence, and action.
2. Inventory existing events and authoritative sources; define identity, session, time, ordering, deduplication, consent, retention, deletion, and classification semantics.
3. Design the minimum versioned event and property schema with naming, types, units, sources, allowed values, and compatibility.
4. Instrument at the authoritative event boundary and add validation, sampling rules, redaction, quality counters, and cost limits.
5. Test end to end with known journeys, malformed/duplicate/out-of-order cases, consent states, deletion, reconciliation, and dashboard queries.
6. Document taxonomy, metric caveats, ownership, alerts, retention, downstream consumers, and change policy.

## Domain gates

- BLOCKER: every collected field needs a purpose, owner, classification, retention rule, and authorized consumer.
- MUST: metric definitions specify numerator, denominator, unit, time window, timezone, identity, filters, and late/duplicate handling.
- MUST: analytics claims distinguish descriptive correlation from controlled causal evidence.

## Completion report

Report outcome, evidence, decisions, validation, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta without private chain-of-thought.
