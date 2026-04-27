<h1 align="center">X-Studio</h1>
<h3 align="center">面向 AI agent 时代的增长运营实验室。</h3>

<p align="center">
  <em>把跑通过的增长系统沉淀下来 —— 人能审计，agent 能执行。</em>
</p>

<p align="center">
  <a href="./README.md">English</a> ·
  <a href="./README.zh.md">中文</a> ·
  <a href="./README.ko.md">한국어</a>
</p>

<p align="center">
  <a href="https://github.com/Celina-create/X-Studio/stargazers"><img src="https://img.shields.io/github/stars/Celina-create/X-Studio?style=flat-square&logo=github&label=stars&color=181717" alt="Stars"></a>
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-black?style=flat-square" alt="License"></a>
  <img src="https://img.shields.io/badge/skills-8-black?style=flat-square" alt="Skills">
  <img src="https://img.shields.io/badge/playbooks-1-black?style=flat-square" alt="Playbooks">
</p>

---

## 立场

> **每一种增长打法都有半衰期。**

上一个季度还能跑的招式，这个季度就被风控、被同行、被算法迭代掉。冷邮件 → 推特私信 → GitHub Issue；博客 → 长推 → AI 原生格式；候补名单 → 竞品挖角。**表层的战术越来越容易，底层的手艺却越来越难。**

X-Studio **沉淀的是穿越半衰期之后还能用的系统**。每一个文件夹都是真实跑过的方法；每一个 skill 都写得让 AI agent 能直接执行 —— 同时让人能在按下"运行"之前读懂它。

这里**不是教程**，**也不是博客**，是一张 **bench（操作台）**——把工作的现场打开。

---

## 目录结构

| 文件夹 | 内容 |
|---|---|
| [`skills/`](./skills) | 原子化、agent 可执行的增长动作单元——挂进 Cursor / Claude Code / Codex |
| [`playbooks/`](./playbooks) | 叙事性 SOP——多个 skill 如何串成一次完整的 campaign |
| [`templates/`](./templates) | 即用素材——冷邮件 / 落地页 / Issue 表单 |
| [`case-studies/`](./case-studies) | 真实战役——方法、数据、什么有效、什么不行 |

---

## Skill 列表（v0.1 · 现役 8 个）

每个 skill 都已经在真实 campaign 中跑过至少一次，才进入仓库。

| # | Skill | 一句话解释 |
|---|---|---|
| 1 | [`stargazer-email-scraper`](./skills/stargazer-email-scraper) | 抓取**竞品 GitHub 仓库 star 用户**的公开邮箱（命中率 15–17%） |
| 2 | [`competitive-intel-mining`](./skills/competitive-intel-mining) | 在**竞品的公开社区**（GitHub / Discord / Reddit）挖出正在踩痛点的高意向用户 |
| 3 | [`seed-user-pool-stratification`](./skills/seed-user-pool-stratification) | 把种子用户池**按 ROI 分层**，决定先发谁、最后发谁 |
| 4 | [`personalized-cold-outreach`](./skills/personalized-cold-outreach) | 给一份种子 CSV，**批量生成 1 对 1 个性化冷邮件**——开头三句必须只对该用户成立 |
| 5 | [`landing-to-issue-funnel`](./skills/landing-to-issue-funnel) | 把**冷邮件 → 落地页 → 预填好的 GitHub Issue** 串成捕获漏斗，每一次反馈都成为公开资产 |
| 6 | [`content-repurpose-engine`](./skills/content-repurpose-engine) | 一条核心洞察 → **同时输出中英 thread / 长文 / 视频钩子**，单点投入多平台分发 |
| 7 | [`growth-experiment-template`](./skills/growth-experiment-template) | 结构化的**增长实验文档模板**——假设、指标、决策规则、回顾 |
| 8 | [`reddit-account-warmup`](./skills/reddit-account-warmup) | **Reddit 账号 6 周养成 SOP**——发帖 60 秒清单、karma 涨分公式、删帖恢复 SOP |

**路线图预告**：`linkedin-content-warmup`、`x-account-warmup`、`discord-community-seeding`、`outbound-followup-sequencer`（每条等真实跑过一次再上）。

---

## 怎么用

### 作为 AI agent 的 skill 集

```bash
git clone https://github.com/Celina-create/X-Studio.git ~/x-studio

# 整体挂载
ln -s ~/x-studio/skills ~/.claude/skills/x-studio

# 或单独挂载某个 skill
ln -s ~/x-studio/skills/competitive-intel-mining ~/.cursor/skills/competitive-intel-mining
```

在 chat 中按名字调用：

> *"用 `competitive-intel-mining` 跑一下这个竞品的 GitHub issues。"*  
> *"运行 `reddit-account-warmup`，告诉我现在该是 Week 几。"*

### 作为人类的参考

仓库里没有任何"版权保护"——拿走对你有用的部分。给个 star 我会很感谢，不强求。

---

## 方法论

四条原则，决定什么内容能进 X-Studio。

1. **必须真实跑过一次。** 没在 campaign 里验证过的方法，不会被收录——再听起来正确的也不行。
2. **优先 ROI，不优先体量。** 任何"名单"的后 50% 通常都是噪音——发出去之前先砍掉。
3. **Agent 也是 operator。** Skill 写法保证 agent 能从头跑到尾——交接点显式、状态显式、产出显式。
4. **方法公开，神秘感不公开。** 公开方法 / 公开推理 / 公开限制。只有客户数据 / 用户隐私会被脱敏。

---

## 当前状态

| | 现在 |
|---|---|
| **已发布 skill** | 8 |
| **Playbook** | 1（可组合的 "竞品 → 种子" 管线） |
| **Case study** | 0（第一篇制作中） |
| **License** | MIT |

仓库以小步、高频的节奏更新——新的 skill 一旦跑通就会发上来。**Watch 仓库**就能第一时间看到。

---

## 维护者

由 **Celina**（[`@Celina-create`](https://github.com/Celina-create)）维护——一个把"冷启动 / 内容 / 种子用户"看作可工程化系统而不是"凭感觉"的增长 operator。

如果你想合作、定制 skill、或者只是想交换笔记：

- 📩 [`suokata@naver.com`](mailto:suokata@naver.com)
- 🐛 [开 Issue](https://github.com/Celina-create/X-Studio/issues/new/choose)

---

## 协议

MIT © 2026 Celina · 使用、Fork、二创随意，方便的时候带个 attribution。

---

<p align="center">
  <sub>增长是手艺。这里是操作台。</sub>
</p>
