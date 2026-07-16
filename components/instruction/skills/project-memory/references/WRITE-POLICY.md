# Write Policy

## Materiality gate

Write memory only when knowledge is reusable, costly to rediscover, risk-reducing, decision-relevant, needed for continuation, or required for audit/history. Do not store trivial edits, transient observations, obvious code descriptions, every small bug, or duplicated source text.

Prefer references and concise evidence over copied code or documents.

## Atomic write workflow

1. Identify the entry type and scope.
2. Search the index for duplicates, conflicts, and entries that should be updated or superseded.
3. Select the matching template from ../assets/templates/.
4. Record status and confidence consistent with current evidence.
5. Add source paths and concise evidence; distinguish fact, decision, assumption, and proposal.
6. Set trigger terms, affected modules/paths, dates, and relationships.
7. Write the detail file in the nearest scoped directory.
8. Update memory-index.json in the same change.
9. Validate links, relationships, dates, required fields, and secrets.
10. Run memory lint.

Do not silently mutate an accepted decision. Create a new decision and link supersession after approval.

## Task outcomes

For a completed feature, record only material feature summary, new accepted/provisional decision, reusable pattern, invariant, meaningful coverage, limitation, migration impact, or module-map change.

For a reusable bug or incident, record symptom, reproduction, scope, root cause status, failed attempts, final fix, regression protection, prevention, and detection signal. A small typo or obvious local defect does not need an incident.

For refactors, update boundary/module maps, compatibility notes, deprecated behavior, migration impact, removed workaround, and affected docs.

For migrations, preserve run history, compatibility window, data checks, rollback, failure state, and affected contracts.

## Working memory and checkpoints

Create a checkpoint whenever work stops unfinished, spans phases, is blocked, or must be resumed outside the current conversation. It must name the next exact file, action, command, and success condition; record files inspected/changed, decisions, commands, tests, errors, blockers, risks, rollback, and resume instructions.

Never write vague steps such as "continue coding" or "check more."

When work completes:

1. extract reusable semantic or episodic knowledge;
2. create a compact task summary;
3. move the summary to tasks/completed/;
4. archive or remove raw working notes under garbage-collection policy; and
5. close or supersede the active checkpoint in the index.

## Approval boundary

Agents may perform routine evidence, checkpoint, incident, provisional-pattern, map, debt, link, conflict, archive, and changelog updates.

Obtain approval for changes listed under "Safety and approvals" in MEMORY-POLICY.md. When approval is absent, record the proposal or dispute without changing the accepted fact/decision.
