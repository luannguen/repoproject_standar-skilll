# AI LLM Integration Guidance

## Required rules

- Detect provider, model, SDK, and API version before selecting features.
- Treat prompts, retrieved content, model output, and tool arguments as untrusted data.
- Bound agency, cost, retries, timeouts, data retention, and failure modes.

## Preferred patterns

- Schema-validated outputs with deterministic fallback.
- Evaluation fixtures and traceable model/provider metadata without sensitive content.

## Blockers and anti-patterns

- Provider/model contract, data classification, or action approval boundary is unknown.
- Execute model output directly.
- Send secrets or restricted data without an approved provider/data policy.

## Validation

- Run contract mocks, adversarial/safety tests, structured-output validation, timeout/retry tests, evaluation fixtures, and cost/telemetry checks.

Validate the smallest affected scope first, then the repository's required quality gates. Preserve public contracts, data, business behavior, and dependency versions unless the task explicitly authorizes a change.
