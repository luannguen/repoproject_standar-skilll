---
memory_id: DEC-0002
title: Governance precedes ACR execution optimization
memory_type: architecture_decision
scope: level-0:project:instruction-system
summary: Reflexes and VOPL habits may optimize only an already classified, authorized, bounded, and validated workflow.
status: verified
confidence: high
tags: [architecture, acr, vopl, procedural-memory, safety, governance]
trigger_terms: [ACR, VOPL, habit, reflex, procedural-memory, habit-compiler, optimization]
affected_modules: [instruction-system, procedural-memory]
affected_paths: [components/instruction/AI-BOOTSTRAP.md, components/instruction/skills/project-orchestrator, components/instruction/skills/habit-compiler, components/instruction/procedural-memory, components/instruction/scripts]
related_entities: []
related_features: [adaptive-cognitive-runtime, habit-compiler]
source_references: [components/instruction/PROJECT-CONSTITUTION.md, components/instruction/APPROVAL-GATES.md, components/instruction/ACR-ARCHITECTURE.md, components/instruction/procedural-memory/HABIT-REGISTRY.json, components/instruction/scripts/habit-lint.ps1]
evidence: [Orchestrator route validation proves governance tokens precede the ACR optimization gate, Habit lint rejects unsafe and under-evidenced fixtures, Unified validation composes habit lint on the reusable layer]
decision_or_fact: decision
rationale: Optimization must reduce repeated planning cost without becoming an alternate authority path or persisting private reasoning.
consequences: [Compilation creates draft only, Verified promotion requires three comparable successes and two independent verifications, Template mode has no selectable application habit, Mismatch and prediction error fail closed to the selected workflow]
risks: [A future runtime executor could violate the contract unless it enforces authorization and validation outside the model]
valid_from: 2026-07-23
last_verified_at: 2026-07-23
review_after: 2026-10-23
created_at: 2026-07-23
updated_at: 2026-07-23
created_by_task: TASK-20260723-acr-procedural-memory-hardening
supersedes: []
superseded_by:
related_memories: [MEM-SKILL-SYSTEM-0001, MEM-PROJECT-0001, MEM-CONSTRAINT-0001, TASK-20260723-acr-procedural-memory-hardening]
detail_path: components/instruction/project-memory/decisions/DEC-0002-governance-before-acr-optimization.md
decision_id: DEC-0002
approved_source: User request on 2026-07-23 to make the manually added system and workflows correct, stable, accurate, and efficient.
---

# Governance precedes ACR execution optimization

## Context and problem

- context: ACR introduced reflex and procedural-memory selection to reduce repeated deliberation.
- problem: Evaluating an optimization before workflow, memory, risk, and approval routing could bypass the repository's authority model.
- constraints: [Constitution remains highest project authority, Human approval is preserved, Private reasoning and raw transcripts are prohibited, Repository remains template/uninstantiated]

## Options

- considered_options: [Allow habit-first routing, Remove ACR entirely, Keep ACR behind the existing governance plane]
- selected_option: Keep ACR behind the existing governance plane and treat habits as bounded execution optimizations only.
- rejected_options: [Habit-first routing because it can bypass gates, Removing ACR because bounded procedural reuse has value]

## Rationale and trade-offs

- rationale: Governance-first ordering preserves authorization and specialist judgment while still allowing verified repeated procedures to reduce planning work.
- trade_offs: [Every task retains routing overhead, Habit promotion is intentionally conservative, Runtime speed is not yet measured]
- consequences: [Only verified registered current bound scoped habits are selectable, Compilation creates draft only, CRITICAL work is never habit-selected, Failure returns to the selected workflow]
- reversal_conditions: [A higher-authority approved design proves equivalent controls with deterministic tests and migration guidance]

## Change and operations

- migration: Treat the prior route seed as a non-active fixture; no selectable habits exist in template mode.
- rollback: Revert the version-controlled instruction-system change; there is no external or production state.
- security_impact: Closes an authority-bypass path and prohibits raw reasoning, secret access, arbitrary commands, and approval self-assertion.
- performance_impact: Adds deterministic lint and conservative routing overhead; runtime optimization remains unmeasured until an executor exists.
- operational_impact: Habit selection, rejection, prediction errors, lifecycle transitions, and fallback require sanitized reason-code telemetry in a future runtime.
- related_modules: [project-orchestrator, habit-compiler, procedural-memory, unified-validation]
