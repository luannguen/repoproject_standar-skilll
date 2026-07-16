# Tailwind shadcn Guidance

## Required rules

- Treat installed shadcn components as owned source code and preserve local conventions.
- Use semantic tokens instead of repeated arbitrary values.
- Verify keyboard, focus, contrast, responsive, and state behavior.

## Preferred patterns

- Composable primitives with variant-based APIs.
- Mobile-first layouts using repository tokens.

## Blockers and anti-patterns

- Tailwind major, components.json style, or token ownership is unknown for a configuration rewrite.
- Overwrite customized shadcn components from examples.
- Mix Tailwind major-specific configuration models.

## Validation

- Run style/build checks, component tests, accessibility checks, and targeted visual/browser verification.

Validate the smallest affected scope first, then the repository's required quality gates. Preserve public contracts, data, business behavior, and dependency versions unless the task explicitly authorizes a change.
