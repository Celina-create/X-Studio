<h1 align="center">X-Studio</h1>
<h3 align="center">A growth-ops lab for the AI agent era.</h3>

<p align="center">
  <em>Codified systems for shipping growth — auditable by humans, executable by agents.</em>
</p>

<p align="center">
  <a href="./README.md">English</a> ·
  <a href="./README.zh.md">中文</a> ·
  <a href="./README.ko.md">한국어</a>
</p>

<p align="center">
  <a href="https://github.com/Celina-create/X-Studio/stargazers"><img src="https://img.shields.io/github/stars/Celina-create/X-Studio?style=flat-square&logo=github&label=stars&color=181717" alt="Stars"></a>
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-black?style=flat-square" alt="License"></a>
  <img src="https://img.shields.io/badge/skills-9-black?style=flat-square" alt="Skills">
  <img src="https://img.shields.io/badge/playbooks-6-black?style=flat-square" alt="Playbooks">
  <img src="https://img.shields.io/badge/research-1-black?style=flat-square" alt="Research">
  <img src="https://img.shields.io/badge/case--studies-1-black?style=flat-square" alt="Case Studies">
</p>

---

## The thesis

> **Every growth tactic has a half-life.**

What worked last quarter breaks this quarter. Outreach moved from email to Twitter DM to GitHub issues. Content moved from blog posts to threads to AI-native formats. Seed users moved from waitlists to competitor poaching. Every shift, the surface tactics get easier — and the underlying craft gets harder.

**X-Studio captures the systems that survive the decay.** Each folder is something tested in a real campaign. Each skill is written so an AI agent can run it without hand-holding, *and* a growth operator can read it before pressing run.

This isn't a course. It isn't a blog. It's a **bench** — the place where the work happens, opened up.

---

## What's inside

| Folder | What it is |
|---|---|
| [`skills/`](./skills) | Atomic, agent-executable units of growth work — drop into Cursor / Claude Code / Codex |
| [`playbooks/`](./playbooks) | Narrative SOPs — how multiple skills compose into a real campaign |
| [`research/`](./research) | Field reports and ecosystem snapshots — operator interpretation, not journalism |
| [`templates/`](./templates) | Copy-paste assets — cold emails, landing pages, issue forms |
| [`case-studies/`](./case-studies) | Real campaigns — methods, data, what worked, what didn't |

---

## Skills (v0.1 — 9 in use)

Nine atomic skills currently shipped. Each has been used in a live campaign before being written down.

| # | Skill | What it does |
|---|---|---|
| 1 | [`stargazer-email-scraper`](./skills/stargazer-email-scraper) | Extract public emails of competitor-repo stargazers — 15–17% hit rate |
| 2 | [`competitive-intel-mining`](./skills/competitive-intel-mining) | Mine competitor communities (GitHub / Discord / Reddit) for high-intent users |
| 3 | [`seed-user-pool-stratification`](./skills/seed-user-pool-stratification) | Score and segment seed users by ROI before spending a single message |
| 4 | [`personalized-cold-outreach`](./skills/personalized-cold-outreach) | 1-to-1 personalized outreach at batch scale — first three sentences must be true *only* for that recipient |
| 5 | [`landing-to-issue-funnel`](./skills/landing-to-issue-funnel) | Turn a cold email into a pre-filled GitHub Issue capture loop |
| 6 | [`content-repurpose-engine`](./skills/content-repurpose-engine) | One insight → bilingual threads, long-form, video hooks |
| 7 | [`growth-experiment-template`](./skills/growth-experiment-template) | Structured experiment doc — hypothesis, metric, decision rule, retro |
| 8 | [`reddit-account-warmup`](./skills/reddit-account-warmup) | Warm a fresh Reddit account into a stable, low-risk identity in 6 weeks |
| 9 | [`community-content-bot`](./skills/community-content-bot) | Bilingual daily content push to Feishu + Discord on GitHub Actions — 60-min ship, sub-$10/mo cost |

**Roadmap teaser** — `linkedin-content-warmup`, `x-account-warmup`, `discord-community-seeding`, `outbound-followup-sequencer` (each will land when shipped at least once).

---

## How to use

### As an AI-agent skill set

```bash
git clone https://github.com/Celina-create/X-Studio.git ~/x-studio

# Mount everything
ln -s ~/x-studio/skills ~/.claude/skills/x-studio

# Or a single skill
ln -s ~/x-studio/skills/competitive-intel-mining ~/.cursor/skills/competitive-intel-mining
```

Invoke by name in chat:

> *"Use `competitive-intel-mining` on this competitor's GitHub issues."*  
> *"Run `reddit-account-warmup` and tell me which week I'm in."*

### As a reference for humans

Nothing here is copy-protected. Steal what's useful. A star is appreciated, not required.

---

## Method

Four principles that gate what gets published here.

1. **Has shipped at least once.** No theoretical playbooks. If it hasn't been run on a real campaign, it doesn't make it in.
2. **ROI over volume.** Every skill optimizes for precision. The bottom 50% of any "list" is usually noise — we cut it before any message is sent.
3. **Agents are operators.** Every skill is structured so a coding agent can execute the full chain. Hand-off points are explicit. State is explicit.
4. **Method over mystique.** Public method, public reasoning, public limits. Only client / user data is redacted.

---

## Status

| | Today |
|---|---|
| **Skills shipped** | 9 |
| **Playbooks** | 6 (1 acquisition + 1 community + 4-piece [open-source DevRel system](./playbooks/open-source-devrel/)) |
| **Research reports** | 1 ([Feishu × OpenClaw ecosystem snapshot](./research/2026-03-feishu-openclaw-ecosystem-snapshot.md)) |
| **Case studies** | 1 ([Bilingual content bot post-mortem](./case-studies/01-content-bot-postmortem.md)) |
| **License** | MIT |

This repository updates as work happens — small commits, frequent additions. Watch the repo for new skills as they land.

---

## Maintainer

Built by **Celina** ([`@Celina-create`](https://github.com/Celina-create)) — a growth operator who treats outreach, content, and seeding as engineerable systems rather than vibes.

For collaboration, custom skill requests, or notes exchange:

- 📩 [`suokata@naver.com`](mailto:suokata@naver.com)
- 🐛 [Open an issue](https://github.com/Celina-create/X-Studio/issues/new/choose)

---

## License

MIT © 2026 Celina. Use, fork, remix, attribute when convenient.

---

<p align="center">
  <sub>Growth is a craft. This is the bench.</sub>
</p>
