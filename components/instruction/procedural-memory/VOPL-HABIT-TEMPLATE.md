# VOPL Habit Template

**Status**: Governed compilation contract
**Schema version**: 1.0.0
**Context**: Used by Habit Compiler to create non-executable draft candidates. The registry and Project Orchestrator own lifecycle and selection authority.

## File naming and location

Save candidates as `components/instruction/procedural-memory/habits/<habit-id>.vopl.md`. Compilation always starts at `draft`; file presence never grants authority.

## Required metadata

```yaml
---
habit_id: <kebab-case-id>
schema_version: 1.0.0
status: draft
source_kind: compiled
binding_scope: project
project_binding: <verified-binding-id>
intent: <stable-intent>
applicable_paths: [<bounded-glob>]
risk_ceiling: <LOW-or-MEDIUM>
required_workflow: <workflow-id>
required_skills: [<registered-skill-id>]
approval_gates: [<AG-NN-or-none>]
allowed_actions: [<bounded-action-id>]
forbidden_actions: [approval-bypass, production-mutation-without-approval, secret-access, destructive-action-without-approval]
source_task_ids: [<task-1>, <task-2>, <task-3>]
evidence_refs: [<sanitized-evidence-1>, <sanitized-evidence-2>, <sanitized-evidence-3>]
observed_successes: <integer-at-least-3>
independent_verifications: <integer-at-least-2-for-promotion>
max_steps: <positive-integer>
max_retries: <non-negative-integer>
timeout_seconds: <positive-integer>
owner: <project-owner>
last_verified_at: YYYY-MM-DD
review_after: YYYY-MM-DD
rollback: <bounded-recovery-action>
---
```

## VOPL structure

```vopl
skill <SkillName> {
    governance {
        profile.instantiated == true
        registry.status == verified
        workflow.selected == required_workflow
        risk.current <= risk_ceiling
        approvals.satisfied == true
        scope.matches(applicable_paths)
    }

    activates when {
        intent == <ExpectedIntent>
        environment.has(<VerifiedContext>)
    }

    requires {
        <Precondition1>
        <Precondition2>
    }

    predicts {
        <ObservableOutcome1>
        <ObservableOutcome2>
    }

    preserves {
        <Invariant1>
        <Invariant2>
    }

    execute {
        step 1: invoke skill <registered-skill-id> action <bounded-action-id>
        step 2: invoke skill <registered-skill-id> action <bounded-validation-id>
    }

    on prediction_error {
        stop optimized path
        preserve current state
        return to selected workflow
    }

    on failure {
        stop within declared limits
        apply declared rollback
        return to selected workflow
    }

    consolidate after {
        success_count >= 3
        independent_verifications >= 2
    }
}
```

## Lifecycle and safety rules

1. Use only sanitized task outcomes, diffs, validation summaries, approval records, and rollback evidence. Never ingest or persist chain-of-thought, raw transcripts, secrets, or private production data.
2. A manual request or compiler output may create `draft` only. Promotion to `verified` requires at least three comparable successes, two independent verification records, a current project binding, deterministic lint, and named ownership.
3. `draft`, `quarantined`, `retired`, stale, unregistered, unbound, or out-of-scope habits are not selectable.
4. A habit cannot choose its workflow, risk, tools, permissions, or approval result. It may only optimize bounded actions inside an already authorized workflow.
5. Execution steps invoke registered skills through bounded action identifiers; VOPL must not embed arbitrary shell commands or generated source code.
6. Any mismatch, prediction error, timeout, retry exhaustion, failed validation, or expired review date stops the optimized path and returns control to the selected workflow.
7. Application-specific habits cannot be promoted while `PROJECT-PROFILE.json` is `template/uninstantiated`.
8. CRITICAL work is never habit-selected. Production, security, data, external, financial, and destructive actions retain their normal approval gates regardless of habit status.
