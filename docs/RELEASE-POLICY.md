# Release Policy

The template layer follows semantic versioning through the root `VERSION` and `CHANGELOG.md`. Application releases require an evidence-backed release process created after onboarding.

## Template release gate

A template release requires:

- clean unified validation on supported local and CI platforms;
- synchronized registries, workflow/skill contracts, documentation, and Project Memory;
- no unresolved blocker or secret finding;
- compatibility and migration notes for breaking instruction contracts;
- a recoverable Git tag and release notes.

## Application release trigger

When application code and a deployment target exist, add:

- an authoritative version and immutable artifact strategy;
- build, unit, integration, contract, security, and migration checks appropriate to the stack;
- environment promotion and protected approval ownership;
- rollback or forward-recovery procedure with tested data constraints;
- observability, readiness criteria, incident ownership, and post-release verification.

Do not publish or deploy merely because the template validation passes. External publishing and production changes remain approval-gated.
