# VOPL Habit Template

**Status**: Boilerplate for Habit Compilation
**Context**: Used by the Habit Compiler to output Procedural Memory (Compiled Skills).

This template defines the standard VOPL (Vocabulary/Policy Language) structure for any compiled procedural habit in the ACR framework.

## File Naming
Save new habits as `<habit-name>.vopl.md` or `.vopl` depending on the parsing support.

## VOPL Structure

```vopl
skill <SkillName> {

    // Activation Contract
    activates when {
        intent == <ExpectedIntent>
        and environment.has(<RequiredTechOrContext>)
        and <OtherConditions>
    }

    // Preconditions (must be true before execution)
    requires {
        <Condition1>
        <Condition2>
    }

    // Expected state transitions
    predicts {
        <Outcome1>
        <Outcome2>
    }

    // Invariants that must not be broken during or after execution
    preserves {
        <Invariant1>
        <Invariant2>
    }

    // Execution Plan (Procedural Steps)
    execute {
        step 1: <Action>
        step 2: <Action>
    }

    // Fallback if prediction fails during execution
    on prediction_error {
        isolate affected transition
        suspend unsafe action
        request deliberation
    }

    // Criteria for further consolidation or upgrade
    consolidate after {
        success_count >= <X>
        success_rate >= <Y>%
    }
}
```

## Compilation Rules
1. **Never hand-write a habit** for a novelty task. Habits must be compiled from successful LLM traces.
2. The Habit Compiler must extract variables and insert them as parameters.
3. Every habit MUST include `on prediction_error` pointing back to the Deliberative Cortex.
