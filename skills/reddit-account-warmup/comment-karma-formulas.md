# comment-karma-formulas

> Why comments matter more than posts for new accounts: comment karma reads as a "participation quality record" to Reddit's classifier and to most subreddit Automods. Two accounts at 230 total karma — one earned via comments, one via posts — behave very differently.

---

## The karma asymmetry (why comment-first works)

Three accounts, all at 230 total karma:

| Account | Post karma | Comment karma | Stability rank |
|---|---|---|---|
| A | 100 | 130 | Middle |
| B | 200 | 30 | **Worst** |
| C | 30 | 200 | **Best** |

**Stability + posting privilege ranking: C > A > B.**

Why? Comment karma is harder to fake and reads as "this person has been participating in conversations." Many subreddits gate posting privileges on a minimum comment karma threshold (sometimes unstated). A high-post-karma + low-comment-karma profile is the signature of a one-shot promo account.

**Conclusion**: in the new-account window, prioritize comment karma. It's the better long-term investment.

---

## Subreddit selection priority (which subs to comment in)

Pick subs in this order:

1. **High-engagement, casual subs** — communities where people *enjoy* upvoting and replying. Comments here actually get traction.
2. **Active subs (lots of fresh comments)** — your reply has a chance of being read; in a dead sub it's just shouting at archives.
3. **Large traffic subs** — counterintuitively, **save these for last**. Big subs have heavy Automod, ruthless mods, and your comment is one of 200 — the karma yield per minute is low.

### Newcomer-friendly subs (Reddit's official list)

[https://www.reddit.com/r/NewToReddit/wiki/index/newusersubs](https://www.reddit.com/r/NewToReddit/wiki/index/newusersubs)

Reliable starters:

- `r/AskReddit`
- `r/CasualConversation`
- `r/NewToReddit`
- `r/cats` / `r/aww`
- `r/gaming`
- `r/meme` / `r/funny`
- `r/Advice`

**Even "newcomer-friendly" subs have rules.** Read the sidebar before commenting — some restrict title formats, some require flair, some auto-remove low-effort comments under N words.

---

## The karma formula — what gets upvotes

Every high-performing comment hits at least one of these four notes:

### 1. **Useful**

Concrete advice, exact steps, specific resource links, lessons from your own experience.

> ❌ "Try Postgres."  
> ✅ "I had the same setup last year — Postgres worked great until ~10M rows then we needed connection pooling. Used PgBouncer, here's the config: …"

### 2. **Funny**

Light humor, double meaning, contemporary culture reference. **Do not force it** — corny humor on Reddit gets downvoted harder than no humor.

> ❌ "lol same xD"  
> ✅ "[Reads job description] [requires 5+ years of experience in framework released last March]"

### 3. **Empathic**

Acknowledge what the OP is feeling first, then offer something. Best response pattern for vent posts and personal-story posts.

> ❌ "You should just talk to your manager."  
> ✅ "That's exhausting — especially when you can tell something's off but no one will name it. One thing that helped me in a similar spot: …"

### 4. **Non-divisive**

Stay neutral. If a discussion has two camps, contributing to both sides without picking one earns more karma than a strong stance — and avoids downvote brigades from the opposing camp.

> ❌ "Vim is just objectively better."  
> ✅ "I went vim → vscode → cursor over the years. They all win in different contexts — vim still wins for remote/server work, cursor for big refactors."

---

## Comment hygiene rules

- **No "+1", "this", "lol", "same"** as standalone comments — Reddit's spam filter penalizes these and so do users
- **No emojis as the whole comment**. Many subs auto-downvote standalone-emoji replies. Plain `:)` is safer than `🙂`
- **Don't say "I upvoted you" or "give this man an award"** — counts as voting noise
- **Avoid quote-and-respond format** for short comments — bloats the thread, adds no value
- **Don't be the seventh person to make the same joke** under a top comment

---

## The 3 > 30 rule

For new accounts, the safest karma-growth strategy is:

> **3 high-quality comments per day > 30 low-effort filler comments.**

Why this is asymmetric:

- **3 quality comments** = ~3–8 upvotes each = +9 to +24 karma, zero downvote risk, zero mod attention, zero Automod flags
- **30 filler comments** = ~0–1 upvotes each, multiple downvotes, possible negative net karma, mod attention, Automod flag for "low-quality posting pattern"

If you can only spare 5 minutes today, write **one** thoughtful comment. Don't dilute with filler.

---

## Comment-by-design template

Use this structure when you don't know how to start:

```
[Acknowledgment / empathy — 1 sentence]
[Your specific experience / data point — 1–3 sentences]
[A small, useful suggestion or open question — 1 sentence]
```

This formula gets upvotes consistently because it (a) makes the OP feel seen, (b) adds new info to the thread, (c) opens further conversation.

---

## Day-of comment routine (15 minutes / day)

For weeks 2–6 of the [`6-week-workflow.md`](./6-week-workflow.md):

1. **0–2 min**: open Reddit, scroll your home subs, read 3–5 fresh threads
2. **2–5 min**: pick the 3 threads where you have something genuinely useful to say
3. **5–13 min**: write 3 comments using the template above
4. **13–15 min**: 2–3 minutes of upvoting comments / posts you actually liked
5. **Done.** Don't keep scrolling — that's how you trip into a "burst of activity" pattern.

---

## Common comment failure modes

| Symptom | What's actually happening | Fix |
|---|---|---|
| Comment gets 0 score and no replies | Comment was generic, didn't add new info | Add specifics next time |
| Comment gets downvoted to negative | Took a strong side in a divisive thread, OR low-effort | Stay neutral, add value |
| Comment gets removed silently | Hit subreddit-specific Automod (banned word, length, link) | Read sub rules; ask mods if you can't see why |
| Account starts to lose karma overall | Probably negative-karma comments piling up | Review last 10 comments; delete the worst before they tank you |

---

## Related

- Parent: [`SKILL.md`](./SKILL.md)
- Where comments fit in the schedule: [`6-week-workflow.md`](./6-week-workflow.md)
- Higher-stakes activity: [`pre-post-checklist.md`](./pre-post-checklist.md)
- When something goes wrong: [`recovery-playbook.md`](./recovery-playbook.md)
