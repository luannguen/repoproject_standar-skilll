# React Hook Form Zod Guidance

## Required rules

- Treat the schema as a boundary, not proof of authorization.
- Define coercion and empty/null behavior explicitly.
- Associate errors, labels, focus, and submission states accessibly.

## Preferred patterns

- Infer TypeScript input/output types from one intentional schema.
- Map server errors without losing client validation context.

## Blockers and anti-patterns

- Source-of-truth schema or server contract is ambiguous.
- Trust client validation as a security control.
- Duplicate divergent validation rules across form and API.

## Validation

- Run schema tests, form interaction/accessibility tests, typecheck, and server-boundary tests.

Validate the smallest affected scope first, then the repository's required quality gates. Preserve public contracts, data, business behavior, and dependency versions unless the task explicitly authorizes a change.
