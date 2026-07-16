# Custom Skill System Anti-Patterns

These are system-wide blockers. A validator or reviewer must reject any change that introduces them.

1. Rewrite the entire skill library for every project.
2. Mix generic skill guidance with project-specific rules.
3. Activate every skill in every project.
4. Read every custom skill for every task.
5. Detect a technology from comments alone.
6. Ignore the detected package or platform version.
7. Treat framework knowledge from model memory as a current fact.
8. Skip an official source check when one is available.
9. Copy upstream documentation wholesale.
10. Create a Custom Skill that replaces a Standard Skill.
11. Let a Custom Skill weaken security or production rules.
12. Create one giant stack skill for every combination.
13. Copy rules between Next.js and Vite without considering runtime boundaries.
14. Apply the Next.js skill to a Vite application scope.
15. Apply the Vite skill to a Next.js application scope.
16. Apply a technology skill repository-wide when only one monorepo package uses it.
17. Create a domain skill from a menu name.
18. Invent a business invariant by inference.
19. Mark a domain skill verified without an authoritative specification or equivalent evidence.
20. Omit the Project Overlay layer when project-specific facts exist.
21. Put one project's details in the reusable base.
22. Store a secret in an overlay, report, memory, or manifest.
23. Activate a skill without detection evidence.
24. Leave a skill active after its technology is removed.
25. Leave a skill unreviewed after a major version upgrade.
26. Upgrade a dependency merely because a Custom Skill supports a newer release.
27. Copy complete rules into a composite profile.
28. Hard-code active skills in AI-BOOTSTRAP.
29. Omit route tests.
30. Declare the system complete while manifests are out of sync.
