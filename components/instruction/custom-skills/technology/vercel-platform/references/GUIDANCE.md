# Vercel Platform Guidance

## Required rules

- Separate development, preview, and production configuration.
- Use least-privilege credentials and environment-scoped access.
- Confirm function runtime and regional behavior before relying on platform semantics.

## Preferred patterns

- Preview validation before promotion.
- Explicit deployment protection and rollback posture.

## Blockers and anti-patterns

- Project linkage, target environment, or runtime is ambiguous.
- Store secrets in vercel.json or source.
- Assume preview and production environment values are identical.

## Validation

- Validate configuration syntax, build output, preview behavior, security controls, and rollback readiness.

Validate the smallest affected scope first, then the repository's required quality gates. Preserve public contracts, data, business behavior, and dependency versions unless the task explicitly authorizes a change.
