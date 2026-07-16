# Next.js Upstream Ledger

- Last checked: 2026-07-16
- Base status: reusable and version-neutral
- Detected project version: recorded only in Layer B

## Official sources

- [Next.js App Router docs](https://nextjs.org/docs/app)
- [Next.js Pages Router docs](https://nextjs.org/docs/pages)
- [Next.js support policy](https://nextjs.org/support-policy)

## Version-sensitive areas

- Router-specific APIs, caching defaults, middleware/proxy naming, and runtime support.
- React compatibility and build/deployment requirements.

## Classification policy

- Verified: supported by the official source and the detected project release.
- Deprecated: upstream marks the API or release obsolete; do not introduce new use.
- Migration-only: load only for an explicitly authorized upgrade or migration.
- Unverified: source is unavailable, release is unknown, or evidence conflicts; block version-sensitive implementation and request confirmation.

Do not copy official documentation into this skill. Re-check the sources when a major version, platform contract, or deprecation boundary changes.
