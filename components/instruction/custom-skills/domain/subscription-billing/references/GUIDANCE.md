# Subscription Billing Evidence Guide

This file lists review questions and safety dimensions. It does not assert that any candidate concept exists in a project.

## Candidate concepts to verify

- Plan/price version and subscription ownership.
- Trial, active, past-due, paused, canceled, and terminal states.
- Renewal, proration, invoice, grace, and dunning.
- Entitlement effective dates and provider/internal source of truth.

## Evidence required

- Cite at least two independent authoritative artifacts across two categories.
- Prefer schema/migrations and domain source models, reinforced by tests or an approved contract/specification.
- Capture exact applicable paths and distinguish verified facts, conflicts, and unknowns.

## Guardrails

- Treat candidate concepts and lifecycles as questions until repository evidence verifies them.
- Preserve verified invariants across API, data, UI, jobs, events, and tests.
- Make authorization, idempotency, concurrency, audit, failure, and recovery behavior explicit where the verified model requires them.
- Separate payment/provider state from verified entitlement decisions.

## Validation questions

- How do retries and out-of-order webhooks affect subscription state?
- When do cancellation and plan changes take effect?
- How are entitlement drift and provider discrepancies repaired?

If the answers are not established by evidence, keep the skill inactive or provisional and add an open question instead of an invariant.
