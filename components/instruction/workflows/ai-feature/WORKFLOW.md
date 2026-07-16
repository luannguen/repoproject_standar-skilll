# AI Feature Workflow

- id: ai-feature
- version: 1.0.0
- status: ACTIVE
- applies_when: the requested behavior uses an LLM, model, agent, tool calling, retrieval, embeddings, AI memory, or generated consequential output.
- goal: deliver useful AI behavior inside explicit authority, privacy, safety, quality, latency, cost, observability, fallback, and human-control boundaries.
- risk_floor: HIGH; CRITICAL when AI can make irreversible, financial, identity, security, legal, or safety-relevant decisions/actions.
- required_skills:
  - project-orchestrator
  - project-memory
  - requirement-analysis
  - ai-agent-safety
  - security-threat-modeling
  - testing-quality
  - observability-incident
  - documentation-sync
- optional_skills:
  - system-architecture
  - ui-ux-production
  - backend-production-engineering
  - api-integration
  - data-lifecycle
  - analytics-telemetry
  - domain-skill-framework only with proven application evidence
- approval_gates:
  - AG-03 production tool action
  - AG-05 identity/security boundary
  - AG-07 external communication
  - AG-08 model/provider cost
  - AG-09 sensitive data
  - AG-10 provider/platform evolution

## Inputs

- user outcome, non-AI baseline, allowed/forbidden behavior, autonomy, human checkpoints, data classification, and risk
- model/provider/tool contracts, prompts, context/retrieval sources, permissions, budgets, latency, failure, and fallback
- representative and adversarial evaluation cases with success/safety metrics

## Outputs

- AI boundary, threat model, and authority design
- versioned prompt/context/tool/output contracts
- quality/safety/cost/latency evaluation results
- monitoring, fallback, kill switch, human control, docs, and memory

## Pre-task gate

- [ ] AI is justified against a deterministic alternative
- [ ] system/user/retrieved/model/tool trust boundaries and data flows are mapped
- [ ] tools independently enforce authorization, schema, bounds, confirmation, and idempotency
- [ ] quality, safety, privacy, cost, latency, fallback, and incident thresholds are testable

The orchestrator must issue a Task Execution Brief. Stop before any action whose approval gate is unsatisfied.

## Execution phases

1. **Bound** ? Define users, outcome, non-goals, autonomy, allowed/forbidden actions, human control, data, budgets, and safe terminal states.
2. **Threat-model** ? Treat user/retrieved/model/tool content as untrusted; analyze injection, leakage, misuse, impersonation, loops, and provider risk.
3. **Contract** ? Version prompts, context, retrieval, structured outputs, tool schemas, permissions, confirmations, limits, and error/fallback behavior.
4. **Implement** ? Place deterministic validation and authorization outside the model; isolate tools and bound steps, retries, time, tokens, and cost.
5. **Evaluate** ? Run representative quality and adversarial safety suites across variance, injection, leakage, malformed output, hallucination, misuse, refusal, cost, latency, and fallback.
6. **Observe** ? Instrument model/tool decisions and outcomes without sensitive content; add drift, quality, safety, cost, latency, and loop signals.
7. **Release** ? Stage rollout under approval with kill switch, fallback, incident response, limitations, user guidance, and owned evaluation updates.

## Validation

- versioned quality and safety evals meet declared thresholds across repeated runs
- prompt/indirect injection cannot override policy or cross tool/data authority boundaries
- side effects, structured outputs, budgets, fallbacks, human approvals, monitoring, and kill switch work independently of model compliance

## Completion criteria

- [ ] AI outcome meets accepted quality while staying inside authority and budgets
- [ ] material safety/privacy/security evals pass and side effects are deterministically controlled
- [ ] fallback, observability, incident, limitations, docs, ownership, and memory are complete

## Rollback or recovery

Provide a kill switch and deterministic non-AI or safe-failure path. Disable tool side effects or revert model/prompt versions independently; active compromise enters incident-response.

## Project Memory write-back

Record durable AI boundaries, model/prompt/tool versions, eval thresholds/results, safety decisions, limitations, incidents, and costs. Do not store prompts containing secrets, raw private content, or chain-of-thought.

## Final report

State outcome, scope, changed artifacts, validation evidence, unavailable checks, approvals, rollback/recovery readiness, residual risk, documentation, memory delta, and next safe action.
