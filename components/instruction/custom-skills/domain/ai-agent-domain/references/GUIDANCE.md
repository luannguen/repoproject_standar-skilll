# AI Agent Domain Evidence Guide

This file lists review questions and safety dimensions. It does not assert that any candidate concept exists in a project.

## Candidate concepts to verify

- Principal, agent, objective, run, step, and result.
- Tool capability, credential, scope, and side effect.
- Approval, delegation, escalation, pause, cancel, and resume.
- Memory provenance, policy decision, audit, compensation, and recovery.

## Evidence required

- Cite at least two independent authoritative artifacts across two categories.
- Prefer schema/migrations and domain source models, reinforced by tests or an approved contract/specification.
- Capture exact applicable paths and distinguish verified facts, conflicts, and unknowns.

## Guardrails

- Treat candidate concepts and lifecycles as questions until repository evidence verifies them.
- Preserve verified invariants across API, data, UI, jobs, events, and tests.
- Make authorization, idempotency, concurrency, audit, failure, and recovery behavior explicit where the verified model requires them.
- Bind every side effect to verified authority, scope, approval policy, and auditable provenance.

## Validation questions

- Can prompt content expand authority or bypass approval?
- Are retries, pause/resume, cancellation, and compensation safe?
- Can every material action be attributed, inspected, and revoked?

If the answers are not established by evidence, keep the skill inactive or provisional and add an open question instead of an invariant.
