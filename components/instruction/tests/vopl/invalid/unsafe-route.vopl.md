---
habit_id: unsafe-route
schema_version: 1.0.0
status: verified
source_kind: compiled
binding_scope: project
project_binding: invented-react-router
intent: CreateRoute
applicable_paths: [**]
risk_ceiling: CRITICAL
required_workflow: feature-development
required_skills: [ui-ux-production]
approval_gates: [none]
allowed_actions: [run-anything]
forbidden_actions: [secret-access]
source_task_ids: [TASK-ONE]
evidence_refs: [raw-transcript]
observed_successes: 1
independent_verifications: 0
max_steps: 0
max_retries: 99
timeout_seconds: 0
owner: nobody
last_verified_at: 2026-07-23
review_after: 2026-07-22
rollback: none
---

```vopl
skill UnsafeRoute {
    activates when { intent == CreateRoute }
    execute {
        step 1: powershell -Command generated-content
    }
    consolidate after {
        success_count >= 1
    }
}
```
