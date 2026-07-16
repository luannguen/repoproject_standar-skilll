# System-Wide Anti-Patterns

Version: 1.0.0

Each item is prohibited unless an explicit, recorded exception applies.

1. **Unrouted skill** ? creating a skill without integrating it into the registries, Orchestrator, and at least one workflow.
2. **Triggerless skill** ? creating a skill whose activation conditions and exclusions are not deterministic.
3. **No Definition of Done** ? creating a skill without validation and completion criteria.
4. **Duplicate skill** ? creating overlapping capability instead of extending, merging, or clearly separating ownership.
5. **Read every skill** ? loading the full library for every task instead of registry-guided progressive retrieval.
6. **Skip important memory retrieval** ? starting material work without relevant constraints, decisions, incidents, debt, and checkpoint context.
7. **Code before requirements** ? implementing before goal, actors, scope, exclusions, and acceptance criteria are understood.
8. **Code before impact analysis** ? changing behavior before data, contracts, security, operations, compatibility, recovery, and blast radius are assessed.
9. **Security looks optional** ? skipping threat or permission analysis because the patch appears small.
10. **Small change, no test** ? omitting regression evidence because few lines changed.
11. **Build-equals-production fallacy** ? declaring production readiness merely because compilation or build succeeded.
12. **Invent a business rule** ? changing or creating domain behavior without authoritative evidence and ownership.
13. **Invent a permission** ? broadening, narrowing, or assuming access control without authority and server-side verification.
14. **Self-authorized breaking change** ? changing a public or persisted contract without compatibility, consumer migration, and approval.
15. **Self-authorized production migration** ? executing production schema/data transition without explicit gate, rehearsal, validation, and recovery.
16. **Self-authorized major upgrade** ? performing a major dependency/runtime/platform upgrade without evidence, scope separation, and approval.
17. **Out-of-scope refactor** ? mixing unrelated structural cleanup into a bounded task.
18. **Premature abstraction** ? generalizing before repeated evidence establishes stable consumers or a real boundary.
19. **Unnecessary microservice** ? introducing distribution, network, ownership, deployment, and failure cost without a demonstrated boundary need.
20. **Event flow without replay safety** ? using asynchronous/event-driven behavior without idempotency, deduplication, ordering, reconciliation, and replay.
21. **Evidence-free domain skill** ? creating project-specific domain instructions from labels, assumptions, or one task instead of repeated application evidence.
22. **Unrouted long-form documentation** ? creating documentation that Bootstrap, Orchestrator, registry, workflow, or a skill never retrieves.
23. **Workflow without approval gates** ? defining execution phases without mapping potentially gated actions.
24. **Skip rollback or recovery** ? changing critical behavior without a practical rollback, forward-fix, containment, or explicit impossibility.
25. **Ignore backward compatibility** ? changing consumers, data, APIs, events, configuration, or versions without a compatibility window.
26. **Contract change without documentation sync** ? changing behavior or contracts while leaving docs, examples, runbooks, and registries stale.
27. **Important task without memory update** ? failing to record durable decisions, incidents, risks, debt, or verified outcomes.
28. **Stop without checkpoint** ? leaving incomplete work without exact current state, evidence, blockers, and resumption data.
29. **Vague checkpoint** ? recording a checkpoint without the next exact step, files, validation, and stop condition.
30. **Self-downgraded production rule** ? silently weakening BLOCKER/MUST, quality, security, accessibility, approval, or recovery requirements.
31. **Assumption presented as fact** ? using inference, stale memory, or proposed state as verified current evidence.
32. **Bug legitimized by current code** ? treating an existing implementation as the correct business contract when evidence shows defective behavior.
33. **Major upgrade hidden in a feature** ? mixing dependency/platform evolution into feature scope instead of using its workflow and gates.
34. **Ignore platform capability or limitation** ? assuming Base44 or any current platform provides transactions, auth, isolation, runtime, deployment, or integration guarantees without evidence.
35. **Skill system without Orchestrator** ? building a large library without deterministic classification, risk, workflow, context, approval, and completion coordination.
