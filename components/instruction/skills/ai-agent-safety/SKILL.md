---
name: ai-agent-safety
description: Design, implement, or review LLM and agent systems for model suitability, prompt and tool boundaries, untrusted content, authorization, privacy, structured outputs, evaluation, cost, observability, fallback, and human control.
---

# AI and Agent Safety Engineering

## Skill contract

- id: ai-agent-safety
- name: AI and Agent Safety Engineering
- version: 1.0.0
- description: Design, implement, or review LLM and agent systems for model suitability, prompt and tool boundaries, untrusted content, authorization, privacy, structured outputs, evaluation, cost, observability, fallback, and human control.
- purpose: make AI behavior bounded, testable, secure, cost-aware, recoverable, and subordinate to explicit user and system authority.
- scope: model selection evidence, prompts, context, RAG, memory, tools, permissions, sandboxing, structured output, evaluation, guardrails, abuse, privacy, cost, latency, monitoring, fallback, and human approval.
- triggers: LLM, AI feature, agent, tool calling, MCP, prompt, RAG, embeddings, autonomous workflow, model change, AI evaluation, or generated action.
- exclusions: does not grant models authority, expose chain-of-thought or secrets, execute unsafe autonomous actions, or claim deterministic correctness from sampling.
- required_inputs:
  - user outcome, allowed and forbidden behavior, risk, data classification, and human-control requirements
  - model/provider/tool contracts, trust boundaries, context sources, cost/latency limits, and failure modes
  - evaluation dataset, quality/safety metrics, fallback, observability, and incident requirements
- expected_outputs:
  - AI system boundary and threat model
  - prompt/tool/context/data contracts with permissions
  - evaluation and red-team plan plus measured results
  - cost/latency budgets, fallback, monitoring, and human-approval design
- required_files:
  - PROJECT-CONSTITUTION.md
  - SKILL-REGISTRY.json
  - WORKFLOW-REGISTRY.json
- related_skills:
  - system-architecture
  - security-threat-modeling
  - api-integration
  - data-lifecycle
  - testing-quality
  - observability-incident
- prerequisite_skills:
  - project-memory
- next_skills:
  - security-threat-modeling
  - testing-quality
  - observability-incident
  - documentation-sync
- constraints: least agency and privilege; treat model output and retrieved content as untrusted; validate structured outputs; isolate tools; require deterministic controls around side effects.
- blockers: model can cross an authority boundary; untrusted content can alter system policy; sensitive data exposure; side effect lacks confirmation/idempotency; no evaluation for material failure; unbounded cost or recursion.
- approval_requirements: external data sharing, production tool mutation, sensitive context, expanded autonomy, model/provider cost, high-impact generated decision, or weakened human control requires the matching gate.
- execution_workflow: follow the Mandatory workflow in order and preserve its evidence.
- pre_task_checklist:
  - define allowed/forbidden outcomes, users, risk, autonomy, data, tools, and approval boundaries
  - map prompt, retrieval, memory, model, parser, tool, and external trust boundaries
  - establish quality, safety, latency, cost, fallback, incident, and evaluation criteria
- post_task_checklist:
  - untrusted input/output is isolated and validated
  - tools enforce server-side authorization, schema, limits, idempotency, and confirmation independently of the model
  - evaluations cover quality, safety, injection, leakage, misuse, cost, latency, fallback, and regression
- validation_process: run representative and adversarial evals including prompt injection, indirect injection, data leakage, tool misuse, malformed output, hallucinated references, loops, cost exhaustion, refusal, fallback, and human-approval paths.
- completion_criteria: the AI system stays inside explicit authority and budgets; material evals pass; side effects are deterministically controlled; monitoring, fallback, incident, and residual risk are documented.
- exception_policy: record the rule, reason, scope, risk, compensating control, rollback, approval, expiry, and follow-up; never silently weaken a BLOCKER or approval gate.
- memory_read_policy: retrieve only indexed facts, decisions, constraints, incidents, debt, and checkpoints relevant to the classified task; verify them against current evidence.
- memory_write_policy: write only concise, durable, verified decisions, patterns, risks, debt, and checkpoints; never store secrets, raw transcripts, speculation, or temporary logs.
- update_policy: version reusable evidence-backed improvements, synchronize the registry and interface metadata, run system lint, and require approval before weakening safety, quality, compatibility, or completion rules.

## Mandatory workflow

1. Define the user outcome, non-AI baseline, autonomy level, allowed/forbidden behavior, human checkpoints, data classes, and measurable success/failure.
2. Map trust boundaries across system prompts, user/retrieved content, memory, model/provider, parser, tools, credentials, and external systems.
3. Select models and techniques from current evidence; design minimal context, structured output schemas, least-privilege tools, limits, confirmation, idempotency, and sandboxing.
4. Implement deterministic validation and authorization outside the model, with bounded retries, budgets, timeouts, fallback, and safe failure.
5. Create versioned quality and safety evaluations using representative and adversarial cases; measure latency, cost, variance, and regression.
6. Instrument decisions and tool outcomes without sensitive content; document limitations, incident response, kill switch, ownership, and controlled evolution.

## Domain gates

- BLOCKER: model text, retrieved documents, and tool output are untrusted data and may not override system policy or authorization.
- BLOCKER: consequential side effects require deterministic authorization and the applicable human approval outside the model.
- MUST: every loop has bounded steps, time, tokens/cost, retries, tool scope, and a safe terminal state.

## Completion report

Report outcome, evidence, decisions, validation, unavailable checks, approval status, residual risk, documentation changes, and Project Memory delta without private chain-of-thought.
