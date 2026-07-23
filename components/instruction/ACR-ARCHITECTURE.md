# Adaptive Cognitive Runtime (ACR) Architecture

**Status**: Implemented governance and validation contract; runtime executor not implemented
**Version**: 1.1.0
**Last updated**: 2026-07-23

## Purpose

ACR reduces repeated planning cost without transferring authority to a reflex, model, or compiled habit. The governing loop is:

`Observe -> Align -> Predict -> Compare -> Select/Plan -> Act -> Evaluate -> Adjust`

The loop improves evidence use and feedback. It does not replace the Constitution, user authority, workflow routing, Project Memory, specialist gates, approvals, or validation.

## Non-negotiable ordering

Every task follows this control flow:

1. Normalize goal, acceptance, scope, exclusions, and unknowns.
2. Inspect current evidence; classify task and highest risk.
3. Select exactly one primary workflow, minimum Standard Skills, and only task/path-matched active Custom Skill bindings.
4. Retrieve and verify relevant Project Memory.
5. Produce a Task Execution Brief for MEDIUM+ work and satisfy approval gates.
6. Consider a deterministic reflex or registered VOPL habit only as an execution optimization inside the authorized plan.
7. Execute with bounded steps, retries, time, paths, actions, validation, and rollback.
8. On mismatch or prediction error, stop the optimized path and return to the already selected workflow.
9. Validate, synchronize documentation, and write only durable sanitized memory.

Reflexes and habits are never authority sources. They cannot choose their own workflow, risk, tools, permissions, or approval result.

## Cognitive layers

### Governance plane

Constitution, Bootstrap, Project Orchestrator, workflow contracts, Standard Skills, active Custom Skill bindings, approval gates, and Project Memory establish authority and context before optimization.

### Deterministic reflex layer

A reflex is code-defined and testable. It may reject an unsafe or invalid action, or perform a bounded reversible action already authorized by governance. Every reflex needs a named contract, current evidence, deterministic validation, and rollback.

### Procedural memory

VOPL habits are declarative procedures stored separately from Standard Skills, reusable Custom Skills, and Project Memory. `procedural-memory/HABIT-REGISTRY.json` is the routing source. File presence is not activation.

Lifecycle states are:

- `draft`: candidate only; never selectable.
- `verified`: independently reviewed, sufficiently evidenced, current, bound, scoped, and selectable after governance.
- `quarantined`: disabled because of mismatch, staleness, failure, incident, or invalidation.
- `retired`: intentionally inactive historical procedure.

### Habit Compiler

Habit Compiler accepts sanitized task outcome summaries, verified diffs, validation results, approval records, and rollback outcomes. It never reads or reconstructs chain-of-thought, raw transcripts, secrets, or private production data. Compilation creates `draft` only.

Promotion requires at least three comparable successes, two independent verification records, deterministic lint, current project binding, named ownership, review expiry, rollback, and registry synchronization.

### Deliberative cortex

The LLM handles novelty, conflicts, incomplete evidence, prediction errors, and cases with no valid optimization. Its output is untrusted until deterministic policy, schema, authorization, and validation checks pass.

### Metacognition and observability

Track selection attempts, accepted/rejected reason codes, lifecycle transitions, prediction errors, validation failures, timeouts, retries, rollback outcomes, and fallback to the standard workflow. Telemetry must contain identifiers and outcomes, not prompts, raw content, secrets, or private reasoning.

## VOPL authority and execution contract

A selectable habit must declare intent, project binding, applicable paths, required workflow and skills, risk ceiling, approval gates, allowed and forbidden actions, provenance, evidence counts, limits, owner, review date, and rollback. VOPL execution steps invoke registered skills through bounded action identifiers; they do not embed shell commands or generated source code.

CRITICAL work is never habit-selected. Production, security, identity, data, external, financial, destructive, and irreversible actions keep their normal approval gates even when a habit matches.

## Failure and recovery

Fail closed when registration, binding, scope, evidence, status, freshness, risk ceiling, approvals, limits, or validation cannot be proven. Stop the optimized path, preserve current state, apply declared rollback where safe, record a sanitized outcome, and continue through the selected standard workflow. Repeated prediction error or any material safety failure quarantines the habit pending review.

## Template boundary

This repository is `template/uninstantiated`. It therefore ships an empty governed habit registry and parser fixtures only. The React-router example is test data under `tests/vopl/`; it is not project evidence and cannot activate. Application-specific habits remain draft until a cloned project is instantiated with authoritative stack, architecture, path, validation, and ownership evidence.

## Current implementation status

Implemented now:

- governance-first Orchestrator and Bootstrap contracts;
- VOPL metadata/body contract and lifecycle policy;
- empty default-deny habit registry;
- valid and adversarial fixtures;
- cross-platform deterministic habit lint integrated with unified validation.

Not implemented or claimed:

- an autonomous runtime executor;
- model/provider selection or cost/latency benchmarks;
- production telemetry backend;
- application-specific habits or application production readiness.

A future executor is a separate HIGH-risk implementation that must enforce the same contracts outside the model and add versioned quality, safety, latency, cost, fallback, kill-switch, and incident evaluations.
