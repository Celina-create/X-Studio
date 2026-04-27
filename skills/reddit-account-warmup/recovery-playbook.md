# recovery-playbook

> Things will go wrong: a post will get `[removed]`, a mod will message you, your karma will start dropping. The instinct in every case is to *push back harder* — and that's exactly what kills the account. The right move is almost always **slow down, observe, adjust**.

---

## When a post is `[removed]`

Removed posts are not always a strike. Most are auto-removals by AutoModerator or routine mod cleanup, not a punishment. The danger is **how you react.**

### SOP

1. **Do not repost.** Not the same content, not "edited" content, not in another sub immediately.
2. **Do not message the mods angrily.** The fastest way to escalate from "removed post" to "banned account."
3. **Read the removal reason carefully** — usually shown via Automod auto-comment or a mod note.
4. **Diagnose:**
   - Format issue? (missing flair, wrong tag, link not allowed)
   - Content issue? (rule X.Y violated)
   - Account issue? (minimum karma not met, account too new)
5. **Wait at least 24 hours** before any further activity in that subreddit.
6. **If you genuinely don't understand why**, message the mods politely (one short message) asking what rule applied. Wait for reply. Don't follow up if no reply within 48h.
7. **Two consecutive removals** → **stop posting for 48–72 hours**, switch to comment-only mode.

### What "edit and repost" actually does

Reddit treats edit-and-repost as a fresh signal — usually a *worse* one. Automod has a memory of your removed posts and the new one starts with a strike against it. **Never repost in the same sub within 7 days of a removal.** If the content is genuinely valuable, repost in a *different* sub a week later, with a fresh angle.

---

## When a mod sends you a warning / DM

This is a yellow card. You haven't been banned, but a human is now watching.

### SOP

1. **Don't argue.** Don't sarcasm. Don't "but other people do it." Don't bring up rules-lawyering.
2. **Don't ghost.** A short, calm acknowledgment is the right move.

   > Template:
   > > "Thanks for the heads-up — I missed [rule X], will follow it from now on. Appreciate you taking the time to flag it."

3. **Don't reply more than once.** If they don't respond, don't follow up.
4. **Stop posting in that sub for 7 days.** Continue commenting normally elsewhere.
5. **Audit your recent activity.** What pattern triggered the mod's attention? Quantity? Self-promo signals? Off-topic? Fix it across the account, not just that sub.

### Don't do this

- Reply combatively or "explain yourself" defensively
- Carpet-bomb private DMs to mods asking for clarification
- Start a public meta-post complaining about mods
- Switch to a backup account to keep posting in that sub — Reddit detects ban-evasion and slaps both accounts

---

## When your account feels "shadowed" / throttled

Symptoms:

- New posts hit 0 score and stay there
- Comments get `0` and zero replies even in active threads
- Your profile looks normal to you but logged-out viewers can't see your content

### SOP

1. **Confirm shadow status.** Open an incognito tab, visit `https://reddit.com/user/<your_username>` — if the page shows "page not found" or no content, you're shadowbanned. Otherwise it's likely sub-level Automod throttling, not a global shadow.
2. **If shadowbanned**: appeal via the Reddit help center. Don't keep posting — you're invisible, only further confirming "spam-account behavior" to the classifier.
3. **If not shadowbanned but throttled in specific subs**:
   - Stop posting in those subs entirely for 14 days
   - Continue commenting normally elsewhere
   - Karma in *other* subs accumulating helps recalibrate your account-level signals
4. **Reduce frequency across the board.** If you were posting daily, drop to 2–3 per week.
5. **Diversify.** If 80% of your activity is in one niche, mix in interest subs.
6. **Avoid** any "system-fighting" behavior — alt accounts, VPN-jumping, re-registration. Each escalates the risk.

---

## When karma starts dropping

Two scenarios:

### Scenario A: a single bad post / comment is bleeding

- Find the offender (sort your recent activity by lowest score)
- **Delete it** if the bleeding continues. Deletion stops further downvotes from that thread.
- Take a 48-hour pause from posting in that sub

### Scenario B: account-wide karma decay

If multiple recent comments are at -3 to -5 and you can't identify a single cause:

- You probably started commenting in a sub with a hostile sub-culture. Disengage from it for 14 days.
- Or you started a "tone shift" (e.g., went from useful → snarky) — review the last 10 comments and ask "would I upvote this?"
- Increase **passive activity** (browsing, light upvoting) and **decrease output** for 1 week. Karma usually stabilizes.

---

## When Automod auto-removes everything you write

This typically means one of:

1. **Account is too new** for the sub (sub has minimum age requirement, often 30/60/90 days)
2. **Account karma is below sub's minimum** (often 50/100/500)
3. **Your account has a "shadowed" classification** at the Reddit-level
4. **The sub Automod has flagged your username/IP/email pattern** specifically

### Diagnosis flow

```
Step 1: Try posting in r/test or r/CasualConversation
   └─ Works? → Sub-specific issue (likely karma/age threshold)
   └─ Fails everywhere? → Step 2

Step 2: Check incognito-tab visibility (see "shadowed/throttled" section)
   └─ Visible? → Account-level signals are off; reduce activity 14 days
   └─ Invisible? → Shadowbanned; appeal via help center

Step 3: If posts are visible but always 0 score in your home subs
   └─ Likely "low quality" classifier flag
   └─ Switch to comment-only for 4 weeks, write only high-quality replies
```

---

## When it's actually a permaban

Symptoms:

- "This account has been suspended" page on your profile
- Cannot log in / cannot post anywhere
- Email from Reddit Trust & Safety

### What to do

1. **Read the email.** It will state the rule violated.
2. **Appeal once**, calmly, via the link in the email. Don't appeal twice — the second appeal is rarely read.
3. **Do not** create a new account from the same device + IP within 72 hours. Reddit will associate them.
4. **Do not** create a new account at all if the ban was for vote manipulation or evasion — those are permanent identity bans.
5. **If you genuinely violated a rule unknowingly**, accept it. The account is gone. Take the lesson.

---

## FAQs (from real-world running of this playbook)

### Q1: I have a banned account on this device. Can I register a new one?

You **can**, but you need to:

- Switch device or factory-reset the current one
- Switch IP (different network entirely, not just VPN exit node)
- Wait at least 48–72 hours after the previous ban
- Register the new account with a different email + phone number

Even with all of these, the new account is "associated" probabilistically. Treat it as risky and warm it up extra carefully.

### Q2: Can I bind Reddit to Google / Apple SSO?

You can, but only one account per Google or Apple account. **If the SSO account ever gets banned, you lose the binding permanently** — the next account on the same Google/Apple ID also gets flagged.

**Recommended**: register with a fresh Gmail address per Reddit account, never SSO.

### Q3: Can I reuse a phone number / email after deleting the old account?

**No, and don't try.** Reddit retains identity hashes after deletion. A new account using the same phone or email is associated with the deleted account from minute one.

Every fresh account = fresh email + fresh phone. Treat them as one-shot identifiers.

### Q4: I bought an aged account. Can I just start posting?

**Don't.** Aged accounts have a behavior fingerprint from the previous owner. The moment you start posting in a different niche / different style / different time-of-day pattern, Reddit's classifier sees the discontinuity and flags it. Most bought-aged-accounts get shadowbanned within 2 weeks.

If you must use one: pretend it's a brand-new account and re-do the full 6-week warm-up cycle. The aged karma stops being an asset and starts being a liability if you post anything that doesn't match the previous owner's pattern.

### Q5: Is comment karma transferable across accounts?

**No.** Karma is per-account; there is no aggregation. Don't think you can "warm up an alt account quickly because main has karma."

### Q6: My post got `[removed by Reddit]` (not by mods). What happened?

Site-wide moderation. Almost always one of:

- Vote manipulation suspicion
- Spam pattern detection
- Trust & Safety flag (CSAM, harassment, doxx — rare but the harshest)

These are much more serious than mod removals. **Do not repost. Do not appeal aggressively.** Wait 7 days, audit your recent activity, and if it happens twice, treat the account as compromised.

---

## Recovery cadence summary

| Event | Pause length | Mode after pause |
|---|---|---|
| Single removed post | 24 hours | Continue commenting normally |
| Two consecutive removed posts | 48–72 hours | Comment-only for 7 days |
| Mod warning / DM | 7 days in that sub | Continue elsewhere normally |
| Suspected throttle | 14 days in affected subs | Light commenting elsewhere |
| Shadowban confirmed | Stop posting completely | Appeal, then wait |
| Permaban | Account is gone | Don't re-register on same device for 72h |

---

## Related

- Parent: [`SKILL.md`](./SKILL.md)
- Avoid being here in the first place: [`pre-post-checklist.md`](./pre-post-checklist.md)
- Behaviors that get you here fast: [`high-risk-actions.md`](./high-risk-actions.md)
- Context for what's normal: [`6-week-workflow.md`](./6-week-workflow.md)
