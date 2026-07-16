---
memory_id: TASK-20260716-backend-production-engineering-skill
memory_type: task_summary
scope: level-4:task:backend-production-engineering-skill
status: verified
confidence: high
trigger_terms: [backend-production-engineering, backend-skill, base44, data-integrity, authorization, reliability, observability, routing]
source_references: [AGENTS.md, components/instruction/AI-BOOTSTRAP.md, components/instruction/skills/backend-production-engineering/SKILL.md, components/instruction/project-memory/audits/BACKEND-AUDIT.md, components/instruction/project-memory/audits/BACKEND-PRODUCTION-RISK-REPORT.md, components/instruction/project-memory/audits/BACKEND-REMEDIATION-BACKLOG.md]
last_verified_at: 2026-07-16
review_after: 2026-10-16
supersedes: []
superseded_by:
related_memories: [MEM-BACKEND-0001, MEM-CONSTRAINT-0001, MEM-GAP-0001, MEM-DEBT-0001, MEM-UI-0001, TASK-20260716-project-memory-onboarding]
---

# Create Backend Production Engineering skill

## Objective

Create a mandatory project-local Backend Engineering Operating System for production analysis, design, implementation, refactor, debug, migration, review, validation, operations, and controlled learning.

## Completed work

- Initialized components/instruction/skills/backend-production-engineering with standard skill metadata.
- Kept SKILL.md as an 85-line contract/workflow/router and moved detailed rules into progressive references.
- Added production rules for domain invariants, architecture/boundaries, Base44 capability verification, data/query/money, API/validation/errors/integrations/webhooks/storage, authorization/tenant/security/privacy/configuration, transactions/concurrency/idempotency/jobs/performance/recovery, observability/audit, migrations/compatibility/deployment, and testing.
- Added Backend Decision Summary, reuse ladder, contract/data-impact analysis, implementation plan, pre/post gates, twelve-role self-review, unavailable-check evidence, exception policy, and controlled learning.
- Added exactly 70 classified anti-patterns and reusable production patterns.
- Made the skill, capability verification, Backend Decision Summary, and pre-implementation gate mandatory in AGENTS.md and AI-BOOTSTRAP.md before backend code.
- Created backend current-state audit, production-risk report, and source-triggered remediation backlog.
- Updated project snapshot, gap/debt/questions, shared/UI backlogs/audits, stale report, onboarding checkpoint, and Project Memory indexes without fabricating application facts.

## Structure decision

Use the existing specialist-skill convention:

- SKILL.md and agents/openai.yaml at the skill root;
- RULES, ARCHITECTURE, PLATFORM, DATA, API, SECURITY, RELIABILITY, OBSERVABILITY, MIGRATIONS, TESTING, PATTERNS, ANTI-PATTERNS, CHECKLIST, and CHANGELOG under references/.

This follows skill-creator progressive disclosure, matches the path already reserved by AI-BOOTSTRAP, keeps each rule topic under one owner, and avoids a parallel instruction system. Repository audit/risk/backlog records stay in Project Memory because they describe current evidence rather than reusable normative procedure.

## Validation

- skill-creator validation logic: valid;
- required skill/reference files: present;
- skill contract fields: 19/19;
- requested anti-patterns: 70/70;
- SKILL.md length: 85 lines;
- routing/enforcement: present in AGENTS.md and AI-BOOTSTRAP.md;
- Markdown links: valid;
- unfinished TODO/TBD/FIXME markers: zero;
- long reference files without Contents: zero;
- UTF-8 mojibake markers: zero;
- agents/openai.yaml metadata: valid.
- Project Memory lint after index/detail write: 0 BLOCKER, 0 WARN, 13 indexed entries.

The installed Python runtime lacks PyYAML, so quick_validate ran through a temporary flat-frontmatter compatibility shim; the shim was removed and no dependency was added.

## Unverified application-specific areas

No application source, Base44 project configuration, manifest, entity/schema, service/function, authentication/authorization/tenant implementation, integration/webhook/payment/job/storage, logging/observability, migration, deployment, test, runtime evidence, or Git history exists. Application typecheck/lint/build/tests, authorization/tenant/concurrency/idempotency/integration/migration/load/security tests, runtime observability, and actual platform capability verification could not run. These remain explicit P0/P1 work in the backend risk report, remediation backlog, and onboarding checkpoint.

## Memory update

Created MEM-BACKEND-0001, closed the missing-backend-skill row in MEM-GAP-0001, refreshed cross-skill/project memories, and kept application onboarding blocked only on authoritative application/Base44/business/schema/auth/test/deployment sources.
