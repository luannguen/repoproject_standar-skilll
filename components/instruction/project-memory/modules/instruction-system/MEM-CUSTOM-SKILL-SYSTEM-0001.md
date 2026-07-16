---
memory_id: MEM-CUSTOM-SKILL-SYSTEM-0001
title: Two-layer reusable Custom Skill system is active
memory_type: project_fact
scope: level-0:project:instruction-system:custom-skills
summary: The repository has 27 reusable Custom Skills, evidence-based stack/domain detection, and manifest-driven project overlays while only GitHub CI is active in template mode.
status: verified
confidence: high
tags: [custom-skills, technology, domain, detection, activation, overlay, validation]
trigger_terms: [custom-skill, stack-detection, domain-detection, activation, overlay, technology, framework, clone]
affected_modules: [instruction-system, repository-governance]
affected_paths: [components/instruction/custom-skills, components/instruction/project-custom-skills, components/instruction/scripts, AGENTS.md]
related_entities: []
related_features: [custom-skill-library, project-onboarding]
source_references: [components/instruction/custom-skills/CUSTOM-SKILL-REGISTRY.json, components/instruction/project-custom-skills/PROJECT-STACK-MANIFEST.json, components/instruction/project-custom-skills/PROJECT-DOMAIN-MANIFEST.json, components/instruction/project-custom-skills/ACTIVE-CUSTOM-SKILLS.json, components/instruction/reports/CUSTOM-SKILL-SYSTEM-READINESS.md, components/instruction/reports/VALIDATION-REPORT.md]
evidence: [27 reusable modules pass Skill Creator quick validation and custom lint, Stack detection finds only GitHub CI at HIGH confidence, Domain detection finds zero qualifying artifacts and zero verified rules, Twelve custom route fixtures enforce task and path scope]
decision_or_fact: implementation_fact
rationale: Future clones need reusable technology/domain expertise without copying project facts or loading irrelevant skills.
consequences: [Standard Skills retain higher authority, Reusable modules remain inactive until project bindings exist, Clone onboarding must re-run detection and create scoped overlays]
risks: [A clone will block validation if application evidence changes without manifest synchronization, Hosted CI remains unverified until pushed]
valid_from: 2026-07-16
last_verified_at: 2026-07-16
review_after: 2026-10-16
created_at: 2026-07-16
updated_at: 2026-07-16
created_by_task: TASK-20260716-reusable-custom-skill-system
supersedes: []
superseded_by:
related_memories: [MEM-PROJECT-0001, MEM-SKILL-SYSTEM-0001, MEM-TEMPLATE-STANDARD-0001, TASK-20260716-reusable-custom-skill-system]
detail_path: components/instruction/project-memory/modules/instruction-system/MEM-CUSTOM-SKILL-SYSTEM-0001.md
---

# Two-layer reusable Custom Skill system is active

## Verified fact

Layer A contains 14 technology and 13 domain reusable modules. Layer B contains project detection manifests, activation bindings, and evidence-backed overlays. Standard Skills remain independent and higher-authority.

The current repository is still `template/uninstantiated`. Only `github-ci` is active from Git metadata and a GitHub Actions workflow. No application technology, provider version, domain, or business invariant is inferred.

## Routing rule

Read the project manifests first. Load only active/provisional bindings whose task type and package/path scope intersect the task. Apply reusable base guidance before the project overlay. A reusable entry or composite profile never activates a skill.

## Re-verification

Run `components/instruction/scripts/validate.ps1` after clone onboarding and after dependency, platform, schema, contract, domain, or scope changes. Update manifests, overlays, tests, reports, and memory atomically.
