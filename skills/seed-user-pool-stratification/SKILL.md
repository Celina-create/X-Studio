# seed-user-pool-stratification

**Purpose** — Given a raw seed user pool of 100–1000 rows, stratify it into ROI-ranked tiers before spending any outreach energy. Prevents the classic mistake of spraying Tier-4 prospects first and burning the list.

**Triggers** — "rank this seed pool", "who should I message first", "stratify these 500 leads", "who's Tier 1 here"

**Why this matters** — Reply rate drops ~70% when you send to low-tier leads first (they set the baseline, contaminate deliverability, and burn your bandwidth). Always hit Tier 1 first, learn, then decide if Tier 2–4 is worth the effort.

---

## Inputs

- **Raw seed CSV** (from [`competitive-intel-mining`](../competitive-intel-mining) or elsewhere) with at minimum: `handle`, `source_url`, `exact_quote`, `pain_category`
- **Your product's ICP** — 1–2 sentences describing who benefits most
- **Capacity** — how many messages you can send personally per week (realistic, not aspirational)

## Outputs

- CSV with added columns: `tier` (1–4), `intent_score` (0–3), `fit_score` (0–3), `access_score` (0–3), `rationale`, `send_week`
- `pool-ranking-summary.md` — how many rows per tier, recommended send sequence, estimated reply/convert rates

## Scoring rubric

Each row gets 3 scores, each 0–3. Total = `intent × 0.5 + fit × 0.3 + access × 0.2`.

### Intent (0–3) — how hot is their pain right now?

- `3` — Complaint posted in last 30 days, unresolved, active blocker
- `2` — Complaint in last 90 days, resolved but with workaround
- `1` — Mentioned pain >90 days ago
- `0` — No direct pain signal

### Fit (0–3) — how well do they match your ICP?

- `3` — Exact ICP (role, team size, tech stack all match)
- `2` — Adjacent ICP (2 of 3 match)
- `1` — Loose ICP (1 of 3 match)
- `0` — Not ICP

### Access (0–3) — how easily can you reach them?

- `3` — Public email + active on X/LinkedIn + English-speaking
- `2` — Two reach channels available
- `1` — One obscure channel only
- `0` — Effectively anonymous handle

## Tiering

| Tier | Weighted score | Action |
|---|---|---|
| **Tier 1** | ≥2.5 | Personal 1-to-1 outreach by founder, within 7 days |
| **Tier 2** | 1.8–2.4 | Templated-but-personalized outreach, within 3 weeks |
| **Tier 3** | 1.0–1.7 | Bulk outreach with minimal personalization, when Tier 1–2 exhausted |
| **Tier 4** | <1.0 | Drop or park for a later community-building phase |

## Steps

1. **Score each row** across intent / fit / access
2. **Compute weighted score → tier**
3. **Write 1-sentence rationale** per Tier-1 row (why them, why now, what angle)
4. **Capacity-cap Tier 1** — if you have 10 Tier-1 rows but only capacity for 5/week, split across 2 weeks
5. **Write summary** — how many per tier, send sequence, expected reply rate (benchmark: Tier 1 = 30–50%, Tier 2 = 10–20%, Tier 3 = 2–5%)

## Quality bar

- [ ] Every Tier-1 row has a written rationale
- [ ] Tier 1 does not exceed your realistic weekly capacity × 4 (otherwise you burn the list)
- [ ] If Tier 1 is <5 rows, don't stratify — just hand-pick. Stratification is overkill for small pools.

## Anti-patterns

- **Don't skip Tier 1 to "warm up with easy Tier 3 messages."** Tier 1 teaches you what resonates; Tier 3 teaches you only that cold email is hard.
- **Don't let fit override intent.** Perfect ICP + no pain = no reply. Hotter pain + loose ICP converts higher.
- **Don't rank on "followers" or "stars."** Prominence ≠ pain.

## Related

- Upstream skill: [`competitive-intel-mining`](../competitive-intel-mining)
- Downstream skill: [`personalized-cold-outreach`](../personalized-cold-outreach)
- Playbook: [`01-cold-email-campaign`](../../playbooks/01-cold-email-campaign.md)
