# Open-Source DevRel — A 4-Piece Operating System

> Most open-source projects "do DevRel" by writing a CONTRIBUTING.md and hoping. This is what doing it *systematically* looks like.

These four playbooks compose into a **complete contributor flywheel** — from "stranger lands on your repo" to "Core Contributor with a LinkedIn certificate."

```
                    ┌─────────────────────────────────────┐
                    │                                     │
            ┌───────▼──────────┐               ┌──────────┴───────────┐
            │ 02 · Issue       │               │ 03 · Recognition     │
            │   Pipeline SOP   │               │   System             │
            │                  │               │                      │
            │ • lifecycle      │               │ • README wall        │
            │ • triage bot     │               │ • monthly spotlight  │
            │ • 24h SLA        │               │ • points leaderboard │
            │ • health checks  │               │ • certificates       │
            └────────┬─────────┘               │ • affiliate program  │
                     │                         └──────────▲───────────┘
                     │                                    │
                     ▼                                    │
            ┌──────────────────┐               ┌──────────┴───────────┐
            │ 01 · Good First  │               │ 04 · PR Layer        │
            │   Issue System   │──contributor─▶│   Operations         │
            │                  │   picks up    │                      │
            │ • detection      │               │ • step-by-step guide │
            │   formula        │               │ • PR template        │
            │ • label matrix   │               │ • mentor SLA         │
            │ • mentor map     │               │ • commit conventions │
            │ • AI prompts     │               │ • review etiquette   │
            └──────────────────┘               └──────────────────────┘
                          PR merged → points awarded → recognition triggered → loop
```

---

## When to use this stack

| You are... | Read in this order |
|---|---|
| Setting up a brand-new open source project | 02 → 01 → 04 → 03 |
| Already have a repo + GitHub Actions, want better triage | 02 → 04 |
| Have contributors but losing them after first PR | 03 → 01 |
| Have first-PR contributors but no second-PR retention | 03 → 04 |
| Want to attract students / build resume value | 03 (focus: certificates) |

---

## What you don't need to read first

These playbooks are **opinionated** but **not religious**. Skip what doesn't fit:

- **No paid product?** → Skip the Affiliate section in `03`. Keep certificates and recognition.
- **Solo maintainer, no mentor team?** → In `01`, just be your own mentor for all areas; the SLA still helps.
- **No money for swag?** → In `03`, certificates + leaderboard alone work surprisingly well for student contributors.

---

## Battle-tested?

Yes. Every framework in these 4 playbooks has been **shipped in a real open-source project** — including the Good First Issue formula `(B AND C) AND (A OR D)`, the 24h response SLA, the contribution pool health checks, and the all-contributors + monthly leaderboard combo.

What's been removed for X-Studio: project-specific issue numbers, real mentor names, internal team assignments, product-specific UI strings. What's been kept: every formula, template, label color, SLA timing, and ratio that actually matters.

---

## How to fork this stack

1. Copy these 4 files to your own repo (or link back here)
2. Rename `<your-project>` → your project name everywhere
3. Pick the **smallest viable subset** for your stage:
   - Pre-launch: just `01` (define what GFI means)
   - First 10 contributors: add `04` (PR process)
   - First 100 contributors: add `02` and `03`
4. Don't copy the success metrics blindly — set your own M1/M2/M3 numbers based on your starting point

---

## Related

- [`../00-competitive-seed-pipeline.md`](../00-competitive-seed-pipeline.md) — sister playbook for *acquisition*-side ops
- [`../../skills/`](../../skills) — atomic skills you can compose into these playbooks
- [`../../research/`](../../research) — ecosystem signals that inform "what kind of contributor are you trying to attract"
