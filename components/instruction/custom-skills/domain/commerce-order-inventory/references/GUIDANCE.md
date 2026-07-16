# Commerce Order Inventory Evidence Guide

This file lists review questions and safety dimensions. It does not assert that any candidate concept exists in a project.

## Candidate concepts to verify

- Order and line-item state machines.
- Inventory availability, reservation, and allocation.
- Fulfillment, cancellation, return, and adjustment.
- Pricing/tax snapshots and audit history.

## Evidence required

- Cite at least two independent authoritative artifacts across two categories.
- Prefer schema/migrations and domain source models, reinforced by tests or an approved contract/specification.
- Capture exact applicable paths and distinguish verified facts, conflicts, and unknowns.

## Guardrails

- Treat candidate concepts and lifecycles as questions until repository evidence verifies them.
- Preserve verified invariants across API, data, UI, jobs, events, and tests.
- Make authorization, idempotency, concurrency, audit, failure, and recovery behavior explicit where the verified model requires them.
- Verify atomicity and concurrency behavior for inventory-affecting transitions.

## Validation questions

- Can retries double-reserve or double-release stock?
- Which transitions are legal and who may invoke them?
- How are partial fulfillment, cancellation, and compensation handled?

If the answers are not established by evidence, keep the skill inactive or provisional and add an open question instead of an invariant.
