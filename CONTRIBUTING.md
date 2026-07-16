# Contributing

## Before changing the repository

1. Read `AGENTS.md`, the Constitution, Bootstrap, registries, and the primary workflow selected for the task.
2. Classify the highest applicable risk and satisfy all relevant approval gates.
3. Keep changes scoped. Do not add a framework, service, dependency, domain rule, schema, license, or deployment assumption without current evidence and authorization.
4. Never commit secrets, local environment values, production data, personal data, or raw incident logs.

## Change expectations

- Use a focused branch and a pull request.
- Explain the problem, accepted outcome, risk, validation, compatibility, and recovery.
- Update docs, registries, changelog, and Project Memory when durable reality changes.
- Add or update tests and fixtures proportional to behavior changed.
- Preserve Windows and Linux portability for the reusable layer.
- Record unavailable project-specific checks as conditional gaps, not passes.

## Validate

Run:

```powershell
./components/instruction/scripts/validate.ps1
```

If an instantiated project registers additional commands in `components/instruction/PROJECT-PROFILE.json`, run those authoritative commands too.

## Review and merge

The repository host should require the `Quality Gates` checks and CODEOWNERS review on the protected default branch. The pull-request author must resolve material review findings and keep recovery instructions current. See [Repository governance](docs/REPOSITORY-GOVERNANCE.md).
