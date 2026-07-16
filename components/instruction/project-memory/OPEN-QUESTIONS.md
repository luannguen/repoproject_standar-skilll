---
memory_id: MEM-QUESTION-0001
memory_type: open_question
scope: level-0:project
status: provisional
confidence: low
trigger_terms: [onboarding, product, domain, stack, architecture, authentication, deployment, testing]
source_references: [components/instruction/project-memory/PROJECT-SNAPSHOT.md, components/instruction/project-memory/audits/MEMORY-GAP-REPORT.md, components/instruction/project-memory/audits/UI-UX-AUDIT.md, components/instruction/project-memory/audits/BACKEND-AUDIT.md]
last_verified_at: 2026-07-16
review_after: 2026-08-16
supersedes: []
superseded_by:
related_memories: [MEM-PROJECT-0001, MEM-GAP-0001, MEM-DEBT-0001, MEM-UI-0001, MEM-BACKEND-0001]
---

# Open Questions

The following are unknown because no application sources or approved project documents existed during audit:

- What product and game rules does the application implement?
- What languages, frameworks, runtimes, packages, and module boundaries exist?
- What are the entities, schema, ownership boundaries, and source-of-truth rules?
- What are the authentication, authorization, tenant, privacy, and security models?
- What API, event, storage, analytics, or third-party integration contracts exist?
- What application UI framework, design system, tokens, components, user flows, accessibility baseline, and frontend tooling exist? (Production procedural rules now exist.)
- What application-specific backend architecture, Base44 capabilities/limits, testing, migration, documentation, observability, and deployment rules apply? (Production procedural rules now exist.)
- What environments, release workflow, monitoring, and incident procedures exist?
- What work is active, blocked, or historically important?

Close each question only with current repository evidence or an explicitly approved source. Update or split this entry after onboarding.
