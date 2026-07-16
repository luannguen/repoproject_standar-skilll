---
memory_id: MEM-PROJECT-0001
memory_type: project_fact
scope: level-0:project
status: verified
confidence: high
trigger_terms: [repository, codebase, module, architecture, onboarding, continue]
source_references: [README.md, components/instruction/TEMPLATE-MANIFEST.json, components/instruction/PROJECT-PROFILE.json, components/instruction/SKILL-REGISTRY.json, components/instruction/WORKFLOW-REGISTRY.json, components/instruction/custom-skills/CUSTOM-SKILL-REGISTRY.json, components/instruction/project-custom-skills/ACTIVE-CUSTOM-SKILLS.json, components/instruction/reports/CUSTOM-SKILL-SYSTEM-READINESS.md]
last_verified_at: 2026-07-16
review_after: 2026-10-16
supersedes: []
superseded_by:
related_memories: [MEM-GAP-0001, MEM-QUESTION-0001, MEM-UI-0001, MEM-BACKEND-0001, MEM-SKILL-SYSTEM-0001, MEM-TEMPLATE-STANDARD-0001, MEM-CUSTOM-SKILL-SYSTEM-0001, TASK-20260716-template-production-standard, TASK-20260716-reusable-custom-skill-system]
---

# Project Snapshot

## Verified current state

- The repository is under Git on branch `main` with a configured GitHub remote.
- It contains a validated Project Engineering Skill System: Constitution, Orchestrator, Approval Gates, 21 registered Standard Skills, 12 registered workflows, 24 Standard routing fixtures, and unified executable validation.
- It contains a separate two-layer library of 27 reusable Custom Skills, deterministic stack/domain detection, 12 custom routing fixtures, and one HIGH-confidence `github-ci` project binding.
- It also contains a reusable onboarding, governance, contribution, security, release, ownership, and cross-platform CI baseline.
- No application source, runtime/package manifest, schema, migration, application test suite, or deployment target exists.
- Template artifacts are not evidence of application architecture, framework, entities/schema, services, permissions, transactions, design system, deployment, recovery, or business workflow.

## Evidence

- `PROJECT-PROFILE.json` is `template/uninstantiated` and records no application manifests, schemas, or deployment targets.
- Skill lint verifies 21 skills and workflow lint verifies 12 workflows.
- Static routing validation covers all 12 workflows and LOW, MEDIUM, HIGH, and CRITICAL cases.
- Custom validation covers 14 technology and 13 domain modules; current domain detection is empty and no business invariant is inferred.
- Repository, route/link, anti-pattern, and memory validation pass locally.
- The template readiness report separates active reusable controls from project-specific conditional controls.

## Operational consequence

Run `project-onboarding` after cloning. Do not infer the game domain, technology stack, modules, provider capabilities, entities/schema, authentication, authorization, tenant/transaction behavior, deployment environment, business workflows, UI framework, tokens, or components. Activate only controls supported by current application evidence. Re-run Custom Skill detection after clone onboarding and bind modules only to verified task/package/path scopes.

## Re-verification

Inventory the repository, inspect the profile and registries, verify repository-host settings, run unified validation plus every registered application command, then update this snapshot and both indexes.
