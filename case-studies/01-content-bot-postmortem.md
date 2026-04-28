---
title: "Building (and Pausing) a Bilingual Content Bot for a Developer Community"
date: 2026-04-28
type: post-mortem
tags: [devrel, automation, content-strategy, github-actions, llm]
duration: 3 weeks live
status: paused (code preserved, schedules disabled)
related-skill: ../skills/community-content-bot/
related-playbook: ../playbooks/02-daily-community-push.md
---

# Building (and Pausing) a Bilingual Content Bot for a Developer Community

> A retrospective on an automation project that worked **technically**,
> failed **strategically**, and taught me more in 3 weeks of being live
> than the previous 3 months of planning. Names and numbers anonymized.

---

## TL;DR

I built a fully automated bilingual content bot that pushed 5 themed cards
per week to 3 Feishu groups + 1 Discord channel. It worked perfectly on the
technical level — generation, formatting, multi-group fan-out, error
recovery, all of it. After 3 weeks live I **paused all schedules**. Here's
why that was the right call, what I'd do differently, and the artifact
that survived: [the skill](../skills/community-content-bot/) and
[the playbook](../playbooks/02-daily-community-push.md).

---

## The setup

**Audience**: ~600 people across 3 Feishu groups + ~200 in Discord, all
self-identified developers interested in an open-source AI agent project.

**Hypothesis**: "Daily quality content in the group will increase
engagement, surface contribution opportunities, and warm leads for our
contributor pipeline."

**The bot** (architecture detail in the [skill](../skills/community-content-bot/SKILL.md)):
- 5 themes on rotating schedule (tech news, ecosystem picks, AI products, weekly digest, weekend pick)
- Each cron pulls HackerNews top 15, sends to LLM with theme-specific prompt
- LLM returns a single bilingual JSON (`zh` + `en` blocks)
- Renders Feishu interactive card (Chinese) + Discord embed (English)
- Broadcasts to N webhooks in parallel
- ~$5/month cost, zero servers

**Build time**: ~3 days from spec to first card landing.
**Total cost over 3 weeks**: ~$8 in LLM calls.

---

## What worked

### 1. The technical pattern is solid and reusable

GitHub Actions + a 487-line ESM script + 2 secrets = a bot that runs on a
schedule, in two languages, to many channels. No backend, no DB, no
dependency management beyond the script itself. This pattern works for:
- Daily reports / digests
- Release announcements
- Cross-channel notifications
- Any "fan-out a webhook payload on a cron" use case

The full implementation is preserved in the
[community-content-bot skill](../skills/community-content-bot/) so I can
ship the same pattern to a different project in 60 minutes.

### 2. Multi-webhook fan-out via comma-separated secrets

The single most-clever piece of the design: **one secret can hold N
webhook URLs**, the script splits on comma and broadcasts via
`Promise.allSettled`. Adding a new group = edit one secret value, no code
deploy.

This pattern alone is worth keeping for unrelated future projects.

### 3. Bilingual via single LLM call

Initially I built it as two separate LLM calls (Chinese pass, English
pass). One call returning a `{zh, en}` JSON object cut LLM cost ~45% and
removed a class of "two outputs disagree on facts" bugs. Worth the
slightly more complex prompt.

### 4. The "editor, not aggregator" prompt design

Every theme prompt explicitly says **"don't do news-dump aggregation,
every item must have commentary on why developers should care."** Output
quality was visibly higher than off-the-shelf newsletter bots I've seen.

---

## What didn't work

### 1. Lurkers don't engage with bot content

Across 21 cards in 3 weeks:
- Median Feishu reactions: 1 (mostly from team members)
- Median Discord replies: 0
- Total click-throughs to repo issues from bot buttons: 7

The 800 people in those groups weren't there for daily briefings. They
were there because they'd hit a bug, were curious about the project, or
already followed the same sources elsewhere (HN, Twitter, GitHub
Trending). The bot was **shipping content into a low-signal channel**.

### 2. Editorial drift after week 1

The first week's cards felt fresh because I was hand-tuning prompts daily.
By week 2 I'd let it run and the themes started repeating patterns:
- Tech news leaning toward the same 3-4 topics (LLMs, frameworks, RAG)
- Tech ecosystem picks gravitating to the same source pool
- Weekend picks getting noticeably less "weekend"

LLM-generated daily content **compresses to its mean** without active
editorial pressure. That pressure has to come from somewhere — and a
human editor who reads the output, judges it, and tunes prompts is
expensive in the one resource I needed most: my own attention.

### 3. The "automation buys back time" promise was inverted

I'd budgeted ~30 min/week to "watch the bot." Reality:
- 30 min reading every output
- 20 min in Slack discussing what felt off
- 30 min editing prompts to fix drift
- 15 min explaining to teammates "no it's not broken, it just generated something weird"

Net: ~95 min/week of attention to keep a bot generating content nobody
was reading. **Worse ROI than just publishing 1 hand-written digest per week.**

### 4. The bot was an answer looking for a question

The unspoken hypothesis driving the build was: *"more content in the
group → more engagement → more contributors."* Looking at it now, every
arrow in that chain is weak:
- Content ≠ engagement (especially when source isn't a person)
- Engagement ≠ contribution (different motivations entirely)
- Daily cadence ≠ weekly cadence retention (in fact often worse — fatigue)

The right hypothesis would have been: *"What signal tells me a community
member is ready to contribute, and how do I respond to that signal in
real time?"* Which is a completely different system.

---

## What I'd do differently

### 1. Run the math before writing a line of code

Before building, I should have answered:
- What's the realistic engagement rate on bot content in similar
  developer communities? (Looking at a few comparable groups: ~0.5%
  click-through, 1-3% reaction. My groups were within range — meaning
  the bot was working, my expectations were wrong.)
- What's the cost (in attention, not dollars) of keeping editorial
  quality high? (I assumed $0. It was 90 min/week.)
- What would I do with the same engineering hours instead? (Build the
  contribution pool dashboard — 10× higher ROI in retrospect.)

### 2. Test with one channel + one human editor first

Instead of going straight to automation, I should have:
1. Asked a teammate to write 5 cards manually for a week
2. Tracked engagement
3. **Then** decided whether to automate

If the human-written version flopped, I'd have learned the lesson for $0.
I learned it for ~$8 + 25 hours.

### 3. Build the **shut-off criteria** before the bot goes live

I had no written threshold for "this isn't working." So when engagement
was tepid in week 1, I told myself "it's still ramping." Week 2: "needs
more variety." Week 3: "okay this isn't a 'tweak the prompts' problem."

The [playbook now includes Phase 6: Sunset criteria](../playbooks/02-daily-community-push.md#phase-6--sunset-criteria-write-this-before-you-ship)
with hard thresholds. Future me will thank current me.

### 4. Frame automation as "the second version, after a human proves the pattern"

Every successful editorial automation I've seen started as a **human
ritual** that someone got tired of doing manually. The bot was the
*second* version of a thing that worked.

I built the second version first. The first version (hand-written daily
content) might have failed too — but I'd have learned that for ~3 hours
of effort, not 25.

---

## The artifacts that survived

The bot itself is paused but the **patterns are kept and packaged**:

| Artifact | What it preserves |
|---|---|
| [Skill: community-content-bot](../skills/community-content-bot/) | Full source code, customization guide, troubleshooting |
| [Playbook: 02-daily-community-push.md](../playbooks/02-daily-community-push.md) | The 60-minute ship path including the lessons above |
| This case study | The why-not, the sunset criteria, the strategic framing |

If a future project genuinely needs daily multi-channel bilingual
notifications (release pipeline updates, on-call rotation, security
alerts) — the skill ships in 60 minutes. The pattern is correct; **the
use case in this case wasn't.**

---

## Strategic takeaways (for builders)

1. **Automation amplifies whatever you already do.** If the manual version
   doesn't get engagement, the automated version won't either — it'll
   just fail at scale.

2. **"Free engineering" isn't free.** Even when LLM costs are $5/mo,
   editorial quality maintenance costs are real. Budget them or expect
   drift.

3. **Write your sunset criteria first.** Pre-committed thresholds are the
   only thing that protects you from sunk-cost rationalization. Without
   them, every project lasts forever in a degraded state.

4. **The right level of automation is one step behind your bottleneck.**
   My bottleneck was *understanding what makes community members
   contribute*, not *generating more content*. Automating the wrong layer
   makes the bottleneck worse, not better.

5. **A failed project is a valuable artifact if you write down what you
   learned.** This document is more useful to me (and possibly to you)
   than three more weeks of mediocre engagement metrics would have been.

---

## Numbers, in one place

| Metric | Value |
|---|---|
| Build time | 3 days |
| Time live | 21 days |
| Cards generated | 21 (5 themes × ~4 weekdays + weekly + weekends, minus a few skipped) |
| LLM cost | ~$8 |
| GitHub Actions cost | $0 (under free quota) |
| Median Feishu reactions per card | 1 |
| Median Discord replies per card | 0 |
| Click-throughs to issues | 7 (across 21 cards × 4 channels) |
| Maintenance time | ~95 min/week |
| Decision to pause | Week 3, day 4 |
| Time to write skill + playbook + this | 1 day (post-pause) |
| Total honest learning ROI | High, **once I wrote it down** |

---

## Related

- [Skill: community-content-bot](../skills/community-content-bot/) — the productionized pattern
- [Playbook: Daily community content push](../playbooks/02-daily-community-push.md) — the 60-minute ship path
- [Open-Source DevRel collection](../playbooks/open-source-devrel/) — the contributor flywheel this bot was meant to feed
