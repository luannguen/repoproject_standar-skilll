---
name: observability-incident
description: Instrument, diagnose, contain, recover, and learn from failures using user-impact signals, structured logs, metrics, traces, alerts, runbooks, incident roles, and evidence-preserving response.
---

# Observability and Incident Response

## Skill contract

- id: observability-incident
- name: Observability and Incident Response
- version: 1.0.0
- description: Instrument, diagnose, contain, recover, and learn from failures using user-impact signals, structured logs, metrics, traces, alerts, runbooks, incident roles, and evidence-preserving response.
- purpose: make critical behavior measurable and failures quickly detectable, diagnosable, containable, recoverable, and learnable.
- scope: SLIs/SLOs, metrics, logs, traces, correlation, dashboards, alerts, runbooks, incident triage, containment, mitigation, recovery, communication, review, and corrective actions.
- triggers: logging/metrics/tracing/alerting work, production issue, outage, degradation, incident, unknown failure, runbook, SLO, or operational-readiness task.
- exclusions: does not expose sensitive telemetry, make unapproved critical production changes, assign blame, or invent root cause without evidence.
- required_inputs:
  - user impact, timeline, symptoms, telemetry, recent changes, architecture, dependencies, and SLOs
  - access and authority boundaries, incident severity, owners, runbooks, and recovery options
  - known baselines, alert history, data classification, and retention constraints
- expected_outputs:
  - observable signals and alert/runbook design
  - incident timeline, hypotheses, evidence, actions, and current status
  - containment, recovery, verification, and rollback record
  - blameless root cause and prioritized corrective actions
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - backend-production-engineering
  - api-integration
  - devops-release
  - performance-scalability
  - security-threat-modeling
- prerequisite_skills:
  - project-memory
- next_skills:
  - code-review-refactoring
  - testing-quality
  - documentation-sync
  - project-memory
- constraints: stabilize user impact before deep remediation; preserve evidence; correlate across boundaries; redact sensitive data; distinguish symptom, contributing factor, and verified root cause.
- blockers: no safe visibility into critical impact; unauthorized mitigation; evidence destruction risk; uncontrolled production action; recovery cannot be verified.
- approval_requirements: critical production mutation, traffic/data/security change, external communication, or destructive recovery action requires incident authority or explicit approval.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - establish severity, impact, start time, affected users/systems, incident authority, and communication channel
  - preserve telemetry and enumerate recent changes, dependencies, and safe containment options
  - define action log, hypotheses, stop conditions, and rollback
- post_task_checklist:
  - impact is contained and recovery verified against user-facing signals
  - timeline separates evidence, hypothesis, decision, action, and outcome
  - root cause, detection gap, corrective actions, owners, priorities, and memory updates are recorded
- validation_process: correlate user symptoms with metrics, logs, traces, changes, and dependency signals; falsify hypotheses; verify mitigation and recovery through independent health and business signals.
- completion_criteria: the system is stable or explicitly handed off; impact and recovery are verified; evidence and actions are preserved; follow-ups close root, detection, prevention, and response gaps.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Declare incident context, severity, impact, authority, roles, timeline, and a single action log.
2. Inspect user-facing signals first, then correlate metrics, traces, structured logs, deployments, configuration, dependencies, and recent changes.
3. Form ranked falsifiable hypotheses; take the smallest safe diagnostic or containment step with stop and rollback conditions.
4. Contain impact and restore service before broad root-cause refactoring; observe independent health and business signals.
5. Confirm recovery, monitor for recurrence, communicate status only through authorized channels, and preserve evidence.
6. Run a blameless review covering trigger, root and contributing factors, detection/response gaps, corrective actions, owners, and durable memory.

## Domain gates

- BLOCKER: every production action during an incident needs an owner, timestamp, hypothesis, expected signal, stop condition, and rollback.
- MUST: telemetry uses correlation identifiers and structured fields but excludes secrets and unnecessary personal data.
- MUST: do not close an incident on infrastructure health alone when user/business signals remain degraded.

## Completion report

Report outcome, evidence, decisions, validation, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta without private chain-of-thought.
