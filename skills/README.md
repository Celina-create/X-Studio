# Skills

Atomic, agent-executable skills. Each skill is a single folder containing a `SKILL.md` that any AI coding agent (Cursor, Claude Code, Codex, Gemini CLI) can follow end-to-end.

## Skill index

| Skill | One-liner | Status |
|---|---|---|
| [stargazer-email-scraper](./stargazer-email-scraper) | Extract public emails of competitor-repo stargazers (15–17% hit rate) | v0.1 · in use |
| [competitive-intel-mining](./competitive-intel-mining) | Mine competitor communities for high-intent users | v0.1 · in use |
| [competitive-analysis](./competitive-analysis) | Competitor / category deep dive — growth + SEO + strategic implications | v0.1 · in use |
| [competitor-deep-research-sop](./competitor-deep-research-sop) | **SOP v1.3.1** — pain-first research, 12-layer evidence, M1×M2, Tier-1 seeds + monitoring | v0.1 · in use |
| [seed-user-pool-stratification](./seed-user-pool-stratification) | Score and segment seed users by ROI before spending a single message | v0.1 · in use |
| [personalized-cold-outreach](./personalized-cold-outreach) | 1-to-1 personalized outreach at batch scale | v0.1 · in use |
| [landing-to-issue-funnel](./landing-to-issue-funnel) | Turn a cold email into a pre-filled GitHub Issue capture loop | v0.1 · testing |
| [content-repurpose-engine](./content-repurpose-engine) | One insight → bilingual threads, long-form, video hooks | v0.1 · in use |
| [growth-experiment-template](./growth-experiment-template) | Structured experiment doc — hypothesis, metric, decision rule | v0.1 · in use |
| [reddit-account-warmup](./reddit-account-warmup) | Warm a fresh Reddit account into a stable, low-risk identity in 6 weeks | v0.1 · in use |
| [community-content-bot](./community-content-bot) | Bilingual daily content push to Feishu + Discord — 60-min ship, $5/mo cost | v0.1 · paused (see [case study](../case-studies/01-content-bot-postmortem.md)) |

## SKILL.md format

Every skill follows this shape:

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

## Install

```bash
# All skills
ln -s ~/x-studio/skills ~/.claude/skills/x-studio

# Single skill
ln -s ~/x-studio/skills/competitive-intel-mining ~/.cursor/skills/competitive-intel-mining
```

## Contribute

Requests for new skills → [open an issue](https://github.com/Celina-create/X-Studio/issues/new/choose).
