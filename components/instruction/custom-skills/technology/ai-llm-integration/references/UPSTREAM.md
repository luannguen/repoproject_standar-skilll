# AI LLM Integration Upstream Ledger

- Last checked: 2026-07-16
- Base status: reusable and version-neutral
- Detected project version: recorded only in Layer B

## Official sources

- [OWASP GenAI Security Project](https://genai.owasp.org/initiatives/top-10-for-llm-and-genai/)
- Provider official documentation: select only the detected provider's official API, model, and SDK documentation; none is selected in this template.
- [OWASP LLM application security project](https://owasp.org/www-project-top-10-for-large-language-model-applications/)

## Version-sensitive areas

- Model IDs, API schemas, tool-calling/structured-output semantics, streaming, token limits, retention, safety controls, and pricing.

## Classification policy

- Verified: supported by the official source and the detected project release.
- Deprecated: upstream marks the API or release obsolete; do not introduce new use.
- Migration-only: load only for an explicitly authorized upgrade or migration.
- Unverified: source is unavailable, release is unknown, or evidence conflicts; block version-sensitive implementation and request confirmation.

Do not copy official documentation into this skill. Re-check the sources when a major version, platform contract, or deprecation boundary changes.
