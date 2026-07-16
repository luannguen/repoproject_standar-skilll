# Routing Gap Report

Date: 2026-07-16

| Pre-task gap | Consequence | Resolution |
|---|---|---|
| Bootstrap started with task class then Project Memory; no Orchestrator | No consistent risk, workflow, approval, or minimal-context selection | Bootstrap now routes Constitution ? registries ? Orchestrator ? approvals ? Memory ? workflow/skills |
| Only UI and backend had explicit specialist routes | Requirements, architecture, security, test, migration, release, incident, performance, analytics, and AI concerns could be missed | 20-skill registry plus task/risk capability routing |
| No primary workflow selection | Agents could improvise sequence or combine incompatible lifecycles | 11 workflows and deterministic precedence |
| No approval map | Production, destructive, external, paid, data, security, and breaking actions lacked one project-local gate source | 12 approval gates referenced by every workflow |
| No MEDIUM+ execution brief | Scope, evidence, risks, validation, and recovery decisions could remain implicit | Orchestrator Task Execution Brief contract |
| No unused-skill or workflow-use validation | Orphan instructions could silently accumulate | Skill/workflow lint enforces bidirectional usage |
| No dependency-cycle validation | Routing could become impossible | Skill lint performs DAG traversal |
| No link/route tests | Bootstrap and references could drift | Route test checks paths, links, routes, anti-patterns, and ordering |
| Domain skill creation unconstrained | Workspace names or one-off tasks could produce invented business rules | Domain Skill Framework requires authoritative repeated application evidence |

## Route examples

- UI feature: feature-development + requirement-analysis + ui-ux-production + testing-quality + documentation-sync; add backend/API/data/security only when affected.
- Backend bug: bug-fix + backend-production-engineering + testing-quality; add observability/data/security by evidence.
- Schema migration release: migration as primary until transition is verified; release governs authorized promotion as a nested phase.
- Active outage: incident-response dominates feature/bug/release work.
- AI tool feature: ai-feature + ai-agent-safety + security-threat-modeling + testing-quality + observability; tool permissions remain deterministic outside the model.

No active unrouted registered skill or workflow remains.
