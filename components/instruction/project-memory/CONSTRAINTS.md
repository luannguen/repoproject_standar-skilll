---
memory_id: MEM-CONSTRAINT-0001
memory_type: technical_constraint
scope: level-0:project
status: verified
confidence: high
trigger_terms: [all-tasks, memory, implementation, documentation, continuation, secret, conflict]
source_references: [AGENTS.md, components/instruction/AI-BOOTSTRAP.md, components/instruction/skills/project-memory/references/MEMORY-POLICY.md]
last_verified_at: 2026-07-16
review_after: 2026-10-16
supersedes: []
superseded_by:
related_memories: [DEC-0001, PAT-0001]
---

# Project Memory Constraints

- Every task performs at least a lightweight memory scan.
- Medium/complex work is gated by retrieval, verification, stale/conflict detection, and a Memory Context Summary.
- Memory supports action and navigation; it never overrides the authoritative source for the claim type.
- Current implementation, intended contract, historical behavior, and future proposal remain distinct.
- Retrieval is selective and progressive; agents do not load the entire store.
- Verified entries require evidence and current source references.
- Uncertainty is explicit through supported, provisional, or disputed status.
- Detail and structured index change atomically and must pass lint.
- Unfinished work requires an exact, chat-independent checkpoint.
- Completed working memory is compacted into durable entries and a task summary.
- Secrets, credentials, private production data, and chain-of-thought are prohibited.
- No major dependency or vector database is added without demonstrated need and approval.
- Business invariants, permission models, accepted decisions, security rules, public contracts, migration history, and material incidents are not silently changed or deleted.
