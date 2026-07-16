# Memory Policy

## Purpose and authority

Project Memory externalizes reusable project knowledge. It helps agents find and connect authoritative sources; it does not override them. Keep implementation reality, intended contract, historical behavior, and future proposals distinct.

For current implementation behavior, prefer reproducible runtime evidence, current code, current schema/migrations, current tests, documentation, then memory.

For intended behavior, prefer approved specification, confirmed business rule, accepted architecture decision, higher-level instruction, contract tests, memory, then current implementation.

For security and production rules, prefer higher-level instruction, applicable production skill, security policy, accepted architecture decision, memory, then implementation. Report an implementation conflict when lower-priority sources violate a higher-priority contract.

## Memory classes and scope

Use four classes:

- procedural: workflows, skills, rules, checklists, and conventions;
- semantic: architecture, boundaries, invariants, contracts, ownership, and constraints;
- episodic: incidents, failed approaches, migrations, regressions, and lessons;
- working: current task state, blockers, commands, tests, and exact resume steps.

Use the closest applicable scope without ignoring higher layers:

- level 0: project constitution and project-wide constraints;
- level 1: domain;
- level 2: module or package;
- level 3: feature or workflow;
- level 4: task, migration, or incident.

Supported entry types are: project_fact, business_invariant, architecture_decision, technical_constraint, business_constraint, module_map, data_ownership, source_of_truth, permission_rule, coding_convention, design_pattern, anti_pattern, reusable_solution, integration_contract, dependency_decision, migration_record, incident, bug_root_cause, failed_approach, workaround, performance_finding, security_finding, technical_debt, open_question, task_checkpoint, task_summary, documentation_gap, and deprecated_behavior.

## Evidence and status

Use only these statuses: verified, supported, provisional, disputed, deprecated, superseded, archived.

- verified: directly supported by current authoritative evidence appropriate to the claim;
- supported: strong indirect or incomplete evidence;
- provisional: a bounded assumption or first-use pattern needing verification;
- disputed: credible sources conflict;
- deprecated: retained behavior or guidance should no longer be used;
- superseded: replaced by a linked entry;
- archived: inactive history retained for traceability.

Use confidence high, medium, or low based on evidence quality, source authority, recency, and scope coverage. Never use numeric confidence.

Every active entry needs a source, evidence, scope, trigger, status, verification date, review date, and relationships. Do not mark an entry verified when its evidence is only memory.

## Lifecycle

Create, verify, add evidence, correct, dispute, supersede, deprecate, archive, merge, or delete under policy. Never overwrite material decision history. Link both directions with supersedes and superseded_by.

Review more frequently when affected paths change often or when the entry concerns security, payment, permission, schema, API contracts, or migrations. Review stable project principles less often. A changed source or expired review date makes the entry a verification candidate, not automatically false.

## Controlled learning

Promote a finding to a reusable rule only when it is verified by code, test, approved source, or repeated successful use; is reusable beyond one special case; and does not weaken production, security, accessibility, or data integrity.

A one-time success may be a provisional reusable pattern. Promote it to verified only after successful reuse, strong technical evidence, or explicit review and acceptance.

## Safety and approvals

Never store secret values, credentials, private keys, tokens, unnecessary personal data, sensitive payment data, private production payloads, or chain-of-thought. Record only environment-variable names or configuration locations.

An agent may create checkpoints, add evidence, fix links, clarify summaries, record proven root causes or failed approaches, add provisional patterns, update module maps after code changes, archive completed checkpoints, mark conflicts, add debt, and update this skill changelog.

Require explicit approval before deleting or changing business invariants, business rules, accepted architecture decisions, security rules, FE/BE blockers, important incidents, migration history, source-of-truth ownership, permission or tenant models, public contracts, disputed memory, or instruction hierarchy; before adding major infrastructure/vector databases; and before handling sensitive values.
