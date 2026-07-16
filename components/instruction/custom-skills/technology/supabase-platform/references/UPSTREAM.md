# Supabase Platform Upstream Ledger

- Last checked: 2026-07-16
- Base status: reusable and version-neutral
- Detected project version: recorded only in Layer B

## Official sources

- [Supabase AI tools](https://supabase.com/docs/guides/ai-tools)
- [Supabase Agent Skills](https://github.com/supabase/agent-skills)
- [Supabase RLS guide](https://supabase.com/docs/guides/database/postgres/row-level-security)
- [Supabase migrations](https://supabase.com/docs/guides/deployment/database-migrations)

## Version-sensitive areas

- Auth session APIs, SSR helpers, CLI commands, RLS behavior, Edge runtime, and platform feature maturity.

## Classification policy

- Verified: supported by the official source and the detected project release.
- Deprecated: upstream marks the API or release obsolete; do not introduce new use.
- Migration-only: load only for an explicitly authorized upgrade or migration.
- Unverified: source is unavailable, release is unknown, or evidence conflicts; block version-sensitive implementation and request confirmation.

Do not copy official documentation into this skill. Re-check the sources when a major version, platform contract, or deprecation boundary changes.
