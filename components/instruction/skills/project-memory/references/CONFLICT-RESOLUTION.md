# Conflict Resolution

When two memories or a memory and source disagree:

1. Do not overwrite either claim silently.
2. Define the disputed scope and affected behavior.
3. Label each claim as implementation reality, intended contract, historical behavior, or future proposal.
4. Collect the relevant runtime, code, schema, migration, test, specification, business-rule, decision, instruction, and memory sources.
5. Apply source authority for the type of claim, not a universal mechanical order.
6. If authority is still unclear, mark relevant entries disputed and create a conflict report/open question.
7. If resolution is evidenced or approved, create/update the winning entry and set both supersedes and superseded_by.
8. Preserve material decision, migration, incident, and audit history.
9. Re-run lint and re-verify dependent memories.

A code/spec mismatch is an implementation conflict until resolved; running code does not automatically invalidate an approved specification. A memory-only disagreement cannot produce a verified result.

A conflict report should include claims, scope, sources, authority analysis, operational risk, temporary safe behavior, owner/approval needed, and next verification step.
