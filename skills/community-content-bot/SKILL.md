---
name: community-content-bot
description: |
  Bilingual daily content push bot for developer communities — generates
  themed cards (tech news, ecosystem picks, AI products, weekly digest,
  weekend pick) via LLM and pushes to Feishu (Chinese) + Discord (English)
  webhooks on a schedule.
triggers:
  - "set up a content bot for our community"
  - "push daily updates to our Feishu group"
  - "automate our Discord developer channel"
  - "建一个社群内容推送机器人"
  - "把每天的技术资讯自动推到飞书"
runtime: github-actions
language: javascript-esm
status: production-ready (paused in source project — see case-studies/01)
---

# Community Content Bot

A self-hosted, bilingual (中文 / English) daily content push bot for
developer communities — runs on **GitHub Actions only**, no server, no
backend, no DB. Sub-$5/month operating cost (LLM API only).

## What it does

Every weekday + weekend, it:

1. Picks a content theme based on the cron schedule
2. Pulls fresh signals from HackerNews top stories
3. Asks an LLM to generate a **bilingual JSON payload** (zh + en)
4. Renders a Feishu interactive card (Chinese) and a Discord embed (English)
5. Broadcasts both to multiple webhooks in parallel (multi-group support)

| Theme | Cron (UTC) | Beijing Time | What it pushes |
|---|---|---|---|
| 🔥 Tech News | `0 1 * * 1-5` | Weekday 9:00 | 3-5 deep tech news with editorial commentary |
| 🧩 Tech Ecosystem | `0 4 * * 1-5` | Weekday 12:00 | One deep recommendation: skill / plugin / OSS tool |
| 🏆 AI Products | `0 12 * * 1-5` | Weekday 20:00 | 5-7 AI products from GitHub Trending / PH / HN |
| 📰 Weekly Digest | `0 10 * * 5` | Friday 18:00 | Week's top 5-7 stories + "Week's reflection" |
| 🎲 Weekend Pick | `0 2 * * 0,6` | Weekend 10:00 | A side project / dev meme / lighthearted story |

## Why use it

**For maintainers of an open-source project with a community**:
- Zero-server: just GitHub Actions + 2 webhooks
- Multi-group: comma-separate webhook URLs in secrets, parallel broadcast
- Bilingual by design: same source, separate Chinese/English LLM output
- Editor-first prompts: NOT a news scraper, every item has commentary
- Reusable: swap out brand strings, theme prompts, button URLs

## When NOT to use it

Don't ship this until you have answers to:
- **Who actually reads daily content in a community?** Most lurkers won't, and active members already follow the same sources.
- **What's the conversion goal?** If "more group activity" — there are higher-ROI tactics (issue threads, weekly office hours).
- **Can you sustain editorial quality?** LLM-only content quickly feels generic. The "X writes weekly digest" pattern outperforms automated daily.

> See [`case-studies/01-content-bot-postmortem.md`](../../case-studies/01-content-bot-postmortem.md)
> for the full retrospective on why this skill was built, deployed, then paused.

## Architecture

```
┌──────────────────────┐
│  GitHub Actions      │  schedule: 5 cron lines + workflow_dispatch
│  community-content-  │
│  push.yml            │
└──────────┬───────────┘
           │ env: theme, webhooks, llm key
           ▼
┌──────────────────────┐    ┌─────────────────┐
│  daily-content-      │───▶│  HackerNews API │
│  bot.mjs             │    │  (top 15)       │
│                      │    └─────────────────┘
│  1. fetch HN         │    ┌─────────────────┐
│  2. build prompt     │───▶│  LLM Provider   │
│  3. call LLM         │    │  (LiteLLM /     │
│  4. parse bilingual  │    │   OpenRouter)   │
│  5. render cards     │    └─────────────────┘
│  6. broadcast        │
└──────────┬───────────┘
           │
     ┌─────┴──────┐
     ▼            ▼
┌─────────┐  ┌──────────┐
│ Feishu  │  │ Discord  │  Both support comma-separated multi-URL
│ webhook │  │ webhook  │  (e.g. push to 3 groups simultaneously)
└─────────┘  └──────────┘
```

## Files

- `scripts/daily-content-bot.mjs` — main bot script (487 lines, ESM, no deps)
- `scripts/community-content-push.yml` — GitHub Actions workflow

## Setup (5 min)

### 1. Drop the files in

```bash
mkdir -p scripts/notify .github/workflows
cp daily-content-bot.mjs scripts/notify/
cp community-content-push.yml .github/workflows/
```

### 2. Customize 4 things

In `daily-content-bot.mjs`:
- **Brand strings** in `buildBilingualPrompt()` — replace
  `"the open-source community"` with your project name
- **Button URLs** in `buildFeishuCard()` and `buildDiscordEmbed()` — point
  to your contributor guide / issues / rewards page
- **Theme prompts** in `THEME_PROMPTS` — adjust tone for your audience

In `community-content-push.yml`:
- Cron schedules if you want different timing

### 3. Add 4 secrets to your repo

Settings → Secrets and variables → Actions → New repository secret:

| Secret | Value | Notes |
|---|---|---|
| `COMMUNITY_CONTENT_FEISHU_WEBHOOK` | `https://open.feishu.cn/...` | Comma-separate for multi-group: `url1,url2,url3` |
| `COMMUNITY_CONTENT_DISCORD_WEBHOOK` | `https://discord.com/api/webhooks/...` | Same multi-URL support |
| `LITELLM_ENDPOINT` | `https://your-llm-proxy/v1` | Or use `LLM_API_BASE` |
| `LITELLM_API_KEY` | `sk-...` | Or use `LLM_API_KEY` |

### 4. Test before scheduling

GitHub → Actions → "Community Content Push" → Run workflow → choose theme:
- Start with `tech-news` to validate end-to-end
- Check the run log for `Sent: [tech-news] ZH: ... | EN: ...`
- Verify the cards land in Feishu + Discord

### 5. Pause / resume

To pause without deleting: comment out the `schedule:` block in the YAML.
Manual `workflow_dispatch` still works for one-off pushes.

## Multi-group webhook trick

The bot supports **comma-separated webhook URLs** in a single secret:

```
COMMUNITY_CONTENT_FEISHU_WEBHOOK = "https://...hook/aaa,https://...hook/bbb,https://...hook/ccc"
```

`parseWebhookUrls()` splits on comma, `broadcastWebhook()` fires
`Promise.allSettled` to all URLs in parallel. Partial failures are logged
but don't crash the run — only fails the workflow if ALL webhooks fail.

This means **one secret can fan out to 3+ Feishu groups** with no code change.

## Cost

- HackerNews: free
- LLM (Claude Sonnet 4 via proxy): ~$0.05 per push × 5/day × 22 weekdays
  + 8 weekend = ~$5-7/month
- GitHub Actions: free for public repos, included in private quota
- Webhooks: free

**Total: < $10/month** for a 3-group bilingual rollout.

## Troubleshooting

### `Cloudflare 403` from LLM endpoint
The default LiteLLM proxy can hit Cloudflare protection from GitHub Actions
runners. Fix: switch to OpenRouter (`https://openrouter.ai/api/v1`) by
swapping `LITELLM_ENDPOINT` and `LITELLM_API_KEY`. The bot accepts any
OpenAI-compatible endpoint.

### `Webhook failed (404)`
Webhook URL revoked or wrong. Regenerate in Feishu/Discord, update secret,
re-run workflow.

### `LLM did not return both zh and en content`
The model occasionally returns malformed JSON. The bot logs first 300 chars
of the response. If it persists, lower `temperature` from `0.7` to `0.3`
or switch models.

## Related

- [Reddit Account Warmup](../reddit-account-warmup/) — community-side setup before automation
- [Content Repurpose Engine](../content-repurpose-engine/) — turn one source into 5 channel formats
- [Case study #01](../../case-studies/01-content-bot-postmortem.md) — full deployment retrospective
- [Playbook · Daily community push](../../playbooks/02-daily-community-push.md) — end-to-end SOP
