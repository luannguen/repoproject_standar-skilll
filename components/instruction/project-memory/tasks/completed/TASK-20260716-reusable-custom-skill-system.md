---
memory_id: TASK-20260716-reusable-custom-skill-system
title: Add reusable two-layer Custom Skill system
memory_type: task_summary
scope: level-4:task:reusable-custom-skill-system
summary: Added 27 reusable technology/domain skills, evidence detectors, project bindings/overlays, routing integration, validation, reports, and memory without creating application-specific rules.
status: verified
confidence: high
tags: [task-summary, custom-skills, detection, activation, overlay, validation]
trigger_terms: [reusable-custom-skill-system, custom-skill, stack, domain, overlay, continue]
affected_modules: [instruction-system, repository-governance, project-memory]
affected_paths: [AGENTS.md, README.md, components/instruction]
related_entities: []
related_features: [custom-skill-library, project-onboarding]
source_references: [components/instruction/reports/CUSTOM-SKILL-SYSTEM-READINESS.md, components/instruction/reports/CUSTOM-SKILL-STACK-DETECTION-REPORT.md, components/instruction/reports/CUSTOM-SKILL-DOMAIN-DETECTION-REPORT.md, components/instruction/reports/CUSTOM-SKILL-ACTIVATION-REPORT.md, components/instruction/reports/VALIDATION-REPORT.md]
evidence: [Fourteen technology and thirteen domain reusable skill contracts exist, Twenty-seven skills pass Skill Creator quick validation, Unified validation composes all four custom validators, Only the evidence-backed GitHub CI binding is active]
decision_or_fact: task_outcome
rationale: Preserve the implementation boundary and validated outcome outside chat history.
consequences: [Future projects can reuse bases and add only evidence-backed overlays, Application-specific work remains deferred until real sources exist]
risks: [Detection and activation manifests must be regenerated after a clone adds application evidence, External GitHub enforcement is still owner-verified]
valid_from: 2026-07-16
last_verified_at: 2026-07-16
review_after: 2026-10-16
created_at: 2026-07-16
updated_at: 2026-07-16
created_by_task: TASK-20260716-reusable-custom-skill-system
supersedes: []
superseded_by:
related_memories: [MEM-CUSTOM-SKILL-SYSTEM-0001, MEM-SKILL-SYSTEM-0001, MEM-TEMPLATE-STANDARD-0001]
detail_path: components/instruction/project-memory/tasks/completed/TASK-20260716-reusable-custom-skill-system.md
---

# Add reusable two-layer Custom Skill system

## Completed

- created 14 technology and 13 domain reusable bases with machine-readable contracts;
- recorded official upstream sources and version-sensitive areas for technology modules;
- created stack/domain detectors, project manifests, compatibility and activation rules;
- activated only `github-ci` and created one scoped overlay;
- integrated manifest routing into Constitution, Bootstrap, Orchestrator, AGENTS, onboarding, CI validation, reports, and memory;
- deferred all application versions, domain invariants, and project overlays that require real sources.

## Validation

All 27 custom skills pass Skill Creator quick validation. Custom lint, stack detection, domain detection, and 12 custom route fixtures pass and are composed by the unified validator.

## Recovery

All changes are version-controlled repository files. No application code, dependency, migration, public contract, production setting, or external system was changed.
