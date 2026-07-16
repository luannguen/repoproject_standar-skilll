---
name: requirement-analysis
description: Turn ambiguous product or engineering requests into testable scope, actors, rules, acceptance criteria, edge cases, non-functional requirements, and traceability. Use for new features, unclear changes, bug reproduction, and scope negotiation.
---

# Requirement Analysis

## Skill contract

- id: requirement-analysis
- name: Requirement Analysis
- version: 1.0.0
- description: Turn ambiguous product or engineering requests into testable scope, actors, rules, acceptance criteria, edge cases, non-functional requirements, and traceability. Use for new features, unclear changes, bug reproduction, and scope negotiation.
- purpose: ensure implementation solves an explicit, testable problem without hidden scope or invented requirements.
- scope: stakeholders, actors, use cases, functional and non-functional requirements, acceptance criteria, assumptions, exclusions, dependencies, edge cases, and traceability.
- triggers: ambiguous requests, new features, behavior changes, disputed bugs, multi-system work, or missing acceptance criteria.
- exclusions: does not choose detailed architecture, design visual interfaces, or implement code.
- required_inputs:
  - user intent and constraints
  - current behavior, documentation, contracts, and issue evidence
  - known actors, environments, data, and business rules
- expected_outputs:
  - normalized problem statement and bounded scope
  - testable acceptance criteria and edge-case matrix
  - assumption, dependency, risk, and open-question log
  - requirement-to-validation traceability
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - project-orchestrator
  - system-architecture
  - ui-ux-production
  - backend-production-engineering
  - testing-quality
- prerequisite_skills:
  - project-memory
- next_skills:
  - system-architecture
  - ui-ux-production
  - backend-production-engineering
  - testing-quality
- constraints: distinguish explicit facts from inference; use observable language; do not resolve material product choices without authority.
- blockers: contradictory success criteria; unknown actor or rule that changes security, money, persisted data, or irreversible behavior; scope cannot be bounded safely.
- approval_requirements: request explicit direction for material scope expansion, conflicting product choices, or acceptance of a known requirement gap.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - identify source and authority for each requirement
  - inspect current behavior and reusable issue/spec evidence
  - separate must-have outcome from proposed solution
- post_task_checklist:
  - each acceptance criterion is observable and unambiguous
  - edge, failure, permission, empty, loading, concurrency, and recovery states are addressed where relevant
  - every requirement maps to an owner or validation method
- validation_process: walk each actor and scenario through Given/When/Then outcomes; challenge ambiguity, contradiction, non-testable adjectives, missing negative paths, and scope leakage.
- completion_criteria: scope and exclusions are explicit; material unknowns are resolved or blocked; acceptance criteria and validation traceability cover the requested outcome.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Restate the problem, desired outcome, affected actors, and evidence without adopting the proposed solution prematurely.
2. Inventory functional rules, non-functional constraints, current behavior, dependencies, and authoritative sources.
3. Separate facts, assumptions, questions, and decisions; escalate only questions that materially change the result.
4. Define in-scope and out-of-scope behavior plus success, failure, empty, permission, concurrency, and recovery cases.
5. Write prioritized, observable acceptance criteria and map each to planned validation.
6. Review for contradiction, hidden implementation mandates, missing stakeholder impact, and uncontrolled expansion.

## Domain gates

- BLOCKER: no acceptance criterion may depend on an undefined security or data-ownership rule.
- MUST: qualitative targets such as fast, secure, intuitive, or scalable require a measurable proxy or named validation method.
- MUST: requirements preserve current public behavior unless an approved change says otherwise.

## Completion report

Report the outcome, evidence inspected, decisions made, validation performed, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta. Do not expose private chain-of-thought.
