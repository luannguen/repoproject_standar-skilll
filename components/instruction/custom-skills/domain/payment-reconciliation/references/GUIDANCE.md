# Payment Reconciliation Evidence Guide

This file lists review questions and safety dimensions. It does not assert that any candidate concept exists in a project.

## Candidate concepts to verify

- Internal payment and external provider identifiers.
- Authorization, capture, failure, refund, dispute, and settlement.
- Webhook authenticity, ordering, and replay.
- Reconciliation discrepancy and repair workflow.

## Evidence required

- Cite at least two independent authoritative artifacts across two categories.
- Prefer schema/migrations and domain source models, reinforced by tests or an approved contract/specification.
- Capture exact applicable paths and distinguish verified facts, conflicts, and unknowns.

## Guardrails

- Treat candidate concepts and lifecycles as questions until repository evidence verifies them.
- Preserve verified invariants across API, data, UI, jobs, events, and tests.
- Make authorization, idempotency, concurrency, audit, failure, and recovery behavior explicit where the verified model requires them.
- Require idempotency, authenticated provider events, immutable evidence, and explicit discrepancy handling where verified.

## Validation questions

- Can duplicate or out-of-order events corrupt state?
- How are amount/currency mismatches surfaced and repaired?
- Are refunds, disputes, and partial outcomes reconciled?

If the answers are not established by evidence, keep the skill inactive or provisional and add an open question instead of an invariant.
