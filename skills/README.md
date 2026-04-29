# Skills

Atomic, agent-executable skills. Each skill is a single folder containing a `SKILL.md` that any AI coding agent (Cursor, Claude Code, Codex, Gemini CLI) can follow end-to-end.

**Total: 12 skills.** All have shipped at least once before being written down.

---

## Two ways to read this index

- **Funnel view** — which step of growth ops the skill belongs to (research → seed → outreach → content → measure).
- **Layer view** — how abstract the skill is (meta-method, strategic framework, or executable tool).

---

## Funnel view (default)

| Stage | Skill | One-liner | Status |
|-------|-------|-----------|--------|
| **1. Research** | [`competitor-deep-research-sop`](./competitor-deep-research-sop) ⭐ | **SOP v1.3.1** — pain-first research, 12-layer evidence, M1×M2 matrix, Tier-1 seeds + monitoring; ships with full 930-line methodology | in use |
| | [`competitive-analysis`](./competitive-analysis) | Competitor / category deep dive — growth + SEO + strategic implications | in use |
| | [`competitive-intel-mining`](./competitive-intel-mining) | Mine competitor communities (GitHub / Discord / Reddit) for high-intent users | in use |
| **2. Seed extraction** | [`stargazer-email-scraper`](./stargazer-email-scraper) | Extract public emails of competitor-repo stargazers — 15–17% hit rate | in use |
| | [`seed-user-pool-stratification`](./seed-user-pool-stratification) | Score and segment a raw seed pool into ROI-ranked tiers before any send | in use |
| **3. Outreach** | [`personalized-cold-outreach`](./personalized-cold-outreach) | 1-to-1 personalized outreach at batch scale — quotes the recipient's own words | in use |
| | [`landing-to-issue-funnel`](./landing-to-issue-funnel) | Replace "landing → waitlist form" with "landing → pre-filled GitHub Issue" | testing |
| **4. Content & community** | [`content-repurpose-engine`](./content-repurpose-engine) | One insight → platform-native versions for X (EN/ZH), long-form, LinkedIn, video | in use |
| | [`community-content-bot`](./community-content-bot) | Bilingual daily content push to Feishu (ZH) + Discord (EN) — 60-min ship, sub-$10/mo | paused (see [case study](../case-studies/01-content-bot-postmortem.md)) |
| | [`reddit-account-warmup`](./reddit-account-warmup) | Warm a fresh Reddit account into a stable, low-risk identity in 6 weeks | in use |
| **5. Measure** | [`growth-experiment-template`](./growth-experiment-template) | Force every experiment into a standard doc shape — hypothesis, metric, decision rule, retro | in use |
| **6. Build (AI products)** | [`ai-agent-sdd`](./ai-agent-sdd) ⭐ | Write a professional SDD for an AI agent before vibe-coding — MVP (12 sec) and Full (23 sec) templates with AI-specific sections | in use |

---

## Layer view

| Layer | Meaning | Skills |
|-------|---------|--------|
| **L0 · Methodology / Meta** | Teaches the agent **how to think** | [`competitor-deep-research-sop`](./competitor-deep-research-sop) · [`ai-agent-sdd`](./ai-agent-sdd) |
| **L1 · Strategic framework** | Synthesizes information into decisions | [`competitive-analysis`](./competitive-analysis) · [`seed-user-pool-stratification`](./seed-user-pool-stratification) · [`growth-experiment-template`](./growth-experiment-template) |
| **L2 · Executable tool** | Gets a concrete action done | [`competitive-intel-mining`](./competitive-intel-mining) · [`stargazer-email-scraper`](./stargazer-email-scraper) · [`personalized-cold-outreach`](./personalized-cold-outreach) · [`landing-to-issue-funnel`](./landing-to-issue-funnel) · [`content-repurpose-engine`](./content-repurpose-engine) · [`community-content-bot`](./community-content-bot) · [`reddit-account-warmup`](./reddit-account-warmup) |

> **2 meta · 3 strategic · 7 executable** — meta layer now includes both *research* (competitor SOP) and *build* (AI agent SDD), reflecting that both research and shipping benefit from explicit method.

---

## How they chain (typical campaign path)

```
①  competitor-deep-research-sop    (define 12-layer channel coverage + Tier-1 source)
       ↓
②  competitive-intel-mining        (execute the mining defined by SOP)
       ↓
③  stargazer-email-scraper         (turn handles into emails)
       ↓
④  seed-user-pool-stratification   (1000 rows → P0 / P1 / P2 / P3)
       ↓
⑤  personalized-cold-outreach      (P0 first · quote their own words)
       ↓
⑥  landing-to-issue-funnel         (responders → pre-filled issue → public lead DB)
       ↓
⑦  growth-experiment-template      (record hypothesis · metric · result · decision)
       ↓ in parallel ↓
⑧  content-repurpose-engine        (turn the campaign learnings into multi-platform posts)
⑨  community-content-bot           (push the daily cards to Feishu + Discord)
⑩  reddit-account-warmup           (warm accounts in parallel · ready before any launch)
       ↓
①✓ competitive-analysis            (quarterly retro · re-check whether competitors shifted)
```

Eleven skills compose a closed loop: **know your competitor → reach their unhappy users → measure what worked → republish what learned**.

---

## SKILL.md format

Most skills follow this shape:

```markdown
# <Skill Name>

**Purpose** — what this skill solves
**Triggers** — when to invoke
**Inputs** — what the agent needs from you
**Outputs** — what it produces
**Steps** — 1…N executable steps
**Quality bar** — how to tell if it shipped well
**Related** — links to playbooks / templates
```

Newer skills (`competitive-analysis`, `competitor-deep-research-sop`) use frontmatter (`---name / description---`) so coding agents can auto-route by description match.

---

## Install

```bash
# Mount everything
ln -s ~/x-studio/skills ~/.claude/skills/x-studio

# Or a single skill
ln -s ~/x-studio/skills/competitor-deep-research-sop ~/.cursor/skills/competitor-deep-research-sop
```

Invoke by name in chat:

> *"Use `competitor-deep-research-sop` on Sila. Output the M1×M2 matrix and a Tier-1 list of 8."*
> *"Run `personalized-cold-outreach` on `tier1.csv`. Each message must quote a specific issue they filed."*

---

## Roadmap (each will land when shipped at least once)

- `linkedin-content-warmup` — content side, L2
- `x-account-warmup` — content side, L2
- `discord-community-seeding` — outreach side, L2
- `outbound-followup-sequencer` — outreach side, L2

---

## Contribute

Requests for new skills → [open an issue](https://github.com/Celina-create/X-Studio/issues/new/choose).
