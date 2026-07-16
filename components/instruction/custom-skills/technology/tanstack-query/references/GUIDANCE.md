# TanStack Query Guidance

## Required rules

- Use stable structured query keys with clear ownership.
- Invalidate or update the exact affected cache after mutations.
- Make retry, stale-time, and error behavior intentional.

## Preferred patterns

- Central query-key factories.
- Optimistic updates with rollback and race handling.

## Blockers and anti-patterns

- Installed TanStack Query major or rendering/hydration environment is unknown.
- Treat server state as duplicate local state.
- Invalidate the whole cache for a narrowly scoped mutation.

## Validation

- Run hook/unit tests, mutation race tests, hydration tests where relevant, typecheck, and UI integration tests.

Validate the smallest affected scope first, then the repository's required quality gates. Preserve public contracts, data, business behavior, and dependency versions unless the task explicitly authorizes a change.
