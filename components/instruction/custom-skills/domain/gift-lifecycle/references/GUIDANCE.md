# Gift Lifecycle Evidence Guide

This file lists review questions and safety dimensions. It does not assert that any candidate concept exists in a project.

## Candidate concepts to verify

- Gift issuer, sender, recipient, and beneficiary.
- Delivery, claim, redemption, expiry, cancellation, and transfer.
- Value/entitlement ownership and audit.
- Token secrecy and replay resistance.

## Evidence required

- Cite at least two independent authoritative artifacts across two categories.
- Prefer schema/migrations and domain source models, reinforced by tests or an approved contract/specification.
- Capture exact applicable paths and distinguish verified facts, conflicts, and unknowns.

## Guardrails

- Treat candidate concepts and lifecycles as questions until repository evidence verifies them.
- Preserve verified invariants across API, data, UI, jobs, events, and tests.
- Make authorization, idempotency, concurrency, audit, failure, and recovery behavior explicit where the verified model requires them.
- Verify one-time and ownership transitions atomically where evidence requires them.

## Validation questions

- Can a gift be claimed or redeemed twice?
- What happens on delivery failure, expiry, refund, or transfer?
- Which identities may inspect gift details before claim?

If the answers are not established by evidence, keep the skill inactive or provisional and add an open question instead of an invariant.
