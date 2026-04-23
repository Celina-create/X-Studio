# Playbook: Competitive seed pipeline

**Status**: draft v0.1

Running a full pipeline from "we need seed users" to "first 30 replies", using a competitor's public community as the source.

## When to run this

- You're launching a product in a category with at least one incumbent that has a public community
- You need 20–80 high-intent seed users in 2–4 weeks
- You have founder-level bandwidth to personally send 5–10 outreach messages per day

## Prerequisites

- Product has a landing page or public README that communicates value in <60 seconds
- 1 sentence ICP description locked in
- At least one competitor identified with public community (GitHub / Discord / Reddit / forum)
- ~8 hours of deep-work time over the first week

## Phases

### Phase 1a — Scrape stargazers (day 1)

Run [`stargazer-email-scraper`](../skills/stargazer-email-scraper) against each competitor's GitHub repo. Output: CSV with ~15–17% email hit rate (e.g., 2,000 emails from 14,000 stars).

### Phase 1b — Mine pain quotes (day 1–3, can run in parallel with 1a)

Run [`competitive-intel-mining`](../skills/competitive-intel-mining) on each identified competitor's issues / discussions / Discord / Reddit. Output: raw CSV of 100–500 rows with `exact_quote` per user. Join with Phase 1a output by `github_handle` to enrich stargazer rows with pain signals.

### Phase 2 — Stratify (day 3–4)

Run [`seed-user-pool-stratification`](../skills/seed-user-pool-stratification) on the joined pool. Output: scored CSV with Tier 1–4 assignments.

Expect ~10% to land in Tier 1. If Tier 1 is <5 rows, either your mining wasn't thorough enough or the competitor community isn't actually rich.

### Phase 3 — Personalize (day 4–6)

Run [`personalized-cold-outreach`](../skills/personalized-cold-outreach) on Tier 1 only. Output: per-recipient message draft.

Review the 5 best and 5 worst drafts manually. Tune the generation prompt until the worst drafts are acceptable.

### Phase 4 — Send (week 2)

Send 5–10 Tier-1 messages per day, Tuesday–Thursday, 10am recipient local time. Track replies in a simple CRM (a Google Sheet is fine).

Do NOT start Tier 2 until Tier 1 results are in.

### Phase 5 — Measure (week 3)

After 10 business days, compute:

- Reply rate (benchmark: Tier 1 should hit 25%+)
- Reply quality (how many are "yes, interested" vs "not a fit" vs silent)
- Top 2 pain phrases that got the warmest replies — these become hooks for Tier 2 messages

If reply rate is <15%, stop and diagnose before expanding. Most common causes:
- Pain keywords too broad (mined low-intent users)
- Pitch line too abstract
- Wrong channel (some pools are reachable on X but not email)

### Phase 6 — Expand or kill (week 4)

- **Reply rate ≥25%**: expand to Tier 2 with the winning hook
- **Reply rate 15–24%**: iterate on the hook, rerun Phase 3 with the learnings
- **Reply rate <15%**: this competitor's community isn't your pool. Try a different competitor OR a different source entirely (communities you're already in, referrals, partner lists).

## Pitfalls

- **Spraying Tier 3 first "to warm up"** — teaches you nothing and burns deliverability
- **Generating messages without reading them** — personalization quality drops the moment you skip the human review
- **Measuring success by "opens" or "click rate"** — reply rate is the only metric that matters at this stage
- **Running 3 competitor pipelines in parallel** — you can't give each the attention needed; serial is faster

## Exit criteria

One of:

- ✅ 20+ qualified replies → you have your seed user pool, move to activation
- ❌ <10 qualified replies after 4 weeks → the hypothesis "this competitor's community is our source" is falsified; try a different source

## Related

- Skills: [`competitive-intel-mining`](../skills/competitive-intel-mining), [`seed-user-pool-stratification`](../skills/seed-user-pool-stratification), [`personalized-cold-outreach`](../skills/personalized-cold-outreach)
- Templates: [`templates/cold-email/`](../templates/cold-email/)
