# React TypeScript Guidance

## Required rules

- Preserve hook ordering and render purity.
- Prefer explicit domain types and narrow unknown values at boundaries.
- Match the repository component and state ownership conventions.

## Preferred patterns

- Small typed components with explicit ownership.
- Accessible semantic controls and deterministic state transitions.

## Blockers and anti-patterns

- React or TypeScript major cannot be established for a version-sensitive API.
- Use effects to derive values that can be computed during render.
- Silence type errors with broad any casts.

## Validation

- Run the repository TypeScript check, lint, component tests, and accessibility checks in affected scope.

Validate the smallest affected scope first, then the repository's required quality gates. Preserve public contracts, data, business behavior, and dependency versions unless the task explicitly authorizes a change.
