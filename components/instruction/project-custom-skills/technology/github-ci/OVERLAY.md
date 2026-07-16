# GitHub CI Project Overlay

- Base skill: `components/instruction/custom-skills/technology/github-ci/SKILL.md`
- Applicable package: repository root
- Applicable paths: `.github/**`, `components/instruction/**`, `scripts/**`
- Detected platform version: platform-managed; action releases are explicit in workflow files
- Last verified: 2026-07-16

## Evidence-backed project facts

- `.github/workflows/quality-gates.yml` runs on `push` and `pull_request`.
- The workflow declares `permissions: contents: read`.
- The reusable-layer job runs on `ubuntu-latest` and `windows-latest`, with `fail-fast: false`.
- The workflow uses `actions/checkout@v6`, invokes PowerShell Core, and calls `./components/instruction/scripts/validate.ps1`.
- `components/instruction/scripts/validate.ps1` is the single CI/local composition entry point and must remain synchronized with required validators.

## Narrowing rules

- Preserve Windows/Linux parity for reusable instruction-system checks.
- Any new mandatory validator must be composed by `validate.ps1`; the workflow should continue to call the unified entry point.
- Workflow permission increases, new secrets, external publication, deployment, or release side effects require the applicable approval and security review.
- This overlay says nothing about application build, runtime, deployment, or domain behavior because no such evidence exists.
