# Reusable Custom Skill System

This directory is Layer A: a reusable, version-aware library of technology and domain skills. It augments, and never replaces, the Standard Skills in `../skills`.

Layer B lives in `../project-custom-skills`. It contains detection manifests, active bindings, and evidence-backed overlays for one repository. A reusable base must never contain project secrets, project paths, tenant identifiers, or inferred business invariants.

## Runtime routing

1. Read the project stack and domain manifests.
2. Select only bindings in `ACTIVE-CUSTOM-SKILLS.json` whose scope intersects the task.
3. Load the reusable `SKILL.md`, then its contract and only the references needed for the task.
4. Apply the project overlay last. The overlay may narrow a base rule but may not weaken the Constitution, security, compatibility, or production requirements.
5. Route Standard Skills independently through `SKILL-REGISTRY.json`.

A skill is active only when detection is `true`, confidence is `HIGH` or `MEDIUM`, and the task touches its declared technology/domain and scope. `LOW` requires confirmation; `NONE` is inactive. Domain skills additionally require structural evidence from source, schema, tests, contracts, or authoritative specifications. Names, navigation labels, comments, and marketing copy are not domain evidence.

## Status and activation

- Status: `available`, `active`, `provisional`, `deprecated`, `disabled`.
- Activation mode: `auto`, `confirmation_required`, `manual`, `disabled`.
- `available` means reusable but not project-active.
- `provisional` means evidence exists but needs confirmation or stronger coverage.

Run the four custom validators before declaring this system ready. The root `validate.ps1` composes them with all Standard Skill checks.
