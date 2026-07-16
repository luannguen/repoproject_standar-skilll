---
name: documentation-sync
description: Keep user, developer, API, architecture, operations, release, instruction, and Project Memory documentation synchronized with verified behavior and decisions.
---

# Documentation Synchronization

## Skill contract

- id: documentation-sync
- name: Documentation Synchronization
- version: 1.0.0
- description: Keep user, developer, API, architecture, operations, release, instruction, and Project Memory documentation synchronized with verified behavior and decisions.
- purpose: make current behavior, setup, contracts, decisions, operations, and limitations discoverable without duplicating or inventing sources of truth.
- scope: README and guides, API/schema docs, ADRs, runbooks, diagrams, changelogs, release notes, registries, comments, examples, onboarding, and Project Memory routing.
- triggers: behavior, contract, setup, configuration, architecture, dependency, workflow, release, incident, deprecation, or instruction-system change; stale or missing documentation.
- exclusions: does not document speculation as fact, copy source code into prose, write secrets, or preserve obsolete docs merely for convenience.
- required_inputs:
  - verified change and validation evidence
  - affected audiences, source-of-truth artifacts, current docs, links, examples, and ownership
  - compatibility, migration, operations, release, and memory implications
- expected_outputs:
  - minimal synchronized documentation set
  - updated examples, diagrams, references, changelog or release notes
  - stale-documentation findings and owners
  - durable memory update or explicit no-memory decision
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - project-memory
  - requirement-analysis
  - system-architecture
  - api-integration
  - devops-release
- prerequisite_skills:
  - project-memory
- next_skills:
  - project-memory
- constraints: source code and machine contracts remain authoritative where appropriate; link instead of duplicate; label current, proposed, deprecated, and historical states.
- blockers: behavior is not verified; conflicting authoritative sources; documentation would expose sensitive data; required operational or migration guidance is missing for a high-risk change.
- approval_requirements: public publication, external communication, disclosure of sensitive or internal material, or constitutional weakening uses the matching approval gate.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - identify audiences and every document, registry, contract, example, diagram, runbook, and memory entry affected
  - compare current documentation against verified behavior and source-of-truth artifacts
  - choose one owner/source per fact and avoid duplicate narratives
- post_task_checklist:
  - commands, paths, links, examples, versions, statuses, diagrams, and contracts match current evidence
  - deprecated or historical content is labeled or removed safely
  - changelog, release, runbook, registry, and Project Memory deltas are complete
- validation_process: run available link, schema, snippet, command, registry, and documentation builds; manually trace instructions from a clean-reader perspective and compare claims to authoritative artifacts.
- completion_criteria: affected audiences can discover accurate current behavior and operational guidance; no known stale or broken reference remains; memory contains only durable verified deltas.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Map the verified change to affected audiences and documentation surfaces using repository search and registry references.
2. Identify the authoritative source for each fact; mark stale, duplicate, conflicting, missing, deprecated, or historical content.
3. Update the smallest coherent documentation set, linking to machine-readable sources and preserving explicit compatibility or migration guidance.
4. Validate commands, paths, examples, schemas, diagrams, links, versions, and status language against current artifacts.
5. Update changelog, release notes, runbook, registries, and Project Memory only where durable facts changed.
6. Report synchronized surfaces, intentionally unchanged surfaces, unavailable checks, stale debt, and ownership.

## Domain gates

- BLOCKER: never state implemented, deployed, secure, compatible, or production-ready without corresponding evidence.
- MUST: operationally significant changes include failure diagnosis, recovery, rollback or forward-fix guidance.
- MUST: instruction changes synchronize registries, bootstrap routing, version metadata, validation, and memory.

## Completion report

Report outcome, evidence, decisions, validation, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta without private chain-of-thought.
