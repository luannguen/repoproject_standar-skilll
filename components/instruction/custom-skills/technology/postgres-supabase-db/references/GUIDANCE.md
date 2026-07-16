# Postgres Supabase DB Guidance

## Required rules

- Express invariants with constraints and transactional boundaries where evidence supports them.
- Design RLS for least privilege and test authorized and unauthorized paths.
- Treat migrations as forward-safe, reviewable, and recoverable operations.

## Preferred patterns

- Additive-expand/contract migrations.
- Indexes derived from measured query paths and policy behavior.

## Blockers and anti-patterns

- Target schema, migration state, data volume, or rollback posture is unknown for a destructive operation.
- Edit production schema outside migrations.
- Use security-definer behavior without an explicit threat review.

## Validation

- Validate SQL and migrations, run policy/constraint tests, inspect query plans when performance changes, and verify rollback or recovery procedure.

Validate the smallest affected scope first, then the repository's required quality gates. Preserve public contracts, data, business behavior, and dependency versions unless the task explicitly authorizes a change.
