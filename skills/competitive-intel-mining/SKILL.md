# competitive-intel-mining

**Purpose** — Find seed users by mining competitor products' public communities (GitHub issues, Discord, Reddit, forums) for people currently hitting the pain your product solves.

**Triggers** — "find seed users from <competitor>", "mine <competitor>'s community", "who complains about <pain> on <competitor>"

**Why this beats buying a list** — People in competitor communities have already (a) paid the cost of trying a product in your category, (b) encountered real pain with it, and (c) publicly written about the pain. That's the highest-intent signal short of a referral.

---

## Inputs

- **Target competitor(s)** — product name + 1–3 public community URLs (GitHub repo, Discord invite, subreddit, forum)
- **Pain keywords** — 3–8 phrases that describe the problem your product solves (e.g., "agent loop", "sandbox rejects", "can't hold project memory")
- **Pool size target** — how many qualified leads you need (default: 20–80)

## Outputs

- A CSV with columns: `handle`, `platform`, `source_url`, `exact_quote`, `pain_category`, `intent_score`, `last_active`, `contact_path`
- A short `seeding-rationale.md` summarizing: top 3 pain clusters, which competitor is ripest, recommended outreach angle

## Steps

1. **Enumerate sources** — List every public community the competitor owns. GitHub issues/discussions are usually richest; Discord and Reddit next.
2. **Scrape recent 90 days** — Pull titles + bodies + reactions. For GitHub, `gh api` or the Issues API. For Reddit, `pushshift` or the JSON endpoints. For Discord, manual scroll.
3. **Keyword filter** — Match each item against pain keywords. Require ≥1 hit in title OR body.
4. **Score intent** (0–3):
   - `3` — Author complaining about active blocker, asked for fix, no satisfactory answer
   - `2` — Author confirmed the pain but moved on or self-patched
   - `1` — Passerby commented on someone else's complaint
   - `0` — Just mentioned the keyword, not actually pained
5. **Deduplicate** — Same handle across multiple issues → keep highest-intent row.
6. **Enrich contact path** — For each `handle`, find the easiest reply channel: X profile, GitHub bio email, personal site. Prefer the channel they're most active on.
7. **Output CSV + rationale** — Ship both files to `case-studies/<competitor>-seed-pool.csv` (redacted as needed).

## Quality bar

- [ ] Every row has an `exact_quote` — if you can't cite their words, they don't belong in the pool
- [ ] At least 60% of rows scored `2` or `3`
- [ ] `seeding-rationale.md` answers: which competitor is ripest and why, which pain cluster to lead with
- [ ] No row depends on a private channel you can't actually reach

## Anti-patterns

- **Don't scrape handles without quotes.** A handle alone is noise; a handle + quote is signal.
- **Don't lead with your product.** The first outreach message refers to *their* pain, not your feature.
- **Don't mine the founder's followers.** Fans ≠ pained users.

## Related

- Playbook: [`00-competitive-seed-pipeline`](../../playbooks/00-competitive-seed-pipeline.md)
- Follow-up skill: [`seed-user-pool-stratification`](../seed-user-pool-stratification) — scores and segments the pool
- Follow-up skill: [`personalized-cold-outreach`](../personalized-cold-outreach) — writes the actual messages
