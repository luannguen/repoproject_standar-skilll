# Referral Commission Evidence Guide

This file lists review questions and safety dimensions. It does not assert that any candidate concept exists in a project.

## Candidate concepts to verify

- Referrer/referee attribution and expiry.
- Eligibility and self-referral/fraud controls.
- Commission basis, currency, rounding, caps, and version.
- Pending, approved, reversed, payable, and paid lifecycle.

## Evidence required

- Cite at least two independent authoritative artifacts across two categories.
- Prefer schema/migrations and domain source models, reinforced by tests or an approved contract/specification.
- Capture exact applicable paths and distinguish verified facts, conflicts, and unknowns.

## Guardrails

- Treat candidate concepts and lifecycles as questions until repository evidence verifies them.
- Preserve verified invariants across API, data, UI, jobs, events, and tests.
- Make authorization, idempotency, concurrency, audit, failure, and recovery behavior explicit where the verified model requires them.
- Version verified formulas and retain auditable inputs for recalculation.

## Validation questions

- What event fixes attribution and calculation inputs?
- How do refunds/cancellations reverse or adjust commission?
- Can retries duplicate commission or payout?

If the answers are not established by evidence, keep the skill inactive or provisional and add an open question instead of an invariant.
