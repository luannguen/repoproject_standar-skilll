# PWA WebView Guidance

## Required rules

- Define cache ownership, versioning, update, and invalidation explicitly.
- Treat host bridges and deep links as untrusted input boundaries.
- Test target browser/WebView capabilities instead of assuming parity.

## Preferred patterns

- Network strategy selected per resource class.
- Explicit update notification and recovery path.

## Blockers and anti-patterns

- Target browser, operating system, WebView host, or offline contract is unknown.
- Cache authenticated API responses indiscriminately.
- Assume service-worker support or installability inside every WebView.

## Validation

- Run manifest checks, offline/update tests, target browser tests, bridge security tests, and cache recovery tests.

Validate the smallest affected scope first, then the repository's required quality gates. Preserve public contracts, data, business behavior, and dependency versions unless the task explicitly authorizes a change.
