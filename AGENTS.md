# Project instruction routing

These repository instructions apply to every task.

0. **Mandatory Active Inference Loop**: Every task MUST be executed following this cognitive sequence BEFORE touching code: Quan sát môi trường (Observe) -> Cập nhật trạng thái và niềm tin (Align) -> Dự đoán điều sắp xảy ra (Predict) -> So sánh dự đoán với thực tế (Compare) -> Chọn phản xạ, kỹ năng hoặc suy luận (Select/Plan) -> Hành động (Act) -> Đánh giá hậu quả (Evaluate) -> Điều chỉnh kiến thức và hành vi (Adjust).
1. Read `components/instruction/PROJECT-CONSTITUTION.md` and `components/instruction/AI-BOOTSTRAP.md` before project analysis or implementation.
2. Read the Standard Skill/workflow registries, template/profile manifests, `components/instruction/custom-skills/CUSTOM-SKILL-REGISTRY.json`, and all three project custom-skill manifests. Invoke `components/instruction/skills/project-orchestrator/SKILL.md`; select exactly one primary workflow, the minimum applicable Standard Skills, and only active Custom Skill bindings that intersect the task type and package/path scope.
3. If the repository profile is template/uninstantiated or the task is clone setup, select project-onboarding and project-bootstrap-governance before application work. Assign the highest applicable LOW, MEDIUM, HIGH, or CRITICAL risk. Produce a Task Execution Brief before MEDIUM+ implementation.
4. Evaluate `components/instruction/APPROVAL-GATES.md`; stop before a gated action until its exact approval is satisfied.
5. Run `components/instruction/skills/project-memory/SKILL.md` retrieval progressively and verify material memory against current repository evidence.
6. Follow the selected workflow pre-task, execution, validation, documentation, recovery, and completion gates.
7. For UI/UX work, `ui-ux-production` is mandatory. For backend work, `backend-production-engineering` is mandatory. Full-stack work must reconcile API, schema, permission, state, and error contracts before implementation.
8. Keep Standard Skills separate from reusable Custom Skills. Do not preload the full library, activate a reusable skill without a project binding, hard-code active skills, or invent missing stack/version/domain evidence.
9. After work, synchronize affected documentation, detection/activation manifests, overlays, registries, and durable memory; create an exact checkpoint if incomplete and run applicable system validation.
10. Never store secrets, credentials, private production data, personal data, raw logs, speculation, or private chain-of-thought in Project Memory.

When repository rules conflict, apply the Constitution authority order. Stop and report any unresolved material conflict.
