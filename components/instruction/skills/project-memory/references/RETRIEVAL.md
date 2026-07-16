# Retrieval

## Build the query

Derive a Memory Retrieval Query before work:

- task type and user goal;
- domain, module, feature, entities, and state transitions;
- affected and neighboring paths;
- dependencies and integrations;
- error text, stack trace terms, migration identifiers, and version;
- permission, security, payment, and data sensitivity;
- business vocabulary and known aliases;
- task or incident identifier when continuing work.

Search concepts and relationships, not only filenames.

## Progressive retrieval

1. Read project-memory/INDEX.md.
2. Filter memory-index.json using metadata.
3. Open only high-relevance detail files.
4. Verify material claims at their source.

Always include matching level-0 constraints. Then prefer the closest scope: domain, module, feature, incident/checkpoint. Read debt and open questions only when they can change the plan or risk.

Exclude deprecated, superseded, and archived entries from the main context unless analyzing history, migration, rollback, or regression. Include disputed entries only to expose a relevant conflict.

## Deterministic relevance ranking

Use this ranking to sort candidates; the score ranks context and is not confidence:

| Signal | Weight |
| --- | ---: |
| exact scope or required level-0 constraint | 10 |
| module match or affected-path overlap | 8 |
| feature or entity match | 7 |
| dependency, integration, permission, or migration match | 6 |
| trigger-term or error-signature match | 5 |
| direct relationship to an already selected memory | 4 |
| task-type or tag match | 3 |

Then apply these tie-breakers in order:

1. verified before supported before provisional;
2. not overdue before overdue;
3. high before medium before low confidence;
4. closest scope before broader scope;
5. newest verification date.

A high-risk task must include all matching higher-level security, permission, payment, data-integrity, and public-contract constraints even when their score is lower.

## Context budget

Keep index metadata in the first pass. Read details only when the entry can affect an option, constraint, regression risk, verification target, or next step. Do not load unrelated incident history or copy source code into the context pack.

Stop expanding context when selected memories cover:

- applicable project constraints;
- closest domain/module/feature facts;
- accepted decisions and public contracts;
- similar incidents or failed approaches;
- active checkpoint;
- relevant debt/questions; and
- known stale/conflicting items.

## Memory Context Pack

Report conclusions and sources only:

- task classification;
- retrieval query summary;
- relevant constraints, facts, decisions, and contracts;
- incidents, failed approaches, and checkpoint;
- stale or disputed entries;
- claims re-verified and claims still provisional;
- source paths used.

For combined FE/BE work, create one shared pack, then separate FE constraints, BE constraints, and the API/schema/permission/UX contract.

## Retrieval examples

- Bug fix: incident, workaround, module history, recent change, failed approach, regression test, dependency.
- Refactor: architecture decision, public contract, consumers, boundary, compatibility, past refactor incident.
- Migration: schema ownership, migration history, rollback, affected integrations, data invariants.
- Documentation: target memory plus current code/schema/test; detect current-state versus future-plan drift.
- Continuation: closest active/blocked checkpoint by task ID, paths, branch/version, and objective; verify it before resuming.
