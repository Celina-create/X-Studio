# 竞品 UX 调研框架 SOP v1

**日期**: 2026-04-17
**版本**: v1.3.1 · 双轴建模 + 12 层渠道全展开
**状态**: ✅ 可复用
**适用**: 对任何早期 / 中期竞品做 "用户痛点 × 种子用户挖掘 × 对比定位" 调研
**首次应用**: [Paperclip 用户痛点调研](./2026-04-17-paperclip-deep-dive.md)（v1.2 结构，本版本不做 backfill） · [Multica 深度调研](./2026-04-17-multica-deep-dive.md)（v1.3 首用）
**下次适用**: S 级剩余 5 家（Sila / CoChat / Agent United / Moxt / Meco / Dust）+ 跨层 A 档 3 家（Slack / Mattermost / Devin）

---

## 0 · 这份 SOP 要解决什么问题

传统竞品调研易陷入 3 个陷阱:

| 陷阱 | 症状 | SOP 如何避开 |
|---|---|---|
| **只看官方材料** | Landing page / 宣传视频 / 融资稿主导认知 | 12 层渠道强制覆盖用户侧 |
| **只看自己视角** | 盯着对手功能列表做比对 | 12 维度痛点框架强制切换到用户感受视角 |
| **看完没行动** | 报告写完进文件柜 | 强制产出 "Tier 1 可触达清单 + 触达模板 + 监测仪表盘" |

**核心目标**: 每次调研输出 **可执行的种子用户名单 + 产品差异化方向 + 持续监测配置**，而不只是分析文章。

---

## 1 · 框架总览

```
┌─────────────────────────────────────────────────────────────────────┐
│  竞品 UX 调研 = 痛点双轴 (谁 × 痛什么) × 主题维度 × 信号分层        │
│               × 12 层渠道 × 多对手对比 × 行动落地                   │
└─────────────────────────────────────────────────────────────────────┘

  痛点双轴(M1×M2)   主题维度(M3-M9)   信号分层(S1-S3)
       │                │                  │
       └────────┬───────┴──────┬───────────┘
                │              │
                ▼              ▼
         12 层渠道矩阵    多对手对比网格
                │              │
                └──────┬───────┘
                       ▼
          痛点全景报告 + T1 可触达清单 + 触达模板
                       │
                       ▼
               持续监测仪表盘 + 产品行动项
```

### 核心结构 · 11 主维度 + 3 信号维度 = 14 维度框架

| 类别 | # | 名称 | 用途 |
|---|---|---|---|
| **双轴** | M1 | 用户分层痛点（**谁在痛**） | 横轴 |
| | M2 | 痛点类型（**痛什么**） | 纵轴 |
| **主题** | M3 | 证据来源（**从哪看到**） | 方法论 |
| | M4 | 商业模式反推（卖给谁、怎么卖） | 定位 |
| | M5 | 一体两面（痛点即优势） | 辩证思考 |
| | M6 | 首次体验 / Onboarding | 早期产品关键 |
| | M7 | 期望 vs 现实落差（Hype Gap） | 口碑方向 |
| | M8 | 流失 / 迁移信号 | 用户流向 |
| | M9 | Feature Request 高频未满足 | 差异化机会地图 |
| **信号** | S1 | 用户愤怒度分层 | 情绪信号 → 种子用户 |
| | S2 | 公开求替代行为 | 行为信号 → 种子用户 |
| | S3 ⭐ | **用户自救行为**（v1.3 保留） | 最强转化信号 |

> **v1.3 核心升级**: 之前 v1.0-v1.2 是**单轴建模**（只有"谁在痛"M1-M8 的分层），v1.3 引入**双轴建模**（M1 "谁" × M2 "痛什么"），并新增 M6 / M7 / M9 三个独立主题维度。原 M10 "用户自救信号" 迁移到 S 系列作为 **S3** 保留（这是行为信号而非痛点类型，更适合信号系列）。

---

## 2 · 痛点双轴 + 主题维度 + 信号分层（核心 · v1.3 · 14 维度）

> **设计原则**: 双轴建模（M1 × M2）确保不漏核心主干，主题维度（M3-M9）承载特定分析任务，信号系列（S1-S3）直接导出种子用户清单。三组维度**功能不同不可互换**。

---

### 轴 1 · M1 · 用户分层痛点（谁在痛）

**问题**: 谁在痛？
**用途**: 横轴 —— 与 M2 交叉形成痛点矩阵

| 用户层 | 定义 | 典型信号词 |
|---|---|---|
| **管理员 / 运行者** | 装 / 跑 / 维护产品的人 | *"install fails / deployment / crash / no auto backup"* |
| **终端用户** | 日常使用产品的人 | *"confusing / slow / broken / I don't understand"* |
| **开发者 / 集成方** | 扩展 / 接入 / 贡献代码的人 | *"pnpm install fails / docs missing / API unclear / 'AI DISASTER'"* |
| **商业版客户** | 付钱买 SaaS / 云 / 企业版的人 | *"pricing confusing / downtime / data loss / SLA"* |
| **社区用户** | 开源 / 免费 / 论坛用户 | *"unclear paid vs free / maintainer unresponsive / abandoned"* |
| **合规客户** | 政府 / 国防 / 金融 / 医疗 | *"SOC 2 / FedRAMP / GDPR / HIPAA / audit log"* |

---

### 轴 2 · M2 · 痛点类型（痛什么）⭐ v1.3 新增独立轴

**问题**: 痛什么？
**用途**: 纵轴 —— 与 M1 交叉形成痛点矩阵，使得横切查询（"定价痛集中在哪类用户"）变为一步操作

| 痛点类型 | 定义 | 典型信号词 |
|---|---|---|
| **运维** | 部署 / 监控 / 稳定性 / 备份 | *"8 hours setup / no HA / data loss / manual backup"* |
| **升级** | 版本迁移 / breaking change | *"upgrade broke / migration painful / can't downgrade"* |
| **性能** | 速度 / 延迟 / 并发 | *"slow / timeout / laggy / won't scale"* |
| **移动端** | iOS / Android / 响应式 | *"no mobile app / mobile broken / tiny screen"* |
| **UI** | 界面 / 信息架构 / 可用性 | *"confusing UI / too many tabs / can't find X"* |
| **生态** | 集成 / 插件 / 扩展 | *"no Slack integration / plugin broken / ecosystem weak"* |
| **API** | 接口清晰度 / 稳定性 / 文档 | *"undocumented / breaking API / rate limited"* |
| **定价** | SKU 混乱 / 客单价 / 续费 | *"can't find pricing / 4 brands / what am I paying for"* |
| **AI 能力** | 模型智能度 / 幻觉 / 上下文 | *"hallucinates / forgets context / can't reason"* |
| **合规** | 认证 / 审计 / 数据驻留 | *"no SOC 2 / can't self-host in EU / audit gap"* |

**核心规则**:

- 每条痛点证据必须**同时标注** M1 (哪类用户) 和 M2 (哪种类型)
- 最终产出一张 M1 × M2 的 6×10 矩阵，可支持任意横切查询
- Paperclip 例子: `[管理员] × [运维]` = 8 小时自托管 / `[开发者] × [API]` = pnpm 装不起 / `[商业版客户] × [定价]` = 4 品牌并存

---

### M3 · 证据来源（从哪看到）

**问题**: 这条痛点信息是从哪获取的？
**用途**: 每条证据强制标注来源，保证可回溯 + 信源覆盖率可量化

| 来源类型 | 代表 |
|---|---|
| 代码托管 | GitHub Issues & Discussions / PR |
| 技术论坛 | Reddit / HN / Lobsters |
| 官方渠道 | 官方论坛 / Discord / Slack |
| 海外技术社区 | Dev.to / Medium / Substack / towardsAI |
| 评测聚合 | G2 / Capterra / TrustRadius / MrDelegate |
| 官方销售页 | Landing page 本身（自曝对比页） |
| ASO | App Store / Google Play review |
| 搜索 | Google `"产品" alternative / problem / disaster / vs` |

每条证据必须附**可回溯链接**。详见 [§3 12 层渠道矩阵](#3--12-层渠道矩阵证据来源) 的完整版。

---

### M4 · 商业模式反推（卖给谁、怎么卖）

**问题**: 这家的 SKU / 客户分层 / 漏斗长什么样？
**用途**: 揭示对手**目标客户的真实分层**（vs 对外话术），支持商业模式对比表

**反推要素**:

- **客户分层**: 国防 / Five Eyes / NATO / 企业 / SMB / Indie
- **SKU 切分**: OSS / VPS / 云 / 企业托管 / 定制
- **开源漏斗**: 免费 OSS → VPS → Cloud → Enterprise 的哪一段最粗
- **客单价区间**: $0 / $10-50 / $100-500 / $1k+
- **续费机制**: 月付 / 年付 / credits / 一次性买断

**Paperclip 例子**: 无合规 / 无国防 / Solo Founder 一层撑全盘 / OSS → VPS $12-48 → 云 $19-49 → 企业定制 · 4 品牌并存

---

### M5 · 一体两面（痛点和优势的辩证）

**问题**: 这个"痛点"反过来是否是"优势"？对谁是痛对谁是优？
**用途**: 避免把"中性属性"误判为"痛点" —— 为差异化决策提供辩证视角

**典型例子**:

| 一体两面属性 | 对 A 类用户 | 对 B 类用户 |
|---|---|---|
| Self-hosted | 运维负担 🔴 | 数据主权 🟢 |
| BYOAK（自带 Claude key）| 多一步配置 🟡 | 成本透明 🟢 |
| OSS（MIT）| 无 SLA 保障 🟡 | 可 fork 可审计 🟢 |
| Autonomous（无人值守）| 烧钱风险 🔴 | 解放人力 🟢 |

**使用姿态**: 每条 M1 × M2 痛点都要问一次 *"这对谁是优势？"* —— 答案是"对 Slark ICP 也是优势"就不要把它做成差异化宣传点。

---

### M6 · 首次体验 / Onboarding（装得上 / 上手难度）⭐ v1.3 独立

**问题**: 从点开官网到第一个"Aha 时刻"要多久？
**用途**: 对早期产品（3-12 个月）这是**最强痛点**，单独成轴避免被塞进"运维"里看不见

**标准追问清单**:

| 问题 | 证据来源 | 标尺 |
|---|---|---|
| 从 Download / Sign up 到第一个跑起来的动作要多久？ | 官方 docs + 用户评测 | <5min / <1h / <1d / 1-7d / 7d+ |
| 装到一半最常在哪里卡？ | GitHub Issues / Dev.to | 装依赖 / 配置 / 填 key / 首次运行 |
| 首跑成功后做对第一件"有用的事"多久？ | 用户推特 / Reddit | Aha-time 秒表 |
| 有没有"一键启动"（Desktop app / Docker）？ | 官方入口页 | 有 / 有但坑多 / 无 |
| 新用户撤退的公开吐槽 top 3 | Issue / Reddit / Dev.to | 放 Paperclip §2.1 那种位置 |

**Paperclip 例子**: 官方自己说 *"8+ hours best case"*，社区说 *"AI DISASTER pnpm 装不起"* → M6 是 Paperclip 最大的 M 维度痛点。

---

### M7 · 期望 vs 现实落差（Hype Gap）⭐ v1.3 新增

**问题**: 官方 / KOL 承诺的是什么，用户实际体验到的是什么？
**用途**: **Hype 落差决定口碑传播方向**。早期产品用户是被 hype 带进来的，落差大 = 反向口碑激增 = 最强情绪信号

**三层追问**:

1. **官方话术**（Landing + founder 推特 + 融资稿的核心 slogan）
2. **KOL 评测**（Dev.to / YouTube / Medium 的"我用了一周"类评测）
3. **用户抱怨**（GitHub Issues / Reddit / 愤怒推文）

**落差分析模板**:

| 官方承诺 | KOL 背书 | 用户实际体验 | 落差分值 (1-5) |
|---|---|---|---|
| "Zero-human company" | *"autonomous dream"* | $12K 烧钱 + agentic panic | 5 🔴 |
| *"One-click deploy"* | *"easy install"* | 8+ 小时 + pnpm 崩 | 5 🔴 |

**Paperclip 例子**: Kunal *"proof of concept wearing a product's clothing"* 是典型 Hype Gap 语言。M7 命中即 Hype Gap 信号强。

**传播方向判断**:

- Hype Gap < 2 → 用户口碑会自然发酵，对手是正向增长曲线
- Hype Gap 3-4 → 用户会"又爱又恨"，对手处于 Peak of Inflated Expectations，**是种子用户触达的最佳窗口**
- Hype Gap = 5 → 用户会公开求替代，对手进入幻灭期，**Slark 狙击窗口已开**

---

### M8 · 流失 / 迁移信号（进和出的方向）

**问题**: 用户从哪儿来，要去哪儿？
**用途**: **用户流向 = 种子用户定位最强指标**，M8 命中即 Tier 1 候选

**标准扫描语料**:

| 信号句式 | 含义 | 触达姿态 |
|---|---|---|
| *"Migrating from X to \[target\]"* | X → 对手 流入 | 监测，看 X 缺什么 |
| *"Went back to X"* | 对手 → X 退回 | **Slark 继承机会** |
| *"Switched to Y from \[target\]"* | 对手 → Y 流出 | Y 是竞争者或 Slark 前身 |
| *"Tried \[target\] but..."* | 试了就走 | 流失信号最强 |
| *"Looking for alternative to \[target\]"* | 公开求替代 | 见 S2 |

**输出 M8 时要画一张"流向图"**: 箭头指向 + 粗细代表声量，最粗出入流 = Slark 切入口。

---

### M9 · Feature Request 高频未满足 ⭐ v1.3 新增

**问题**: 用户**主动提出但官方拒绝或拖延**的需求是什么？
**用途**: **这是 Slark 的差异化机会地图** —— 官方不做但用户要的，就是 Slark 可以率先做的

**核心差异 vs M9（原 v1.2）"商业模式"**:

- 原 M9 关注的是**定价 / SKU 清晰度**（商业模式层） → 迁到 M2 "定价" 类型 + M4 "商业模式反推" 主题维度
- **新 M9** 关注的是**功能层** —— 用户呼声高但官方不做的 feature

**扫描来源**:

- GitHub Issues 标签 `enhancement` / `feature-request` / `discussion`
- 按 reactions (👍) 排序 top 20
- 官方回复状态: `wontfix` / 无回复 / `roadmap` / `help-wanted`
- Discord / Reddit 高频呼声

**输出模板**:

| 需求 | 声量 | 官方状态 | Slark 评估 |
|---|---|---|---|
| Team workspace | 👍 234 | wontfix | 🟢 Day-1 做 |
| iOS app | 👍 89 | backlog | 🟡 看 ICP |
| SSO / SAML | 👍 45 | Enterprise only | 🟢 OSS 版内置 |

---

### S 系列 · 种子用户信号（3 个 · 直接导出触达清单）

| # | 维度 | 问题 | 产出 |
|---|---|---|---|
| **S1** | 用户愤怒度分层 | 用户情绪强度 | 🔴 愤怒 / 🟠 失望 / 🟡 怀疑 / 🟢 追问 / ⚪ 成功 |
| **S2** | 公开求替代行为 | 用户在明处找替代 | *"Looking for alternative to X"* 类帖子 |
| **S3** ⭐ | **用户自救行为**（v1.2 原 M10 迁入） | 用户不再抱怨，直接写补丁绕过 | *"my fork / workaround script / custom plugin"* |

**种子用户三档优先级**（v1.3 明确）:

```
S3 自救者     最高 · 最懂痛点 + 最有能力迁移 + 最可能成 champion
    ↓
S1 🔴 愤怒    次高 · 情绪强烈 + 已公开发声 + 迁移阻力小
    ↓
S2 公开求替代  高   · 意图明确 + 已在比较，但可能多家并比
    ↓
S1 🟠 失望    中   · 抱怨中 + 还没走，可维系
    ↓
S1 🟡🟢 怀疑/追问  低   · 中立 + 需要长期种草
```

→ **S3 / S1 🔴 命中即 flag 为 Tier 1 优先触达**。触达模板见 [§7](#7--触达模板库通用)。

---

## 3 · 12 层渠道矩阵（证据来源）· v1.3 展开全子渠道

> **v1.3 升级**: 原版每层只列 1-2 子渠道，实际执行时覆盖率判断模糊。v1.3 把每层展开为完整子渠道清单 + 抓取要点 + 效率评级，可直接 1:1 搭自动化。**⭐ 标记的是信号密度最高的重点层**。

### Layer 1 · 代码托管（开发者原生）

| 子渠道 | 抓什么 | 效率 | 工具 / 搜法 |
|---|---|---|---|
| **GitHub Issues** | bug / feature request / 用户愤怒度 | 🟢 高 | `gh api repos/X/Y/issues --paginate --jq '... reactions ...'` |
| **GitHub Discussions** | 半结构化用户对话 | 🟡 中 | `gh api repos/X/Y/discussions` |
| **GitHub Pull Requests** | 社区贡献者画像 | 🟡 中 | `gh api repos/X/Y/pulls --state all` |
| **GitHub Stars History** | 增长斜率 + 爆发时点 | 🟢 高 | [star-history.com](https://star-history.com) |
| **GitHub Trending** | 本周新爆发项目 | 🟢 高 | [github.com/trending](https://github.com/trending) + Language / Date filter |
| **npm / PyPI / Docker Hub 下载量** | 真实使用量信号（star 不能反映） | 🟢 高 | [npm-stat.com](https://npm-stat.com) / [pypistats.org](https://pypistats.org) / Docker Hub pull count |

### Layer 2 · 技术社区论坛（中等技术浓度）

| 子渠道 | 抓什么 | 备注 |
|---|---|---|
| **Hacker News** | Launch 帖 + 评论 + "Ask HN alternatives" | search with [HN Algolia](https://hn.algolia.com) |
| **Reddit** (`r/selfhosted` / `r/MachineLearning` / `r/LocalLLaMA` / `r/programming` + **产品官方 subreddit**) | 用户深度吐槽 | 每月扫一次 |
| **Dev.to** | "One Open Source Project a Day" 等系列评测 | Medevel 等博主常发 |
| **Hacker Noon** | 中等长文评测 | 搜 product name |
| **Lobste.rs** | 小众技术社区（lobste.rs） | 比 HN 深但 niche |
| **Stack Overflow tag** | bug/how-to 问题数量 = 真实使用量 | 搜 tag trend |

### Layer 3 · 长内容 / Newsletter ⭐（用户给的核心补充）

> **为什么⭐**: 策展人视角比单个用户视角更前瞻，且 **newsletter 提及 = 心智突破到 mainstream 的锚点信号**。

| 子渠道 | 抓什么 | 特别之处 |
|---|---|---|
| **Substack** | AI-first 独立分析师（Latent Space / Stratechery / Simon Willison / Interconnects） | curator 视角比用户视角更前瞻 |
| **Medium** | 长篇教程 / 用户体验分享 / "X vs Y" 对比文 | 搜 `"product name"` Medium 原生搜索 |
| **TLDR.tech** | 日报订阅，产品进入 TLDR = 已到 mainstream 信号 | [tldr.tech/ai](https://tldr.tech/ai) 专门盯 |
| **The Neuron Daily** | AI 日报 curator | [theneurondaily.com](https://theneurondaily.com) |
| **Alphasignal** | 产品上线快讯 curator（**Multica 就是被它们捧的**） | Threads + newsletter 双端 |
| **Ben's Bites / AI Breakfast** | AI 独立 newsletter 生态 | 订阅 10+ 家覆盖大部分信号 |
| **个人技术博客** | Google `"product name" review site:blog.*` | 长文评测最真实 |
| **YouTube 评测** | 产品 demo / unboxing / 踩坑视频 | 搜 `product name + "review" / "tutorial"` |

### Layer 4 · 社交媒体

| 子渠道 | 抓什么 |
|---|---|
| **Twitter / X** | founder 公开对话 + 用户日常吐槽 + meme 化传播 |
| **LinkedIn** | 企业买家视角 + founder 声明 + 公司招聘动态 |
| **Threads** | 崛起的 AI curator 二阵地（Alphasignal 等大号迁移到 Threads） |
| **Bluesky / Mastodon** | niche 技术圈早期迁移用户 |

### Layer 5 · 产品评测聚合

| 子渠道 | 抓什么 |
|---|---|
| **Product Hunt** | 上线当日评论 + maker Q&A + 竞品关联推荐 |
| **G2 / Capterra / TrustRadius** | 企业用户结构化评论 |
| **Gartner Peer Insights** | 企业 IT 决策者评论 |
| **[AlternativeTo.net](https://alternativeto.net)** ⭐ | "X 的替代品"列表 = **高信号竞品地图**（"looking for alternative to X" 等效产出） |
| **Popular AI Tools / MrDelegate** | AI 产品专门评测站 |
| **SaaSworthy / Futurepedia** | AI SaaS 聚合 |

### Layer 6 · 搜索引擎（Google 直接）⭐

> **为什么⭐**: Google Alerts 是 **0 维护订阅流**，配合以下关键词模式 = 异常信号自动送到邮箱。

| 搜索模式 | 抓什么 |
|---|---|
| `"product name" + review` | 用户评测 |
| `"product name" + "pros and cons"` | 结构化利弊讨论 |
| `"product name" + "complaints" / "problems"` | 负面信号集中 |
| `"product name" + "vs X"` | 对比搜索（用户决策期） |
| `"product name" + "alternative"` | 流失信号 |
| `"product name" + site:reddit.com` | 挖 Reddit 深层讨论 |
| **Google Trends** ([trends.google.com](https://trends.google.com)) | 搜索热度曲线（宏观信号） |
| **Google Alerts** | 订阅关键词自动推送（0 维护） |

### Layer 7 · 应用商店（ASO 信号）⭐

> **为什么⭐**: 评分 + 评论区抱怨对有移动 / 桌面端的对手是**最密集的用户真话池**（比 GitHub issue 门槛更低）。

| 子渠道 | 抓什么 |
|---|---|
| **Apple App Store** | iOS app rating + 评论（**Sila 已上 iOS 必看**） |
| **Google Play** | Android 同上 |
| **Microsoft Store / Mac App Store** | 桌面端评分 |
| **Chrome Web Store / Edge Add-ons** | 浏览器扩展评分 |
| **Setapp** | macOS 生态评价 |
| **Sensor Tower / App Annie** | 下载量 + 评分趋势（需付费或 free tier） |

### Layer 8 · 问答平台

| 子渠道 | 抓什么 |
|---|---|
| **Stack Overflow** | how-to 问题 = 真实使用痛点 |
| **Quora** | 企业买家 / 非技术用户视角 |
| **Reddit** (`r/AskProgramming` / `r/AskTech`) | 非产品专属的跨产品比较 |

### Layer 9 · 招聘 / 内部信号 ⭐（被严重低估）

> **为什么⭐**: 招聘 JD 是**未来 3-6 个月产品路线的公开剧透**，但 95% 竞品调研会跳过这层。

| 子渠道 | 抓什么 |
|---|---|
| **LinkedIn Jobs** | 产品招聘职位 = 技术路线信号（**招 iOS 工程师 = 要 ship iOS**） |
| **Wellfound (AngelList)** | 早期创业公司招聘（YC 类） |
| **Levels.fyi** | 团队规模 + 薪资（反推融资状况） |
| **Glassdoor** | 离职员工评价（真实文化和战略信号） |
| **X 公司名 + "headcount"** | LinkedIn 插件可看 headcount 增长曲线 |

### Layer 10 · 财务 / 融资 / 公开披露

| 子渠道 | 抓什么 |
|---|---|
| **Crunchbase** | 融资轮次 + 投资人 |
| **PitchBook** | 深度财务数据（付费） |
| **YC Launch pages** ([ycombinator.com/launches](https://www.ycombinator.com/launches)) | YC batch 产品详情 |
| **Tracxn / CB Insights** | 品类地图 + 融资趋势 |

### Layer 11 · 产品原生社区

| 子渠道 | 抓什么 |
|---|---|
| **Discord**（产品官方服务器） | 实时用户对话 + 求助帖 = **最深痛点信号** |
| **Slack 社区** | 类似 Discord |
| **Matrix / Telegram group** | niche 技术圈深讨论 |
| **官方论坛** (e.g. [forum.mattermost.com](https://forum.mattermost.com)) | 结构化求助 + 长期存档 |

### Layer 12 · 聚合 / awesome lists

| 子渠道 | 抓什么 |
|---|---|
| **GitHub awesome-lists** (`awesome-ai-agents` / `awesome-agents`) | 品类产品地图 |
| **GitHub Trending "AI" topic** | 本周新玩家 |
| **Hugging Face Spaces** | AI demo 生态 |
| **[AlternativeTo.net](https://alternativeto.net) "X alternatives"** | 竞品发现入口 |

---

### 覆盖率标准（v1.3 细化）

| 产品阶段 | 必达 Layer | 子渠道密度要求 |
|---|---|---|
| **早期产品** (<6 个月) | 至少 **8/12** 层 · 必达 L1/L2/L3/L6/L11 | 每层至少命中 2 个子渠道有效信号 |
| **中期产品** (6 个月-2 年) | 至少 **10/12** 层 · 必达 L1/L2/L3/L5/L6/L7/L11 | 每层至少 3 个子渠道 |
| **成熟产品** (2 年+) | **12/12** 层 | L9 招聘信号 + L10 财务必达 |

### 子渠道命中判断规则（v1.3 新增）

- 一个**子渠道** = 抓到 ≥ 2 条有效证据（引述 / Issue / 评论 / 搜索结果）才算"命中"
- 一个 **Layer** = 至少 1 个子渠道命中才算"覆盖"
- 不允许**跳过 L1 / L3 / L11**（代码托管 / newsletter / 原生社区是种子用户密度最高的三层）

### 自动化搭建建议（v1.3 新增）

**低成本自动化组合（每家对手一次性配置 30 分钟）**:

```
L1  GitHub Releases RSS + Issues Feedly watch + star-history 周报
L3  Substack / TLDR / Alphasignal 订阅（邮箱标签归档）
L4  Twitter list + Threads follow（每日刷 10 分钟）
L6  Google Alerts（6 条搜索模式全配）
L11 Discord / 官方论坛潜水（每周 Friday 扫）
```

**中成本自动化（有工程支持时）**:

```
L1  GitHub Issues API → Slack bot 聚合推送（按 reactions 排序）
L5  AlternativeTo scraping → weekly digest
L6  SerpApi → 负面关键词自动监测
L7  App Store Connect API / AppFigures 日报
L9  LinkedIn Scraper（按 JD 关键词 alerts）
```

---

## 4 · 多对手对比策略（v1.1 · 删除"单一对标"）

> ⚠️ **v1.0 弃用规则**: 原版只锚定一个非竞品（如 Mattermost）做对比，信息密度太低。
> **v1.1 新规则**: 所有对比表必须列出 **调研范围内所有同级竞品**，非竞品降级为"参照系"。

### 对比表通用结构

**推荐列数: 6-12 列**

```
| 维度          | 竞品 A | 竞品 B | 竞品 C | ... | 非竞品参照 |
|---------------|--------|--------|--------|-----|-----------|
| 痛点 1        | 🔴     | 🟡     | 🟢     |     | 🟢        |
| 痛点 2        | ...    | ...    | ...    |     | ...       |
```

### 对比表使用规则

1. **第一列是维度**，每行一个可观察指标（不是主观评价）
2. **每个竞品一列**，已知数据填实值，未知留"待调研"（**禁止虚构**）
3. **非竞品参照单独列在最右**（用斜体标注）
4. **至少每个维度标注一个"分化洞察"段落**，解释表格中的关键差异
5. **每次跑完一个新对手，回来补齐之前所有对比表的空白**（渐进累积）

### 对比表必备维度（至少 5 项）

| 必备维度 | 示例 |
|---|---|
| 核心架构 | IM / Kanban / Org Chart / Agent-as-Service |
| 定价模式 | OSS + SaaS / Subscription / Credits / Seat-based |
| 目标客户 | Solo / SMB / Enterprise / Regulated |
| 合规认证 | SOC 2 / FedRAMP / HIPAA / 无 |
| Mobile / Desktop | iOS / Android / Electron / Web only |
| 商业通路清晰度 | 单品牌 vs 多品牌分散 |

---

## 5 · 调研执行 Checklist（每个对手套一次）

### 阶段 1 · 立项（0.5 天）

- [ ] 确认对手在 S 级名单（refer `competitive-matrix.md`）
- [ ] 为对手建 folder: `clone/artifacts/research/YYYY-MM-DD-<对手名>-deep-dive.md`
- [ ] 为对手建监测文件: `growth space/monitoring/<对手名>-watch.md`

### 阶段 2 · 产品速览（0.5 天）

**必产出 · 放报告开头**:

- [ ] 产品定位（一句话 + 50 字以内描述）
- [ ] GitHub 数据（stars / contributors / 上线时间 / founder handle）
- [ ] 商业入口站点清单（所有已知域名）
- [ ] 受众用户类型（4 类画像 + 占比估算）
- [ ] **商业目标客户**一句话定性（不等于"受众"——看他们**卖给谁**）

### 阶段 3 · 证据收集（2-3 天）

按 12 层渠道覆盖:

- [ ] L1 GitHub Issues 按 reactions + comments 排序，取 top 20
- [ ] L2-L6 必达层全扫一遍，每层至少 5 条高信号
- [ ] L7-L12 按适用性补
- [ ] 建 **原始证据链** （附录 A 放所有链接 / 引述 / 截图）

### 阶段 4 · 痛点双轴映射（1-2 天 · v1.3 重写）

**Step 4.1 · 双轴矩阵填充（必做）**:

- [ ] 每条证据同时打 M1（谁）和 M2（痛什么）双标
- [ ] 输出 6×10 的 `M1 × M2` 热力矩阵（空 / 🟡 / 🟠 / 🔴）
- [ ] 识别 top 3 "交叉热格"（如 `[开发者] × [API]`），作为独立小节展开

**Step 4.2 · 主题维度调研（必做 M4-M9，共 6 维）**:

- [ ] M4 商业模式反推：客户分层 / SKU / 漏斗 / 客单价 / 续费 五要素全表
- [ ] M5 一体两面：至少 3 条"一体两面属性"（对 A 痛 vs 对 B 优）
- [ ] M6 Onboarding：Aha-time 秒表 + 装到一半卡点 top 3 + 撤退吐槽 top 3
- [ ] M7 Hype Gap：官方话术 vs KOL 评测 vs 用户实际三层对照表 + 落差分
- [ ] M8 流向图：画一张带箭头粗细的迁移图（从哪来 / 到哪去）
- [ ] M9 未满足需求：GitHub Issues 按 reactions 排 top 20，列官方状态

**Step 4.3 · 信号分层 + 种子用户（必做 S1-S3）**:

- [ ] S1 愤怒度 5 级：至少 🔴 愤怒 3 人 + 🟠 失望 3 人
- [ ] S2 公开求替代：至少 3 个 "looking for alternative to X" 帖
- [ ] **S3 用户自救行为**：扫所有 fork / workaround / custom plugin / PR —— 这是 **Tier 1 最优先**

**Step 4.4 · 孤儿素材检查 ⭐ v1.3 新增**:

- [ ] 扫一遍 §4-4.3 所有证据，如果有素材**装不进任何一个 M1-M9 / S1-S3 格子** →
  - (a) 先放"孤儿素材"临时 bucket
  - (b) 累积 3 条以上 → 提交 SOP 候选新维度（§11 版本历史记录）
  - (c) 单次出现可忽略，**避免为了一条素材改框架**

### 阶段 5 · 对比表填充（0.5 天）

- [ ] 至少对**商业模式** + **Self-hosting** 两大维度做横向对比
- [ ] 列出 8 家 S 级（或你划定范围内所有同级）
- [ ] 补齐至少 6 项必备对比维度
- [ ] 每张表下一段"分化洞察"文字

### 阶段 6 · 种子用户挖掘（1 天）

- [ ] S1 愤怒度分级: 至少标出 🔴 愤怒 + 🟠 失望 各 3 人
- [ ] S2 求替代信号: 标出至少 3 个公开求替代的贴 / 评
- [ ] **Tier 1 可触达清单**: P0 优先 5-10 人，附 GitHub / Twitter / LinkedIn handle
- [ ] 准备至少 2 条触达模板（针对技术痛点 + 针对装不上 2 类）

### 阶段 7 · 对新产品的运营行动指南（0.5 天）

- [ ] 5 条核心启示（必须包含 "避开 X 的陷阱" 句式）
- [ ] 种子用户挖掘 4 步动作（Week 1 / Week 2 / Month 1 / 长期）
- [ ] 持续监测配置（L1-L6 各配一个 RSS / Alert）
- [ ] 下一步动作清单（附责任人 + 时限）

### 阶段 8 · 沉淀与回流（0.5 天）

- [ ] 建精简 insight 文件: `clone/memory/ideas/YYYY-MM-DD-<对手>-research-insights.md`
- [ ] 更新 `clone/memory/facts/competitive.md`（如不存在则建）
- [ ] 更新 `growth space/competitive/competitive-matrix.md`（补档位 / 新痛点）
- [ ] 回写到本 SOP 的 "历次应用记录" 区（下面 §11）
- [ ] **孤儿素材归档** ⭐ v1.3：如 §4.4 有孤儿素材，提交 SOP 候选新维度

### 阶段 9 · 外部框架体检（可选 · 季度性）⭐ v1.3 新增

每季度对照 1 个外部成熟框架做一次体检，防止 SOP 闭环自嗨:

- [ ] 对照 **YC User Interview 清单**（The Mom Test）：看 S 系列种子用户问题是否还够锋利
- [ ] 对照 **JTBD (Jobs to be Done)**：看 M2 痛点类型是否遗漏"任务维度"
- [ ] 对照 **Kano Model**：看 M9 Feature Request 分级是否缺"兴奋 vs 基本"区分
- [ ] 对照 **PMF Survey (Rahul Vohra)**：看 S1 愤怒度是否还需要"如果明天产品消失"类问题
- [ ] 体检结论记录到 §11 版本历史，触发 v1.x+1 迭代

**总工时**: 单个对手 ~6-8 人日（不含 §9 体检）。并行可 2 人对 1 家，3-4 天完成。

---

## 6 · 输出标准结构（报告模板 · v1.3 按双轴重组）

新产品调研报告必须按以下 5 部分结构:

```
# <对手名> 用户痛点调研报告

**日期 / 方法 / 责任人 / 用途**

📇 产品速览
  - 产品定位
  - GitHub 数据
  - 开源 / 商业化入口
  - 受众用户类型（6 类画像 · 对齐 M1）

TL;DR · 5 句话 + M5 一体两面 (至少 3 条)

目录

第一部分 · 方法论
  - 渠道覆盖矩阵（12 层实际覆盖情况）
  - 对手在四层产品空间的定位（L1/L2/L3/L4）

第二部分 · 痛点双轴全景 (v1.3 核心变化)
  §2.0 · M1 × M2 热力矩阵 (6×10 矩阵)
  §2.1 · 双轴交叉 Top 3 热格 (最痛的三个格子展开)
  §2.2 · M1 分层视图 (从"谁"切)
    - 管理员 / 运行者
    - 终端用户
    - 开发者 / 集成方
    - 商业版客户
    - 社区用户
    - 合规客户
  §2.3 · M2 分类视图 (从"痛什么"切)
    - 运维 / 升级 / 性能 / 移动端 / UI / 生态 / API / 定价 / AI 能力 / 合规

第三部分 · 主题维度深度分析
  §3.1 · M4 商业模式反推 (含 8 家对比表)
  §3.2 · M5 一体两面辩证 (至少 3 属性)
  §3.3 · M6 Onboarding 痛点 (Aha-time + 撤退吐槽)
  §3.4 · M7 Hype Gap 落差表 + 传播方向判断
  §3.5 · M8 用户流向图 (进 / 出 / 箭头粗细)
  §3.6 · M9 Feature Request 未满足地图 (Top 20 + 官方状态)

第四部分 · 信号分层与种子用户 (导出 Tier 1 清单)
  §4.1 · S1 愤怒度 5 级
  §4.2 · S2 公开求替代行为
  §4.3 · S3 用户自救行为 ⭐ (最优先触达)
  §4.4 · Tier 1 可触达清单 (P0 + P1)
  §4.5 · 孤儿素材 (v1.3 · 如有)

第五部分 · 对新产品的运营行动指南 (SOP 化)
  §5.1 · 5 条核心启示 (含"避开 X 的陷阱"句式)
  §5.2 · 种子用户挖掘 4 步动作 (Week 1 / 2 / Month 1 / 长期)
  §5.3 · 持续监测仪表盘配置
  §5.4 · 下一步动作清单 (责任人 + 时限)

附录 A · 原始证据链 (每条 M1 × M2 打标)
附录 B · 触达模板库 (至少 3 种: 愤怒 / 装不上 / 自救)
附录 C · 下一步动作清单
附录 D · 8 家 S 级对比表 (核心架构 / 定价 / 目标客户 / 合规 / Mobile / Onboarding / Hype Gap)

Related (至少 5 条交叉引用)
```

### 章节内 M1 × M2 双标引用规范

每条痛点证据在报告中的标准标注格式:

```markdown
> *"pnpm install fails with native dependency errors on macOS"*
> — [Issue #342](url) · 👍 67
>
> **标签**: `M1 开发者` × `M2 API` · S1 🟠 失望 · S3 ✅ 有人写了 fork
```

→ 这种标注让后续任何 horizontal query（"所有 API 痛"或"所有开发者痛"）都能 grep 出来。

---

## 7 · 触达模板库（通用）

### 模板通用原则

1. **具体 Issue / 贴子 URL 必须引用**（证明你看了）
2. **不推产品** 在第一段（证明你不是 spammer）
3. **提供价值**（送 demo / 对比文 / 15 分钟咨询）
4. **低承诺 CTA**（"如果不合适，我发你一个 30 秒视频看看能不能帮到你"）

### 模板 A · 技术性 Issue 报告者（针对 M1-M3 愤怒者）

见 [Paperclip 报告附录 B 模板 1](./2026-04-17-paperclip-deep-dive.md#附录-b--t1-愤怒用户触达模板)

### 模板 B · 装不上 / 入门受挫（针对 M3 "AI DISASTER" 类）

见 [Paperclip 报告附录 B 模板 2](./2026-04-17-paperclip-deep-dive.md#附录-b--t1-愤怒用户触达模板)

### 模板 C · 独立评测者（针对 L3 长内容作者）

见 [Paperclip 报告附录 B 模板 3](./2026-04-17-paperclip-deep-dive.md#附录-b--t1-愤怒用户触达模板)

### 模板 D · 自救者 / PR 作者（M10 触发 · 新模板待验证）

```
Hey [Name],

Saw your [AADRs workaround / PR #xxx / fork] — you're solving
[对手名] the hard way. We're building [YourProduct] as the
version where [他们自救的那层] is native.

No pitch. If you tell me what you're running 5+ agents on and
what you wish just worked, I'll either:
  (a) Show you a 3-min demo if we solve it, or
  (b) Add it to our public roadmap with your name.

— [Name]
```

**触达时机规则**:

- 🔴 愤怒 / M10 自救用户 → **24-48 小时内**
- 🟠 失望 / 求替代 → **3-5 天内**
- 🟡 怀疑 / 中性 → **1-2 周内**（先潜水社区 1 周再出手）

---

## 8 · 持续监测仪表盘配置（通用）

每个 S 级对手建一个 `growth space/monitoring/<对手名>-watch.md`，包含:

```markdown
# <对手名> 监测清单

## RSS 源
- GitHub Releases: https://github.com/X/Y/releases.atom
- GitHub Issues: Feedly watch
- Reddit: r/<对手 sub> RSS
- 所有博客 / 文档站的 RSS

## Google Alerts
- "<对手>" + alternative
- "<对手>" + problem / disaster / fails
- "<对手>" + vs

## Twitter Search
- <对手> min_faves:5 -filter:replies
- 创始人 @handle 推文

## 每周 Review Checklist
- [ ] 新 Issue top 5 (by reactions)
- [ ] 新 Reddit 热贴
- [ ] 新评测 / 长文
- [ ] 融资 / 团队变动
- [ ] 对比表需要补齐的列

## 异常触发
任何 🔴 级愤怒帖 → 24 小时内触达
```

**集成到 dashboard 仓库** 的 "对手信号" Tab，脚本每周自动聚合，人工 Tuesday review。

---

## 9 · 跨层调研策略 · 精简模式（v1.2 新增）

> **背景**: 同品类 S 级竞品吃透后，需要从**相邻层（L1 入口 / L2 合规 / L3 runtime）**挑个别代表做轻量调研，用于预判用户迁移路径与漂移风险。这类对手不适合套完整 12 维度，应用**精简模式**。

### 四层产品空间定义

| 层 | 名称 | 定义 | 与 Slark ICP 的关系 | 代表产品 |
|---|---|---|---|---|
| **L1** | 入口层 · 通用团队 IM | 装机量心智占位 | ❌ 错位（通用企业，AI-first 只是一小块） | Slack / Teams / Discord / Lark |
| **L2** | 合规层 · 自托管安全 IM | 政府 / 国防 / 金融 | ❌ 错位（合规非 AI-first） | Mattermost / Rocket.Chat / Wickr / Wire |
| **L3** | 能力层 · Agent Runtime | 单机执行能力 | ❌ 错位（个人开发者 / 企业 SWE） | Claude Code / Codex / Cursor / Devin |
| **L4** | 融合层 · Managed Agent Workspace | Slark 所在品类 | ✅ 直接重合 | Multica / Sila / CoChat / Paperclip / ... |

### 三档调研策略（决定调研深度）

| 档位 | 层归属 | 入表资格门 | 调研深度 | 预期工时 |
|---|---|---|---|---|
| **S 级** 主竞品 | 仅 L4 | Gate 0 ICP 重合 + Q1 "会二选一" | 完整 12 维度 × 12 渠道 × 8 家对比 | 6-8 人日 |
| **A 级** 跨层观察档（v1.2 新增）| L1 / L2 / L3 各 1 代表 | 有明显用户流动 / 漂移路径的最强代表 | 精简 4 维度 + 4 渠道 | **2-3 人日** |
| **B 级** 漂移监测 | L1 / L2 / L3 其余 | 同层其他家（镜像关系） | 月度 changelog 扫 | 自动化 |

### A 级精简模式（v1.3 重选 · 4 主题维度 + 1 信号维度）

> **v1.3 升级**: 在双轴框架下，跨层调研不需要铺满 M1 × M2 矩阵，只做**跨层最有价值**的 4 个主题维度 + 必做 S3 自救信号。

**精简维度表**:

| 维度 | 跨层是否必做 | 说明 |
|---|---|---|
| M1 × M2 双轴全矩阵 | ❌ 跳过 | 跨层矩阵差异太大，无比对价值 |
| **M4 商业模式反推** | ✅ **必做** | 看对手的客户分层 / SKU / 漏斗 —— 是否有往 L4 漂移的商业信号 |
| **M7 Hype Gap 落差** | ✅ **必做** | 跨层对手的 hype 曲线对 Slark 用户心智最具干扰 |
| **M8 用户流向** | ✅ **必做** | **核心**：跨层调研的第一目的就是看用户从 L1/L2/L3 → L4 的迁移漏斗 |
| **M9 Feature Request** | ✅ **必做** | 看对手是否在接到 "Team Workspace" / "Multi-agent" 类呼声 |
| **S3 用户自救行为** | ✅ **必做** | 自救者 = 最可能从 L1/L2/L3 迁到 Slark 的人 |
| M5 一体两面 / M6 Onboarding | ❌ 按需 | L2 合规层做 M6；其他跳过 |
| S1 / S2 | 🟡 轻量扫 | 各标 3 条即可，不需要穷尽 |

**跨层调研的产出重心 = 漂移追踪表 + 迁移漏斗图，不是完整痛点报告**。

**精简渠道（只覆盖 4 层）**:

| Layer | 必做 | 重点 |
|---|---|---|
| L1 代码托管 | ✅ | 如果 OSS，扫 top 20 issue by reactions |
| L2 技术论坛 | ✅ | Reddit / HN 搜 "alternative / vs" |
| L3 长内容评测 | ✅ | Dev.to / Medium 高权重长评 |
| L6 搜索引擎 | ✅ | Google `"产品" vs nexu / alternative / migration` |
| 其他 L4/L5/L7-L12 | 按需 | 有信号再扩展 |

### 漂移迹象追踪表（A 级必产出）

A 级调研必须产出一张 **"漂移迹象追踪表"**，记录对手往 L4 方向演进的所有公开信号:

| 信号类型 | 取数位置 | 触发升级为 S+ 的条件 |
|---|---|---|
| **公开 Roadmap** | 官网 / GitHub Projects | 出现 "Team" / "Workspace" / "Multi-agent" 字样 |
| **CEO / Founder 推特** | Twitter/X | 提及 "collaboration" / "team" / "multi-agent orchestration" |
| **招聘 JD** | Wellfound / LinkedIn | 招 "team product" / "workspace" / "multi-agent" PM |
| **产品更新日志** | Changelog / Release notes | 发布 shared workspace / team plan / multi-user session |
| **融资口径变化** | 媒体稿 | 从 "coding" / "IM" 向 "AI workplace" 转移 |
| **展会 / 演讲** | YouTube / conference | 出现 "AI team" / "agent employee" 类演讲 |

### A 级输出报告结构（精简版）

```
# <对手名> 跨层观察调研（A 级）

产品速览（§2 完整版）
漂移迹象追踪表 ⭐
4 维度痛点（M1 / M3 / M4 / M10）
切换路径分析（对手用户 → Slark 的最大漏斗）
监测配置（RSS / Twitter / changelog）
下一步触发条件（什么情况升级为 S+）
```

### 三档升级 / 降级规则

```
B 档监测  →  A 档调研          A 档调研  →  S+ 主表
─────────────────────────    ────────────────────────
触发条件:                    触发条件:
  • 同层出现"黑马"占 stars   • 漂移追踪表命中 2+ 条
  • 用户在 Slark 社区反复提   • 官方宣布 team / workspace
  • 媒体 coverage 剧增         • Slark 流失用户指向该对手
```

### 首批 A 级清单（2026-04-17 选定）

| 层 | 对手 | 选中理由（为什么是它不是同层别家） | 当前调研计划 |
|---|---|---|---|
| **L1** | **Slack** | Sila 正在攻击 Slack + 大量 AI-first startup 在 Slack 存量用户；Slack → Slark 是最大用户迁移漏斗 | **P0** · 2026-04-24 前启动 |
| **L2** | **Mattermost** | 已有痛点 map 轻调研基础 + 合规市场空位确认路径 | **P1** · 2026-05-01 前 |
| **L3** | **Devin** | Cognition Labs 代表**Autonomous Agent → Team Workspace** 最有可能的漂移方向；Enterprise SWE 客户有 team workspace 预算 | **P1** · 2026-05-08 前 |

**为什么 L3 选 Devin 不选 Cursor**:

- Devin 已有 Team plan + Session Replay + multi-agent 编队（Devin Swarm），实质上已在往 team workspace 漂移
- Cursor 的 team 功能本质还是 IDE 协作（code review / share rules），不是 agent-as-employee workspace
- Devin 面向 Enterprise SWE 团队，预算与 Slark ICP 有潜在重合（AI-first 技术团队）；Cursor 偏个人订阅
- 用户粘性对比: Cursor 粘性在"个人编辑器"，Devin 粘性在"远程异步执行"——**后者是团队心智的天然入口**
- **Cursor 降为 B 档**（月度 changelog 扫即可）

---

## 10 · 历次应用记录

### S 级主竞品（L4 同品类）

| 日期 | 对手 | 报告 | 负责人 | 关键产出 |
|---|---|---|---|---|
| 2026-04-17 | **Paperclip** | [report](./2026-04-17-paperclip-deep-dive.md) | 增长团队 | 20 人 Tier 1 名单 / 5 条启示 / M10 维度诞生 |
| 2026-04-25 (计划) | Sila | 待建 | 增长团队 | 8 家对比表补 iOS 列 |
| 2026-05-02 (计划) | Multica | 已有轻量版，待升级 | 增长团队 | Daemon 架构对比 |
| 2026-05-09 (计划) | CoChat | 待建 | 增长团队 | Enterprise governance 切入点 |
| 2026-05-15 (计划) | 剩余 Moxt / Meco / Agent United / Dust | 待建 | 增长团队 | 完成 8 家完整对比表 |

### A 级跨层观察档（v1.2 新增 · 精简模式）

| 日期 | 对手 | 层 | 报告 | 负责人 | 核心追问 |
|---|---|---|---|---|---|
| 2026-04-24 (计划) | **Slack** | L1 入口层 | 待建 | 增长主理 | Sila 怎么攻 Slack？AI-first 小团队为什么还在 Slack？迁移触发点？ |
| 2026-05-01 (计划) | **Mattermost** | L2 合规层 | 可直接升级 [痛点 map](./2026-04-17-slack-mattermost-multica-painpoint-persona-map.md) | 增长团队 | 合规市场空位大小？Self-host 成熟度上限？ |
| 2026-05-08 (计划) | **Devin** | L3 能力层 | 待建 | 增长团队 | Team plan 用户画像？Session Replay 是否漂向 workspace 体验？ |

---

## 11 · 版本历史与迭代

| 版本 | 日期 | 变更 | 触发原因 |
|---|---|---|---|
| **v1.0** | 2026-04-17 初稿 | 11 维度 + 12 渠道 + 单一 Mattermost 锚点 | Paperclip 调研初版 |
| **v1.1** | 2026-04-17 修订 | 1) 强制产品速览开头<br>2) 新增 **M10 用户自救信号**<br>3) 删除单一锚点，改多对手对比表<br>4) 第五部分改"对新产品的运营行动指南"（去 Slark 绑定）<br>5) 增加调研 checklist + 触达模板库 + 监测配置标准化 | 应用在 Paperclip 后发现方法论需要通用化 |
| **v1.2** | 2026-04-17 修订 | 1) 新增 **§9 跨层调研策略 · 精简模式**（4 维 × 4 层 × 漂移追踪）<br>2) 引入 **S/A/B 三档调研深度** 明确升降级规则<br>3) 首批 A 级跨层观察档选定: Slack / Mattermost / Devin<br>4) 新增 **漂移迹象追踪表** 标准<br>5) 明确 **L3 选 Devin 不选 Cursor** 的判断依据 | S 级 8 家之外需要观察 L1/L2/L3 代表，提前建立用户迁移路径基线 |
| **v1.3** ⭐ | 2026-04-17 升级 | 1) **双轴建模**：引入 M1（谁）× M2（痛什么）双轴矩阵 · 每条证据强制双标<br>2) 新增独立主题维度 **M6 Onboarding** / **M7 Hype Gap** / **M9 Feature Request**<br>3) 原 M10 "用户自救信号" 迁入 S 系列为 **S3**（行为信号归位）<br>4) §5 Checklist 阶段 4 重写为 "双轴映射 + 主题调研 + 信号分层 + 孤儿素材检查"<br>5) 新增 **§5 阶段 9 外部框架体检**（季度 YC / JTBD / Kano / PMF Survey）<br>6) §6 报告模板按新维度重组，明确每条证据的 `M1 × M2` 双标规范<br>7) §9 跨层精简模式重选核心维度（M4 / M7 / M8 / M9 + S3） | 用户反馈：原框架只有"谁在痛"单轴，无法横切查询"所有定价痛集中在哪类用户"；图片参考提示双轴建模更可复用 |
| **v1.3.1** | 2026-04-17 补丁 | **§3 12 层渠道矩阵全展开**：1) 每层从"1-2 个渠道代表"展开为**完整子渠道清单 + 抓取要点 + 效率评级**（L1 → 6 子渠道 / L3 → 8 子渠道 / L7 → 6 子渠道等）<br>2) 标记 **L3 / L6 / L7 / L9** 为 ⭐ 重点层（信号密度最高）<br>3) 新增**子渠道命中判断规则**（≥ 2 条有效证据才算命中）<br>4) 新增**自动化搭建建议**（低成本 30 分钟 vs 中成本工程版）<br>5) 覆盖率标准细化到 "必达 Layer + 子渠道密度"<br>6) L9 招聘信号从 1 行扩写为 5 子渠道（被严重低估的未来路线剧透层） | 用户对比图片版渠道矩阵发现 SOP §3 子渠道缺失严重（缺 star-history / trending / npm 下载量 / Substack 策展人 / TLDR / Alphasignal / Levels.fyi 等），执行时无法直接 1:1 搭自动化 |

### v1.3 兼容性说明

- 已完成的 **Paperclip 深度报告**（v1.2 结构）**不做 backfill** —— 数据仍有效，重读时把 M1-M10 旧标签映射到新 M1 × M2：
  - 旧 M1 (管理员) → 新 M1 (管理员/运行者) × M2 (运维 / 升级 / 性能)
  - 旧 M6 (Self-hosting) → 新 M1 (管理员) × M2 (运维)
  - 旧 M9 (商业模式) → 新 M2 (定价) + M4 (商业模式反推)
  - 旧 M10 (自救) → 新 S3
- **下次调研（Sila / CoChat / ...）必须按 v1.3 格式产出**
- Paperclip 报告头部加 compat 提示（见 [Paperclip report](./2026-04-17-paperclip-deep-dive.md)）

### 未来迭代方向

- **v1.4** · 调研完 3 家 A 级后，固化 "A 级报告自动化生成模板"
- **v1.5** · 跑完 S 级 8 家 + A 级 3 家后，抽象"S/A/B 档调研深度差异 dashboard 生成脚本"
- **v2.0** · 通用化到其他品类（不只 Agent-Native Workspace）

---

## Related

- [Paperclip 调研报告（首次应用）](./2026-04-17-paperclip-deep-dive.md)
- [Slack × Mattermost × Multica 痛点人群 Map](./2026-04-17-slack-mattermost-multica-painpoint-persona-map.md) —— SOP 方法论起点
- [Managed Agent Workspace 品类全景](./2026-04-17-managed-agent-workspace-landscape.md) —— S 级名单来源
- [competitive-matrix](../../../growth%20space/competitive/competitive-matrix.md) —— S/A/B 档位定义
- [Paperclip 调研 5 条启示](../../memory/ideas/2026-04-17-paperclip-research-5-insights.md) —— 精简 insight 版
- [`growth space/monitoring/`](../../../growth%20space/monitoring/) —— 持续监测 watchlist 仓
