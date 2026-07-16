---
memory_id: MEM-DEBT-0001
memory_type: technical_debt
scope: level-0:project
status: supported
confidence: high
trigger_terms: [debt, onboarding, documentation, module-map, incident, architecture, specialist-skill]
source_references: [components/instruction/project-memory/audits/MEMORY-GAP-REPORT.md, components/instruction/project-memory/audits/MEMORY-REMEDIATION-BACKLOG.md, components/instruction/project-memory/audits/UI-UX-REMEDIATION-BACKLOG.md, components/instruction/project-memory/audits/BACKEND-REMEDIATION-BACKLOG.md]
last_verified_at: 2026-07-16
review_after: 2026-08-16
supersedes: []
superseded_by:
related_memories: [MEM-GAP-0001, MEM-QUESTION-0001, MEM-UI-0001, MEM-BACKEND-0001]
---

# Memory Debt

## Current debt

Project-specific semantic and episodic memory is unpopulated because the application codebase and authoritative documents are absent. Project Memory plus UI/UX and Backend Production procedural skills are usable, but they cannot yet supply application domain rules, Base44 capabilities, module maps, entities/schema, design tokens/components, contracts, incidents, migrations, deployment facts, or proven code patterns.

## Impact

Future implementation must not assume application behavior from this instruction-only baseline. The first task after source ingestion carries onboarding and verification cost.

## Remediation

Execute the Memory Remediation Backlog when sources arrive. Prioritize accepted specifications, instruction hierarchy, manifests/entry points, schema/migrations, auth/permission contracts, tests, deployment configuration, active checkpoints, and incidents.
