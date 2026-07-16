# Production Project Standard

A cross-stack repository template for starting software projects with explicit AI routing, risk gates, Project Memory, governance, and portable quality checks.

This repository is production-oriented infrastructure, not a claim that a future cloned application is production-ready. Application architecture, domain rules, security controls, tests, deployment, recovery, and observability must be activated from real evidence after cloning.

## Start a project

1. Create a new repository from this template or clone it without carrying template history.
2. Run the onboarding helper in preview mode:

   ```powershell
   ./scripts/initialize-project.ps1 -ProjectName "my-project" -Owner "@team" -Purpose "Verified project purpose" -WhatIf
   ```

3. Review [Project onboarding](components/instruction/PROJECT-ONBOARDING.md), then run the helper without `-WhatIf`.
4. Select the `project-onboarding` workflow before application implementation.
5. Run stack/domain detection, then bind only reusable Custom Skills supported by repository evidence and limited to the owning packages/paths.
6. Add project overlays only for verified versions/conventions/domain rules; never infer them or copy the reusable base.
7. Validate the reusable layer:

   ```powershell
   ./components/instruction/scripts/validate.ps1
   ```

Windows PowerShell 5.1 and PowerShell 7+ are supported. CI runs the reusable quality gates on Windows and Linux.

## What is included

- a constitutional authority and approval-gate model;
- deterministic workflow and 21-skill Standard registry;
- a separate two-layer library of 14 technology and 13 domain Custom Skills with manifest-driven scoped activation;
- Project Memory with structured linting;
- repository, Standard Skill, workflow, Custom Skill, stack/domain detection, routing-fixture, link, and secret-hygiene checks;
- contributor, security, release, ownership, issue, pull-request, and dependency-update baselines;
- explicit conditional controls for application-specific production readiness.

See [Custom Skill architecture](components/instruction/custom-skills/README.md), [Custom Skill readiness](components/instruction/reports/CUSTOM-SKILL-SYSTEM-READINESS.md), [Repository governance](docs/REPOSITORY-GOVERNANCE.md), [Security baseline](docs/SECURITY-BASELINE.md), and [Release policy](docs/RELEASE-POLICY.md).

## Evidence boundary

Do not infer a runtime, framework, domain model, schema, provider, application distribution license, or production environment from this template. `components/instruction/PROJECT-PROFILE.json` is the machine-readable source for onboarding state and registered commands. Unknown or conditional controls must remain visible until verified. A reusable Custom Skill being present does not make it active; only `components/instruction/project-custom-skills/ACTIVE-CUSTOM-SKILLS.json` can bind it to an evidence-backed task and scope.

## Contributing

Follow [CONTRIBUTING.md](CONTRIBUTING.md). Security reports must follow [.github/SECURITY.md](.github/SECURITY.md).

## License

Licensed under the [Apache License 2.0](LICENSE).
