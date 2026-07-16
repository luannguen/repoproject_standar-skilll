# Node.js Runtime Guidance

## Required rules

- Use a supported LTS release for production unless the project explicitly records another policy.
- Match ESM/CommonJS behavior and package exports to repository configuration.
- Handle process shutdown, async errors, resource limits, and untrusted input explicitly.

## Preferred patterns

- Pinned runtime policy with CI parity.
- Graceful shutdown and bounded resource usage.

## Blockers and anti-patterns

- Runtime version or module mode cannot be established for a version-sensitive change.
- Assume local Node matches CI or production.
- Use deprecated or experimental APIs without an explicit compatibility decision.

## Validation

- Run on declared runtime versions, typecheck/lint, unit/integration tests, and process lifecycle tests.

Validate the smallest affected scope first, then the repository's required quality gates. Preserve public contracts, data, business behavior, and dependency versions unless the task explicitly authorizes a change.
