---
name: habit-compiler
description: Compile sanitized, verified task outcome evidence into governed draft VOPL habits without granting execution authority or storing private reasoning.
---

# Habit Compiler

## Skill contract

- id: habit-compiler
- name: Habit Compiler
- version: 1.1.0
- description: Compiles sanitized, verified task outcome evidence into governed draft VOPL habits without granting execution authority.
- purpose: reduce repeated planning cost while keeping workflow selection, risk classification, approvals, validation, and human authority outside the habit.
- scope: post-task evaluation of repeated, equivalent, verified outcomes and lifecycle maintenance of procedural-memory candidates.
- triggers: at least three comparable verified successes, explicit manual draft request, or scheduled re-verification of an existing habit.
- exclusions: Does not execute habits; only compiles them.
- required_inputs: sanitized task summaries, verified diffs and validation results, stable intent, project binding evidence, risk and approval history, and rollback evidence.
- expected_outputs: a lint-valid `draft` `.vopl.md` candidate plus a registry proposal; only separately reviewed evidence may promote it to `verified`.
- required_files:
  - ../../PROJECT-CONSTITUTION.md
  - ../../procedural-memory/VOPL-HABIT-TEMPLATE.md
  - ../../procedural-memory/HABIT-REGISTRY.json
- related_skills:
  - project-memory
  - project-orchestrator
- prerequisite_skills:
  - project-memory
- next_skills:
  - None (Execution terminates after compilation)
- constraints: follow the versioned VOPL contract; never ingest or emit chain-of-thought, raw transcripts, secrets, private production data, arbitrary shell/code, or application assumptions unsupported by current evidence; compilation never activates a habit.
- blockers: fewer than three comparable verified outcomes for promotion; missing provenance, project binding, scope, owner, validation, expiry, risk ceiling, approval mapping, or rollback; template/uninstantiated profile for an application-specific habit; conflicting or sensitive evidence.
- execution_workflow: sanitize outcome evidence -> compare equivalent successes -> extract bounded invariants and parameters -> emit draft -> lint -> independent review -> register verified or quarantine.
- approval_requirements: AG-01 for scope expansion or a new architectural pattern; every declared downstream gate remains independently required at habit use time.
- pre_task_checklist: confirm evidence is sanitized, comparable, successful, current, project-bound, and sufficient for the requested lifecycle transition.
- post_task_checklist: confirm VOPL syntax, provenance, parameterization, least authority, risk ceiling, gates, validation, expiry, rollback, and registry status.
- validation_process: run `scripts/habit-lint.ps1`; exercise valid and adversarial fixtures; verify draft cannot execute and template-mode application habits cannot become verified.
- completion_criteria: a lint-valid draft or lifecycle update exists; activation remains denied unless independent verification and registry promotion requirements pass.
- exception_policy: quarantine invalid or stale candidates and fall back to the selected standard workflow; never bypass a missing control.
- memory_read_policy: read only concise verified task outcomes and current project evidence; never read or reconstruct private reasoning or raw transcripts.
- memory_write_policy: write only sanitized provenance, invariants, outcomes, limitations, and lifecycle state; keep Project Memory indexes synchronized for durable decisions only.
- update_policy: version VOPL and skill contracts together, migrate or quarantine incompatible habits, synchronize registry/tests/docs/memory, and never weaken activation controls without approval.

## Execution Workflow

1. **Evidence normalization**: read sanitized completed-task summaries, diffs, tests, approvals, and rollback outcomes; reject private reasoning and raw logs.
2. **Equivalence and invariant extraction**: prove that at least three successful cases share the same intent, environment, scope, authority, and observable outcome before proposing promotion.
3. **Parameter and boundary discovery**: expose variables, allowed actions, forbidden actions, applicable paths, risk ceiling, workflow, skills, approval gates, limits, and expiry.
4. **Draft generation**: apply `VOPL-HABIT-TEMPLATE.md` and write only a `draft` candidate under `components/instruction/procedural-memory/habits/`.
5. **Deterministic validation**: run `habit-lint.ps1`; malformed, under-evidenced, unsafe, stale, or template-specific candidates fail closed.
6. **Independent promotion**: a reviewer or authorized workflow verifies evidence and promotes the matching registry entry to `verified`. Compilation alone cannot do this.
7. **Runtime selection**: the Project Orchestrator may consider only a verified, current, matching entry after governance and approval gates pass. Any mismatch or prediction error quarantines or suspends the optimized path and returns to the selected workflow.

## Domain gates

- BLOCKER: a habit cannot select its own workflow, risk, permissions, tools, or approval result.
- BLOCKER: application-specific habits remain draft while `PROJECT-PROFILE.json` is `template/uninstantiated`.
- MUST: promotion requires at least three comparable successful outcomes and two independent verification records; a manual request may create a draft only.
- MUST: every use is bounded by steps, time, retries, paths, allowed actions, forbidden actions, risk ceiling, rollback, and safe failure.
