# Multi Tenant SaaS Evidence Guide

This file lists review questions and safety dimensions. It does not assert that any candidate concept exists in a project.

## Candidate concepts to verify

- Tenant identity and ownership.
- Membership lifecycle and invitation.
- Tenant-scoped versus global resources.
- Cross-tenant support or administration.

## Evidence required

- Cite at least two independent authoritative artifacts across two categories.
- Prefer schema/migrations and domain source models, reinforced by tests or an approved contract/specification.
- Capture exact applicable paths and distinguish verified facts, conflicts, and unknowns.

## Guardrails

- Treat candidate concepts and lifecycles as questions until repository evidence verifies them.
- Preserve verified invariants across API, data, UI, jobs, events, and tests.
- Make authorization, idempotency, concurrency, audit, failure, and recovery behavior explicit where the verified model requires them.
- Verify tenant scope at every trusted data-access boundary.

## Validation questions

- Can one tenant read or mutate another tenant data path?
- How are background jobs and caches scoped?
- Which actors may cross tenant boundaries, and where is that audited?

If the answers are not established by evidence, keep the skill inactive or provisional and add an open question instead of an invariant.
