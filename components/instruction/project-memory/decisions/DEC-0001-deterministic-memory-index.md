---
memory_id: DEC-0001
memory_type: architecture_decision
scope: level-0:project
status: verified
confidence: high
trigger_terms: [memory-index, retrieval, semantic-search, vector-database, dependency, architecture]
source_references: [components/instruction/AI-BOOTSTRAP.md, components/instruction/skills/project-memory/references/RETRIEVAL.md, components/instruction/skills/project-memory/references/MEMORY-POLICY.md]
last_verified_at: 2026-07-16
review_after: 2026-10-16
supersedes: []
superseded_by:
related_memories: [MEM-CONSTRAINT-0001, PAT-0001]
---

# DEC-0001: Deterministic memory index

## Context and problem

The project needs selective retrieval, lifecycle validation, and low context overhead. The initial workspace has no application runtime or dependency baseline.

## Considered options

1. Markdown-only navigation.
2. Markdown detail plus a deterministic JSON index.
3. Semantic/vector search with new infrastructure.

## Decision

Use Markdown detail files with memory-index.json as the deterministic routing metadata. Keep INDEX.md as a concise human view. Do not add a vector database or major dependency until measured scale/retrieval failures justify it and approval is obtained.

## Rationale and trade-offs

JSON is supported by built-in tooling, easy to lint, deterministic, and adequate for tags, triggers, paths, modules, entities, features, dates, and relations. It requires atomic index/detail maintenance and does not provide fuzzy semantic search.

## Consequences

- Retrieval starts from structured metadata and expands progressively.
- Lint enforces index/detail/source consistency.
- Future semantic search must preserve IDs, lifecycle, evidence, and deterministic fallback.

## Reversal condition

Reconsider only after the store is large enough that measured, representative retrieval queries fail despite sound metadata, and the operational/security cost of new infrastructure is approved.

## Change impact

- migration: preserve existing JSON IDs and relationships during any future index migration.
- rollback: continue with JSON/Markdown; no external service state exists.
- security: avoids exporting memory to a new service.
- performance: local linear scans are acceptable for the current empty/small store.
- operations: no additional runtime or service dependency.
