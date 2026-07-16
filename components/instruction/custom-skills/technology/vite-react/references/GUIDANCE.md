# Vite React Guidance

## Required rules

- Keep client-exposed and server-only environment values separate.
- Use detected Vite plugin and module conventions.
- Validate development and production builds when configuration changes.

## Preferred patterns

- Typed environment declarations and minimal plugin configuration.
- Scope build changes to the owning package.

## Blockers and anti-patterns

- Build target, Vite major, or deployment base path is ambiguous.
- Apply Next.js server APIs to a Vite client application.
- Expose secrets through import.meta.env client variables.

## Validation

- Run Vite production build, typecheck, lint, and affected browser/integration tests.

Validate the smallest affected scope first, then the repository's required quality gates. Preserve public contracts, data, business behavior, and dependency versions unless the task explicitly authorizes a change.
