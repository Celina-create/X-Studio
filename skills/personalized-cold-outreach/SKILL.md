# personalized-cold-outreach

**Purpose** — Generate 1-to-1 personalized outreach messages at batch scale. Each message quotes the recipient's own words back to them, references a specific pain they've expressed, and offers a concrete next step.

**Triggers** — "personalize cold emails for <pool>", "write outreach for this CSV", "1-to-1 message for each row in <file>"

**Why this beats a mailmerge** — Standard mailmerge replaces `{{name}}`. This skill generates 3–5 personalized sentences per recipient referencing their actual public pain statements. Reply rates are typically 3–10× standard cold email.

---

## Inputs

- **Seed CSV** from [`competitive-intel-mining`](../competitive-intel-mining) — must include `handle`, `source_url`, `exact_quote`, `pain_category`
- **Your pitch** — 2–3 sentences describing what you'd show the recipient if they replied (not your full product tour)
- **Message channel** — email / X DM / GitHub issue / LinkedIn
- **CTA** — what action you want them to take (reply / book call / click pre-filled issue / watch 3-min Loom)

## Outputs

- A CSV enriched with columns: `subject`, `opening`, `pain_mirror`, `pitch_line`, `cta`, `pre_filled_url` (if applicable), `send_batch`
- A review list of the 5 best and 5 worst generated messages for manual tuning before batch send

## Steps

1. **Read row + source URL** — For each recipient, pull the `exact_quote` and (optionally) re-open the source URL for 1–2 adjacent sentences of context.
2. **Draft opening** — 1 sentence referring to *the specific place you found them* ("saw your Paperclip #447 thread"). Never generic ("I noticed you").
3. **Draft pain mirror** — 1–2 sentences quoting their own words and naming the underlying pain ("you said 'agent panics when sandbox rejects bash' — that's the class of bug that comes from X").
4. **Draft pitch line** — 1 sentence only. What you'd show them if they replied. Concrete, not abstract.
5. **Draft CTA** — 1 specific next step with near-zero friction. Examples:
   - "Want a 3-min Loom tailored to your case? Reply y/n."
   - "Open a pre-filled issue with what breaks today — <URL>"
   - "Reply with a screenshot of your current agent config"
6. **Sign-off** — First name only. No title, no links in signature.
7. **Quality check each message** against the rules below. Regenerate if any fail.
8. **Batch output** — Group into send batches of ≤10 per day per channel to avoid spam filters / rate limits.

## Quality bar (per message)

- [ ] ≤120 words total
- [ ] Zero generic phrases ("I hope this finds you well", "I came across your profile")
- [ ] Exact quote from their words appears verbatim once
- [ ] Subject line is <50 chars and references something specific to them
- [ ] CTA is a single verb + ≤15 words
- [ ] If possible, includes a pre-filled URL so they can reply with 1 click

## Message template (default)

```
Subject: <specific thing from their post, e.g., "The Paperclip #447 panic">

Hey {{name}},

Saw your {{source}} where you wrote: "{{exact_quote}}"

That's the class of pain that happens because {{one-line technical/strategic take}}.

I've been working on {{one-line pitch}} — here's what I'd show you if it helps:
{{pre_filled_url}}  (30 seconds, no signup)

Worth a look?

—{{your_first_name}}
```

## Anti-patterns

- **Don't use "I think" or "I believe"** — they read as low-confidence. State the observation.
- **Don't close with "let me know if you're interested"** — it's a weak CTA. Use a specific verb.
- **Don't send on Monday morning** — inbox is overloaded. Tuesday–Thursday 10am recipient local time performs best.
- **Don't A/B 10 variants** — pick one good message, iterate after 20 replies.

## Related

- Skill: [`competitive-intel-mining`](../competitive-intel-mining) — source of the input CSV
- Skill: [`landing-to-issue-funnel`](../landing-to-issue-funnel) — for the `pre_filled_url` pattern
- Template: [`templates/cold-email/`](../../templates/cold-email) — raw message templates
- Playbook: [`01-cold-email-campaign`](../../playbooks/01-cold-email-campaign.md)
