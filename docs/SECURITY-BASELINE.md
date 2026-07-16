# Security Baseline

## Active template controls

- environment and common private-key artifacts are ignored and repository lint blocks tracked secret filenames;
- content heuristics inspect tracked text for common private-key and token patterns;
- pull requests route security-sensitive work through threat modeling and approval gates;
- private vulnerability reporting instructions are present;
- dependency updates cover GitHub Actions before an application ecosystem exists;
- CI uses read-only repository contents permission.

These controls reduce repository-layer risk only. They are not an application security assessment.

## Conditional controls

Activate controls when their evidence trigger appears:

| Evidence | Required controls |
|---|---|
| Runtime or package manifest | pinned supported runtime, lockfile policy, vulnerability and license scanning, update ownership |
| Authentication or authorization | threat model, server enforcement, object/field access tests, tenant isolation, audit |
| Persisted or sensitive data | classification, encryption boundaries, retention/deletion, backup/restore, access review |
| Public API, webhook, or queue | schema validation, abuse/rate controls, timeout/retry/idempotency, reconciliation |
| Deployment target | least-privilege identity, protected environments, artifact provenance, rollback, monitoring |
| AI or agent behavior | authority/tool boundaries, prompt and data handling, adversarial evals, monitoring, cost limits |

Do not add generic scanner jobs that cannot identify a language, manifest, or deployment target. During onboarding, register the stack-specific checks in `PROJECT-PROFILE.json` and make them required before claiming readiness.

## Secret response

If a secret is exposed, stop propagation, revoke or rotate it through an authorized owner, remove it from current and historical distribution as appropriate, assess access, and document only non-sensitive incident facts. Deleting a file alone does not revoke a credential.
