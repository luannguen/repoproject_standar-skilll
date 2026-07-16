# Workflow Registry

Machine-readable source: [WORKFLOW-REGISTRY.json](WORKFLOW-REGISTRY.json). Select exactly one primary workflow, then compose only the capability skills needed by its task surfaces.

| ID | Version | Status | Default risk | Required skills | Path |
|---|---:|---|---|---:|---|
| project-onboarding | 1.0.0 | active | MEDIUM | 7 | [WORKFLOW.md](workflows/project-onboarding/WORKFLOW.md) |
| feature-development | 1.0.0 | active | MEDIUM | 5 | [WORKFLOW.md](workflows/feature-development/WORKFLOW.md) |
| bug-fix | 1.0.0 | active | MEDIUM | 5 | [WORKFLOW.md](workflows/bug-fix/WORKFLOW.md) |
| refactoring | 1.0.0 | active | MEDIUM | 5 | [WORKFLOW.md](workflows/refactoring/WORKFLOW.md) |
| migration | 1.0.0 | active | HIGH | 8 | [WORKFLOW.md](workflows/migration/WORKFLOW.md) |
| dependency-upgrade | 1.0.0 | active | HIGH | 7 | [WORKFLOW.md](workflows/dependency-upgrade/WORKFLOW.md) |
| release | 1.0.0 | active | HIGH | 6 | [WORKFLOW.md](workflows/release/WORKFLOW.md) |
| incident-response | 1.0.0 | active | CRITICAL | 6 | [WORKFLOW.md](workflows/incident-response/WORKFLOW.md) |
| documentation | 1.0.0 | active | LOW | 3 | [WORKFLOW.md](workflows/documentation/WORKFLOW.md) |
| performance-optimization | 1.0.0 | active | MEDIUM | 6 | [WORKFLOW.md](workflows/performance-optimization/WORKFLOW.md) |
| security-review | 1.0.0 | active | HIGH | 5 | [WORKFLOW.md](workflows/security-review/WORKFLOW.md) |
| ai-feature | 1.0.0 | active | HIGH | 8 | [WORKFLOW.md](workflows/ai-feature/WORKFLOW.md) |

## Selection precedence

1. An uninstantiated clone or repository-baseline task selects project-onboarding before application work.
2. Active production impact selects `incident-response`.
3. Production promotion selects `release`; a migration inside a release is a nested phase, not a second primary workflow.
4. A compatibility transition selects `migration`; dependency-only evolution selects `dependency-upgrade`.
5. AI behavior selects `ai-feature`; a security-only assessment selects `security-review`.
6. Measured optimization selects `performance-optimization`; behavior-preserving structural work selects `refactoring`.
7. A defect selects `bug-fix`; new behavior selects `feature-development`; documentation-only work selects `documentation`.

When several apply, choose the workflow with the highest risk and dominant outcome, then include other concerns through optional skills and phases.
