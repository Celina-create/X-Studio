# Playbook: Daily Community Content Push (Feishu × Discord, Bilingual)

End-to-end SOP for shipping a bilingual daily content bot to your developer
community in **under 60 minutes** — from "should we even do this?" to
"first card landed in 3 Feishu groups + 1 Discord channel."

> **Read this first**: [`case-studies/01-content-bot-postmortem.md`](../case-studies/01-content-bot-postmortem.md)
> — the full retrospective on building, deploying, then **pausing** a bot
> with this exact architecture. The tactical lessons about audience fit
> and editorial sustainability inform every step below.

---

## When to use this playbook

✅ **Good fit**:
- You have an active developer community (≥ 200 people across Feishu/Discord) AND
- You publish or have access to original content (release notes, blog posts, internal research) AND
- You already see a pattern of "people share interesting links and we comment on them"

❌ **Bad fit**:
- Pure marketing / consumer audience (this bot is dev-tone)
- Fewer than 100 active members (announce in person; bot will look empty)
- No editorial voice yet ("aggregator without opinion" is the failure mode)

---

## The 60-minute path

| Phase | Time | Outcome |
|---|---|---|
| 0 · Prerequisites | 5 min | Webhooks generated, secrets list ready |
| 1 · Drop in code | 5 min | 2 files in repo, branch pushed |
| 2 · Configure brand | 10 min | Buttons + tone match your project |
| 3 · Test with one webhook | 10 min | First card lands in test group |
| 4 · Roll out to all groups | 5 min | Multi-group broadcast verified |
| 5 · Schedule + monitor | 10 min | Cron live, first scheduled push observed |
| 6 · Sunset criteria | 15 min | Decision rules for pause/kill written down |

---

## Phase 0 · Prerequisites

### 0.1 Generate webhooks

**Feishu (3 production groups + 1 test group recommended)**:
1. In each group → Settings → Group Bot → Add Bot → Custom Bot
2. Name it (e.g. "Daily Tech Bot"), click "Add"
3. Copy the webhook URL (`https://open.feishu.cn/open-apis/bot/v2/hook/...`)
4. **Skip security settings** for the test group; for production, add IP
   whitelist for GitHub Actions IPs (or add a signing key)

**Discord (1 channel to start)**:
1. Channel → Settings (gear) → Integrations → Webhooks → New Webhook
2. Name + avatar, copy the webhook URL
   (`https://discord.com/api/webhooks/...`)

### 0.2 LLM access

Pick one (the bot accepts any OpenAI-compatible endpoint):
- **OpenRouter** (recommended) — `https://openrouter.ai/api/v1`, free signup
- **OpenAI** — direct API key
- **LiteLLM proxy** — if you self-host

Test the key with curl:
```bash
curl https://openrouter.ai/api/v1/chat/completions \
  -H "Authorization: Bearer YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"anthropic/claude-sonnet-4","messages":[{"role":"user","content":"hi"}]}'
```

> ⚠️ **Cloudflare 403 trap**: Some LiteLLM proxies block GitHub Actions IPs.
> If you get `403 Cloudflare error page`, switch to OpenRouter.

---

## Phase 1 · Drop in code

```bash
# In your repo
mkdir -p scripts/notify .github/workflows
curl -sL "https://raw.githubusercontent.com/Celina-create/X-Studio/main/skills/community-content-bot/scripts/daily-content-bot.mjs" \
  -o scripts/notify/daily-content-bot.mjs
curl -sL "https://raw.githubusercontent.com/Celina-create/X-Studio/main/skills/community-content-bot/scripts/community-content-push.yml" \
  -o .github/workflows/community-content-push.yml

git checkout -b feat/community-content-bot
git add scripts/notify .github/workflows
git commit -m "feat(notify): add bilingual community content bot"
git push -u origin feat/community-content-bot
```

Open a PR. Don't merge yet — secrets first.

---

## Phase 2 · Configure brand

### 2.1 GitHub repo variables (Settings → Variables → Actions)

| Variable | Example | Purpose |
|---|---|---|
| `PROJECT_NAME` | `Refly` | Used in Discord author + LLM prompt |
| `PROJECT_REPO` | `refly-ai/refly` | All button URLs (Issues, GFI label) |
| `DOCS_BASE_URL` | `https://docs.refly.ai` | Contributor guide + rewards buttons |
| `PROJECT_AVATAR` | URL to 200×200 PNG | Discord embed icon |

### 2.2 Optional: tweak `THEME_PROMPTS`

In `scripts/notify/daily-content-bot.mjs`, lines 50-70. Adjust the
language for your audience (Chinese-only, English-only, more/less casual).

The default 5 themes work well for technical OSS communities. If you
remove a theme, also remove the matching cron line in the YAML.

---

## Phase 3 · Test with one webhook

### 3.1 Add minimal secrets

Settings → Secrets and variables → Actions → New repository secret:

| Secret | Value |
|---|---|
| `COMMUNITY_CONTENT_FEISHU_WEBHOOK` | **Test group URL only** (one URL, no commas) |
| `LITELLM_ENDPOINT` | `https://openrouter.ai/api/v1` |
| `LITELLM_API_KEY` | Your OpenRouter / LLM key |

> Skip `COMMUNITY_CONTENT_DISCORD_WEBHOOK` for now — Feishu test first.

### 3.2 Manual run

Actions → "Community Content Push" → Run workflow → choose `tech-news`.

Watch the run log. Healthy output:
```
Theme: 🔥 技术资讯 / Tech News (2026-04-28)
Fetched 15 HN stories
Calling LLM for bilingual content generation...
Generated ZH: "今日 5 条最值得关注的技术资讯"
Generated EN: "Today's Top 5 Tech Stories Worth Your Attention"
  Feishu: 1/1 succeeded
Daily content push completed
Sent: [tech-news] ZH: ... | EN: ...
```

Check the test group — first card should land within 30 seconds.

### 3.3 Common first-run errors

| Error | Fix |
|---|---|
| `LLM_API_KEY (or LITELLM_API_KEY) is required` | Secret not visible to workflow — check repo permissions |
| `LLM request failed (403): Cloudflare` | Switch endpoint to OpenRouter |
| `LLM returned non-JSON` | Lower `temperature` to 0.3, or try a stronger model |
| `Webhook failed (404)` | Webhook URL revoked, regenerate |
| `Webhook business error (19021): ...` | Feishu group bot rate-limited (5/sec) — usually transient |

---

## Phase 4 · Roll out to all groups

### 4.1 Multi-webhook in one secret

Once test passes, **edit** `COMMUNITY_CONTENT_FEISHU_WEBHOOK` to comma-separate:

```
https://open.feishu.cn/.../hook/test,https://.../hook/group1,https://.../hook/group2,https://.../hook/group3
```

The bot's `parseWebhookUrls()` splits on comma; `broadcastWebhook()` fires
all in parallel via `Promise.allSettled`.

### 4.2 Add Discord

Add `COMMUNITY_CONTENT_DISCORD_WEBHOOK` (single or comma-separated URLs).

### 4.3 Re-run manually

Same `tech-news` trigger. Verify card lands in **all** Feishu groups + Discord.

Log will show:
```
  Feishu: 4/4 succeeded
  Discord: 1/1 succeeded
```

If a single webhook fails, the bot reports `3/4 succeeded` and continues —
only crashes if **all** fail.

---

## Phase 5 · Schedule + monitor

### 5.1 Merge the PR

The cron schedules in `community-content-push.yml` activate immediately
after merge to default branch.

Default schedule (UTC):
```
0 1 * * 1-5    Tech News        - Weekday Beijing 09:00
0 4 * * 1-5    Tech Ecosystem   - Weekday Beijing 12:00
0 12 * * 1-5   AI Products      - Weekday Beijing 20:00
0 10 * * 5     Weekly Digest    - Friday  Beijing 18:00
0 2 * * 0,6    Weekend Pick     - Weekend Beijing 10:00
```

GitHub schedules can drift up to 15 minutes during high-load periods.
Don't pin to "exactly 9:00" expectations.

### 5.2 Monitor for 1 week

Daily checklist:
- [ ] Did the card land in all groups?
- [ ] Did anyone in the group react / comment / click?
- [ ] Was the LLM output coherent? (Quick scan, not full QA)
- [ ] Any error notifications from GitHub Actions?

Track in a simple sheet:

| Date | Theme | Reactions (Feishu) | Replies (Discord) | LLM quality 1-5 |
|---|---|---|---|---|
| 2026-04-28 | tech-news | 3 | 0 | 4 |
| 2026-04-29 | tech-eco | 1 | 1 | 3 |

---

## Phase 6 · Sunset criteria (write this BEFORE you ship)

**Pause if any of these are true after 4 weeks**:

| Signal | Threshold |
|---|---|
| Avg reactions per card | < 2 across all groups |
| Avg replies / discussions started | < 1 per week |
| LLM quality scores | Avg < 3.0 |
| Manual edits required | > 20% of cards (means tone is off) |
| Group "mute" or "leave" events | > 5 in a week (fatigue signal) |

**Kill criteria (delete the workflow)**:
- 8 weeks of below-threshold engagement
- A higher-ROI channel emerges (e.g. weekly office hours, async digest from
  a real human editor) that pulls attention away

> The bot in [case study #01](../case-studies/01-content-bot-postmortem.md)
> hit pause criteria after 3 weeks. The team kept the code (this skill)
> for future reuse but turned off all schedules.

---

## Operational tips

### Drift handling
GitHub cron is best-effort. For "must-fire" events (e.g. release
announcements), don't rely on schedule — use `workflow_dispatch` from a
separate workflow triggered by a release event.

### Per-group customization
If one group wants Chinese-only and another wants English-only, run TWO
workflows with separate secret sets, each pointing to one channel.

### Cost ceiling
Set OpenRouter spending cap at $20/month — the bot itself costs ~$5-7/mo
but a runaway loop (e.g. retried via workflow_dispatch many times) can
spike. Budget alerts > monitoring.

### Editorial fallback
If you suspect LLM quality drift, run with `tech-news` manually before
each schedule for a week. Compare LLM output to what a human editor would
write. If gap is wide → pause and revisit prompts.

---

## Resources

- [Skill: community-content-bot](../skills/community-content-bot/) — source code + setup details
- [Case study #01](../case-studies/01-content-bot-postmortem.md) — full deployment + pause retrospective
- [Open-Source DevRel collection](./open-source-devrel/) — the broader contributor flywheel this bot was meant to feed
- [Feishu custom bot docs](https://open.feishu.cn/document/client-docs/bot-v3/add-custom-bot)
- [Discord webhooks docs](https://support.discord.com/hc/en-us/articles/228383668)

## Changelog

- **2026-04-28** — Initial public release. Pattern derived from a production
  deployment that ran ~3 weeks before being paused for low engagement.
