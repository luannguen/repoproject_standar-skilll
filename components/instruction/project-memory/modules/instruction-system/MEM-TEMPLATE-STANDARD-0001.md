---
memory_id: MEM-TEMPLATE-STANDARD-0001
title: Reusable production project template baseline is active
memory_type: project_fact
scope: level-0:project:template-governance
summary: The repository has an evidence-gated onboarding, governance, and cross-platform validation baseline while application-specific controls remain conditional.
status: verified
confidence: high
tags: [template, onboarding, governance, ci, validation, security]
trigger_terms: [clone, template, onboarding, governance, production-standard, ci, quality-gate]
affected_modules: [instruction-system, repository-governance]
affected_paths: [README.md, .github, docs, scripts, components/instruction]
related_entities: []
related_features: [project-template, project-onboarding]
source_references: [README.md, components/instruction/TEMPLATE-MANIFEST.json, components/instruction/PROJECT-PROFILE.json, components/instruction/PROJECT-ONBOARDING.md, components/instruction/reports/TEMPLATE-PRODUCTION-READINESS.md]
evidence: [Unified local validation covers repository, skills, workflows, routing fixtures, routes/links, and memory, Static fixtures cover 12 workflows and four risk levels, CI definition targets Windows and Linux without assuming an application stack]
decision_or_fact: implementation_fact
rationale: Future clones need a durable boundary between reusable template readiness and application production readiness.
consequences: [Clones route first-run work through project-onboarding, Application controls activate only from verified triggers, External repository settings remain owner-verified]
risks: [Hosted CI and repository protections are unverified until pushed and configured, A clone can become stale if the project profile is not instantiated]
valid_from: 2026-07-16
last_verified_at: 2026-07-16
review_after: 2026-10-16
created_at: 2026-07-16
updated_at: 2026-07-16
created_by_task: TASK-20260716-template-production-standard
supersedes: []
superseded_by:
related_memories: [MEM-PROJECT-0001, MEM-SKILL-SYSTEM-0001, MEM-GAP-0001, TASK-20260716-template-production-standard]
detail_path: components/instruction/project-memory/modules/instruction-system/MEM-TEMPLATE-STANDARD-0001.md
---

# Reusable production project template baseline is active

## Claim

The repository is a validated template-layer standard with onboarding, governance, ownership, security reporting, release policy, cross-platform CI definition, and deterministic checks. It does not claim application production readiness.

## Boundary

Application stack, domain, schema, data sensitivity, deployment, license, host protections, tests, scanners, recovery, observability, and concrete domain skills remain conditional until current evidence and authorized owner decisions exist.

## Re-verification

Run `components/instruction/scripts/validate.ps1`, inspect `PROJECT-PROFILE.json`, verify hosted CI and repository settings, then run every registered application command.
