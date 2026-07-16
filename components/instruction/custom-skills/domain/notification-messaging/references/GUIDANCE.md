# Notification Messaging Evidence Guide

This file lists review questions and safety dimensions. It does not assert that any candidate concept exists in a project.

## Candidate concepts to verify

- Notification intent, recipient, channel, locale, and template version.
- Consent, preference, quiet-hour, and suppression policy.
- Queued, sent, delivered, failed, bounced, and read semantics.
- Deduplication, retry, provider callback, and fallback.

## Evidence required

- Cite at least two independent authoritative artifacts across two categories.
- Prefer schema/migrations and domain source models, reinforced by tests or an approved contract/specification.
- Capture exact applicable paths and distinguish verified facts, conflicts, and unknowns.

## Guardrails

- Treat candidate concepts and lifecycles as questions until repository evidence verifies them.
- Preserve verified invariants across API, data, UI, jobs, events, and tests.
- Make authorization, idempotency, concurrency, audit, failure, and recovery behavior explicit where the verified model requires them.
- Separate durable notification intent from provider delivery attempts.

## Validation questions

- Can retries create duplicate user-visible messages?
- How are preference changes and suppression enforced?
- What delivery statuses are provider facts versus internal inference?

If the answers are not established by evidence, keep the skill inactive or provisional and add an open question instead of an invariant.
