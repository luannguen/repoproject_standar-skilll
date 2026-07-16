---
name: performance-scalability
description: Measure, diagnose, optimize, and capacity-plan latency, throughput, resource use, concurrency, payload, rendering, data access, caching, and cost under representative workloads.
---

# Performance and Scalability Engineering

## Skill contract

- id: performance-scalability
- name: Performance and Scalability Engineering
- version: 1.0.0
- description: Measure, diagnose, optimize, and capacity-plan latency, throughput, resource use, concurrency, payload, rendering, data access, caching, and cost under representative workloads.
- purpose: meet explicit performance and capacity targets with measured improvements, bounded resource use, and no correctness or operability regression.
- scope: budgets, profiling, benchmarking, load and stress testing, query and algorithm analysis, caching, concurrency, payloads, client rendering, capacity, cost, and regression gates.
- triggers: slow behavior, timeout, resource saturation, scale concern, capacity planning, performance optimization, load test, cache, query, bundle, or cost-efficiency task.
- exclusions: does not optimize by intuition, weaken correctness/security for speed, or run disruptive load against production without authority.
- required_inputs:
  - user-visible target, SLI/SLO, workload shape, baseline, environment, data volume, and growth
  - profiles, traces, metrics, queries, payloads, resource and cost evidence
  - correctness, consistency, freshness, security, availability, and capacity constraints
- expected_outputs:
  - reproducible baseline and bottleneck evidence
  - prioritized optimization hypotheses
  - measured implementation and before/after comparison
  - capacity, regression, observability, and rollback plan
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - system-architecture
  - backend-production-engineering
  - ui-ux-production
  - data-lifecycle
  - observability-incident
- prerequisite_skills:
  - project-memory
- next_skills:
  - testing-quality
  - observability-incident
  - documentation-sync
  - project-memory
- constraints: measure end-to-end and at bottlenecks; use representative data and concurrency; preserve correctness, security, accessibility, compatibility, and debuggability.
- blockers: no reproducible baseline or target; workload is unrepresentative; bottleneck unsupported by evidence; optimization changes consistency or safety without approval; production load test unauthorized.
- approval_requirements: production load/stress, infrastructure spend, cache consistency weakening, architecture expansion, or user-visible quality trade-off requires the matching approval.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - define metric, percentile, target, workload, data volume, concurrency, environment, and cost boundary
  - capture baseline profiles, traces, queries, resources, payloads, and user-path timing
  - identify correctness, freshness, security, availability, and rollback constraints
- post_task_checklist:
  - the intended bottleneck improved under the same representative test
  - no correctness, tail-latency, resource, cost, accessibility, security, or operability regression is hidden
  - capacity limit, regression budget, monitoring, and rollback are explicit
- validation_process: repeat controlled benchmarks with warm/cold and representative cases; compare distributions and resources, run correctness/regression tests, and verify production-like telemetry without overstating lab results.
- completion_criteria: the target is met or the evidence explains the limit; before/after results are reproducible; trade-offs, capacity, monitoring, and residual risk are documented.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Define a user- or system-visible performance budget, representative workload, percentile, data shape, concurrency, environment, and baseline protocol.
2. Measure end-to-end latency and decompose profiles, traces, queries, payloads, rendering, allocation, I/O, locks, network, cache, and external time.
3. Rank bottleneck hypotheses by measured contribution, expected gain, complexity, risk, cost, and reversibility.
4. Apply one focused optimization at a time, preserving invariants and introducing caches or concurrency only with explicit correctness semantics.
5. Repeat the identical benchmark, inspect distributions and resources, and run functional, failure, security, and accessibility regression checks.
6. Set capacity and regression thresholds, observability, rollout, stop, rollback, and follow-up experiments.

## Domain gates

- BLOCKER: no optimization claim without comparable before/after evidence and an explicit target.
- MUST: averages do not replace tail percentiles for user-facing or reliability-sensitive paths.
- MUST: cache design declares key, owner, consistency, freshness, invalidation, stampede, size, privacy, and failure behavior.

## Completion report

Report outcome, evidence, decisions, validation, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta without private chain-of-thought.
