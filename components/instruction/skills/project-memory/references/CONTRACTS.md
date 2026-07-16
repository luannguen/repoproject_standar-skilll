# Contracts

## Common memory contract

Every indexed entry must include:

- memory_id: stable unique ID;
- title, memory_type, scope, and concise summary;
- status and evidence-based confidence;
- tags and trigger_terms;
- affected_modules, affected_paths, related_entities, and related_features;
- source_references and concise evidence;
- decision_or_fact, rationale, consequences, and risks;
- valid_from, last_verified_at, review_after, created_at, and updated_at;
- created_by_task;
- supersedes, superseded_by, and related_memories;
- detail_path.

Use ISO 8601 dates. Use arrays even for zero or one relation. Use repository-relative paths. Keep IDs immutable; suggested prefixes are MEM, DEC, INC, TASK, and PAT.

The detail file frontmatter must contain at least memory_id, memory_type, scope, status, confidence, trigger_terms, source dates, and relationships, and its body must contain evidence and operational consequences.

## Conditional contracts

### Task checkpoint

Require task_id, objective, scope, current_status, completed_work, files_created, files_modified, files_inspected, decisions_made, assumptions, commands_run, tests_passed, tests_failed, current_errors, blockers, unresolved_questions, next_exact_step, next_files_to_read, next_commands_to_run, risks, rollback_notes, related_memories, resume_instruction, created_at, and updated_at. Include completion_percentage only when measurable.

### Incident

Require incident_id, environment, affected_version, symptom, reproduction, impact, affected_modules, root_cause_status, root_cause, contributing_factors, failed_attempts, temporary_mitigation, permanent_fix, regression_test, detection_signal, prevention_rule, related_changes, status, and last_verified_at.

Use root_cause_status: confirmed, suspected, unknown, or not_applicable. Do not present a suspected root cause as confirmed.

### Architecture decision

Require decision_id, context, problem, constraints, considered_options, selected_option, rationale, trade_offs, consequences, rejected_options, reversal_conditions, migration, rollback, security_impact, performance_impact, operational_impact, status, approved_source, and related_modules.

### Module memory

Require responsibility, public_api, dependencies, consumers, data_ownership, invariants, integrations, known_limitations, known_issues, relevant_tests, and operational_notes.

### Pattern

Require problem_shape, applicability, non_applicability, implementation_outline, evidence, successful_uses, failure_modes, trade_offs, validation, and promotion_state. A first success is provisional.

### Failed approach

Require problem, attempted_approach, context, observed_result, failure_cause_status, evidence, when_it_might_work, do_not_retry_until, and alternative.

## Templates

Copy, then complete:

- [memory-entry.md](../assets/templates/memory-entry.md)
- [task-checkpoint.md](../assets/templates/task-checkpoint.md)
- [incident.md](../assets/templates/incident.md)
- [architecture-decision.md](../assets/templates/architecture-decision.md)
- [module-memory.md](../assets/templates/module-memory.md)
- [pattern.md](../assets/templates/pattern.md)
- [failed-approach.md](../assets/templates/failed-approach.md)
