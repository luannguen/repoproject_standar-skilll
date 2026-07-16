# Garbage Collection

Garbage collection keeps retrieval precise without destroying history.

## Review triggers

Run a review after a completed multi-phase task, major refactor, migration, incident closure, contract change, or module-ownership change, and periodically when the index grows materially.

## Operations

1. Detect duplicate scope/claim pairs and choose one canonical entry.
2. Merge complementary evidence without changing the meaning or status beyond the evidence.
3. Mark replaced entries superseded and link both directions.
4. Archive superseded entries after active references are moved.
5. Compact completed checkpoints into one task summary and extract reusable semantic/episodic entries.
6. Remove temporary notes that have no durable value and no references.
7. Flag broken sources, missing scope/trigger/evidence, overdue reviews, unused entries, and unresolved disputes.
8. Rebuild the human index from structured metadata and run lint.

Never automatically delete accepted architecture decisions, business invariants, security/payment incidents, migration history, audit-relevant records, disputed entries, or referenced entries. Archive or supersede them with traceability.

Delete only when an entry is temporary, unreferenced, non-audit-relevant, contains no unique evidence/history, and policy permits removal. Secret material is an exception: stop, remove it safely from the working tree/history as authorized, rotate affected credentials, and record only a redacted incident.

## Compaction standard

A completed task summary retains objective, material outcome, changed paths, accepted/provisional decisions, verification/tests, remaining risks, extracted memory IDs, and rollback or follow-up. It excludes conversational narrative, transient command output, and private reasoning.
