# Procedural Memory

This directory is the governed store for compiled VOPL habits. It is separate from Standard Skills, reusable Custom Skills, and Project Memory.

## Authority boundary

A habit is an execution optimization only. It cannot select a workflow, assign risk, activate a Custom Skill, grant tool permission, satisfy an approval, or replace specialist validation. Project Orchestrator completes governance routing first and may then consider a matching `verified` habit.

## Lifecycle

- `draft`: compiled or manually requested candidate; never selectable.
- `verified`: independently reviewed, registered, current, project-bound, scoped, and sufficiently evidenced.
- `quarantined`: disabled after mismatch, prediction error, stale evidence, validation failure, or incident.
- `retired`: intentionally inactive historical procedure.

Compilation starts at `draft`. Promotion requires at least three comparable successful outcomes and two independent verification records. File presence never changes lifecycle status; `HABIT-REGISTRY.json` is the machine routing source.

## Fail-closed behavior

Missing registration, stale review date, scope mismatch, unavailable binding, exceeded risk ceiling, unsatisfied approval, invalid metadata, timeout, retry exhaustion, prediction error, or failed validation stops the optimized path and returns control to the already selected workflow. Application-specific habits cannot be verified in template/uninstantiated mode.

Run `../scripts/habit-lint.ps1` directly or `../scripts/validate.ps1` through the unified quality gate.
