# Security Review Workflow

- id: security-review
- version: 1.0.0
- status: ACTIVE
- applies_when: a bounded design, implementation, dependency, configuration, or system surface requires threat analysis and control validation.
- goal: identify and remediate material threats with evidence while preserving authorized scope and sensitive data.
- risk_floor: HIGH; CRITICAL for active compromise, exposed secrets, cross-tenant access, destructive security action, or regulated data impact.
- required_skills:
  - project-orchestrator
  - project-memory
  - security-threat-modeling
  - testing-quality
  - documentation-sync
- optional_skills:
  - system-architecture
  - ui-ux-production
  - backend-production-engineering
  - api-integration
  - data-lifecycle
  - dependency-evolution
  - observability-incident
  - code-review-refactoring
  - ai-agent-safety
- approval_gates:
  - AG-02 destructive action
  - AG-03 production action
  - AG-05 security/identity mutation
  - AG-06 contract break
  - AG-09 sensitive data
  - AG-11 control weakening

## Inputs

- authorized scope, assets, actors, trust/data flows, roles, data classes, dependencies, and deployment evidence
- existing controls, prior findings/incidents, abuse cases, operational constraints, and test authorization

## Outputs

- threat model and prioritized findings
- control and remediation mapping
- authorized security test evidence
- monitoring, response, residual risk, docs, and memory

## Pre-task gate

- [ ] scope, test authorization, assets, trust boundaries, data classes, and privileged operations are explicit
- [ ] current architecture and controls are verified rather than assumed
- [ ] finding severity criteria, evidence handling, disclosure, stop, and recovery rules are set

The orchestrator must issue a Task Execution Brief. Stop before any action whose approval gate is unsatisfied.

## Execution phases

1. **Model** ? Map assets, actors, privileges, trust boundaries, entry points, data flows, dependencies, and attacker goals.
2. **Enumerate** ? Identify abuse cases and threats across authorization, isolation, injection, replay, secrets, privacy, supply chain, denial, logging, and recovery.
3. **Prioritize** ? Score impact, exploitability, exposure, detectability, affected principals, and control strength.
4. **Inspect** ? Trace authoritative enforcement paths and review defaults, bypasses, race conditions, errors, logs, configuration, and dependency posture.
5. **Test** ? Execute only authorized negative, boundary, replay, rate, isolation, leakage, dependency, and secure-failure tests.
6. **Remediate** ? Fix root controls in small reviewable changes and add regression evidence plus detection/recovery.
7. **Report** ? Record sanitized findings, severity, evidence, owner, remediation, verification, accepted risk, expiry, and disclosure status.

## Validation

- authorization and tenant/object isolation fail closed at authoritative boundaries
- sensitive input, output, secrets, logs, errors, dependencies, rate/cost limits, and recovery paths were tested
- HIGH/CRITICAL findings are fixed or explicitly accepted by authorized ownership with compensating controls

## Completion criteria

- [ ] scope has a complete threat/control map and material tests
- [ ] no unapproved HIGH/CRITICAL finding or exposed sensitive artifact remains
- [ ] remediation, monitoring, response, documentation, and memory are complete

## Rollback or recovery

Security mutations remain staged and reversible where possible. Active compromise switches to incident-response; secret rotation or production containment requires exact authority and an exposure/recovery plan.

## Project Memory write-back

Store sanitized durable threats, decisions, incidents, control patterns, accepted risk, and remediation status. Never store exploit secrets, credentials, personal data, or raw sensitive evidence.

## Final report

State outcome, scope, changed artifacts, validation evidence, unavailable checks, approvals, rollback/recovery readiness, residual risk, documentation, memory delta, and next safe action.
