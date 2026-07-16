# Next.js Guidance

## Required rules

- Detect App Router versus Pages Router before selecting an API.
- Make server/client and runtime boundaries explicit.
- Treat caching, revalidation, redirects, and middleware as version-sensitive behavior.

## Preferred patterns

- Server-first data access with intentional client islands.
- Explicit cache and revalidation policy backed by tests.

## Blockers and anti-patterns

- Router type or deployment runtime is ambiguous for the requested change.
- Mix Pages Router and App Router APIs without evidence.
- Assume Node runtime where Edge or another runtime is configured.

## Validation

- Run Next.js build, typecheck, lint, route tests, and affected integration tests.

Validate the smallest affected scope first, then the repository's required quality gates. Preserve public contracts, data, business behavior, and dependency versions unless the task explicitly authorizes a change.
