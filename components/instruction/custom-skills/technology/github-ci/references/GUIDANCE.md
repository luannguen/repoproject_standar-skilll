# GitHub CI Guidance

## Required rules

- Declare least-privilege GITHUB_TOKEN permissions.
- Treat pull-request input and third-party actions as untrusted supply-chain boundaries.
- Keep local validation and CI entry points aligned across supported runners.

## Preferred patterns

- Explicit permissions and concurrency policy.
- Pinned, reviewed actions with deterministic validation commands.

## Blockers and anti-patterns

- Workflow permissions, event trust boundary, or required secret ownership is unclear.
- Interpolate untrusted context directly into shell code.
- Grant write-all permissions by default or store secrets in workflows.

## Validation

- Parse workflows, run repository validation locally, inspect trigger/permission behavior, and verify supported runner parity.

Validate the smallest affected scope first, then the repository's required quality gates. Preserve public contracts, data, business behavior, and dependency versions unless the task explicitly authorizes a change.
