# AI Bootstrap

This mandatory router coordinates Constitution, Orchestrator, Project Memory, workflows, skills, approvals, validation, documentation, and continuity. It does not replace specialist judgment.

## Required order

0. Initialize the **Active Inference Loop** (Observe -> Align -> Predict -> Compare -> Select/Plan -> Act -> Evaluate -> Adjust) and maintain it throughout all following steps.
1. Read `PROJECT-CONSTITUTION.md`.
2. Read Standard Skill and workflow routing metadata in `SKILL-REGISTRY.json` and `WORKFLOW-REGISTRY.json`, then inspect `TEMPLATE-MANIFEST.json` and `PROJECT-PROFILE.json`.
3. If the profile is `template/uninstantiated` or clone onboarding is the dominant outcome, select `project-onboarding` and `project-bootstrap-governance`; otherwise invoke `skills/project-orchestrator/SKILL.md` to normalize the goal, classify task, assign the highest applicable risk, select one primary workflow, and select the minimum Standard Skills.
4. Read `custom-skills/CUSTOM-SKILL-REGISTRY.json` and the project-generated `project-custom-skills/PROJECT-STACK-MANIFEST.json`, `PROJECT-DOMAIN-MANIFEST.json`, and `ACTIVE-CUSTOM-SKILLS.json`. Select only active/provisional bindings whose task type and package/path scope intersect the current task; load the reusable base, then its project overlay. Absence from the active manifest means inactive.
5. For MEDIUM+, create the Task Execution Brief in `skills/project-orchestrator/references/TASK-EXECUTION-BRIEF.md`.
6. Evaluate `APPROVAL-GATES.md`; stop before any unsatisfied gated action.
7. Invoke `skills/project-memory/SKILL.md`; retrieve only relevant entries and verify material memory against current evidence.
8. Read the selected `workflows/<id>/WORKFLOW.md`, then only selected Standard Skills, activated Custom Skills, and task-matched references.
9. Pass Constitution, workflow, and skill pre-task gates.
10. Analyze and execute within accepted scope; search for reuse before extension or creation.
11. Run proportional specialist validation and adversarial review; never present an unavailable check as passed.
12. Synchronize affected contracts, detection/activation manifests, overlays, docs, registries, changelogs, runbooks, and release artifacts.
13. Write only durable verified memory; checkpoint incomplete work, compact completed work, and run memory lint.
14. Report outcome, evidence, validation, approvals, recovery, residual risk, documentation, and memory delta.

## Implementation gate

Do not implement until:

- the Active Inference Loop has completed its "Select/Plan" phase and explicitly approved the action;
- goal, acceptance, scope, exclusions, evidence, and material unknowns are explicit;
- task class, risk, workflow, skills, memory context, and approval status are known;
- affected invariants, users, contracts, data, trust boundaries, operations, compatibility, and recovery are analyzed;
- reuse search, implementation sequence, validation, documentation, and memory plans are complete;
- all approvals required for the next action are satisfied.

A small LOW task may use a compact brief, but still requires registry routing and a lightweight constraints/path-matched memory scan.

If a required skill or project source does not exist, record the gap and continue only with a safe, non-fabricated approach. In template mode, application-specific validation is conditional rather than passed. Never invent domain rules, permissions, schemas, architecture, or platform guarantees.

## Risk classification

- LOW: narrow, local, reversible, with no sensitive, public, persisted, or production effect.
- MEDIUM: multi-file or behavioral change with contained blast radius and practical rollback.
- HIGH: security, identity, data, public contract, infrastructure, migration, release, cost, architecture, or availability impact.
- CRITICAL: active major incident or irreversible/destructive action with data-loss, cross-tenant, identity, financial, legal, or safety impact.

Unknown impact raises risk. Use the highest applicable level.

## Workflow routing

| Dominant outcome | Primary workflow |
|---|---|
| Clone, instantiate, or standardize an uninstantiated repository | project-onboarding |
| New or expanded behavior | `feature-development` |
| Defect or regression | `bug-fix` |
| Behavior-preserving structural improvement | `refactoring` |
| Data/schema/contract/runtime/provider transition | `migration` |
| Dependency/framework/platform evolution | `dependency-upgrade` |
| Deploy, promote, publish, rollout, or rollback | `release` |
| Active production impact or security event | `incident-response` |
| Documentation-only work | `documentation` |
| Measured performance/capacity/cost work | `performance-optimization` |
| Bounded threat/control assessment | `security-review` |
| LLM, agent, tool, RAG, embedding, or model behavior | `ai-feature` |

If several match, select the highest-risk dominant outcome and compose other concerns through optional skills.

## Capability routing

- Project initialization and repository governance: `project-bootstrap-governance`.
- Requirements: `requirement-analysis`; architecture: `system-architecture`.
- Interface/accessibility: `ui-ux-production`; backend/domain: `backend-production-engineering`.
- API/event/provider: `api-integration`; persisted data/lifecycle: `data-lifecycle`.
- Any behavior change: `testing-quality`; security/trust: `security-threat-modeling`.
- Review/refactor: `code-review-refactoring`; dependency/platform: `dependency-evolution`.
- CI/CD/release: `devops-release`; observability/incident: `observability-incident`.
- Performance/capacity: `performance-scalability`; docs/registry: `documentation-sync`.
- Compatibility: `migration-compatibility`; analytics: `analytics-telemetry`; AI/agent: `ai-agent-safety`.
- Domain discovery: `domain-skill-framework`; never create a project domain overlay or verified invariant without authoritative application evidence.
- Technology/domain specialization: select only bindings from `project-custom-skills/ACTIVE-CUSTOM-SKILLS.json`; a composite profile or reusable-library entry never activates a skill.

## Context efficiency

Load registries and project detection/activation manifests first, then only the primary workflow, selected Standard Skills, active task/scope-matched Custom Skills, relevant memory, affected sources, and direct specialist references. Do not read every skill, reusable custom module, or memory file.


## UI/UX routing and gate

A task is UI/UX-related when it creates, edits, refactors, reviews, or affects a page, layout, component, form, table/list, dashboard, navigation, responsive behavior, styling/theme/type, modal/dialog/drawer, accessibility, animation/interaction, loading/empty/error state, onboarding, search/filter/pagination, upload, authentication/profile, admin/public interface, mobile, PWA, or visual output.

For every such task:

1. Read skills/ui-ux-production/SKILL.md and the referenced RULES/CHECKLIST.
2. Retrieve and verify UI, flow, component, token, accessibility, permission, API, incident, and checkpoint memory.
3. Search current code for analogous pages, components, hooks, tokens, state patterns, permission patterns, and tests.
4. Complete the reuse ladder decision.
5. Produce a concise UX Decision Summary.
6. Complete the pre-implementation gate before outputting UI code.
7. Implement under the skill and current project architecture.
8. Complete self-review and all available post-implementation validation.
9. Record exceptions, UI debt, reusable patterns, and Project Memory delta.

BLOCKER: do not output UI/UX code before reading the skill, completing discovery/reuse analysis, and creating the UX Decision Summary. Do not silently skip a BLOCKER/MUST rule.
## Backend routing and gate

A task is backend-related when it creates, edits, refactors, debugs, reviews, migrates, secures, operates, deploys, or affects backend/business logic, API, database, entity/model/schema, repository/data access, service/server function, authentication/authorization/RBAC/permission/multi-tenant, transaction/concurrency/idempotency, webhook/integration/payment/order/inventory/ledger, queue/event/job/cron/automation, storage/file/upload, notification/email, caching, import/export/synchronization, audit/security/performance/reliability/observability, or production deployment.

For every such task:

1. Read `skills/backend-production-engineering/SKILL.md` and its required RULES/CHECKLIST.
2. Retrieve and verify domain invariants, source of truth, data ownership, schema/migrations, contracts, permissions, platform capability, integrations, incidents, operations, debt, and the closest checkpoint.
3. Search current sources for analogous entities, schemas, services/functions, validation, authorization/tenant, error, transaction/idempotency, adapter, pagination, logging, test, migration, utility, configuration, and deployment patterns.
4. Complete the reuse decision before proposing a new module/service/dependency.
5. Produce a concise Backend Decision Summary without private chain-of-thought.
6. Verify each required platform capability as platform-provided, project-built, partial, unsupported, unknown, or compensation-required, with current evidence.
7. Analyze entity/schema/API/event/error impact and backward compatibility.
8. Analyze server authorization, object/field access, tenant isolation, validation, and mass-assignment controls.
9. Analyze transaction/consistency, concurrency, idempotency, timeout/retry, partial failure, and recovery/reconciliation.
10. Define files, boundaries, data/control/auth/error flows, observability, tests, migration/deployment/rollback, and non-goals in the implementation plan.
11. Complete the pre-implementation checklist before backend code.
12. Implement under the skill and verified current architecture.
13. Complete role-based self-review and every available post-implementation validation.
14. Record exceptions, unavailable checks, residual risks, backend debt, and Project Memory delta.
15. Update the skill only with reusable verified learning under its approval policy.

BLOCKER: do not output backend code before:

- reading the Backend Production Engineering skill and required references;
- identifying business invariants and source of truth;
- completing discovery and reuse analysis;
- verifying the capabilities on which correctness depends;
- analyzing data impact, server authorization, ownership/tenant scope, and validation;
- analyzing applicable transaction, concurrency, idempotency, failure, and recovery;
- completing the pre-implementation checklist.

For full-stack work, both specialist gates apply. Resolve API/schema/permission/state/error/upload/auth contract conflicts before either side is implemented.

Do not silently skip or downgrade a BLOCKER/MUST rule. Missing evidence that determines correctness, data integrity, security, financial safety, tenant isolation, destructive migration, or recoverability is a blocker rather than permission to invent behavior.


## Required task reporting

For MEDIUM+ tasks, keep these sections concise:

### TASK EXECUTION BRIEF

- goal, acceptance, class, risk, scope/exclusions, evidence, and unknowns;
- workflow, skills, memory IDs, invariants/contracts, and approvals;
- sequence, validation, recovery, docs/memory plan, blockers, and deliverables.

### MEMORY CONTEXT

- sources, verified constraints/decisions, incidents/checkpoint, stale/conflicting entries, and facts needing verification.

### MEMORY UPDATE

- entries created, updated, superseded, completed, checkpointed, or unchanged plus lint results.
