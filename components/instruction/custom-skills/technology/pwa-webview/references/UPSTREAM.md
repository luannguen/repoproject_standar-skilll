# PWA WebView Upstream Ledger

- Last checked: 2026-07-16
- Base status: reusable and version-neutral
- Detected project version: recorded only in Layer B

## Official sources

- [MDN making PWAs installable](https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable)
- [MDN Service Worker API](https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API)
- [MDN Web App Manifest](https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps/Manifest)

## Version-sensitive areas

- Installability criteria, service-worker lifecycle, browser compatibility, storage quotas, and native bridge behavior.

## Classification policy

- Verified: supported by the official source and the detected project release.
- Deprecated: upstream marks the API or release obsolete; do not introduce new use.
- Migration-only: load only for an explicitly authorized upgrade or migration.
- Unverified: source is unavailable, release is unknown, or evidence conflicts; block version-sensitive implementation and request confirmation.

Do not copy official documentation into this skill. Re-check the sources when a major version, platform contract, or deprecation boundary changes.
