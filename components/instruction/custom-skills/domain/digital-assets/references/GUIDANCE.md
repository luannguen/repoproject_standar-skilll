# Digital Assets Evidence Guide

This file lists review questions and safety dimensions. It does not assert that any candidate concept exists in a project.

## Candidate concepts to verify

- Asset owner, uploader, subject, and viewer.
- Upload, quarantine, scan, process, publish, archive, and delete.
- Metadata, derivative, storage key, and signed access.
- Retention, legal hold, and orphan cleanup.

## Evidence required

- Cite at least two independent authoritative artifacts across two categories.
- Prefer schema/migrations and domain source models, reinforced by tests or an approved contract/specification.
- Capture exact applicable paths and distinguish verified facts, conflicts, and unknowns.

## Guardrails

- Treat candidate concepts and lifecycles as questions until repository evidence verifies them.
- Preserve verified invariants across API, data, UI, jobs, events, and tests.
- Make authorization, idempotency, concurrency, audit, failure, and recovery behavior explicit where the verified model requires them.
- Authorize storage access at a trusted boundary and treat uploaded content as untrusted.

## Validation questions

- Can unauthorized actors enumerate or retrieve assets?
- How are derivatives and caches invalidated on delete or visibility change?
- What limits, scanning, retention, and recovery rules apply?

If the answers are not established by evidence, keep the skill inactive or provisional and add an open question instead of an invariant.
