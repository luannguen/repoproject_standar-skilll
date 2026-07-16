---
name: tailwind-shadcn
description: Version-aware Tailwind shadcn production guidance. Use only when project detection and an active binding prove this technology is in the task scope; trigger on editing Tailwind configuration or CSS, shadcn components, design tokens, responsive layout, themes, or component registry configuration.
---

# Tailwind shadcn Router

1. Read `references/CONTRACT.json` and the project binding before acting.
2. Confirm detection confidence, applicable package/path, installed version, and task intersection.
3. Read `references/UPSTREAM.md` for version-sensitive work and verify current official documentation when needed.
4. Load `references/GUIDANCE.md` plus only the required Standard Skills.
5. Apply the project overlay last; reject secrets, unsupported assumptions, copied upstream docs, or weakened production rules.

Block when the skill is inactive, scope is ambiguous, the detected version is unsupported or unknown for a version-sensitive change, compatibility fails, or required evidence is absent. Do not upgrade dependencies merely to match this reusable skill.

## References

- Contract: `references/CONTRACT.json`
- Operating guidance: `references/GUIDANCE.md`
- Official-source ledger: `references/UPSTREAM.md`
