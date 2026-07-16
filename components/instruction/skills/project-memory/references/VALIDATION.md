# Validation

## Verify before use

Re-verify an entry when an affected source changed; a schema, dependency, API, module, business rule, test, migration, or security policy changed; review is overdue; status is provisional/disputed; a new source conflicts; or task risk is high.

Verification may read instructions, specifications, code, schema, migrations, tests, dependency/configuration files, and runtime evidence, or run reproducible tests. Update last_verified_at, evidence, status, and review_after only for the scope actually checked.

## Stale detection

Treat an entry as a review candidate when:

- any affected/source path changed after last_verified_at;
- referenced files disappeared;
- a related schema/API/migration/dependency changed;
- ownership or module boundaries changed;
- protected tests changed or vanished;
- review_after passed; or
- a conflicting accepted source appeared.

Do not use one review interval for all memory. Shorten it for volatile modules and high-impact security/payment/permission/data contracts.

## Lint severity

BLOCKER means the memory system cannot be declared valid:

- malformed/unreadable index;
- duplicate or missing memory ID;
- missing required contract field;
- invalid status/confidence;
- active detail/source path missing;
- verified entry with no evidence/source;
- unresolved or circular supersession;
- active checkpoint with no exact next step;
- incident with no root-cause status;
- likely secret value;
- detail/index identity mismatch or unindexed active entry.

WARN means manual review is required but structure remains usable:

- verified entry past review date;
- low-confidence high-risk entry;
- inactive entry still retrieved by default;
- potential duplicate summary;
- long-unreferenced memory;
- missing optional relationship or operational detail.

## Validation sequence

1. Run scripts/memory-lint.ps1.
2. Inspect every WARN relevant to the task.
3. Open each changed entry and its source.
4. Confirm index/detail parity and source paths.
5. Confirm deprecated/superseded/archived entries are excluded by default.
6. Confirm no secret or chain-of-thought was written.
7. For changed scripts, run a positive test and an intentionally invalid fixture test.

Do not claim completion while a BLOCKER remains. Record items that cannot be verified as provisional, disputed, debt, or open questions.
