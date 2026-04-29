---
name: ai-agent-sdd
description: 在写代码之前，为 AI agent 或 AI 产品写一份专业的软件设计文档（SDD）。强制团队/vibe-coding agent 在动手前讲清楚问题、用户、成功指标、agent 工作流、LLM 策略、评估框架、失败模式与验收标准 —— 让实现有边界、可测试、可交付。当你启动一个新 AI agent 项目、在 vibe-coding 之前、现有 AI 功能开始失控、或要把 AI 产品交接给新负责人/外包时使用。两种深度：MVP（12 节，30 分钟填完）与 Full（23 节，2 小时填完）。
---

# AI Agent SDD —— AI 产品的软件设计文档

这个 skill 引导产品团队在写 AI agent 代码**之前**写一份专业 SDD，避免 vibe-coding 滑向"目标会变 / 指标做不出来 / 没法验收 / 没法交接"的沼泽。

一份好的 SDD 按顺序回答 5 个问题：

1. **Why** —— 解决什么问题、为谁、用什么指标衡量
2. **What** —— 功能性 + 非功能性需求
3. **How** —— 系统架构 + LLM 策略 + Agent 工作流 + 数据 + API + UI
4. **边界** —— 失败模式 / 安全 / 评估 / 验收标准
5. **节奏** —— 分期交付 / 风险 / 待解决问题

没有 SDD，vibe-coded AI 产品会：(1) 中途自己改目标 (2) 没法评估 (3) 没法交接 (4) demo 一次能跑，长期没法维护。

---

## 何时使用

- 🚀 启动新 AI agent / AI 产品（从 0 开始）
- 🔁 现有 AI 功能开始 scope drift
- 🤝 把 AI 产品交接给新工程师 / 外包 / co-founder
- 📊 给投资人 / 合作方推销 AI 产品 —— 需要单一真相源
- 🎯 想让 vibe-coding agent 写出"好代码"而不是"乱代码"
- 🧪 在上线前定义评估框架（golden set + 回归检查）

## 何时不要用

- 微调 prompt / 改一行文案（开销过大）
- 没有 LLM 或 agent 逻辑的纯基础设施改动（用普通 tech spec）
- 1 天内会丢弃的玩具原型（5 行 README 就够了）

---

## 不可妥协原则

1. **问题优先于方案** —— 第 1-4 节（问题/目标/指标/Persona）填完之前，不准开始写功能需求
2. **目标必须可测** —— 每个目标都有 metric + target，"提升 UX" 不是目标
3. **非目标必须显式** —— 你选择**不做**什么，和你选择做什么同等重要
4. **Agent 工作流不允许"魔法"** —— 每次 LLM 调用都要写明：模型、prompt 文件位置、输入/输出
5. **失败模式是一等公民** —— 在写 happy-path 代码前，先列出幻觉、死循环、下游 API 失败
6. **验收标准必须人人可测** —— 包括非工程师；通过 / 失败必须明确无歧义
7. **评估框架是 MVP 一部分** —— V1 上线前至少 10 个 golden 输入 + 期望输出

---

## 两个模板

| 模板 | 节数 | 填写时间 | 适用场景 |
|---|---|---|---|
| `templates/sdd-template-mvp.md` | **12** | ~30 分钟 | 小功能 / 单 agent / 已有基础设施；或必须几小时内开始写代码 |
| `templates/sdd-template-full.md` | **23** | ~2 小时 | 新产品 / 多 agent 系统 / 要交接 / 要 pitch / 要开源 |

**默认从 MVP 起步。scope 超出 MVP 时升级到 Full。**

---

## 工作流 —— 如何运行这个 skill

### Step 1：定模板深度
问用户："这是新独立产品（Full）还是已有产品的子功能（MVP）？"

### Step 2：复制模板
```bash
mkdir -p docs/sdd
cp .cursor/skills/ai-agent-sdd/templates/sdd-template-mvp.md docs/sdd/<product-slug>-sdd.md
# 或者 sdd-template-full.md
```

### Step 3：按顺序填，不准跳

模板强制顺序：

1. 第 6 节（功能需求）必须在 1-5 节填完后才能填
2. 第 9 节（Agent 工作流）必须在第 8 节（系统架构）填完后才能填
3. 第 19 节（验收标准）必须在 6-7 节（FR/NFR）填完后才能填

跳节填正是 vibe-coded 产品失败的原因。

### Step 4：编码前先 sign-off

SDD 填完后：
- 给一个 stakeholder（顾问 / co-founder / 有 PM 背景的朋友）看 —— 拿到 1-2 个尖锐问题
- 50%+ 的 FR 模糊 → 退回 refine
- 验收标准没法测 → 退回

通过后才开始编码。

### Step 5：把 SDD 当 living doc

- 改变行为的 PR 必须更新对应的 SDD 节
- 每个阶段结束（MVP → V1 → V2），bump 版本 + 加 changelog
- SDD 与代码分歧超过 2 节 → 安排 30 分钟同步会

---

## 节清单（Full 模板 · 23 节）

| # | 节 | 必填? | 回答什么 |
|---|---|---|---|
| 0 | Doc Metadata | ✅ | version / owner / status / last_updated / reviewers |
| 1 | TL;DR | ✅ | 3 句话电梯演讲 |
| 2 | Problem & Goals | ✅ | 哪里坏了 / 想达成什么 / 不打算尝试什么 |
| 3 | Success Metrics | ✅ | 主指标 + 护栏指标 + 目标值 |
| 4 | Personas | ✅ | 主 + 次用户角色 |
| 5 | User Journeys | ✅ | 2-3 条核心叙事流 |
| 6 | Functional Requirements | ✅ | FR-1 / FR-2 ... 含 ID / 优先级 / 验收 |
| 7 | Non-Functional Requirements | 🟡 | 延迟 / 吞吐 / 准确率 / 成本上限 |
| 8 | System Architecture | ✅ | 顶层图 + 组件清单 |
| 9 | LLM Strategy | ✅ (AI) | 模型选择 / fallback 链 / prompt 文件位置 |
| 10 | Agent Workflow | ✅ (AI) | 状态机 / DAG of steps |
| 11 | Tools / Function Calls | ✅ (AI) | agent 可调工具列表 |
| 12 | Memory Strategy | 🟡 (AI) | 无 / 短期 / 长期 |
| 13 | Human-in-the-Loop | 🟡 (AI) | 人工介入点 |
| 14 | Evaluation Framework | ✅ (AI) | golden set / 评估节奏 / 回归检查 |
| 15 | Data Model | ✅ | 实体 / 关系 / schema 草图 |
| 16 | API Design | ✅ | 接口表 |
| 17 | UI / Page Structure | 🟡 | 线框 / 路由图 |
| 18 | Tech Stack & Rationale | 🟡 | 每个技术选择的理由 |
| 19 | Deployment Topology | 🟡 | 每个组件运行在哪 |
| 20 | Observability | 🟡 | 指标 / 日志 / trace / 告警 |
| 21 | Cost Model | 🟡 | LLM token / 基础设施 / 第三方 API |
| 22 | Security & Privacy | ✅ | 鉴权 / 数据处理 / secrets |
| 23 | Failure Modes | ✅ | 幻觉 / 死循环 / 下游失败 |
| 24 | Acceptance Criteria | ✅ | 可测可验证 |
| 25 | Phased Delivery | 🟡 | MVP → V1 → V2 |
| 26 | Open Questions & Risks | 🟡 | 未解决的问题 |
| 27 | Glossary | ⚪ | 领域术语 |
| 28 | Changelog | ⚪ | v0.1 / v0.2 ... |

✅ = 必填 · 🟡 = 推荐 · ⚪ = 可选 · (AI) = AI 特有

> MVP 模板（`sdd-template-mvp.md`）只保留 ✅ 行 + 把 9-14 节合并为单一"AI 行为"节，共 12 节。

---

## 反模式（拒绝填这种内容）

| 反模式 | 为什么害死 SDD |
|---|---|
| "指标后面再加" | 没法衡量成功 = 没法上线 |
| "Agent 自己会想办法" | LLM 行为必须被指定，不是被祈祷 |
| "验收标准：能正常工作" | 不可测 = 不会被测 = 上线后静默失败 |
| "我们会优雅处理错误" | 列出真实失败模式；"优雅" 是空话 |
| 抄全部 section 标题但内容留空 | 空的 section 比没有 section 更糟 |
| 在代码写完之后才写 SDD | 文档失去意义 —— 它从"设计"沦为"事后说明" |

---

## 与其他 skill 配对

- **SDD 之前**：`pm-feature-spec` 写更广义的 PRD；`persona-research` 做用户调研
- **SDD 之后**：`growth-experiment-template` 设计上线实验；`daily-review-update` 跟踪执行
- **实现阶段**：跟 Cursor / Claude Code 跑 vibe-coding session，**把 SDD 作为系统 prompt 上下文** —— "读 docs/sdd/<product>.md，按 section 顺序实现"

---

## 产出结构

跑完这个 skill 后，工作区应包含：

```
docs/sdd/
└── <product-slug>-sdd.md          # 填好的 SDD
```

如果产品同时有 PRD（来自 `pm-feature-spec`）：

```
docs/
├── prd/<product-slug>.md          # 是什么 & 为什么
├── sdd/<product-slug>-sdd.md      # 怎么做 & 边界
└── eval/<product-slug>-golden.json # 评估集（被 SDD §14 引用）
```

---

## 战略说明

一份好 SDD 是**清晰度的强制函数**。AI 产品的失败大多不是"代码烂"，是"不知道在建什么"。填完 12-section MVP 模板可以在写任何代码之前catch ~80% 的此类失败。

把 SDD 当成"用最低成本发现自己在做错事"的工具。
