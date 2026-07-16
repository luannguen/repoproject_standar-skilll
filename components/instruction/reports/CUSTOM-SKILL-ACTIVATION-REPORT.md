# Custom Skill Activation Report

Date: 2026-07-16

## Active binding

`github-ci` is the only active Custom Skill.

- Confidence: HIGH.
- Evidence: `.git/config` and `.github/workflows/quality-gates.yml`.
- Scope: repository root; `.github/**`, `components/instruction/**`, and `scripts/**`.
- Task types: CI, repository governance, release automation, and validation.
- Overlay: `project-custom-skills/technology/github-ci/OVERLAY.md`.
- Required Standard Skills: devops-release, security-threat-modeling, testing-quality, documentation-sync.

The binding does not apply to application behavior. All other reusable skills are inactive because they are absent from `ACTIVE-CUSTOM-SKILLS.json`. Composite stack profiles are routing shortcuts and cannot activate skills.

Routing tests cover positive path/type intersections and negative cases for inactive Next.js, Supabase, payment-domain, profile, task-only, and path-only signals.
