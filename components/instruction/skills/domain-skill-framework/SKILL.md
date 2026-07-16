---
name: domain-skill-framework
description: Discover, justify, design, create, validate, and govern project-specific domain skills only when repeated application evidence proves stable terminology, invariants, lifecycles, policies, risks, and workflows not covered by general capabilities.
---

# Domain Skill Framework

## Skill contract

- id: domain-skill-framework
- name: Domain Skill Framework
- version: 1.0.0
- description: Discover, justify, design, create, validate, and govern project-specific domain skills only when repeated application evidence proves stable terminology, invariants, lifecycles, policies, risks, and workflows not covered by general capabilities.
- purpose: capture durable project-domain expertise without inventing business rules or proliferating premature skills.
- scope: domain discovery, evidence thresholds, candidate evaluation, boundary definition, domain contract design, routing, validation, versioning, deprecation, and consolidation.
- triggers: repeated domain misunderstandings, recurring invariant-heavy work, established domain vocabulary/lifecycle, cross-module domain policy, or explicit request to create a domain skill.
- exclusions: does not create a domain skill from names alone, a single task, speculative roadmap, generic engineering practice, or absent application evidence.
- required_inputs:
  - current application source, schema, contracts, tests, documentation, incidents, and verified stakeholder rules
  - repeated task evidence showing a stable domain boundary and recurring risk
  - overlap analysis against existing capability and domain skills
- expected_outputs:
  - domain evidence dossier and candidate score
  - create, defer, merge, or reject decision
  - if approved, a compliant domain-skill contract, routing, tests, and ownership
  - lifecycle, update, conflict, and deprecation plan
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - project-orchestrator
  - project-memory
  - requirement-analysis
  - system-architecture
  - data-lifecycle
- prerequisite_skills:
  - project-memory
- next_skills:
  - project-orchestrator
  - documentation-sync
  - project-memory
- constraints: require verified application evidence and repeated need; prefer extending a capability skill or Project Memory when the knowledge is not a distinct durable domain.
- blockers: no application source; domain rules are disputed or unowned; evidence comes from one isolated task; candidate duplicates an existing skill; safe validation examples are unavailable.
- approval_requirements: creation of a new project domain skill requires user approval after the evidence dossier; weakening or deleting one follows constitutional and compatibility approval rules.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - locate authoritative domain sources, owners, vocabulary, invariants, lifecycle states, failures, and permissions
  - retrieve repeated task, incident, debt, and failed-approach evidence
  - compare the candidate against existing skills and lower-cost memory/pattern alternatives
- post_task_checklist:
  - the decision is evidence-backed and overlap-free
  - any new skill has the full common contract, registry route, workflow use, metadata, validation cases, owner, and version
  - deferred candidates retain explicit evidence gaps and re-evaluation criteria
- validation_process: test candidate instructions against at least three distinct representative tasks plus ambiguity, conflict, misuse, and boundary cases; run skill, workflow, and routing lint.
- completion_criteria: create only a distinct, reusable, evidence-backed domain capability with deterministic routing and proven value, or record a clear defer/reject decision without fabricating rules.
- exception_policy: no exception may waive the application-evidence requirement; record all other exceptions with rule, reason, scope, risk, control, approval, expiry, and remediation.
- memory_read_policy: retrieve domain terms, facts, decisions, incidents, patterns, debt, failed approaches, and task history; verify all candidate rules against current application evidence.
- memory_write_policy: store the candidate decision, authoritative sources, stable domain rules, rejected overlap, validation evidence, ownership, and re-evaluation trigger; never store speculative business logic.
- update_policy: version domain-skill changes, synchronize registry/workflows/routes/metadata, validate representative tasks, and require approval before changing invariants, permissions, lifecycle semantics, or completion gates.

## Evidence threshold

A new domain skill requires all of the following:

1. Current application evidence exists in at least two authoritative artifact types, such as source plus tests, or schema plus contracts.
2. The same domain boundary or invariant has affected at least three distinct tasks, incidents, or durable decisions.
3. General capability skills cannot express the knowledge without repeated project-specific interpretation.
4. The domain has stable vocabulary, owners, states or invariants, failure modes, and permission implications.
5. A bounded trigger and exclusion set prevents accidental global activation.
6. Representative validation tasks and an owner/update path exist.

## Mandatory workflow

1. Inventory verified domain entities, vocabulary, invariants, lifecycle transitions, actors, permissions, integrations, failures, incidents, and authoritative sources.
2. Cluster repeated work and score frequency, impact, stability, specialist interpretation cost, and current-skill overlap.
3. Choose among memory entry, reusable pattern, capability-skill extension, domain-skill merge, new domain skill, or defer.
4. For a new candidate, define boundary, triggers, exclusions, inputs, outputs, invariants, failure and security gates, dependencies, workflows, validation cases, ownership, and version policy.
5. Present the evidence dossier and obtain approval before creating the domain skill.
6. Scaffold with Skill Creator, add the common contract and only necessary resources, register and route it, then run representative and adversarial validation.
7. Monitor usage, false activations, overlap, stale rules, and value; consolidate or deprecate safely when evidence changes.

## Domain gates

- BLOCKER: no application source means no project-specific domain skill may be created.
- BLOCKER: domain rules require an authoritative owner/source and may not be inferred from UI labels, filenames, or generic industry practice.
- MUST: a candidate must be more reusable than a Project Memory entry and more specific than a general capability skill.
- MUST: domain-skill dependencies remain acyclic and every created skill is used by at least one routed workflow or documented task class.

## Current repository decision

As of 2026-07-16, this repository contains instruction artifacts but no application source, schema, contracts, tests, runtime, or domain documentation. Therefore no concrete domain skill is justified. This framework is the complete and intentional deliverable until evidence appears.

## Completion report

Report evidence sources, candidate score, overlap analysis, decision, approval status, validation cases, routing changes, residual gaps, and Project Memory delta without private chain-of-thought.
