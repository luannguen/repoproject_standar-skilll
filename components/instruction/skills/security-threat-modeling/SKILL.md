---
name: security-threat-modeling
description: Threat-model and validate trust boundaries, identity, authorization, tenant isolation, input handling, secrets, privacy, abuse resistance, supply chain, logging, and incident response for engineering changes.
---

# Security and Threat Modeling

## Skill contract

- id: security-threat-modeling
- name: Security and Threat Modeling
- version: 1.0.0
- description: Threat-model and validate trust boundaries, identity, authorization, tenant isolation, input handling, secrets, privacy, abuse resistance, supply chain, logging, and incident response for engineering changes.
- purpose: prevent unauthorized access, data exposure, privilege abuse, injection, fraud, denial of service, and unsafe recovery by designing controls before implementation.
- scope: assets, actors, trust boundaries, threats, authn/authz, tenant isolation, validation, cryptography use, secrets, privacy, abuse cases, dependencies, audit, and security verification.
- triggers: auth, permissions, sensitive data, multi-tenant behavior, public endpoints, integrations, uploads, payments, admin actions, AI tools, dependency or infrastructure changes, or security review.
- exclusions: does not perform unauthorized exploitation, invent compliance claims, rotate production secrets, or replace legal/privacy authority.
- required_inputs:
  - system/data-flow evidence and affected assets
  - actors, roles, identities, trust boundaries, data classification, and attacker capabilities
  - existing controls, dependency posture, incident history, and operational constraints
- expected_outputs:
  - bounded threat model and abuse-case inventory
  - security requirements and control mapping
  - security test plan and findings by severity
  - remediation, monitoring, incident, and residual-risk plan
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - system-architecture
  - backend-production-engineering
  - api-integration
  - data-lifecycle
  - ai-agent-safety
  - devops-release
- prerequisite_skills:
  - project-memory
- next_skills:
  - backend-production-engineering
  - testing-quality
  - observability-incident
  - documentation-sync
- constraints: least privilege, deny by default, server-side enforcement, data minimization, defense in depth, secure failure, and evidence-based severity.
- blockers: unknown authority boundary; client-only enforcement; exposed secret; cross-tenant access path; critical unmitigated vulnerability; sensitive operation without audit or recovery.
- approval_requirements: secret rotation, production security mutation, broad permission, intentional control weakening, intrusive testing, sensitive-data handling, or acceptance of HIGH/CRITICAL risk requires explicit authority.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - identify assets, adversaries, entry points, trust boundaries, roles, data classes, and privileged operations
  - inspect auth, validation, secrets, dependency, logging, and incident evidence
  - define threat scope and authorized test boundaries
- post_task_checklist:
  - authorization and isolation are enforced at authoritative boundaries
  - inputs, outputs, secrets, logs, errors, rate/cost limits, and dependencies are hardened
  - security tests, monitoring, response, and residual risks are recorded
- validation_process: test negative authorization, tenant crossover, malformed and oversized input, injection classes, replay, rate abuse, secret and log leakage, dependency findings, and secure failure within authorized scope.
- completion_criteria: material threats have preventive, detective, and recovery controls; HIGH/CRITICAL findings are remediated or explicitly accepted; evidence supports the security claim.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Map assets, actors, privilege levels, data flows, trust boundaries, entry points, dependencies, and attacker goals.
2. Enumerate threats and abuse cases using impact, exploitability, exposure, and detectability; prioritize the highest risk.
3. Specify server-side authorization, isolation, validation, secret, privacy, rate, audit, dependency, and failure controls.
4. Review implementation paths for bypass, confused deputy, injection, replay, race, information leak, denial of service, and insecure defaults.
5. Execute authorized negative tests and inspect logs, errors, telemetry, and recovery behavior for leakage or blind spots.
6. Record findings, remediation, monitoring, incident actions, accepted risk, owner, and expiry.

## Domain gates

- BLOCKER: authentication does not imply authorization; every protected action needs object- and tenant-aware server-side checks.
- BLOCKER: no secret, token, personal data, or sensitive payload may enter source, client bundles, URLs, ordinary logs, or memory artifacts.
- MUST: HIGH and CRITICAL findings block release unless explicitly accepted by authorized ownership with compensating controls.

## Completion report

Report outcome, evidence, decisions, validation, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta without private chain-of-thought.
