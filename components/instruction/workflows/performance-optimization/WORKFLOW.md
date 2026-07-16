# Performance Optimization Workflow

- id: performance-optimization
- version: 1.0.0
- status: ACTIVE
- applies_when: a measured latency, throughput, capacity, resource, payload, rendering, data-access, or cost target is not met.
- goal: meet an explicit budget through measured bottleneck removal without correctness, security, accessibility, reliability, or cost regression.
- risk_floor: MEDIUM; raise for production load, architecture/infrastructure spend, consistency changes, or critical capacity.
- required_skills:
  - project-orchestrator
  - project-memory
  - performance-scalability
  - testing-quality
  - observability-incident
  - documentation-sync
- optional_skills:
  - system-architecture
  - ui-ux-production
  - backend-production-engineering
  - data-lifecycle
  - security-threat-modeling
  - analytics-telemetry
  - code-review-refactoring
- approval_gates:
  - AG-03 production load or rollout
  - AG-05 security/consistency boundary
  - AG-08 material cost
  - AG-10 architecture/platform evolution

## Inputs

- user/system metric, percentile, target, baseline protocol, workload, data volume, concurrency, environment, and growth
- profiles, traces, metrics, queries, payloads, resources, costs, constraints, and current tests

## Outputs

- reproducible baseline and ranked bottlenecks
- focused optimization and before/after results
- functional and non-functional regression evidence
- capacity, rollout, monitoring, rollback, and memory update

## Pre-task gate

- [ ] target and representative workload are explicit
- [ ] baseline is reproducible in a controlled comparable environment
- [ ] bottleneck hypotheses are supported by measurements
- [ ] correctness, freshness, security, accessibility, availability, cost, and rollback constraints are known

The orchestrator must issue a Task Execution Brief. Stop before any action whose approval gate is unsatisfied.

## Execution phases

1. **Budget** ? Define metric, percentile, target, workload, data, concurrency, environment, cost, and measurement error.
2. **Baseline** ? Capture end-to-end and component timings, resources, profiles, queries, payloads, cache, I/O, network, and dependencies.
3. **Rank** ? Order bottlenecks by measured contribution, expected gain, risk, complexity, cost, and reversibility.
4. **Optimize** ? Change one focused factor at a time and declare any cache, concurrency, batching, or approximation semantics.
5. **Compare** ? Repeat the identical protocol and compare distributions, resources, cost, and representative edge loads.
6. **Regress** ? Run correctness, failure, security, accessibility, compatibility, and operational validation.
7. **Operationalize** ? Set performance gates, capacity thresholds, dashboards, alerts, rollout, rollback, and next experiments.

## Validation

- before/after data uses the same protocol and reports distribution, not only averages
- performance gain does not hide correctness, tail, resource, cost, accessibility, security, or observability regression
- capacity limit and production-like differences are explicit

## Completion criteria

- [ ] target is met or an evidence-backed limit and next decision is reported
- [ ] results are reproducible and tied to the identified bottleneck
- [ ] regression, monitoring, capacity, docs, rollback, and memory are complete

## Rollback or recovery

Keep each optimization independently revertible. Cache or data-shape changes need invalidation and compatibility recovery; production load tests require authorized stop thresholds.

## Project Memory write-back

Record durable budgets, baselines, bottlenecks, verified patterns, capacity constraints, and rejected approaches; do not store raw benchmark dumps.

## Final report

State outcome, scope, changed artifacts, validation evidence, unavailable checks, approvals, rollback/recovery readiness, residual risk, documentation, memory delta, and next safe action.
