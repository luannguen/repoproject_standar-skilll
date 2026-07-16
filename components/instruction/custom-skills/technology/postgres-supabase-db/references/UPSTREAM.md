# Postgres Supabase DB Upstream Ledger

- Last checked: 2026-07-16
- Base status: reusable and version-neutral
- Detected project version: recorded only in Layer B

## Official sources

- [PostgreSQL row security](https://www.postgresql.org/docs/current/ddl-rowsecurity.html)
- [PostgreSQL current documentation](https://www.postgresql.org/docs/current/)
- [Supabase database migrations](https://supabase.com/docs/guides/deployment/database-migrations)
- [Supabase Postgres Agent Skills](https://github.com/supabase/agent-skills)

## Version-sensitive areas

- PostgreSQL major behavior, extensions, RLS semantics, migration tooling, pooling, and managed-platform restrictions.

## Classification policy

- Verified: supported by the official source and the detected project release.
- Deprecated: upstream marks the API or release obsolete; do not introduce new use.
- Migration-only: load only for an explicitly authorized upgrade or migration.
- Unverified: source is unavailable, release is unknown, or evidence conflicts; block version-sensitive implementation and request confirmation.

Do not copy official documentation into this skill. Re-check the sources when a major version, platform contract, or deprecation boundary changes.
