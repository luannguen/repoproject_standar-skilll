# Analytics Events Evidence Guide

This file lists review questions and safety dimensions. It does not assert that any candidate concept exists in a project.

## Candidate concepts to verify

- Event name/version, actor, subject, timestamp, and correlation.
- Property schema and semantic ownership.
- Consent, minimization, retention, and deletion.
- Client/server source, deduplication, delivery, and late arrival.

## Evidence required

- Cite at least two independent authoritative artifacts across two categories.
- Prefer schema/migrations and domain source models, reinforced by tests or an approved contract/specification.
- Capture exact applicable paths and distinguish verified facts, conflicts, and unknowns.

## Guardrails

- Treat candidate concepts and lifecycles as questions until repository evidence verifies them.
- Preserve verified invariants across API, data, UI, jobs, events, and tests.
- Make authorization, idempotency, concurrency, audit, failure, and recovery behavior explicit where the verified model requires them.
- Version verified event contracts and minimize sensitive or identifying data.

## Validation questions

- Are client and server events double-counted?
- How are consent, deletion, and identity changes propagated?
- Do tests validate schema and semantic trigger conditions?

If the answers are not established by evidence, keep the skill inactive or provisional and add an open question instead of an invariant.
