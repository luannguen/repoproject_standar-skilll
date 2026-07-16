# Conflicting Rules Report

Date: 2026-07-16

## Resolved conflicts and ambiguities

| Topic | Prior ambiguity | Resolution |
|---|---|---|
| Authority | AGENTS and Bootstrap could not explain precedence among memory and specialist rules | Constitution defines full project-local hierarchy and stop behavior |
| Startup order | Existing Bootstrap called Project Memory before any orchestration; target architecture requires task/risk selection first | Orchestrator now classifies and selects; Memory then retrieves task-specific context |
| UI/backend overlap | Full-stack API, schema, permission, state, and error checks existed in both skills | Primary workflow owns sequence; both skills reconcile one shared contract before implementation |
| Memory authority | Memory is mandatory but could be mistaken for truth | Current verified source evidence outranks memory; memory routes and synthesizes only |
| Self-update | Existing skills allowed reusable updates but no system-wide weakening rule | Constitution requires version, registry sync, lint, memory, and approval for weakening |
| Production action | Specialist rules prohibited some actions but no shared approval vocabulary existed | Approval Gates AG-01 through AG-12 apply across workflows |
| Platform claims | Backend routing referenced Base44 specifically despite no current project configuration | Routing and common contract use evidence-based platform capability; Base44 remains only a capability to verify if project evidence later establishes it |
| Specialist duplication | New cross-cutting skills overlap backend references for security, data, migration, testing, and observability | Backend owns backend implementation invariants; capability skills own cross-cutting analysis and validation; Orchestrator names one owner per task surface |

## Unresolved conflicts

None in the instruction system. Application-level conflicts cannot be assessed because no application evidence exists. Any future current-source versus memory conflict is handled by the Constitution and Project Memory conflict policy.

## Rule duplication assessment

Shared governance lives in Constitution, registries, approval gates, and workflows. Capability skills carry domain-specific gates and do not copy a universal checklist. Existing detailed UI/backend/memory references were preserved rather than duplicated into new skills.
