---
habit_id: setup-new-route-fixture
schema_version: 1.0.0
status: verified
source_kind: fixture
binding_scope: fixture
project_binding: test-only-react-router
intent: CreateRoute
applicable_paths: [src/features/**, src/router/**]
risk_ceiling: MEDIUM
required_workflow: feature-development
required_skills: [requirement-analysis, ui-ux-production, testing-quality]
approval_gates: [AG-01]
allowed_actions: [create-route-component, register-route, validate-route]
forbidden_actions: [approval-bypass, production-mutation-without-approval, secret-access, destructive-action-without-approval]
source_task_ids: [TASK-FIXTURE-001, TASK-FIXTURE-002, TASK-FIXTURE-003]
evidence_refs: [tests/fixtures/route-001, tests/fixtures/route-002, tests/fixtures/route-003]
observed_successes: 3
independent_verifications: 2
max_steps: 4
max_retries: 1
timeout_seconds: 120
owner: instruction-system-test
last_verified_at: 2026-07-23
review_after: 2026-10-23
rollback: revert-workspace-route-change
---

# VOPL fixture: Setup New Route

This is parser test data only. It is outside the governed habit directory and cannot be registered or selected.

```vopl
skill SetupNewRouteFixture {
    governance {
        profile.instantiated == true
        registry.status == verified
        workflow.selected == required_workflow
        risk.current <= risk_ceiling
        approvals.satisfied == true
        scope.matches(applicable_paths)
    }

    activates when {
        intent == CreateRoute
        environment.has(VerifiedRouterBinding)
    }

    requires {
        route_path != empty
        component_name != empty
    }

    predicts {
        route.registered
        component.created
        validation.passed
    }

    preserves {
        existing.routes.integrity
        application.build.success
    }

    execute {
        step 1: invoke skill requirement-analysis action validate-route-request
        step 2: invoke skill ui-ux-production action create-route-component
        step 3: invoke skill ui-ux-production action register-route
        step 4: invoke skill testing-quality action validate-route
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
