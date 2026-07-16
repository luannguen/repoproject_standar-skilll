# Anti-patterns

Severity: BLOCKER invalidates safe use or completion; ERROR requires correction before affected work; WARN causes memory bloat, drift, or weak retrieval.

| # | Severity | Prohibited behavior |
| ---: | --- | --- |
| 1 | BLOCKER | Use chat history as official memory. |
| 2 | ERROR | Claim "I remember" without a repository source. |
| 3 | WARN | Read the entire memory store for every task. |
| 4 | BLOCKER | Skip memory before complex work. |
| 5 | ERROR | Use stale memory without verification. |
| 6 | BLOCKER | Present an assumption as a verified fact. |
| 7 | BLOCKER | Store chain-of-thought. |
| 8 | BLOCKER | Store secrets or credentials. |
| 9 | WARN | Copy long source code into memory. |
| 10 | WARN | Duplicate a whole document across entries. |
| 11 | WARN | Create one giant memory file. |
| 12 | BLOCKER | Create memory with no scope. |
| 13 | BLOCKER | Create memory with no trigger. |
| 14 | BLOCKER | Create active memory with no source. |
| 15 | BLOCKER | Mark verified without evidence. |
| 16 | WARN | Record every minor change. |
| 17 | WARN | Turn every small bug into an incident. |
| 18 | ERROR | Omit an important failed approach. |
| 19 | ERROR | Omit a proven root cause after a reusable fix. |
| 20 | ERROR | Record only a symptom, not root-cause status. |
| 21 | BLOCKER | Present a workaround as the permanent solution. |
| 22 | ERROR | Leave a temporary workaround unlabeled. |
| 23 | BLOCKER | Silently overwrite a prior decision. |
| 24 | BLOCKER | Delete material decision history. |
| 25 | BLOCKER | Supersede without bidirectional links. |
| 26 | ERROR | Leave module maps stale after a major refactor. |
| 27 | ERROR | Skip memory updates after a migration. |
| 28 | BLOCKER | Stop unfinished work without a checkpoint. |
| 29 | ERROR | Create a vague checkpoint. |
| 30 | BLOCKER | Omit the exact next step from a checkpoint. |
| 31 | ERROR | Omit tests run from a checkpoint. |
| 32 | ERROR | Keep working memory active after completion. |
| 33 | WARN | Never compact completed working memory. |
| 34 | BLOCKER | Use memory to legitimize incorrect implementation. |
| 35 | BLOCKER | Reject approved specification merely because code differs. |
| 36 | ERROR | Generalize a rule from one unverified case. |
| 37 | BLOCKER | Add a vector database when deterministic indexing is sufficient. |
| 38 | ERROR | Add a major dependency just to manage Markdown. |
| 39 | BLOCKER | Let the structured index drift from detail files. |
| 40 | BLOCKER | Ignore broken source references. |
| 41 | ERROR | Fail to detect stale memory. |
| 42 | BLOCKER | Hide or ignore a relevant conflict. |
| 43 | BLOCKER | Silently weaken production requirements. |
| 44 | BLOCKER | Change a business invariant without approval. |
| 45 | BLOCKER | Change a permission model without approval. |
| 46 | BLOCKER | Delete a security incident without approval. |
| 47 | ERROR | Skip the memory-delta review after important work. |
| 48 | WARN | Put the whole memory store into the prompt. |
| 49 | WARN | Preserve minute-lived information as durable knowledge. |
| 50 | ERROR | Claim the agent learned when no verified write-back exists. |
