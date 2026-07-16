---
memory_id: PAT-0001
memory_type: design_pattern
scope: level-0:project
status: supported
confidence: high
trigger_terms: [retrieval, context, token, memory-query, index, verification]
source_references: [components/instruction/skills/project-memory/SKILL.md, components/instruction/skills/project-memory/references/RETRIEVAL.md, components/instruction/project-memory/INDEX.md]
last_verified_at: 2026-07-16
review_after: 2026-09-16
supersedes: []
superseded_by:
related_memories: [DEC-0001, MEM-CONSTRAINT-0001]
---

# PAT-0001: Progressive retrieval

## Problem shape

A task needs prior project knowledge without loading the entire memory store or trusting stale summaries.

## Pattern

1. Read the human routing index.
2. Filter structured metadata by scope, module, path, entity, feature, trigger, dependency, risk, status, confidence, and freshness.
3. Open only relevant detail entries.
4. Verify material claims at authoritative sources.

## Applicability

Use for every task, with a lightweight form for trivial changes and a broader high-risk form for security, permission, payment, migration, incident, and public-contract work.

## Non-applicability

Do not stop at metadata when the claim affects implementation or risk. Do not use inactive entries in the main context except for history/regression analysis.

## Evidence and promotion

The instruction architecture and deterministic index implement the pattern. Status remains supported until representative project tasks demonstrate successful reuse or it receives explicit review acceptance.

## Failure modes

- weak or missing tags/triggers;
- index/detail drift;
- skipping source verification;
- overloading context with low-relevance entries.
