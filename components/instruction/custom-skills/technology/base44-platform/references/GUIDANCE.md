# Base44 Platform Guidance

## Required rules

- Detect whether the app editor, exported code, SDK, or beta CLI owns each artifact.
- Verify permissions and security rules before publishing.
- Treat beta CLI and backend behavior as unstable and re-check official docs.

## Preferred patterns

- Explicit ownership map between Base44-managed and repository-managed artifacts.
- Repository-backed review for exported or CLI-managed changes.

## Blockers and anti-patterns

- Base44 project mode, source ownership, or sync direction is unclear.
- Overwrite Base44-managed artifacts without verifying sync behavior.
- Infer platform APIs from generated code or model memory.

## Validation

- Validate entity/function/auth definitions, permissions, security scan evidence, sync behavior, and target deployment.

Validate the smallest affected scope first, then the repository's required quality gates. Preserve public contracts, data, business behavior, and dependency versions unless the task explicitly authorizes a change.
