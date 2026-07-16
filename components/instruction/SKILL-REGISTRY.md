# Skill Registry

Machine-readable source: [SKILL-REGISTRY.json](SKILL-REGISTRY.json). The orchestrator reads this registry first and loads only selected skills.

| ID | Version | Status | Default risk | Path |
|---|---:|---|---|---|
| project-orchestrator | 1.1.0 | active | LOW | [SKILL.md](skills/project-orchestrator/SKILL.md) |
| project-memory | 1.1.0 | active | LOW | [SKILL.md](skills/project-memory/SKILL.md) |
| requirement-analysis | 1.0.0 | active | LOW | [SKILL.md](skills/requirement-analysis/SKILL.md) |
| system-architecture | 1.0.0 | active | MEDIUM | [SKILL.md](skills/system-architecture/SKILL.md) |
| ui-ux-production | 1.1.0 | active | MEDIUM | [SKILL.md](skills/ui-ux-production/SKILL.md) |
| backend-production-engineering | 1.1.0 | active | MEDIUM | [SKILL.md](skills/backend-production-engineering/SKILL.md) |
| api-integration | 1.0.0 | active | MEDIUM | [SKILL.md](skills/api-integration/SKILL.md) |
| data-lifecycle | 1.0.0 | active | HIGH | [SKILL.md](skills/data-lifecycle/SKILL.md) |
| testing-quality | 1.0.0 | active | LOW | [SKILL.md](skills/testing-quality/SKILL.md) |
| security-threat-modeling | 1.0.0 | active | HIGH | [SKILL.md](skills/security-threat-modeling/SKILL.md) |
| code-review-refactoring | 1.0.0 | active | MEDIUM | [SKILL.md](skills/code-review-refactoring/SKILL.md) |
| dependency-evolution | 1.0.0 | active | HIGH | [SKILL.md](skills/dependency-evolution/SKILL.md) |
| devops-release | 1.0.0 | active | HIGH | [SKILL.md](skills/devops-release/SKILL.md) |
| observability-incident | 1.0.0 | active | HIGH | [SKILL.md](skills/observability-incident/SKILL.md) |
| performance-scalability | 1.0.0 | active | MEDIUM | [SKILL.md](skills/performance-scalability/SKILL.md) |
| documentation-sync | 1.0.0 | active | LOW | [SKILL.md](skills/documentation-sync/SKILL.md) |
| migration-compatibility | 1.0.0 | active | HIGH | [SKILL.md](skills/migration-compatibility/SKILL.md) |
| analytics-telemetry | 1.0.0 | active | MEDIUM | [SKILL.md](skills/analytics-telemetry/SKILL.md) |
| ai-agent-safety | 1.0.0 | active | HIGH | [SKILL.md](skills/ai-agent-safety/SKILL.md) |
| domain-skill-framework | 1.0.0 | active | MEDIUM | [SKILL.md](skills/domain-skill-framework/SKILL.md) |
| project-bootstrap-governance | 1.1.0 | active | MEDIUM | [SKILL.md](skills/project-bootstrap-governance/SKILL.md) |

## Registry rules

- IDs and paths are unique; versions use semantic versioning.
- Every dependency points to an active registered skill and the dependency graph is acyclic.
- Every active skill has triggers, task classes, workflow usage, interface metadata, and the common 26-field contract.
- Related skills express composition, not execution order; dependency skills express required availability.
- Add, rename, deprecate, merge, or remove a skill in the JSON registry, affected workflows, bootstrap routing, validation, changelog, and Project Memory as one coherent change.
