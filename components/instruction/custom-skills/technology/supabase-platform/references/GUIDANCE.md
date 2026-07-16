# Supabase Platform Guidance

## Required rules

- Enforce RLS on exposed data paths and never expose service-role credentials to clients.
- Use migrations and repository-controlled configuration for reproducible changes.
- Verify Auth session and server/client boundaries against the installed libraries.

## Preferred patterns

- Least-privilege clients backed by explicit RLS policies.
- Migration-first database and platform changes.

## Blockers and anti-patterns

- Project reference, ownership boundary, or credential exposure risk is unclear.
- Use service-role credentials in browser code.
- Rely on dashboard-only mutations without reproducible repository artifacts.

## Validation

- Run Supabase/database lint where available, policy tests, migration checks, and affected integration tests.

Validate the smallest affected scope first, then the repository's required quality gates. Preserve public contracts, data, business behavior, and dependency versions unless the task explicitly authorizes a change.
