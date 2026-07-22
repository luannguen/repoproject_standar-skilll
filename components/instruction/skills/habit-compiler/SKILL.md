---
name: habit-compiler
description: Act as the Adaptive Cognitive Runtime's Consolidation Engine. Analyzes execution traces from successful tasks to extract invariants, parameterize variables, and output compiled Procedural Memory (VOPL Habits) into the `custom-skills/habits` directory.
---

# Habit Compiler

## Skill contract

- id: habit-compiler
- name: Habit Compiler
- version: 1.0.0
- description: Analyzes execution traces of successful tasks to generate executable Procedural Memory (VOPL Habits).
- purpose: Translate LLM reasoning traces into zero-deliberation routines for future execution.
- scope: Post-task evaluation of repeated successes.
- triggers: post-task success count threshold reached, manual compilation request.
- exclusions: Does not execute habits; only compiles them.
- required_inputs: execution traces, source code diffs, intent.
- expected_outputs: A compiled `.vopl.md` file in `custom-skills/habits/`.
- required_files:
  - ../../PROJECT-CONSTITUTION.md
  - ../../custom-skills/VOPL-HABIT-TEMPLATE.md
- related_skills:
  - project-memory
  - project-orchestrator
- prerequisite_skills:
  - project-memory
- next_skills:
  - None (Execution terminates after compilation)
- constraints: Must strictly follow VOPL structure.
- blockers: Missing context, unstructured execution trace.
- execution_workflow: Read trace -> Normalize -> Extract Invariants -> Emit VOPL file.

## Execution Workflow

1. **Trace Normalization**: Read the `project-memory` for the task history. Identify the sequence of actions that led to success.
2. **Invariant Extraction**: Identify constants (e.g., project architecture, framework constraints).
3. **Parameter Discovery**: Identify variables (e.g., entity name, route path) and expose them in the `requires` block.
4. **Code Generation**: Apply the findings to `VOPL-HABIT-TEMPLATE.md`.
5. **Output**: Write the file to `components/instruction/custom-skills/habits/<habit-name>.vopl.md`.
6. **Register**: The new habit is now available to the `project-orchestrator` ACR Router (Step 2).
