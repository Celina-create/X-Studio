# reddit-account-warmup

**Purpose** — Warm up a fresh Reddit account into a stable, low-risk identity that can post and comment without being silently shadowbanned, removed, or rate-limited — so it can later be used for genuine community participation, growth research, or low-frequency product launches.

**Triggers** — "warm up a reddit account", "新号养 reddit", "my reddit posts keep getting removed", "is my account shadowbanned", "before launching on r/<subreddit>"

**Why this skill is a `skill` and not an `agent`**

Reddit's anti-spam system is built specifically to detect automated and scripted account-warming. The whole craft is *making your account look like a real human*. Therefore:

- ✅ This skill **augments** your judgment with structured checks, calendars, and copy patterns
- ✅ Read-only helpers (subreddit rule lookup, karma tracking) are safe to automate
- ❌ Posting, commenting, voting, and DMing **must be done by hand** — automating those is what gets accounts permabanned

If you came here looking for a "Reddit auto-poster," close this tab. There are better ways to lose your IP.

---

## Inputs

- **A goal**: are you warming this account for personal use, growth research, or to eventually launch a product? The week-6 strategy diverges based on this.
- **A clean device + IP environment** — see `6-week-workflow.md` § "Device & environment SOP"
- **A fresh email** (Gmail recommended) and phone number bound to **one Reddit account only**
- **3–5 target subreddits** related to your interest or product domain (you'll pick after Week 1)

## Outputs

- A 6-week calendar of what to do each day (`6-week-workflow.md`)
- A one-pass pre-publish checklist (`pre-post-checklist.md`)
- A comment-quality framework that actually gets upvotes (`comment-karma-formulas.md`)
- A recovery SOP for when something goes wrong (`recovery-playbook.md`)
- A list of behaviors that get accounts banned (`high-risk-actions.md`)

After 6 weeks, you should have:

- **Comment karma ≥ 50** (the unofficial baseline most subreddits actually require)
- **No removed posts in the last 7 days**
- **3–5 active "home base" subreddits** where mods recognize your handle as benign
- **Zero mod warnings, zero Automod negative flags**

---

## One-page speed-pass

You only need to remember three sentences:

1. **Comment first, post later** — build credibility before broadcasting.
2. **Slow is fast** — the harder you push, the faster Automod fires.
3. **Read every subreddit's rules before doing anything** — every community has different (often unstated) thresholds.

### New-account safety floor

- ✅ Comment karma ≥ 50 before your first post
- ✅ Avoid going *negative* on comment karma (it tanks reach across all subreddits)
- ✅ Continuously interact normally for several days before doing anything that looks like promotion or self-link
- ✅ Keep device + network environment stable, especially in the first 4–6 weeks

---

## Decision tree — what do I read first?

```
Just registered, never posted? ───────► 6-week-workflow.md (Day 1 → Week 6)
About to publish a post? ─────────────► pre-post-checklist.md
Trying to grow comment karma? ────────► comment-karma-formulas.md
Got removed / mod-warned / shadowed? ─► recovery-playbook.md
Wondering "is X allowed?" ────────────► high-risk-actions.md
```

---

## Quality bar (after 6 weeks)

- [ ] Comment karma ≥ 50, post karma ≥ 0
- [ ] No removed comments or posts in the past 7 days
- [ ] 3–5 home-base subreddits where you've made ≥ 5 comments each
- [ ] Profile reads as a real person — bio is short, no link spam, no obvious marketing
- [ ] You can articulate the unwritten rule of each home subreddit ("no question titles", "must include flair", etc.)

---

## What this skill does NOT cover

- **Multi-account farming** — illegal under Reddit ToS, and the second account always burns the first one
- **Vote manipulation / brigading** — instant permaban
- **Buying aged accounts** — shadowbanned the moment you change posting patterns
- **Reddit Ads** — separate skill, see `templates/` once added
- **Automated posting bots** — see "Why a skill, not an agent" above

---

## Compliance — read this before using

Reddit's User Agreement and Content Policy explicitly govern account behavior. Reading rules + warming an account through genuine participation is normal user behavior. Where this skill stays compliant:

- ✅ One person, one account, one stable device/IP
- ✅ All actions (posting, commenting, voting) performed by you, not a script
- ✅ Content is genuine — your real opinion, your real questions
- ✅ No coordinated multi-account behavior

Where this skill becomes **non-compliant** (do not do):

- ❌ Multiple accounts run from same device/IP
- ❌ Coordinated voting or "ask friends to upvote my post"
- ❌ Bot-driven posting, commenting, or DMing
- ❌ Buying upvotes / using vote-exchange groups

**You assume all platform-policy and legal liability. The skill is provided as-is.**

---

## Optional helpers (v0.2 — not yet built)

These are read-only tools — they observe Reddit, never post. Not needed for v0.1, listed here so future-you knows what's coming:

- `tools/check-subreddit-rules.py` — fetch a sub's rules + AutoModerator config + flair requirements, render as a yes/no checklist
- `tools/post-validator.py` — paste a draft title + body, get a red/yellow/green score against the 60-sec checklist
- `tools/karma-tracker.sh` — log daily karma snapshots, alert on sudden negative drops

---

## Origin & credit

The 6-week structure, comment-karma formula, and 60-second pre-post checklist are adapted from a [community-curated guide](https://www.reddit.com/r/China_irl/comments/axig58/reddit_markdown_%E8%A7%84%E5%88%99/) widely used in the Chinese-language growth community, plus my own reps running it across multiple campaigns. Where the source guide is opinionated, the opinions are kept; where I disagreed in practice, the version here reflects what actually worked for me.

---

## Related

- Sub-doc: [`6-week-workflow.md`](./6-week-workflow.md) — Day 1 → Week 6 calendar
- Sub-doc: [`pre-post-checklist.md`](./pre-post-checklist.md) — pre-flight before every post
- Sub-doc: [`comment-karma-formulas.md`](./comment-karma-formulas.md) — how to actually get upvotes
- Sub-doc: [`recovery-playbook.md`](./recovery-playbook.md) — when posts get removed / mod-warned
- Sub-doc: [`high-risk-actions.md`](./high-risk-actions.md) — behaviors that ban accounts
- Sibling skill: [`competitive-intel-mining`](../competitive-intel-mining) — once your account is warm, mine competitor subs for seed users
- Sibling skill: [`content-repurpose-engine`](../content-repurpose-engine) — convert one insight into Reddit-shaped, X-shaped, blog-shaped versions
