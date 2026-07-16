---
name: system-architecture
description: Design or assess system boundaries, responsibilities, contracts, dependencies, quality attributes, failure modes, and evolution paths from verified requirements and repository evidence. Use for cross-cutting or structurally significant changes.
---

# System Architecture

## Skill contract

- id: system-architecture
- name: System Architecture
- version: 1.0.0
- description: Design or assess system boundaries, responsibilities, contracts, dependencies, quality attributes, failure modes, and evolution paths from verified requirements and repository evidence. Use for cross-cutting or structurally significant changes.
- purpose: choose the simplest architecture that protects required quality attributes and remains evolvable and operable.
- scope: system context, component and data-flow boundaries, deployment/runtime assumptions, contracts, dependencies, trade-offs, failure domains, ADRs, and evolution sequencing.
- triggers: new subsystem, cross-cutting feature, major refactor, platform choice, integration topology, architecture review, scaling or reliability redesign.
- exclusions: does not invent unavailable infrastructure, replace detailed UI/backend design, or approve production/platform changes.
- required_inputs:
  - accepted requirements and quality attributes
  - current component, dependency, data, runtime, and deployment evidence
  - constraints, risks, operational model, and change horizon
- expected_outputs:
  - current and target architecture views
  - bounded responsibilities, contracts, and dependency direction
  - option comparison and recorded architecture decision
  - evolution, compatibility, observability, and rollback plan
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - requirement-analysis
  - backend-production-engineering
  - api-integration
  - data-lifecycle
  - security-threat-modeling
  - performance-scalability
- prerequisite_skills:
  - project-memory
- next_skills:
  - ui-ux-production
  - backend-production-engineering
  - api-integration
  - data-lifecycle
  - testing-quality
- constraints: prefer incremental, reversible evolution; separate verified current state from proposed state; avoid technology selection without lifecycle evidence.
- blockers: unknown quality attribute or invariant that changes topology; unowned critical component; unmitigated single point of catastrophic failure; incompatible target with no migration path.
- approval_requirements: major platform/runtime adoption, public contract break, material cost, or irreversible architecture migration follows the corresponding approval gate.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - confirm requirements and measurable quality attributes
  - map current boundaries, dependencies, data ownership, and deployment evidence
  - identify irreversible decisions and unknowns
- post_task_checklist:
  - responsibilities and dependency direction are unambiguous
  - failure, security, operability, compatibility, cost, and recovery trade-offs are recorded
  - decision and phased evolution path are documented
- validation_process: trace critical scenarios and failures through every boundary; test option decisions against constraints, coupling, change cost, operability, security, recovery, and rollback.
- completion_criteria: the selected design has evidence-backed trade-offs, explicit boundaries and contracts, a safe evolution path, and no unresolved high-impact architecture blocker.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Model the current system context and separate observed facts from assumptions.
2. Derive architecture drivers from requirements, invariants, quality attributes, operations, and constraints.
3. Define candidate boundaries and dependency direction; compare no more than three viable options.
4. Trace critical read, write, failure, recovery, and administrative flows across boundaries.
5. Choose the simplest viable option and record trade-offs, rejected alternatives, consequences, and reversibility.
6. Plan incremental delivery, compatibility, observability, test seams, migration, rollback, and ownership.

## Domain gates

- BLOCKER: a component may not own behavior or data without a clear responsibility and authority boundary.
- MUST: synchronous, asynchronous, cached, replicated, and third-party boundaries declare failure and consistency semantics.
- MUST: architecture diagrams or descriptions label current versus proposed state.

## Completion report

Report the outcome, evidence inspected, decisions made, validation performed, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta. Do not expose private chain-of-thought.
