# 6-week-workflow

> Daily routine for warming a fresh Reddit account from Day 1 → Week 6. The single most important rule: **slow is fast**.

---

## Device & environment SOP (set up before Day 1)

Stability of identity matters more than which device you choose. The two real failure modes are (a) Reddit thinks you're a bot, (b) Reddit thinks you're one of multiple accounts on the same fingerprint.

### Device

| Use case | Recommended | Why |
|---|---|---|
| Day-to-day posting / commenting | **Mobile app (iOS/Android)** | Behaves more like a "normal user", auto-fills metadata cleanly |
| Browsing / drafting / mod work | **Desktop browser** | Easier to read sub rules, manage flair, prepare drafts |
| Multi-account on same device | **❌ Never** | One device = one account. Period. |

**Don't switch your "main posting" device often.** Pick one and stick to it for at least the first 6 weeks.

### Network / VPN

- If you must use a VPN: **comment interval ≥ 8 minutes**. Faster = bot-shaped behavior pattern.
- VPN must be a **static IP** and serve **at most 3 Reddit accounts ever**. Dirty/shared VPN IPs are pre-classified by Reddit risk control and your account is dead on arrival.
- For users in mainland China: a **physical overseas SIM / data card** is significantly cleaner than any commercial VPN.
- **First 4–6 weeks**, do not:
  - Frequently switch country / exit node
  - Frequently switch device
  - Operate any other Reddit account from the same device in the same time window

### IP self-check

Run [https://ping0.cc/](https://ping0.cc/) before signup and weekly during Week 1–2. You want:

- IP type: **Residential / 家庭宽带IP**
- Risk score: **< 20%** (green / "extremely clean")
- Native IP: **YES** (not a tunneled/proxied IP)

If your IP shows red on these, fix the network *before* registration — registering on a flagged IP often means the account is shadowbanned from minute one.

---

## Day 1 — Registration

1. Use your **stable** network environment (don't register on coffee-shop wifi then post from home — Reddit notes the IP swap).
2. Register **with email** (Gmail strongly preferred over Apple/Google SSO — SSO ties Reddit identity to that Google account permanently; if either is ever banned, both are gone).
3. Complete email verification.
4. Set the most basic profile only:
   - Username (looks like a real person, no `growth_xxx`/`marketing_xxx` patterns)
   - Avatar (simple, real-looking)
   - One-line bio
   - **No external links. No social-media handles. No marketing language.**

**Hard rule for Day 1**: do nothing else. No commenting, no posting, no upvoting. Just register and walk away.

---

## Week 1 — Quiet & light interaction

> Goal: look like someone who just discovered Reddit and is reading.

### Day 1–3 — Pure browsing

- Browse 5–10 minutes per day, no actions
- Read posts in any subreddits that interest you
- **Do not vote, do not comment, do not save**

### Day 4–7 — Light voting

- 2–3 upvotes per day, in different subs
- Read sidebar rules of any sub you might care about long-term
- Still no comments, still no posts

**Why so passive?** Reddit's anti-spam classifier has a "newborn account behavior fingerprint." Accounts that immediately post / comment / upvote-blast in their first 24 hours look like throwaway promo accounts, even if the content is fine.

---

## Week 2 — Comment karma offensive (target ≥ 50)

> Goal: comment karma 0 → 50, building real interaction history.

- **5–10 comments per day** (VPN users: keep ≥ 8 minutes between any two)
- Comments should genuinely add value — see [`comment-karma-formulas.md`](./comment-karma-formulas.md)
- Spread across **3–5 subreddits**, not concentrated in one
- **Still zero posts**
- Daily 60-second self-check: did any of my comments get heavily downvoted? (If yes, course-correct tomorrow)

**Common failure:** trying to "be funny" too early. New accounts have zero meme credit. Stick to **useful + empathic** voice in Week 2 — humor lands harder once you have history.

---

## Week 3 — Continue commenting, observe

- Maintain Week 2 cadence (5–10 comments/day)
- Start identifying which 3–5 subs feel like home base — subs where:
  - You enjoy reading
  - Your comments get any positive engagement
  - The unwritten norms are visible to you
- **Still zero posts**

By end of Week 3, comment karma should be in the **80–150 range** if you've been writing real comments and not low-effort fillers.

---

## Week 4 — First posts (carefully)

> Goal: 2–3 posts total this week. **Spread them out**, never two in a row.

- **Run [`pre-post-checklist.md`](./pre-post-checklist.md) before every single post**
- Choose one of your home-base subs that:
  - Doesn't have an explicit "minimum karma" rule blocking you
  - Welcomes question / discussion posts (most newcomer-friendly format)
  - Has visible Automod activity but isn't in heavy-removal mode
- If your post gets `[removed]`:
  - **Immediately stop posting for 48–72 hours**
  - Switch back to comment-only mode
  - Read [`recovery-playbook.md`](./recovery-playbook.md)
  - Do **not** repost the same content — even after editing

**Don't try to be popular. Aim for "didn't get removed."**

---

## Week 5 — Frequency tuning (max 1 post / day)

- Continue comments as primary activity (still ~5–10/day)
- **Maximum 1 post per day**, and not every day
- Maintain ratio: roughly **8 comments : 1 post**
- Still no marketing, still no self-links, still no obvious self-promotion
- Start observing: which post format gets traction in your home subs? Question? Personal story? Resource share?

---

## Week 6 — Long-term cadence

> Goal: lock in a sustainable rhythm you can run for months.

- **Lock 3–5 home-base subreddits** where you post most often
- **Add 5–10 interest subreddits** where you only comment (variety makes you look real)
- Daily target: ≥ 5 comments, ≤ 1 post
- Profile audit:
  - Bio still simple? (no "founder of X", no link to landing page)
  - Recent activity reads as "human with hobbies"?
  - Any obvious "all my activity is in <one niche>" pattern? (red flag — diversify)

By end of Week 6 you have an **operational, low-risk account**. Now you can start using it for the actual purpose — but every "purpose" action (sharing your project, etc.) still has to pass the pre-post checklist.

---

## Profile maintenance (ongoing, after Week 6)

The goal is **not "look polished"** — polished accounts read as marketing. The goal is **"reduce signals that you're a single-purpose throwaway."**

- **Avatar + bio**: simple, like a normal user. No link spam. No promotion.
- **External links in profile**: extreme caution in the new-account window; even at Week 6+, putting a project link in your profile is the #1 way to get classified as a spam account.
- **Activity distribution**: never post-only into one subject or one subreddit
- **Natural rhythm**: interest subs + main-base subs interleaved. Avoid "burst posting" patterns (suddenly 10 actions in 30 minutes).

---

## Cadence cheat sheet (printable)

| Phase | Days | Comments/day | Posts/day | Notes |
|---|---|---|---|---|
| Day 1 | 1 | 0 | 0 | Register only, walk away |
| Week 1 (early) | 2–3 | 0 | 0 | Pure browsing |
| Week 1 (late) | 4–7 | 0 | 0 | 2–3 upvotes/day |
| Week 2 | 8–14 | 5–10 | 0 | Comment karma → 50 |
| Week 3 | 15–21 | 5–10 | 0 | Identify home subs |
| Week 4 | 22–28 | 5–10 | 0–1 | First 2–3 posts; pre-post checklist mandatory |
| Week 5 | 29–35 | 5–10 | 0–1 | Max 1 post/day |
| Week 6+ | 36+ | ≥ 5 | ≤ 1 | Long-term sustainable |

---

## Related

- Parent: [`SKILL.md`](./SKILL.md)
- Pre-flight: [`pre-post-checklist.md`](./pre-post-checklist.md)
- Comment strategy: [`comment-karma-formulas.md`](./comment-karma-formulas.md)
- When things break: [`recovery-playbook.md`](./recovery-playbook.md)
- What never to do: [`high-risk-actions.md`](./high-risk-actions.md)
