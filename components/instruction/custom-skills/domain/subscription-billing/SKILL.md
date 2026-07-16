---
name: subscription-billing
description: Evidence-gated Subscription Billing domain guardrails. Use when authoritative project source, schema, tests, contracts, or specifications verify this domain and the active task touches plans, subscriptions, entitlements, invoices, renewals, trials, cancellation, proration, grace periods, or dunning; never infer business invariants from names.
---

# Subscription Billing Router

1. Read `references/CONTRACT.json` and the project domain manifest.
2. Require an active binding plus an overlay whose rules cite authoritative repository evidence.
3. Confirm the task intersects the binding's packages, paths, concepts, and task types.
4. Load `references/GUIDANCE.md` and the required Standard Skills.
5. Apply only verified overlay invariants; record conflicts or unknowns instead of inventing behavior.

This reusable module is a guardrail and discovery aid, not proof that the project implements this domain. Block if evidence is only a menu, route, directory name, comment, marketing text, or technology choice.

## References

- Contract: `references/CONTRACT.json`
- Evidence and lifecycle guidance: `references/GUIDANCE.md`
