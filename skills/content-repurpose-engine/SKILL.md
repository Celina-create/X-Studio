# content-repurpose-engine

**Purpose** — Take one insight / learning / event and produce platform-native versions for X (EN), X (ZH), long-form blog, LinkedIn, and video hook — each adapted to the platform's format, not just reposted.

**Triggers** — "repurpose this into threads", "turn this into content", "multi-platform post this insight"

**Why this matters** — Reposting the same 280 chars to 5 platforms dilutes reach on all 5. Platform-native adaptation takes 3× the effort but 5–10× the traction.

---

## Inputs

- **Source insight** — 1 paragraph + (optionally) supporting data / screenshot / code snippet
- **Target platforms** — subset of: X-EN, X-ZH, LinkedIn, blog, video hook (script only)
- **Voice sample** (optional but strongly recommended) — 2–3 past posts in your voice for tone calibration

## Outputs

Per target platform, one draft file:

- `x-en.md` — single-tweet + thread variant
- `x-zh.md` — single-tweet + thread variant  
- `linkedin.md` — 1 long-form post (800–1200 chars)
- `blog.md` — 600–1200 words, SEO-conscious heading structure
- `video-hook.md` — first 8 seconds script + outline for 60-second video

Plus `cross-posting-notes.md` — what to post where, in what order, with what interval.

## Steps

1. **Read source + voice samples.** Identify the ONE point worth making. Kill any urge to cram multiple points.
2. **Draft each platform sequentially**, not in parallel. Each platform has its own shape:

### X-EN (single tweet)

- Max 280 chars
- Hook in first line. No "As AI evolves…" openings.
- Single concrete claim + evidence, OR one counter-intuitive take
- End with the most quotable sentence (not a question)

### X-EN (thread)

- 5–9 tweets
- Tweet 1 = strong hook + promise payoff
- Tweets 2–N = one claim + one line of evidence per tweet
- Last tweet = either a single practical takeaway or a soft CTA (link / follow)

### X-ZH

- 不是 X-EN 的翻译。重写
- 250–280 字（中文 tweet 字数不同）
- 保留技术名词的英文原文，行文口语化
- 避免"大家好"、"今天给大家分享"等套话

### LinkedIn

- 800–1200 chars
- Start with a strong 1-line hook (first 210 chars shown before "see more")
- Use short paragraphs (1–2 lines each)
- 1 concrete story > 3 abstract claims
- Soft CTA at end (not "DM me for consulting")

### Blog

- 600–1200 words
- H2 structure: Problem → Framework → Example → Takeaway
- First paragraph = TL;DR in 2 sentences
- Canonical link to source insight if it's from a repo / case study

### Video hook

- First 8 seconds must state the counter-intuitive claim
- Outline: hook (8s) → setup (20s) → demonstration (25s) → takeaway (7s)
- Include B-roll / screen-capture notes

## Quality bar

- [ ] No platform post reuses another platform's opening line verbatim
- [ ] X-ZH is not a machine translation of X-EN
- [ ] LinkedIn doesn't open with "🚀 Excited to share…"
- [ ] Blog has canonical URL / citations for any non-original data
- [ ] Cross-posting notes specify at least 6-hour gaps between platforms

## Anti-patterns

- **Don't post to all platforms in the same hour.** Spread by ≥6h to let each breathe.
- **Don't reply to your own thread on day 2 with "update:".** Post a new thread instead.
- **Don't use emojis as bullet points on LinkedIn.** It reads as LinkedIn-influencer slop.
- **Don't write X-ZH as a translation.** Native rewriting is 10× the impact.

## Related

- Skill: [`growth-experiment-template`](../growth-experiment-template) — for measuring which format worked
- Playbook: (none yet — TBD)
