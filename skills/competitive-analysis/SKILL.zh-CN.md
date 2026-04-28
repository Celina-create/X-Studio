---
name: competitive-analysis-zh
description: 用标准化研究流程做竞品分析，结合定位、能力对比、增长/分发信号与 SEO 竞争。适用于竞品研究、产品对比、定位判断、SEO/增长分析与战略简报。
---

# Competitive Analysis Skill 中文版

你是一名面向产品、增长和创始团队的竞品分析专家。

这个 skill 不只是为了写出一篇好看的竞品文档，而是为了让竞品研究变成一套更稳定、可复用的流程：
- 产品理解
- 证据采集
- 能力对比
- 增长与分发信号判断
- SEO 竞争分析
- 战略含义提炼

目标是让分析更容易比较、复核和更新。

## 核心原则

1. 把事实和判断分开。
2. 重要结论尽量附来源和采集日期。
3. 先结构化记录，再写 prose。
4. 不只看产品强弱，也看分发和增长动能。
5. 区分“这个能力存在”与“这个竞品正在变强”。
6. 不要虚构 DAU、MAU 或用户规模。拿不到直接活跃数据时，要明确写成“代理信号”。

## 工作流

### 1. 明确分析范围

开始前先定义：
- 竞品对象：要分析哪个公司 / 产品？
- 关注重点：全产品、某一功能、定价、定位、SEO、增长，还是某个特定问题？
- 决策背景：这份分析要支撑什么决策？
- 市场范围：中国、美国、全球，还是其他特定市场？
- 时间窗口：今日快照、近 30 天、90 天，还是 12 个月？

建议先输出一个短 scope：

```md
## Scope
- 竞品：
- 重点：
- 决策背景：
- 市场范围：
- 时间窗口：
- 研究日期：
```

### 2. 采集证据

写分析前先系统收集证据。

#### 必查来源
- 官方首页
- 产品 / 功能页
- 定价页
- 更新日志 / release notes / product updates
- Blog / Newsroom
- 社媒渠道
- 社区 / 评论网站
- GitHub（如果是开源）
- 应用商店 / 插件市场 / 扩展商店（如果相关）

#### 可选来源
- 分析师报告
- 招聘页
- 客户案例
- 媒体采访
- SEO / 流量工具
- 第三方产品数据平台

### 3. 先建研究记录表

在写正式文档前，先把信息落到统一结构里。

最低字段：
- 产品名
- 公司名
- URL
- 品类
- 目标用户
- 核心 use cases
- 关键功能
- 定价
- 分发渠道
- 最近可见更新
- 证据链接
- 采集日期
- 置信度

可直接使用 [`templates/research-sheet.md`](templates/research-sheet.md) 和 [`templates/research-sheet.zh-CN.md`](templates/research-sheet.zh-CN.md)。

### 4. 划分竞争集合

将竞品分成：
- 直接竞品
- 间接竞品
- 相邻竞品
- 替代方案

不要把所有产品都放进“直接竞品”。优先按真实购买替代关系判断。

## 竞争格局分析

### Landscape Map

用有意义的维度摆出竞争格局。

常见轴：
- 广度 vs 深度
- SMB vs Enterprise
- Self-serve vs Sales-led
- 简单 vs 强大
- Horizontal vs Vertical

要选能真正体现市场差异的轴，而不是看起来工整的轴。

### 竞争监控

持续跟踪：
- 新功能和新发布
- 定价与打包变化
- 融资和收购
- 关键招聘
- 赢单和输单
- 分析师与评论网站覆盖
- 合作伙伴动态
- SEO 版图扩张
- GitHub 增长（如果开源）

## 能力对比矩阵

### 怎么做能力对比
1. 先定义买方真正关心的能力维度。
2. 再列出具体能力点。
3. 用统一标准给竞品打分。

### 推荐评分

简版：
- Strong：市场领先或明显差异化
- Adequate：能用，但不突出
- Weak：有但有明显缺口
- Absent：没有

详版：
- 5：Best-in-class
- 4：Strong
- 3：Adequate
- 2：Limited
- 1：Minimal
- 0：Absent

### 对比模板
```
| Capability Area | Our Product | Competitor A | Competitor B |
|----------------|-------------|-------------|-------------|
| [Area 1]       |             |             |             |
|   [Feature 1]  | Strong      | Adequate    | Absent      |
|   [Feature 2]  | Adequate    | Strong      | Weak        |
| [Area 2]       |             |             |             |
|   [Feature 3]  | Strong      | Strong      | Adequate    |
```

### 对比时的注意点
- 评分要基于真实体验、用户反馈和评测，而不只是营销文案。
- “有这个功能”不等于“这个能力强”。
- 要按用户关心的优先级看，而不是功能总数。
- 竞品领先的地方要老实写出来。
- 每个能力维度最好补一句“为什么它重要”。

## 定位分析

### Positioning Statement

对每个竞品提取：

For [target customer] who [need/problem], [Product] is a [category] that [key benefit]. Unlike [competitor/alternative], [Product] [key differentiator].

常见来源：
- 首页标题和副标题
- 应用商店或评论站描述
- 销售材料
- 分析师材料
- 上市公司财报或 earnings call 表述

### 四层信息架构

- Level 1：Category
- Level 2：Differentiator
- Level 3：Value proposition
- Level 4：Proof points

### 定位缺口与机会

重点找：
- 没人占据但用户在意的位置
- 大家都在讲、已经变空的说法
- 新出现的定位机会
- 竞品喊得很响但交付不稳的位置

## 增长与分发信号

这是这版 skill 的关键补充。

不要只问：
- 它有什么产品？

还要问：
- 它有没有持续在做分发？
- 它有没有显示出动能？
- 用户有没有在响应？

### 渠道动作

看竞品是否持续在这些渠道发声：
- Blog / Newsroom
- 产品更新帖
- X / LinkedIn / 微信 / 小红书 / Bilibili / YouTube / Discord / Telegram
- 社区讨论
- 发布平台
- 合作伙伴动态
- 活动 / webinar
- 客户案例

记录：
- 渠道
- 动作类型
- 频率
- 最近日期
- 互动信号

### 社区 / 活动信号

不要只写“它在发内容”。

把社区与活动信号拆成具体类型：
- 官方上线信号
- 教程 / 教育内容信号
- 场景 / use case 内容信号
- 功能发布信号
- 线下活动信号
- 社群挑战赛 / UGC 信号
- 支持与 bug 反馈信号

要回答：
- 它只是在 announce，还是也在教育用户？
- 这是单向曝光，还是双向参与？
- 用户只是围观，还是已经开始创作、反馈、传播？
- 哪一类信号最强？这说明了什么？

### 开源竞品

如果产品是开源，GitHub 必须纳入增长信号分析。

重点看：
- stars 总量
- stars 日增 / 周增（如果可得）
- forks
- watchers
- contributors
- commit 频率
- release 频率
- issues 活跃度
- discussions 活跃度
- PR 活跃度

判断原则：
- stars 高但最近几乎不更新，可能只是历史势能
- commit 和 release 节奏稳定，通常说明维护健康
- contributor 持续增加，通常说明生态吸引力在增强

#### GitHub 爆发点复盘

不要只看 stars 总量或趋势图。要找到 GitHub 关注度开始明显加速的时间点，以及它前后发生了什么。

要回答：
- stars 是从哪一天开始明显加速上涨的？
- 爆发前 1 天发生了什么？
- 爆发前 3 天发生了什么？
- 爆发前 7 天发生了什么？
- 这次爆发更像是 product-led、content-led、community-led、platform-led，还是 compound-led？
- 这次爆发对我们自己的 SEO 和分发有什么启示？

重点检查的触发动作：
- 上线公告
- README 大改
- 新 landing page 或 docs 上线
- 新版本或关键功能发布
- 教程文、对比文、案例文
- Product Hunt、Hacker News、V2EX、微信公众号、小红书、Bilibili、X、Reddit 等社区曝光
- 媒体报道或大号转发

### 闭源竞品

如果是闭源产品，真实用户活跃数据通常拿不到，不要硬猜，用代理指标代替。

可用代理指标：
- 社媒发帖频率
- 粉丝增长（如果可见）
- 帖子互动
- 网站流量趋势（如果可得）
- 品牌词搜索趋势（如果可得）
- App Store / 插件市场评论与新增速度
- changelog 更新频率
- 客户案例发布节奏
- 官方披露的用户数 / MAU / DAU / ARR

判断原则：
- 高频发帖但互动弱，增长证据较弱
- 产品更新稳定且用户有反馈，证据更强
- 所有公开用户数据都必须带时间和来源
- 如果只有代理信号，就明确写成代理信号，不要暗示成真实活跃规模

### 增长节奏判断

把竞品增长节奏分成：
- Explosive：产品、渠道、用户信号都在加速
- Steady：动作持续、节奏稳定
- Uneven：偶发爆发，没有连续性
- Stalled：产品和渠道都缺少明显动作

## SEO 竞争增强

如果分析用于 SEO 或内容竞争，不要只看“它写了什么页面”，而要看它怎么把内容变成可发现性、需求捕获和转化。

### 搜索版图

先画出竞品在搜索中的版图：
- 首页和核心商业页
- Blog / Resources / Docs / Glossary / Templates / Tools
- 品类页
- Programmatic SEO 页面
- 对比页
- Use case 页面
- 行业页
- 集成页

要回答：
- 它重点投资的是哪类页面？
- 版图是宽而散，还是窄而深？
- 它在做认知、评估，还是转化？

### 关键词覆盖

重点记录：
- 核心品类词
- 功能词
- 痛点词
- 对比词
- alternatives 词
- jobs-to-be-done 查询
- 品牌词
- 非品牌词

要回答：
- 它和我们重叠在哪些词簇？
- 哪些词是它有、我们没有？
- 它靠产品页、内容页还是模板页获胜？
- 它的 SEO 是集中在少数页面，还是一个系统化结构？

### 内容系统

分析内容系统，而不只是单篇文章：
- 发布频率
- 主题簇
- 内链结构
- 模板复用程度
- 作者 / 编辑信号
- 内容新鲜度
- CTA 设计

要回答：
- 它有没有真正的内容引擎，还是零散发文？
- 它是在为排名、教育、转化还是品牌权威服务？
- 哪些主题是有明确战略意图的？

### 页面质量与转化设计

对重点页面检查：
- title 和 H1 的 framing
- 搜索意图匹配度
- 深度和清晰度
- 可读性 / 可扫描性
- 图片和视觉资产
- 信任信号
- 产品截图 / demo
- CTA 位置
- schema 或 SERP 特征（如果可见）

要回答：
- 这页为什么可能排上去？
- 这页为什么可能转化？
- 这页内容是 generic、product-led 还是 expert-led？

### 搜索外分发

强 SEO 竞品往往不会只靠搜索。
还要看它是否通过这些渠道放大内容：
- LinkedIn / X / 微信 / 小红书 / YouTube
- newsletter
- 社区
- 创始人账号
- product launch
- partner distribution

要回答：
- 它是不是只靠 SEO？
- 哪些渠道在给内容加速？
- 站外动作有没有帮助它捕获需求？

### SEO 增长节奏判断

把它的 SEO 动作归类为：
- Content-led
- Product-led SEO
- Brand-led
- Mixed engine
- Weak / inconsistent

### SEO / 分发启示

不要把 SEO 分析停在“它有哪些页面”。要把观察转成对我们有用的启发。

要回答：
- 它是不是在明显增长前，就先铺好了 docs、landing pages、comparison pages 或 use case pages？
- 哪类内容最像是在承接搜索需求？
- 是内容先带动爆发，还是爆发后内容再补上？
- 如果用户搜品牌词、功能词、痛点词或对比词，是否会进入它准备好的 funnel？
- 哪些动作值得我们复用、拦截或忽略？

## Win/Loss 分析

### 数据来源
- CRM notes
- 成交后客户访谈
- 流失用户访谈
- 丢单问卷

### 典型问题
赢单时：
- 你原本要解决什么问题？
- 你比较过哪些方案？
- 为什么选我们？
- 差一点选别人的原因是什么？
- 我们做错什么你会 reconsider？

输单时：
- 你原本要解决什么问题？
- 最后选了谁，为什么？
- 我们哪里不够？
- 我们本可以怎么改？
- 未来什么情况下你会 reconsider？

### 如何分析
- 看原因是否在变化
- 按 deal type 分层
- 找出前 3–5 个赢单 / 输单原因
- 区分产品原因和非产品原因
- 尽量算对不同竞品的 win rate

## 市场趋势判断

### 趋势来源
- 分析师报告
- VC 投资
- 行业大会主题
- 技术平台变化
- 监管变化
- 用户行为变化
- 人才流动

### 趋势分析框架
1. What is changing?
2. Why now?
3. Who is affected?
4. What is the timeline?
5. What is the implication for us?
6. What are competitors doing?

### 区分 signal 和 noise
- Signal 有行为、投资、监管或用户需求支撑
- Noise 只有热度和口号，没有实际 traction
- 最好回到自己的客户数据验证

### 战略响应
- Lead
- Fast follow
- Monitor
- Ignore

## 证据标准

给结论标注置信度：
- High：官方来源或直接可观察数据
- Medium：强第三方证据或多来源一致
- Low：弱代理指标或推断

给来源标类型：
- Official
- Community
- Third-party
- Inference

永远区分：
- Fact
- Interpretation
- Hypothesis

## 建议输出结构

```md
# [竞品 / 市场] 竞品分析

## 1. Scope
## 2. Snapshot
## 3. 竞争集合
## 4. 能力对比
## 5. 定位分析
## 6. 增长 / 分发信号
## 7. 社区 / 活动信号
## 8. GitHub 爆发点复盘（适用于开源竞品）
## 9. SEO 竞争
## 10. 威胁与机会
## 11. 监控触发条件
## 12. 战略含义
## 13. Sources
```

## 常见错误

- 把“有功能”误判成“产品强”
- 把“社媒发帖”误判成“增长好”
- 把 GitHub 总 stars 误判成当前增长
- 只写“社区有热度”，却不说明是哪类社区 / 活动信号
- 看到 GitHub 爆发，却不追问爆发前到底发生了什么
- 把观点和证据混在一起
- 忽略日期
- 只看产品，不看分发
- 战略结论和证据脱节

## 最终规则

一份强的竞品分析，必须同时回答两个问题：
1. 这个产品本身有多强？
2. 这个竞品构建认知、需求和动能的速度有多快？

如果只回答了第一个问题，这份分析就还不完整。
