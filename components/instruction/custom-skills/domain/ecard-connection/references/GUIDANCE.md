# Ecard Connection Evidence Guide

This file lists review questions and safety dimensions. It does not assert that any candidate concept exists in a project.

## Candidate concepts to verify

- Card owner, viewer, recipient, and connection identities.
- Share/request/accept/reject/block/revoke lifecycle.
- Field-level visibility and consent.
- Synchronization and stale-copy behavior.

## Evidence required

- Cite at least two independent authoritative artifacts across two categories.
- Prefer schema/migrations and domain source models, reinforced by tests or an approved contract/specification.
- Capture exact applicable paths and distinguish verified facts, conflicts, and unknowns.

## Guardrails

- Treat candidate concepts and lifecycles as questions until repository evidence verifies them.
- Preserve verified invariants across API, data, UI, jobs, events, and tests.
- Make authorization, idempotency, concurrency, audit, failure, and recovery behavior explicit where the verified model requires them.
- Verify consent and visibility at the trusted read boundary.

## Validation questions

- Who can view each field in each relationship state?
- How do block/revoke changes propagate?
- Are duplicate or crossed requests deterministic?

If the answers are not established by evidence, keep the skill inactive or provisional and add an open question instead of an invariant.
