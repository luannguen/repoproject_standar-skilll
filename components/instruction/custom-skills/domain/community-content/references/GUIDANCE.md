# Community Content Evidence Guide

This file lists review questions and safety dimensions. It does not assert that any candidate concept exists in a project.

## Candidate concepts to verify

- Author, audience, moderator, and subject.
- Draft/published/hidden/removed/deleted lifecycle.
- Report, moderation action, appeal, and restoration.
- Block/privacy effects on feeds, search, and notifications.

## Evidence required

- Cite at least two independent authoritative artifacts across two categories.
- Prefer schema/migrations and domain source models, reinforced by tests or an approved contract/specification.
- Capture exact applicable paths and distinguish verified facts, conflicts, and unknowns.

## Guardrails

- Treat candidate concepts and lifecycles as questions until repository evidence verifies them.
- Preserve verified invariants across API, data, UI, jobs, events, and tests.
- Make authorization, idempotency, concurrency, audit, failure, and recovery behavior explicit where the verified model requires them.
- Apply verified visibility and moderation rules consistently across reads, search, caches, and events.

## Validation questions

- Can blocked or unauthorized actors retrieve content indirectly?
- How do delete, restore, appeal, and cache invalidation interact?
- Which moderation actions require audit or notification?

If the answers are not established by evidence, keep the skill inactive or provisional and add an open question instead of an invariant.
