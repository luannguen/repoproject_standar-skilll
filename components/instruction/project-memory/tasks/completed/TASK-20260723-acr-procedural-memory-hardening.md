---
memory_id: TASK-20260723-acr-procedural-memory-hardening
title: Harden ACR and governed procedural memory
memory_type: task_summary
scope: level-4:task:acr-procedural-memory-hardening
summary: Reordered ACR behind governance, introduced a default-deny VOPL lifecycle and deterministic adversarial validation, and synchronized template metadata and memory.
status: verified
confidence: high
tags: [task-summary, acr, vopl, procedural-memory, validation, governance]
trigger_terms: [acr-hardening, VOPL, habit-compiler, procedural-memory, continue]
affected_modules: [instruction-system, procedural-memory, project-memory, repository-governance]
affected_paths: [components/instruction, VERSION, CHANGELOG.md]
related_entities: []
related_features: [adaptive-cognitive-runtime, habit-compiler]
source_references: [components/instruction/ACR-ARCHITECTURE.md, components/instruction/procedural-memory/HABIT-REGISTRY.json, components/instruction/scripts/habit-lint.ps1, components/instruction/reports/VALIDATION-REPORT.md]
evidence: [Governance-first route guards pass, Valid VOPL fixture passes, Unsafe fixture proves required rejection reasons, Unified reusable-layer validation passes after synchronization]
decision_or_fact: task_outcome
rationale: Preserve the reusable architecture boundary, lifecycle, and validation evidence without relying on chat history.
consequences: [Future clones start with no selectable habits, Application-specific procedures require instantiated evidence, Future executors must enforce the documented contract outside the model]
risks: [No autonomous executor, runtime benchmark, hosted CI result, or application-specific evaluation is claimed]
valid_from: 2026-07-23
last_verified_at: 2026-07-23
review_after: 2026-10-23
created_at: 2026-07-23
updated_at: 2026-07-23
created_by_task: TASK-20260723-acr-procedural-memory-hardening
supersedes: []
superseded_by:
related_memories: [DEC-0002, MEM-SKILL-SYSTEM-0001, MEM-PROJECT-0001, MEM-CONSTRAINT-0001]
detail_path: components/instruction/project-memory/tasks/completed/TASK-20260723-acr-procedural-memory-hardening.md
---

# Harden ACR and governed procedural memory

## Completed

- moved reflex and habit consideration behind task, risk, workflow, skill, memory, Task Brief, and approval routing;
- separated procedural memory from Standard Skills, reusable Custom Skills, and Project Memory;
- added a default-deny empty registry and lifecycle for draft, verified, quarantined, and retired habits;
- changed Habit Compiler to consume sanitized outcome evidence and create draft candidates only;
- moved the unverified React route example into parser fixtures;
- added deterministic valid/adversarial habit lint and governance-order regression checks;
- synchronized skill versions, template version 1.3.0, GitHub CI evidence, current reports, and durable memory.

## Validation

Unified reusable-layer validation, targeted habit lint, route checks, JSON parsing, and diff hygiene are required before completion. Hosted CI remains external evidence to verify after push.

## Recovery

All changes are version-controlled local files with no application, production, provider, or external state. Revert the hardening commit to roll back.
