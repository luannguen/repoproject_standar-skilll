# RBAC Scoped Access Evidence Guide

This file lists review questions and safety dimensions. It does not assert that any candidate concept exists in a project.

## Candidate concepts to verify

- Actor and subject identities.
- Role/permission assignment scope.
- Policy precedence and deny behavior.
- Grant, expiry, delegation, and revocation.

## Evidence required

- Cite at least two independent authoritative artifacts across two categories.
- Prefer schema/migrations and domain source models, reinforced by tests or an approved contract/specification.
- Capture exact applicable paths and distinguish verified facts, conflicts, and unknowns.

## Guardrails

- Treat candidate concepts and lifecycles as questions until repository evidence verifies them.
- Preserve verified invariants across API, data, UI, jobs, events, and tests.
- Make authorization, idempotency, concurrency, audit, failure, and recovery behavior explicit where the verified model requires them.
- Enforce authorization at trusted boundaries, not UI visibility alone.

## Validation questions

- Which trusted boundary enforces each permission?
- How do revocation and cache invalidation propagate?
- Are horizontal and vertical escalation paths tested?

If the answers are not established by evidence, keep the skill inactive or provisional and add an open question instead of an invariant.
