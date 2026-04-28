---
name: competitive-analysis
description: Analyze competitors with a standardized research workflow that combines positioning, capability comparison, growth and distribution signals, and SEO competition. Use when researching a competitor, comparing product capabilities, assessing positioning, or preparing a competitive brief for product strategy, SEO, or growth.
---

# Competitive Analysis Skill

You are an expert at competitive analysis for product managers, growth teams, and founders.

This skill is not only for writing a strong brief once. It is designed to support a more repeatable research workflow:
- product understanding
- evidence collection
- capability comparison
- growth and distribution signal tracking
- SEO competition analysis
- strategic implications

The goal is to produce analysis that is easier to compare, review, and update over time.

## Core Principles

1. Separate facts from interpretation.
2. Record important claims with sources and capture dates.
3. Prefer structured notes before prose.
4. Evaluate competitors on both product strength and distribution momentum.
5. Distinguish what exists from what is actively growing.
6. Do not invent DAU, MAU, or user scale. If direct activity data is unavailable, label proxy signals as proxy signals.

## Workflow

### 1. Scope the Analysis

Always define these first:
- Competitor(s): Which company or product are we analyzing?
- Focus: Full product, feature area, pricing, positioning, SEO, growth, or a specific strategic question?
- Context: What decision will this inform?
- Geography: China, US, global, or another specific market?
- Time window: Snapshot today, recent 30 days, 90 days, or 12 months?

Output a short scope block:

```md
## Scope
- Competitor:
- Focus:
- Decision Context:
- Geography:
- Time Window:
- Research Date:
```

### 2. Collect Evidence

Gather evidence before writing analysis.

#### Required Sources
- Official homepage
- Product and feature pages
- Pricing page
- Changelog, release notes, or product updates
- Blog or newsroom
- Social channels
- Community and review sites
- GitHub if open source
- App store, plugin marketplace, or extension store if relevant

#### Optional Sources
- Analyst reports
- Job postings
- Customer case studies
- Press interviews
- SEO or traffic tools
- Third-party product analytics

### 3. Build the Research Sheet

Create structured notes with fixed fields before writing prose.

Minimum fields:
- Product name
- Company
- URL
- Category
- Target user
- Core use cases
- Key features
- Pricing
- Distribution channels
- Latest visible updates
- Evidence links
- Capture date
- Confidence level

Use the templates in [`templates/research-sheet.md`](templates/research-sheet.md) and [`templates/research-sheet.zh-CN.md`](templates/research-sheet.zh-CN.md).

### 4. Analyze the Competitive Set

Classify competitors into:
- Direct competitors
- Indirect competitors
- Adjacent competitors
- Substitute solutions

Do not put every product in "direct." Use real buyer alternatives whenever possible.

## Competitive Landscape Mapping

### Landscape Map
Position competitors on meaningful dimensions.

Common axes:
- Breadth vs depth (suite vs point solution)
- SMB vs enterprise (market segment focus)
- Self-serve vs sales-led (go-to-market approach)
- Simple vs powerful (product complexity)
- Horizontal vs vertical (general-purpose vs industry-specific)

Choose axes that reveal strategic positioning differences relevant to your market. The right axes make competitive dynamics visible.

### Monitoring the Landscape
Track competitive movements over time:
- Product launches and feature releases
- Pricing and packaging changes
- Funding rounds and acquisitions
- Key hires and job postings
- Customer wins and losses
- Analyst and review coverage
- Partnership announcements
- SEO footprint expansion
- GitHub growth if open source

## Feature Comparison Matrices

### Building a Feature Comparison
1. Define capability areas that matter to buyers, not your internal architecture.
2. List specific capabilities under each area.
3. Rate each competitor using a consistent scale.

### Rating Scale Options

Simple:
- Strong: Market-leading or clearly differentiated.
- Adequate: Functional and usable, but not differentiated.
- Weak: Exists with meaningful gaps.
- Absent: Not present.

Detailed:
- 5: Best-in-class.
- 4: Strong.
- 3: Adequate.
- 2: Limited.
- 1: Minimal.
- 0: Absent.

### Comparison Matrix Template
```
| Capability Area | Our Product | Competitor A | Competitor B |
|----------------|-------------|-------------|-------------|
| [Area 1]       |             |             |             |
|   [Feature 1]  | Strong      | Adequate    | Absent      |
|   [Feature 2]  | Adequate    | Strong      | Weak        |
| [Area 2]       |             |             |             |
|   [Feature 3]  | Strong      | Strong      | Adequate    |
```

### Tips for Feature Comparison
- Rate based on real product experience, customer feedback, and reviews, not only marketing claims.
- "Has feature X" is less useful than "How well does it do X?"
- Weight comparison by what matters to target customers, not total feature count.
- Update regularly because comparisons go stale quickly.
- Be honest about where competitors are ahead.
- Include why each capability area matters.

## Positioning Analysis Frameworks

### Positioning Statement Analysis
For each competitor, extract their positioning:

Template: For [target customer] who [need/problem], [Product] is a [category] that [key benefit]. Unlike [competitor/alternative], [Product] [key differentiator].

Common sources:
- Homepage headline and subheadline
- Product descriptions on stores or review sites
- Sales materials
- Analyst briefing materials
- Earnings call language for public companies

### Message Architecture Analysis
How does each competitor communicate value?

- Level 1: Category
- Level 2: Differentiator
- Level 3: Value proposition
- Level 4: Proof points

### Positioning Gaps and Opportunities
Look for:
- Unclaimed positions
- Crowded positions
- Emerging positions
- Vulnerable positions

## Growth and Distribution Signals

This is a required layer of the analysis.

Do not only ask:
- what product do they have?

Also ask:
- are they actively pushing distribution?
- are they showing signs of momentum?
- are users responding?

### Channel Actions

Track whether the competitor is actively doing growth on channels:
- Blog or newsroom posts
- Product update posts
- X, LinkedIn, WeChat, Xiaohongshu, Bilibili, YouTube, Discord, Telegram
- Community discussions
- Launch platforms
- Partnerships
- Events or webinars
- Customer stories and case studies

Record:
- channel
- activity type
- frequency
- most recent date
- engagement signal

### Community and Activity Signals

Do not stop at "they posted on social."

Break community and activity signals into specific types:
- official launch signal
- tutorial and education signal
- scenario or use-case content signal
- feature release signal
- offline event signal
- community challenge or UGC signal
- support and bug-feedback signal

Questions to answer:
- Are they only announcing, or also educating?
- Is this one-way awareness or two-way participation?
- Are users only watching, or actively creating, reporting, and sharing?
- Which signal type is strongest, and what does that imply about momentum?

### Open Source Competitors

If the product is open source, GitHub is a required growth signal source.

Track:
- stars total
- stars daily or weekly growth if available
- forks
- watchers
- contributors
- commit frequency
- release frequency
- issue activity
- discussion activity
- PR activity

Interpretation:
- High stars with no recent commits can mean historical brand residue, not current momentum.
- Stable commit and release rhythm usually indicates healthy maintenance.
- Rising contributor count can signal ecosystem pull.

#### GitHub Burst-Point Review

Do not stop at star totals or trend lines. Identify when GitHub attention started to accelerate and what happened right before it.

Questions to answer:
- On what date did stars begin to climb faster?
- What changed 1 day before the inflection?
- What changed 3 days before?
- What changed 7 days before?
- Was the burst mainly product-led, content-led, community-led, platform-led, or compound-led?
- What can we learn from this burst for our own SEO and distribution?

Typical burst drivers to check:
- launch announcement
- README rewrite
- new landing page or docs push
- release or major feature update
- comparison or tutorial article
- Product Hunt, Hacker News, V2EX, WeChat, Xiaohongshu, Bilibili, X, Reddit, or other community exposure
- media coverage or large-account reposts

### Closed Source Competitors

If the product is closed source, direct user activity data may be unavailable. Use proxy signals instead of guessing.

Track proxy signals:
- social posting frequency
- follower growth if visible
- post engagement
- website traffic trend if available
- branded search trend if available
- app store reviews and recent velocity
- marketplace installs or ratings
- changelog frequency
- customer case study cadence
- public customer count, MAU, DAU, or ARR if disclosed

Interpretation:
- Frequent posting without engagement is weak growth evidence.
- Frequent product updates plus visible user response is stronger.
- Public usage numbers should always be labeled with date and source.
- If only proxy signals are available, say so explicitly instead of implying direct usage scale.

### Growth Rhythm Assessment

Classify the competitor's growth rhythm:
- Explosive: visible acceleration across product, channel, and user signals
- Steady: consistent output and stable traction
- Uneven: bursts of activity without sustained rhythm
- Stalled: little product or channel movement

## SEO Competition Add-on

If the analysis is for SEO or content competition, do not stop at "what pages do they have?" Study how the competitor turns content into discoverability, demand capture, and conversion.

### Search Footprint

Map the visible search footprint:
- homepage and core commercial pages
- blog, resources, docs, glossary, templates, tools
- category pages
- programmatic SEO pages
- comparison pages
- use case pages
- industry pages
- integration pages

Questions to answer:
- Which page types are they investing in?
- Is the footprint broad or focused?
- Are they building for awareness, evaluation, or conversion?

### Keyword Coverage

Track:
- core category keywords
- feature keywords
- problem or pain-point keywords
- comparison keywords
- alternative keywords
- jobs-to-be-done queries
- branded keywords
- non-branded keywords

Questions to answer:
- Where do they overlap with us?
- Which keywords do they own that we do not?
- Are they winning with product pages, content pages, or templates?
- Is their SEO concentrated in a few pages or spread across a system?

### Content System

Analyze the content engine, not just individual articles:
- publishing cadence
- topic clusters
- internal linking patterns
- template reuse
- author or editorial signals
- freshness patterns
- CTA patterns

Questions to answer:
- Do they have a real editorial system or scattered content?
- Are they publishing to rank, educate, convert, or build brand authority?
- Which topics look strategically intentional?

### Page Quality and Conversion Design

For top pages, inspect:
- title and H1 framing
- search intent match
- depth and clarity
- scannability
- visual assets
- trust signals
- product screenshots or demos
- CTA placement
- schema or SERP features if visible

Questions to answer:
- Why might this page rank?
- Why might this page convert?
- Is the content generic, product-led, or expert-led?

### Distribution Beyond Search

Strong SEO competitors often reinforce search with other channels. Check whether the same content is amplified through:
- LinkedIn, X, WeChat, Xiaohongshu, YouTube
- newsletters
- communities
- founder posts
- product launches
- partner distribution

Questions to answer:
- Are they relying only on SEO?
- Which channels amplify their content?
- Does off-page activity appear to support demand capture?

### SEO Growth Rhythm

Classify the competitor's SEO motion:
- Content-led
- Product-led SEO
- Brand-led
- Mixed engine
- Weak or inconsistent

### SEO and Distribution Takeaways

Do not end SEO analysis at page inventory. Translate observed moves into lessons.

Questions to answer:
- Did they build docs, landing pages, comparison pages, or use-case pages before visible growth kicked in?
- Which content types appear to capture search demand best?
- Did content lead the burst, or did content follow the burst?
- If a user searches brand, feature, problem, or comparison queries, do they land in a prepared funnel?
- Which moves should we copy, counter, or ignore?

## Win/Loss Analysis Methodology

### Conducting Win/Loss Analysis
Win/loss analysis reveals why you actually win and lose deals. It is the most actionable competitive intelligence.

Data sources:
- CRM notes from sales
- Customer interviews shortly after decision
- Churned customer surveys or exit interviews
- Prospect surveys for lost deals

### Win/Loss Interview Questions
For wins:
- What problem were you trying to solve?
- What alternatives did you evaluate?
- Why did you choose us over alternatives?
- What almost made you choose someone else?
- What would we need to lose for you to reconsider?

For losses:
- What problem were you trying to solve?
- What did you end up choosing, and why?
- Where did our product fall short?
- What could we have done differently?
- Would you reconsider us in the future? Under what conditions?

### Analyzing Win/Loss Data
- Track reasons over time.
- Segment by deal type.
- Identify the top 3 to 5 win and loss reasons.
- Distinguish product reasons from non-product reasons.
- Calculate competitive win rates where possible.

## Market Trend Identification

### Sources for Trend Identification
- Analyst reports
- Venture capital activity
- Conference themes
- Technology shifts
- Regulatory changes
- Customer behavior changes
- Talent movement

### Trend Analysis Framework
For each trend:
1. What is changing?
2. Why now?
3. Who is affected?
4. What is the timeline?
5. What is the implication for us?
6. What are competitors doing?

### Separating Signal from Noise
- Signals are backed by behavioral data, investment, regulation, or customer demand.
- Noise is backed only by hype or announcements without traction.
- Test trends against your own customer data.
- Be careful with hype cycles.

### Strategic Response Options
- Lead
- Fast follow
- Monitor
- Ignore

## Evidence Standard

Tag claims with confidence:
- High: official source or directly observable metric
- Medium: strong third-party evidence or multiple aligned sources
- Low: weak proxy or inference

Tag source types:
- Official
- Community
- Third-party
- Inference

Always distinguish:
- Fact
- Interpretation
- Hypothesis

## Recommended Output Structure

```md
# [Competitor / Market] Competitive Analysis

## 1. Scope
## 2. Snapshot
## 3. Competitive Set
## 4. Capability Comparison
## 5. Positioning Analysis
## 6. Growth / Distribution Signals
## 7. Community / Activity Signals
## 8. GitHub Burst-Point Review (for open-source competitors)
## 9. SEO Competition
## 10. Threats and Opportunities
## 11. Monitoring Triggers
## 12. Strategic Implications
## 13. Sources
```

## Common Mistakes

- Treating feature existence as product strength
- Treating social posting as proof of traction
- Treating total GitHub stars as current growth
- Writing "community buzz" without specifying which signal type is visible
- Describing a GitHub spike without asking what happened immediately before it
- Mixing opinion with evidence
- Ignoring update dates
- Ignoring distribution while focusing only on product
- Writing strategic implications that do not connect back to evidence

## Final Rule

A strong competitive analysis should answer two separate questions:
1. How good is this product?
2. How fast is this competitor building awareness, demand, and momentum?

If the analysis answers only the first one, it is incomplete.

---

## Repo-Specific: OpenClaw-Ecosystem & Single-Product Briefs

When analyzing **OpenClaw-based products** or writing **single-product competitive briefs** in this repo, follow the framework and conventions below.

### Framework and Location

- **Framework doc**: `growth space/competitive/openclaw-based-products-research-framework.md` — scope (what counts as OpenClaw-based), discovery channels, classification, single-product template (4.1–4.9), output paths, execution rhythm.
- **Output directory**: All OpenClaw-related briefs go under `growth space/competitive/openclaw/`. Filename pattern: `<product-slug>-competitive-brief.md`.

### Writing Conventions

- **No self-comparison**: Do not include Nexu/Refly in positioning or capability comparison in these briefs; the repo is re-anchoring Nexu positioning separately. Focus on the competitor’s own facts, use cases, and growth.
- **Citations**: Any claim with a source must be cited in text as [1], [2], etc., and the brief must end with a **「引用来源」** section listing each [n] with URL or出处 + date.

### Recommended Section Order

1. 定位与心智模型 (Positioning & mental model)
2. 信息架构 (Message architecture: Category / Differentiator / Value prop / Proof points)
3. 用例 (Use cases — see below)
4. 竞争集合划分 (Competitive set)
5. 竞争格局与能力对比 (Landscape + capability comparison; no self-product column)
6. 增长 (Growth — see below)
7. 风险与不确定性 (Risks & uncertainties)
8. 引用来源 (Sources)

### Use Cases (用例)

- Write **role + scenario** in first person: “我是… / 我原本的流程… / 用了该产品之后…”.
- Include **at least 2–3** distinct roles or scenarios; each as a short narrative (Before/After), not bullet lists.

### Growth (增长)

- **Product data**: Public metrics (GitHub stars, downloads, MAU, funding, press).
- **融资与规模（商业公司必填）**：若竞品为**有融资的商业/VC-backed 公司**，必须在**首版简报**中查清并写入「增长」下的产品数据，不得留空或写「未详查」。须包含：轮次、金额、估值、领投方（及主要跟投）、时间；若近期有 ARR/团队规模等公开表述可一并写入。数据来源：官网公告、Crunchbase、TechCrunch/Reuters 等报道，并在引用来源中标注。开源/无融资产品可写「暂无公开融资」或省略。
- **Star 的结构（产品数据下）**：按以下两层结构书写，勿仅写「见 Star History 或仓库页」。
  - **第一层（GitHub 汇总）**：`GitHub：{org}/{repo} 约 **X.Xk stars**、**X.Xk forks**（截至 YYYY 年 M 月 D 日）[n]。` 可补许可证、trending 等；标注引用 [n]。
  - **第二层（增长时间线）**：`增长时间线：` 下分三条：
    1. 仓库创建于 **YYYY-MM-DD**；
    2. 约 X 周/天内 star 从 0 增至 Xk+，增速极快/快。
    3. `Star History 曲线显示 X 月上旬快速爬升：` 下用子条目列出关键日期与 star 数，例如 `约 3/5 近 5k`、`3/7 约 10k`、`3/9 约 15k`、`3/11 约 20k`、`3/13 后破 25k [n]。` 最后一条带引用 [n]。
  - 数据来源：GitHub API `https://api.github.com/repos/{org}/{repo}`（stargazers_count、forks_count、created_at）、[Star History](https://www.star-history.com/) 或 `https://api.star-history.com/svg?repos={org}/{repo}&type=date` 刻度推断关键时间点。
- **社区与社媒中的用户讨论**：须写出**有见解的洞察**，不能只列链接。必须包含以下子块，每条结论附**原帖链接**（可点击 URL）：
  - **好评**：用户/社区中的正面评价。摘录 1～3 条**典型表述**（可直接引用或概括），说明谁在什么场景下称赞什么，并附原帖或报道链接。
  - **差评/担忧**：负面评价、顾虑、争议或批评。摘录 1～3 条**典型表述**，说明具体痛点或争议点，并附原帖或 Issue 链接。
  - **洞察**：从讨论中提炼的 1～2 句结论，例如用户主要因什么采用、最大痛点是什么、与竞品对比时如何被提及、社区情绪如何。洞察需有讨论或评价作为依据。
- **社媒账号与内容**：写在「增长」中，与产品数据/增长渠道并列。须查清该产品在各社媒平台是否有官方账号；若有，写粉丝或关注量、内容类型，并附账号链接。若无公开账号或无法获知粉丝数，可写未发现账号或粉丝数未公开。
- **Channels**: How they grow (GitHub, Product Hunt, SEO, KOL, app stores, community, events).
- **Trends**: Notable milestones, inflection points, or strategy changes over time.

### Screenshots and Images

- **存放位置**：图片文件**直接放在简报 .md 同目录下**，命名为 `{product}-home.png`、`{product}-github.png`、`{product}-console.png` 等。
- **在简报中引用**：用**纯文件名**引用，例如 `![Paperclip 官网首屏](paperclip-home.png)`。
- **预览方式**：使用 **Cmd+Shift+V**（Mac）或 **Ctrl+Shift+V**（Windows）打开 Markdown 预览查看图片。
- **占位**：暂无截图时在简报中写简短说明（如「建议补充：官网首屏截图」）。
