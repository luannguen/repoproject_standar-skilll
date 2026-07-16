# Custom Skill Conflict Report

Date: 2026-07-16

No unresolved material conflict remains.

| Concern | Resolution |
|---|---|
| Standard Skills versus Custom Skills | Registries and authority are separate; Custom Skills augment and cannot replace or weaken Standard Skills. |
| Reusable domain library versus evidence-only domain creation | Reusable modules are inactive guardrails/questions; no project domain overlay or verified invariant exists. |
| Automatic discovery versus context efficiency | Detection is automatic, but loading requires an active binding plus task/package/path intersection. |
| Skill metadata implicit invocation versus manifest routing | Every custom `agents/openai.yaml` sets `allow_implicit_invocation: false`; AI-BOOTSTRAP reads project manifests. |
| Composite stack convenience versus giant copied skill | Profiles list skill IDs and prerequisites only; they contain no rule or activation state. |
| Upstream currency versus dependency stability | Official sources are re-verified for version-sensitive work; the skill never upgrades a dependency merely to match newer guidance. |
| Project overlays versus reusable bases | Layer B may narrow with cited facts but cannot copy the base, hold secrets, expand scope, or weaken production/security rules. |

Compatibility is evaluated per package/path. Next.js and Vite are incompatible only in the same application scope; monorepo coexistence remains possible with disjoint bindings.
