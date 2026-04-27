# high-risk-actions

> Reddit's penalty system is layered. The same action might be invisible in one subreddit, mod-removed in a second, and Reddit-wide-banned from a third. Knowing **which layer** an action threatens — and what each layer can do to you — is the difference between losing a post and losing the account.

---

## The 3 layers of Reddit rules

```
┌─────────────────────────────────────────────────────────┐
│ Layer 1: Sitewide rules (Reddit Inc.)                   │
│   Penalty range: account suspension → permanent ban     │
│   Examples: vote manipulation, harassment, ban evasion  │
├─────────────────────────────────────────────────────────┤
│ Layer 2: Subreddit rules (each sub's mods + Automod)    │
│   Penalty range: post removal → sub ban                 │
│   Examples: minimum karma, no links, required flair     │
├─────────────────────────────────────────────────────────┤
│ Layer 3: Reddiquette (community etiquette norms)        │
│   Penalty range: downvotes, comment ratios              │
│   Examples: emoji-spam, "+1" comments, link-jack        │
└─────────────────────────────────────────────────────────┘
```

The further up the layer, the harsher the penalty. **Most account deaths happen at Layer 1 by accident** — operators thought they were just "asking friends to upvote" but Reddit calls that vote manipulation, full stop.

---

## Layer 1 — Sitewide rules (account-fatal)

Violating any of these can result in **account suspension or permanent ban**. There is rarely a warning.

### Hard bans

| Action | Why it's banned | What happens |
|---|---|---|
| **Vote manipulation** | Asking friends/groups to upvote your post; using vote-exchange chats; running upvote bots | Permaban + IP/device flag |
| **Coordinated brigading** | Linking from one sub to another to vote/comment-bomb | Permaban for organizer; sub-ban for participants |
| **Multi-account from one IP/device** | Running 2+ accounts on same fingerprint | All accounts permabanned |
| **Ban evasion** | Creating new account after ban to keep posting in same sub | New account + old account permabanned |
| **Spam** | Bulk same-content posting; bot-driven posts | Permaban |
| **Harassment / threats** | Targeting individuals, doxxing | Permaban + Trust & Safety review |
| **Hate speech** | Slurs, dehumanizing language, organized hate | Permaban |
| **Sexual content involving minors** | CSAM | Permaban + law enforcement referral |

### High-risk gray zones

These aren't auto-bans, but they put you on Reddit's watchlist. Three flags = ban.

- **Buying / selling karma or accounts** — bannable when caught
- **Promotional posts disguised as discussion** — repeated offenses → ban
- **Astroturfing** — operating multiple accounts to fake organic discussion → ban
- **Excessive self-promotion** — Reddit's official guideline is the **"9:1 rule"** (≥9 non-promotional posts per 1 self-promotional) — repeated violations → ban

---

## Layer 2 — Subreddit-level rules (post-fatal, sometimes account-fatal)

Each sub has its own rules + an Automod config you can't see. Violations remove your post and potentially ban you from that sub.

### Common explicit rules

- **Minimum account karma** (often 50–500)
- **Minimum account age** (often 30–90 days)
- **Required post flair**
- **No external links** (or "domain whitelist only")
- **No question-format titles** (some discussion subs)
- **No `[help]` posts without `[solved]` follow-ups** (some technical subs)
- **No reposting content from last 30 days**

### Common hidden rules (Automod-enforced, not in sidebar)

- **Title length limits** (e.g., between 20–150 chars)
- **Banned words / regex matches** in title or body
- **Comment-to-post ratio thresholds** (Automod auto-removes posts from "mostly silent" accounts)
- **Pattern fingerprinting** — accounts that post in certain "spam pattern" subs first get auto-removed in others
- **Time-of-day filters** (some subs auto-remove posts during overnight hours when mods are inactive)

**Lesson**: every sub's actual rules are bigger than its sidebar. The only safe move is **comment first to learn the sub**, then post.

---

## Layer 3 — Reddiquette (downvote-fatal, not ban-fatal)

These are social norms, not enforced rules. Violating them doesn't ban you — but it tanks your karma and brands you as a "low-quality account" to mods (which then increases your Layer 2 risk).

### Post anti-patterns

| ❌ Don't | Why |
|---|---|
| Hint / beg for upvotes | "Give me some love!", "Help this hit the front page!" — instant downvote target |
| Bribe with rewards | "If this hits 500 upvotes I'll do X" |
| Coordinated voting requests | "Pls upvote/downvote this" — also a Layer 1 risk |
| Spreading misinformation | Community usually piles on with mass downvotes + reports |
| Burst-post the New queue | Multiple posts in 30 min = Reddit classifies your account as spam |
| ALL CAPS titles | Almost never works |
| Subjective stance in title | "X is terrible" → divisive, downvoted |
| Time-urgency words | "BREAKING / Just happened / URGENT" → triggers Automod in news/tech subs |
| Link-jack | Linking to your own blog where the actual content is just a copy of someone else's | 

### Comment anti-patterns

| ❌ Don't | Why |
|---|---|
| One-word low-effort replies | `lol`, `+1`, `same`, `this` — downvoted on principle |
| Standalone emoji as the comment | Many subs auto-downvote emojis; `:)` text is safer than `🙂` |
| "I upvoted you" / "I downvoted you" | Voting noise, instantly downvoted |
| Quote-and-respond for short comments | Bloats threads, no value added |
| Repeat the same joke under top comment | Instant downvote |
| Begging for awards | "Where's my Reddit gold?" — guaranteed downvote |

---

## High-risk behaviors most operators don't realize are risky

These are the "silent killers" — actions that *feel* harmless but are tracked.

### 1. Posting your own product / project / link in your first month

Even if the link is genuinely valuable, doing this in week 1–4 trips multiple Automods. Wait until **after Week 6** and even then, the post should be **9 to 1 dominated by community contribution**.

### 2. Asking the same question across 3+ subs in 24h

Reddit's classifier sees crosspost / similar-content patterns. **Spread crosspost to ≥ 7 days apart.**

### 3. Sudden activity bursts after long inactivity

Account dormant for 2 weeks → suddenly 20 actions in 30 minutes = bot signature. **Ramp up over 2–3 days** after any pause.

### 4. Switching country / VPN exit between sessions

A 12-hour switch from `us-east` to `de-frankfurt` is a strong "account compromised or shared" signal. **Stay on one exit IP per session, ideally per week.**

### 5. Voting on every comment in a thread you posted in

Reddit tracks vote-coupling. Voting up every reply you got + voting down every reply on the opposing comment is a strong "self-supporter" pattern. **Only vote on content you'd vote on if you had no stake.**

### 6. Posting similar self-content via different accounts on same device

The "I'll just use my alt for this one" thinking. Reddit will associate the alt within 48 hours. Both burn together.

### 7. Repeatedly editing posts after submission

A few edits is normal. 10+ edits in 30 minutes is "trying to evade Automod" pattern. Get the post right *before* you publish.

### 8. Privately DMing mods to push back on a removal

Mods discuss problem users in private channels (modmail-internal). One pushy DM gets you flagged across the entire mod team's other subs.

---

## What to do instead (the inverse playbook)

The mirror of "high-risk" is "low-risk-high-yield." If you're ever unsure whether to do something, replace it with the corresponding low-risk action:

| Tempting action | Low-risk substitute |
|---|---|
| Cross-post to 5 subs | Post to 1 sub, comment in others |
| Promote your project | Talk about a *learning from building* the project, no link |
| Argue with downvoters | Disengage, post elsewhere next week |
| Use VPN to bypass sub ban | Wait 30 days, change behavior, try a related sub |
| Buy aged account | Spend 6 weeks warming a fresh one (cheaper, more durable) |
| Ask friends to upvote | Post at a time when *real* readers are active in that sub |
| Edit post 10× | Save draft → run pre-post-checklist → post once |
| DM mod aggressively | Apologize once or stay silent |

---

## The core mental model

> Reddit's anti-spam system isn't trying to catch *bad content*. It's trying to catch *bad behavior patterns*.
>
> Two operators with identical content — one acting human (slow, varied, conversational), one acting like a bot (fast, repetitive, single-purpose) — get treated radically differently.
>
> The whole skill is: **act human, even when an agent could technically run it for you.** That's why this stays a skill and not an agent.

---

## Related

- Parent: [`SKILL.md`](./SKILL.md)
- The official Reddit user agreement: [https://www.redditinc.com/policies/user-agreement](https://www.redditinc.com/policies/user-agreement)
- The official Reddit content policy: [https://www.redditinc.com/policies/content-policy](https://www.redditinc.com/policies/content-policy)
- What to do if you tripped one: [`recovery-playbook.md`](./recovery-playbook.md)
- How to avoid tripping one: [`pre-post-checklist.md`](./pre-post-checklist.md)
