# Incident Response Workflow

- id: incident-response
- version: 1.0.0
- status: ACTIVE
- applies_when: production or a critical environment has active or suspected user impact, security compromise, data risk, or material degradation.
- goal: protect users and data, contain impact, restore verified service, preserve evidence, communicate under authority, and prevent recurrence.
- risk_floor: CRITICAL by default; diagnostic read-only steps may be lower but remain inside incident control.
- required_skills:
  - project-orchestrator
  - project-memory
  - observability-incident
  - security-threat-modeling
  - testing-quality
  - documentation-sync
- optional_skills:
  - backend-production-engineering
  - api-integration
  - data-lifecycle
  - code-review-refactoring
  - dependency-evolution
  - devops-release
  - performance-scalability
- approval_gates:
  - AG-02 destructive action
  - AG-03 production action
  - AG-05 security boundary
  - AG-07 external communication
  - AG-09 sensitive data
  - AG-12 critical incident action

## Inputs

- impact, symptoms, severity, timeline, affected users/systems/data, telemetry, recent changes, and incident authority
- architecture, dependencies, runbooks, owners, communication channels, access boundaries, and recovery options

## Outputs

- single evidence/action timeline
- contained impact and verified recovery
- authorized communications and handoff
- blameless review with owned corrective actions and memory

## Pre-task gate

- [ ] incident lead/authority, severity, impact, communication channel, and action log exist
- [ ] evidence preservation, sensitive-data handling, and access boundaries are clear
- [ ] each proposed action has hypothesis, owner, expected signal, stop condition, and rollback

The orchestrator must issue a Task Execution Brief. Stop before any action whose approval gate is unsatisfied.

## Execution phases

1. **Declare** ? Open incident control, assign roles, set severity, impact, cadence, authority, and a single timestamped log.
2. **Observe** ? Start with user/business impact; correlate metrics, logs, traces, dependencies, changes, and security/data signals.
3. **Hypothesize** ? Rank falsifiable causes and choose the smallest safe diagnostic or containment action.
4. **Contain** ? Limit blast radius and protect users/data before broad remediation, recording every authorized action.
5. **Recover** ? Restore service through rollback, failover, configuration, repair, or forward-fix and verify independent signals.
6. **Monitor** ? Watch recurrence and secondary data/security effects; communicate status only through authorized channels.
7. **Learn** ? Build a blameless timeline, root/contributing factors, detection gaps, corrective actions, owners, priorities, and due conditions.

## Validation

- recovery is confirmed by user/business signals, not infrastructure health alone
- security/data integrity and any queued/partial effects are reconciled
- hypotheses, actions, outcomes, approvals, and communications are preserved and time-ordered

## Completion criteria

- [ ] impact is contained and stable or explicitly handed off
- [ ] data/security repair and recurrence monitoring are complete enough for exit criteria
- [ ] review, corrective actions, ownership, runbooks, documentation, and memory are recorded

## Rollback or recovery

During stabilization prefer reversible containment. Destructive recovery needs exact approval. If evidence is insufficient, preserve state and reduce action scope; never improvise unlogged critical mutations.

## Project Memory write-back

Create an incident entry for material events with sanitized timeline, verified cause, impact, detection/response lessons, and corrective actions. Store no secrets, personal data, or raw logs.

## Final report

State outcome, scope, changed artifacts, validation evidence, unavailable checks, approvals, rollback/recovery readiness, residual risk, documentation, memory delta, and next safe action.
