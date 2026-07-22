# Adaptive Cognitive Runtime (ACR) Architecture

**Status**: Vision & Target Architecture
**Version**: 1.0.0

## 1. Triết lý Cốt lõi (The Paradigm Shift)

Hệ thống Agent không nên được thiết kế như một "bộ não LLM khổng lồ" phản hồi request một cách thụ động và phải suy nghĩ lại (deliberate) từ đầu cho mỗi tác vụ.

Thay vào đó, nó phải là một **Hệ điều hành Nhận thức (Cognitive Runtime)** duy trì vòng lặp sống liên tục:
`Observe → Align → Predict → Compare → Select/Plan → Act → Evaluate → Adjust`.

Trong đó, LLM **chỉ là một vùng suy luận (Deliberative Cortex)** chuyên xử lý sự mới lạ (novelty), không phải là CPU chạy mọi tác vụ.

## 2. Các Tầng Nhận Thức (Cognitive Layers)

Hệ thống được chia thành 6 tầng rõ rệt, mô phỏng quá trình "nén" từ suy nghĩ chậm thành phản xạ nhanh (như ACT-R / Soar):

### 2.1. Tầng phản xạ (Reflex Layer)
- Code thuần, event-driven, deterministic.
- Chi phí bằng 0 token.
- Xử lý các lỗi đã biết (VD: missing env var -> chặn deploy).

### 2.2. Tầng trí nhớ thủ tục (Procedural Memory)
- Lưu trữ các **Kỹ năng (Skills)** có thể thực thi trực tiếp thay vì semantic vector.
- Mỗi Skill có một **Activation Contract** nghiêm ngặt (Intent, Environment, Preconditions).
- Chỉ kích hoạt khi độ tự tin (Confidence) cao và không vi phạm Invariants.

### 2.3. Tầng thói quen (Habit Compiler)
- Động cơ biến đổi (Consolidation Engine): So sánh các execution trace thành công -> Tìm điểm bất biến (invariants) -> Tách tham số -> Đóng gói thành Skill mới.
- Quá trình: `LLM Reasoning -> Trace Normalization -> Invariant Extraction -> Verification -> Compiled Procedure`.

### 2.4. Tầng mô hình thế giới (World Model)
- Cung cấp khả năng dự đoán (Predictive Power).
- Là tập hợp các graph (Repository, Dependency, Runtime State, historical transitions).
- LLM chỉ can thiệp khi có **Prediction Error** (Kết quả thực tế sai lệch so với mô hình dự đoán).

### 2.5. Tầng suy nghĩ (Deliberative Cortex - LLM)
- Chỉ được gọi khi: Tình huống mới, Không có skill, Skill xung đột, Prediction Error vượt ngưỡng, Rủi ro cao.
- Trọng tâm: Xử lý Novelty.

### 2.6. Tầng siêu nhận thức (Metacognition)
- Quan sát chính Agent: Giám sát Success Rate của Skills, đánh giá khi nào cần compile skill mới, khi nào cần quarantine skill cũ (bị out-of-date do thay đổi môi trường).

## 3. Vai trò của VOPL (Cognitive Intermediate Representation)

VOPL (Vocabulary/Policy Language) đóng vai trò là ngôn ngữ trung gian. Thay vì LLM sinh code trực tiếp, LLM sẽ sinh ra VOPL policy.
Một đơn vị VOPL xác định:
- Khi nào kỹ năng kích hoạt (`activates when`).
- Điều kiện cần thiết (`requires`).
- Dự đoán kết quả (`predicts`).
- Bất biến cần bảo toàn (`preserves`).
- Xử lý khi dự đoán sai (`on prediction_error`).
- Điều kiện đóng gói thành thói quen (`consolidate after`).

## 4. Công thức cốt lõi của ACR
`Novelty → Reasoning → Experience → Abstraction → Verification → Procedure → Habit → Prediction error → Adaptation`
