# Feature Development Workflow

- id: feature-development
- version: 1.0.0
- status: ACTIVE
- applies_when: a new capability or material behavior expansion is requested.
- goal: deliver the smallest coherent feature that meets testable acceptance criteria and project quality attributes.
- risk_floor: MEDIUM; raise to HIGH/CRITICAL for data, security, contract, production, cost, or irreversible impact.
- required_skills:
  - project-orchestrator
  - project-memory
  - requirement-analysis
  - testing-quality
  - documentation-sync
- optional_skills:
  - system-architecture for cross-boundary design
  - ui-ux-production for user interfaces
  - backend-production-engineering for server/domain behavior
  - api-integration for boundary contracts
  - data-lifecycle for persisted data
  - security-threat-modeling for trust/sensitive surfaces
  - observability-incident for operational behavior
  - performance-scalability for explicit budgets
  - analytics-telemetry for measurement
  - ai-agent-safety for AI behavior
  - domain-skill-framework only when repeated application evidence exists
- approval_gates:
  - AG-01 scope expansion
  - AG-05 security or identity boundary
  - AG-06 public contract break
  - AG-08 material cost
  - AG-09 sensitive data

## Inputs

- accepted user outcome, actors, constraints, scope, exclusions, and authoritative evidence
- current implementation, reusable patterns, contracts, data, permissions, tests, operations, and memory
- measurable functional and non-functional acceptance criteria

## Outputs

- requirements and Task Execution Brief
- design/reuse decision and bounded implementation
- tests and specialist validation evidence
- updated documentation and durable memory

## Pre-task gate

- [ ] requirements are observable, prioritized, and traced to validation
- [ ] current evidence and reuse candidates were inspected
- [ ] affected UI/backend/API/data/security/operations surfaces selected their skills
- [ ] compatibility, rollout, recovery, approvals, and non-goals are explicit

For MEDIUM or higher risk, the orchestrator must issue a Task Execution Brief. Stop before any action whose approval gate is unsatisfied.

## Execution phases

1. **Discover** ? Verify current behavior, architecture, reusable assets, consumers, invariants, data and trust boundaries.
2. **Specify** ? Normalize requirements, edge/failure states, acceptance criteria, quality budgets, and exclusions.
3. **Design** ? Choose the smallest viable architecture and contracts; compare alternatives only when material.
4. **Plan** ? Sequence files, tests, migration/compatibility, telemetry, rollout, rollback, and documentation.
5. **Implement** ? Build in small coherent increments using selected specialists and authoritative validation boundaries.
6. **Verify** ? Run risk-mapped functional, integration, security, accessibility, performance, recovery, and regression checks.
7. **Synchronize** ? Update contracts, docs, registries, changelog, and verified Project Memory; checkpoint if incomplete.

## Validation

- every acceptance criterion maps to passing evidence or an approved explicit gap
- new and changed states include positive, negative, boundary, permission, failure, recovery, and regression coverage where applicable
- public/persisted contracts, observability, accessibility, security, and performance claims have specialist evidence

## Completion criteria

- [ ] accepted user outcome works through all affected boundaries
- [ ] no unresolved BLOCKER or unapproved gate remains
- [ ] validation, documentation, compatibility, recovery, residual risk, and memory lifecycle are complete

## Rollback or recovery

Prefer feature flags, additive contracts, reversible changes, staged rollout, or explicit revert. For persisted changes, use the migration workflow and state the last reversible phase.

## Project Memory write-back

Record durable requirements, decisions, reusable patterns, contract changes, known risks/debt, and verified outcomes. Do not store task narration or speculative domain rules.

## Final report

State outcome, scope, changed artifacts, validation evidence, unavailable checks, approvals, rollback/recovery readiness, residual risk, documentation, memory delta, and next safe action.
