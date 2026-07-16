# Project Onboarding

Use this process immediately after cloning and before application implementation.

## 1. Preview identity initialization

```powershell
./scripts/initialize-project.ps1 -ProjectName "my-project" -Owner "@team" -Purpose "Verified purpose" -RepositoryUrl "https://github.com/org/repo.git" -WhatIf
```

Review the output. Run without `-WhatIf` only when the identity is correct. The helper changes the project profile to `project/onboarding`; it does not claim the application is production-ready.

## 2. Select the onboarding workflow

Route the task to `project-onboarding` and `project-bootstrap-governance`. Inventory actual manifests, lockfiles, source roots, schemas, tests, deployment files, owners, and repository-host settings. Run stack/domain detection and review the generated evidence before changing activation bindings.

Keep absent evidence explicit. Do not choose a framework, domain model, database, cloud, license, or production control merely to fill a field.

## 3. Resolve decisions

Confirm:

- project purpose, accountable owner, repository URL, and supported users;
- license or proprietary status;
- application stack and supported versions from manifests;
- data sensitivity, trust boundaries, deployment targets, and environment ownership;
- authoritative build, lint, test, security, migration, and release commands;
- branch protection, reviews, required checks, secret scanning, and private vulnerability reporting.

Material external changes remain approval-gated.

## 4. Activate conditional controls

Use the conditional matrix in `TEMPLATE-MANIFEST.json` and the bootstrap-governance skill. Bind only reusable technology skills detected at HIGH/MEDIUM confidence and scope them to the owning packages/paths. Create domain overlays only when independent authoritative artifacts verify rules. Add only checks whose trigger exists. A real application commonly needs stack-specific dependency scanning, tests, threat modeling, release recovery, and observability in addition to this template layer.

## 5. Validate and close onboarding

Run the unified validator, including custom-skill lint, stack/domain detection, and custom route tests, plus every registered application command. Update the profile, detection/activation manifests, overlays, contributor/security/release docs, registries if routing changed, changelog, and durable Project Memory.

Onboarding may move to `project/active` only when identity, ownership, applicable commands, host controls, unresolved conditions, and evidence are current. Project activity is not the same as production readiness.
