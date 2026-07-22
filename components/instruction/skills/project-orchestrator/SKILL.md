---
name: project-orchestrator
description: Classify every engineering request, assign risk, select the smallest valid workflow and capability-skill set, enforce approvals, and coordinate pre-task, validation, documentation, and memory gates. Use before any repository analysis or change.
---

# Project Orchestrator

## Skill contract

- id: project-orchestrator
- name: Project Orchestrator
- version: 1.1.0
- description: Classify every engineering request, assign risk, select the smallest valid workflow and capability-skill set, enforce approvals, and coordinate pre-task, validation, documentation, and memory gates. Use before any repository analysis or change.
- purpose: make task routing deterministic, risk-aware, context-efficient, and auditable.
- scope: all engineering analysis, architecture, implementation, review, debugging, migration, release, incident, security, performance, documentation, and AI-feature tasks.
- triggers: every task governed by this repository instruction system.
- exclusions: does not replace specialist analysis, implement domain logic from assumptions, or grant approvals.
- required_inputs:
  - current user request and accepted scope
  - SKILL-REGISTRY.json and WORKFLOW-REGISTRY.json
  - CUSTOM-SKILL-REGISTRY.json plus project stack, domain, and active-binding manifests
  - current repository evidence and relevant Project Memory index entries
- expected_outputs:
  - task classification and risk level
  - selected workflow, Standard Skills, active task-scoped Custom Skills, evidence plan, and approval gates
  - Task Execution Brief for MEDIUM, HIGH, and CRITICAL work
  - post-task validation and memory-routing decision
- required_files:
  - PROJECT-CONSTITUTION.md
  - APPROVAL-GATES.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
  - skills/project-orchestrator/references/TASK-EXECUTION-BRIEF.md
  - custom-skills/CUSTOM-SKILL-REGISTRY.json
  - project-custom-skills/PROJECT-STACK-MANIFEST.json
  - project-custom-skills/PROJECT-DOMAIN-MANIFEST.json
  - project-custom-skills/ACTIVE-CUSTOM-SKILLS.json
- related_skills:
  - project-memory
  - requirement-analysis
  - testing-quality
  - documentation-sync
- prerequisite_skills:
  - none
- next_skills:
  - workflow-selected capability skills
  - testing-quality
  - documentation-sync
  - project-memory
- constraints: select Standard Skills by Standard registry metadata and Custom Skills only through active project bindings; filter by task and package/path scope; load only selected skills; use the highest applicable risk; preserve user authority and current scope.
- blockers: missing intent that materially changes the result; unresolved rule conflict; required approval not granted; registry corruption; CRITICAL action without a safe stop and recovery path.
- approval_requirements: evaluate every gate in APPROVAL-GATES.md; local read-only discovery and reversible in-scope workspace changes need no extra approval.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - confirm goal, acceptance criteria, scope, exclusions, and unknowns
  - inspect registry and available project evidence
  - classify task and highest applicable risk
  - identify approval gates, invariants, contracts, rollback, and validation
- post_task_checklist:
  - confirm selected workflow completion criteria
  - verify all selected skill post-task gates
  - record validation, exceptions, residual risk, documentation, and memory delta
- validation_process: check registry paths and dependencies, verify the routing decision against at least one rejected alternative, then run route validation for instruction-system changes.
- completion_criteria: a deterministic route exists; required brief and approvals are satisfied; selected workflow and skills close all material task surfaces; final evidence and residual risk are reported.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Parse the request into goal, deliverables, acceptance criteria, scope, exclusions, constraints, and unknowns.
2. Inspect the registries and current evidence; classify task type and combine all risk dimensions using the highest result.
3. **ACR Router - Step 1 (Reflexes)**: Evaluate if the task matches any zero-token deterministic reflex rules. If yes, execute reflex.
4. **ACR Router - Step 2 (Procedural Memory)**: Search for compiled VOPL skills/habits that match the current intent and environment preconditions. If confidence is high, execute the compiled procedure.
5. **ACR Router - Step 3 (Deliberative Cortex)**: If no reflex or procedural habit applies (or prediction error occurs), invoke standard workflow and LLM novelty reasoning. Select one primary workflow and the minimum Standard Skills whose triggers cover every material surface.
6. Retrieve relevant Project Memory, reconcile it with current evidence, and update unknowns or blockers.
7. Create a Task Execution Brief for MEDIUM+ work and evaluate approval gates before affected actions.
8. Coordinate the selected workflow, enforcing each specialist pre-task and completion gate without replacing specialist judgment.
9. Run post-task validation, documentation synchronization, registry checks when applicable, and durable memory/checkpoint routing.

## Domain gates

- BLOCKER: do not implement before task class, risk, workflow, skills, evidence needs, and approval gates are known.
- BLOCKER: do not claim LOW risk when data, security, public contracts, infrastructure, external effects, or irreversibility are unknown.
- MUST: choose one primary workflow; Standard and activated Custom Skills may be composed, but duplicate responsibilities must have one named owner.
- BLOCKER: never route a reusable Custom Skill that lacks an active project binding, qualifying detection confidence, scope intersection, or required evidence-backed overlay.
- MUST: stop at any unsatisfied approval gate while continuing safe analysis or local preparation where possible.

## Completion report

Report the outcome, evidence inspected, decisions made, validation performed, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta. Do not expose private chain-of-thought.
