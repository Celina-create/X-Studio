---
title: Contributor Recognition System
date: 2026-04
type: playbook / open-source-devrel · piece 3 of 4
status: shipped (battle-tested in production)
goal: 4-layer recognition (acknowledgment → certification → economic incentive → community status) that drives 0→100 contributor growth
---

# Contributor Recognition — A 4-Layer Incentive Stack

> Every "thanks for the PR!" comment is appreciated once. Recognition that compounds is what builds a community. This playbook is the difference between a one-time contributor and a Core Contributor with your project on their LinkedIn.

---

## 0. Why this exists

Recognition has to be **layered**, because contributors come in different shapes:

- **First-time contributor** — wants to *feel seen*
- **Active contributor** — wants *progression* (visible status growth)
- **Core contributor** — wants *resume value* (something to show employers / clients)
- **Power-user / KOL** — wants *economic alignment* (their effort generates revenue too)

A single "thanks!" message addresses none of them. This playbook gives each one a layer designed for them.

---

## 1. Recognition stack — 4 layers

### Layer 1 · GitHub README contributors wall

**Tool**: [all-contributors](https://allcontributors.org/) bot

**Setup**:

1. Install `@all-contributors/bot` on your repo
2. Add the contributors section anchor to README, bot maintains it automatically
3. Trigger via comment: `@all-contributors please add @username for code, docs, design`

**Contribution categories** (all-contributors native):

| Type | Emoji | Meaning |
|---|---|---|
| code | 💻 | Code contribution |
| doc | 📖 | Documentation |
| design | 🎨 | UI/UX design |
| translation | 🌍 | Localization |
| plugin | 🔌 | Plugin / extension |
| bug | 🐛 | Bug report |
| ideas | 🤔 | Idea / proposal |
| review | 👀 | Code review |
| tutorial | ✅ | Tutorial author |
| infra | 🚇 | CI/CD, DevOps |

**README anchor template**:

```markdown
## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
```

**Cadence**:

- Within 24h of every PR merge → maintainer triggers bot
- Weekly check for missed contributors (non-code contributions are easy to miss)

---

### Layer 2 · Monthly contributor spotlight

**Frequency**: 1st of every month (covering previous month)

**Channels**: GitHub Discussions + Discord `#announcements` + X / Twitter + Blog

**Spotlight template**:

```markdown
# 🎉 <your-project> Contributor Spotlight — {Month} {Year}

> Thank you to everyone who made <your-project> better this month!

## 📊 Monthly Stats

- **{N}** contributors made their first contribution
- **{N}** PRs merged
- **{N}** issues resolved
- **{N}** new plugins / extensions published

## 🌟 Top Contributors

### 🏆 MVP of the Month: @{username}

{2–3 sentences on their specific contribution and impact}

### Core Contributors

| Contributor | Contribution | Highlight |
|---|---|---|
| @{username} | {type}: {what they did} | {one-liner} |
| @{username} | {type}: {what they did} | {one-liner} |

## 🆕 New Contributors

Welcome to the community! 🎊

- @{username} — {first contribution description}
- @{username} — {first contribution description}

## 💡 Community Highlights

- {interesting discussions / creative uses / community stories}

## 🏅 Leaderboard (Points)

| Rank | Contributor | Points | Contributions |
|---|---|---|---|
| 🥇 | @{username} | {pts} | {summary} |
| 🥈 | @{username} | {pts} | {summary} |
| 🥉 | @{username} | {pts} | {summary} |

---

*Want to see your name here next month? Check out our [Contributing Guide](link) and [Good First Issues](link)!*
```

**Key principles** (learned from Dify / similar projects):

- **Specific, not generic** — never write "thanks to all contributors"; write *"@fdb02983rhy was instrumental in integrating new LLM capabilities"*
- Every first-time contributor gets `@mention`-ed, even for a typo fix
- Monthly MVP gets extra reward (T-shirt / sticker / certificate / point bonus)

---

### Layer 3 · Release-blog acknowledgments

**Trigger**: every Minor / Major version release

**Location**: dedicated section at the bottom of release blog

**Format** (modeled on Dify's 100K Stars blog):

```markdown
## Community Contributors

This release wouldn't be possible without our amazing contributors:

**Core Contributors**

- **@{username}** — Redesigned the plugin runtime engine, reducing cold
  start time by 40%. Their deep understanding of the plugin lifecycle
  made this architecture overhaul possible.
- **@{username}** — Implemented the Discord channel adapter from scratch.
  Wrote comprehensive tests covering 95% of edge cases.

**Community Contributors**

- @{username} — Fixed memory leak in long-running chat sessions (#1234)
- @{username} — Added Japanese translation for all UI strings (#1256)
- @{username} — Improved onboarding tutorial with step-by-step screenshots (#1278)

Thank you all for making this release possible! 💙
```

**Acknowledgment tiers**:

| Tier | Threshold | Format |
|---|---|---|
| Core Contributor | ≥3 impactful PRs in this release | 2–3 sentences detailed + bold |
| Active Contributor | ≥1 merged PR in this release | One-liner + Issue link |
| Community Helper | Bug Report / Discussion participation | Listed by name |

---

### Layer 4 · Monthly points leaderboard

**Display locations**:

1. **GitHub README** — embedded Top 10 (monthly + cumulative)
2. **Project website** — full leaderboard at `<your-project>.io/contributors`
3. **Discord** — `#leaderboard` channel, bot auto-posts monthly

**Points rules** (align with your contribution pool SOP):

| Contribution | Points | Notes |
|---|---|---|
| PR merged (starter difficulty) | 10 | Typo / config fix |
| PR merged (easy) | 25 | Bug fix, small feature |
| PR merged (medium) | 50 | Complete feature implementation |
| PR merged (advanced) | 100 | Architecture-level change |
| Plugin / extension published | 80 | Independently runnable |
| Bug report (confirmed) | 10 | Includes repro steps |
| Documentation contribution | 15–30 | By depth and length |
| Translation contribution | 20 / language | Per language pack |
| Code review (adopted) | 15 | Substantive review feedback |
| Discussion (marked Answer) | 10 | Marked as answer in Q&A |
| Community referral | 20 | When referred contributor's first PR merges |

**README embedding** (auto-updated via GitHub Actions):

```markdown
## 🏆 Top Contributors This Month

<!-- LEADERBOARD:START -->
| Rank | Contributor | Points |
|---|---|---|
| 🥇 | [@username](profile) | 280 |
| 🥈 | [@username](profile) | 215 |
| 🥉 | [@username](profile) | 180 |
| 4 | [@username](profile) | 140 |
| 5 | [@username](profile) | 120 |
<!-- LEADERBOARD:END -->

[View full leaderboard →](https://<your-project>.io/contributors)
```

**Automation flow**:

GitHub Actions runs on the 1st of every month:

1. Pull all merged PRs / issues / discussions from previous month via GitHub API
2. Calculate points per contributor based on rules above
3. Generate leaderboard markdown, update README between anchor comments
4. Sync to Discord bot + website API

---

## 2. Contributor certificate system

> The certificate is the **single highest-leverage asset** for student contributors. Treat it like a real product.

### 2.1 Tiers

| Tier | Threshold | Color | Perks |
|---|---|---|---|
| 🌱 Seedling | First merged PR | Light green | Certificate + community badge |
| 🌿 Contributor | 100 cumulative points | Dark green | Certificate + Discord role + project T-shirt |
| ⭐ Core Contributor | 500 cumulative points + ≥2 months active | Blue | Certificate + full swag set + RFC voting rights |
| 💎 Maintainer | Invitation only | Purple | Certificate + project decision rights + recommendation letter |

### 2.2 Certificate template specification

```
┌─────────────────────────────────────────────────────┐
│                                                     │
│   [Project Logo]                                    │
│                                                     │
│   ─────────────────────────────────────────────     │
│                                                     │
│   <YOUR-PROJECT> OPEN SOURCE                        │
│   CONTRIBUTOR CERTIFICATE                           │
│                                                     │
│   This certifies that                               │
│                                                     │
│   ╔═══════════════════════════════════╗             │
│   ║  {Contributor Full Name}          ║             │
│   ╚═══════════════════════════════════╝             │
│                                                     │
│   has made outstanding contributions to             │
│   <your-project> as a                               │
│                                                     │
│   [ ⭐ Core Contributor ]                            │
│                                                     │
│   ─── Contribution Summary ───                      │
│                                                     │
│   • {Specific contribution #1}                      │
│   • {Specific contribution #2}                      │
│   • {Specific contribution #3}                      │
│                                                     │
│   Period: {Start Date} – {End Date}                 │
│   Total Points: {N}                                 │
│   PRs Merged: {N}  |  Issues Resolved: {N}          │
│                                                     │
│   ─────────────────────────────────────────────     │
│                                                     │
│   Issued: {Date}                                    │
│   Certificate ID: PRJ-CERT-{YYYY}-{NNNN}            │
│                                                     │
│   [Signature]              [Verify QR Code]         │
│   {CEO / Lead Maintainer}  /verify/{id}             │
│                                                     │
└─────────────────────────────────────────────────────┘
```

**Design specs**:

| Element | Spec |
|---|---|
| Logo | High-resolution official logo |
| Typography | Title: Inter Bold; Body: Inter Regular |
| Color | Dark background + light text (matches product dark theme) |
| Size | A4 landscape (297×210mm) + square social variant (1080×1080px) |
| Format | PDF (print-quality) + PNG (social) + SVG (vector) |
| Verification | Unique cert ID + QR code → online verify page |
| LinkedIn | Provide one-click "Add to LinkedIn Certifications" link |

### 2.3 Issuance flow

```
Contributor crosses points threshold
  ↓
GitHub Actions detects → triggers certificate generator
  ↓
Generate PDF/PNG → auto-create GitHub Issue notifying contributor
  ↓
Contributor confirms info (name, public/private)
  ↓
Issue certificate + LinkedIn add-link + Discord role upgrade
  ↓
Feature in monthly spotlight
```

### 2.4 LinkedIn integration

Provide pre-filled LinkedIn add link:

```
https://www.linkedin.com/profile/add?startTask=CERTIFICATION_NAME
&name=<your-project>+Open+Source+Core+Contributor
&organizationId={your-linkedin-org-id}
&issueYear=2026&issueMonth=4
&certUrl=https://<your-project>.io/verify/PRJ-CERT-2026-0042
&certId=PRJ-CERT-2026-0042
```

**Certification fields**:

- Name: `<your-project> Open Source Core Contributor`
- Issuing Organization: `<your-project> (your-project.io)`
- Credential ID: `PRJ-CERT-2026-0042`
- Credential URL: `https://<your-project>.io/verify/PRJ-CERT-2026-0042`

### 2.5 Student-focused extensions

Students are the certificate system's highest-ROI segment:

| Tactic | Detail |
|---|---|
| **Recommendation letter template** | Core Contributor+ can request CEO/CTO-signed letter |
| **Internship pipeline** | Top 3 student contributors / month → fast-track interview |
| **GitHub Education partnership** | Cross-promote via GitHub Campus Expert program |
| **Resume guide** | Provide "How to feature open source on your resume" with certificate examples |
| **Campus workshops** | Quarterly contributor day workshops at target universities |

---

## 3. Affiliate Program (M2+)

> Optional 4th layer — only relevant if you have a paid product. Skip if you're pure open source.

### 3.1 Why it works

Tech bloggers / YouTubers / course creators / community leaders need **economic alignment** to keep promoting you. Recognition alone won't sustain it.

### 3.2 Tiered commission structure

| Tier | Commission | Trigger | Duration |
|---|---|---|---|
| Tier 1 — Starter | 30% recurring | Default on join | 12 months per referral |
| Tier 2 — Growth | 40% recurring | 10 cumulative paid conversions | 12 months per referral |
| Tier 3 — Elite | 50% recurring | 25 cumulative paid conversions | 12 months per referral |

**Why a 3-tier ladder vs. flat 30% or 50%?** A 30%→40% step at 10 conversions is achievable for committed partners — it removes the psychological wall between "casual affiliate" and "elite", giving partners visible progression motivation.

### 3.3 Earnings example

Sample pricing: Pro $49/mo, Team $199/mo

| Plan | Monthly | 30% comm | 40% comm | 50% comm |
|---|---|---|---|---|
| Pro | $49 | $14.70 | $19.60 | $24.50 |
| Team | $199 | $59.70 | $79.60 | $99.50 |

**Example**: A blogger refers 30 Pro + 5 Team users (Elite tier achieved)

- Pro: 30 × $24.50 = $735/month
- Team: 5 × $99.50 = $497.50/month
- **Total: $1,232.50/month passive income**

### 3.4 Target partner profiles

| Type | Profile | Recruit channel | Volume |
|---|---|---|---|
| Tech YouTuber | 1K–100K subs, AI/DevTool content | Direct DM + free Pro | Medium |
| Tech blogger | Dev.to / Medium / personal blog | SEO content collab | High |
| Community leader | Discord / Slack admins | Community partnership | Medium |
| Consultant | AI implementation consulting | Partner program | Low but high ACV |
| Course instructor | Udemy / Coursera / independent | Education partnership | High |
| Plugin creator | Publishes to your marketplace | Internal cultivation | High |

### 3.5 Tracking + attribution

| Element | Mechanism |
|---|---|
| Infrastructure | Phase 1: [Rewardful](https://www.rewardful.com/) (Stripe-native, lightweight); scale: PartnerStack |
| Tracking | Per-partner referral link `your-project.io/?ref={partner_id}` + 90-day cookie |
| Attribution | **Lifetime attribution** — any future upgrade still credits the original referrer |
| Commission window | 12 months from subscription start |
| Payout | Stripe / PayPal |
| Min payout | $25 USD |
| Dashboard | Real-time clicks / signups / conversions / earnings |

### 3.6 Application + approval

| Item | Detail |
|---|---|
| Cost to join | Free |
| Basic requirement | Public technical content presence (blog / YouTube / social / community) |
| Review criteria | Show what you've built with the product / similar AI tools |
| Review window | 3 business days |
| Onboarding kit | Brand assets + product screenshots + copy templates + demo account |

**Partner perks**:

| Perk | Detail |
|---|---|
| Free Pro account | Permanent free Pro post-approval (for content creation) |
| Beta access | Priority access to beta features |
| Private channel | Discord `#partners` + monthly Partner Call |
| Co-marketing | Official RT / collab promotion of partner content |
| Annual Partner Summit | Top partners fully sponsored |

### 3.7 Plugin marketplace × Affiliate combo

Borrowed from Dify's Creator Center model:

```
Plugin creator builds plugin in your platform
  ↓
Publishes to your plugin marketplace
  ↓
Binds Affiliate account
  ↓
User discovers plugin → registers your platform → pays
  ↓
Plugin creator earns 30–50% recurring commission
```

**Why this multiplier matters**: the plugin itself is the best promotional content — users searching for "AI customer service plugin" land on the creator's plugin, try it, pay, and the creator earns commission. **Content-as-distribution-channel.**

### 3.8 Launch sequence

| Phase | Timing | Action |
|---|---|---|
| Pre-launch | M1 W3-4 | Select platform, design landing page, prep brand kit |
| Soft launch | M2 W1-2 | Invite 10–15 seed partners for closed beta |
| Public launch | M2 W3 | Public announcement + Blog + X + Discord push |
| Optimization | M2 W4–M3 | Refine commission structure / recruitment / asset quality |

---

## 4. Unified incentive matrix

The 4 layers map onto contributor tiers like this:

```
                    Emotional drive                      Economic drive
                          │                                   │
  ┌──────────────────────┼───────────────────────────────────┼──────────────┐
  │                      │                                   │              │
  │  🌱 New contributor   │ README contributor wall          │              │
  │  (first PR)           │ Monthly @mention                 │              │
  │                       │ Seedling certificate             │              │
  │                       │                                  │              │
  │  🌿 Active            │ Featured monthly mention          │              │
  │  (100 pts)            │ Contributor certificate          │              │
  │                       │ Discord exclusive role           │              │
  │                       │ Swag                             │              │
  │                       │                                  │              │
  │  ⭐ Core              │ Detailed release-blog mention     │ Affiliate    │
  │  (500 pts)            │ Core Contributor certificate     │ 30–50% comm  │
  │                       │ RFC voting rights                │ Free Pro     │
  │                       │                                  │              │
  │  💎 Maintainer        │ Project decision rights           │ Elite tier   │
  │  (invite-only)        │ Maintainer certificate + letter   │ 50% comm     │
  │                       │ Annual Summit invitation          │ Partner perks │
  │                       │                                  │              │
  │  📣 Promoter          │                                  │ Affiliate    │
  │  (external KOL)       │ Partner community recognition    │ 30–50% comm  │
  │                       │                                  │ Co-marketing │
  │                       │                                  │              │
  └───────────────────────┴──────────────────────────────────┴──────────────┘
```

---

## 5. Execution priority + timeline

| Priority | Action | Start | Owner | Dependency |
|---|---|---|---|---|
| P0 | all-contributors bot install + README wall | M1 W1 | DevRel | Repo permissions |
| P0 | Points rules + auto-stats script | M1 W1-2 | Eng + Ops | Pool SOP |
| P0 | Spotlight template + first issue | M1 W4 | DevRel | Points data |
| P1 | Certificate template (find designer) | M1 W2-3 | Design | Brand spec |
| P1 | Certificate auto-generation script | M1 W3-4 | Eng | Template |
| P1 | README leaderboard GitHub Action | M1 W3-4 | Eng | Points script |
| P1 | Website /contributors page | M2 W1-2 | Frontend | Points API |
| P2 | Release-blog acknowledgment SOP | Before first release | DevRel | — |
| P2 | Affiliate platform selection + integration | M1 W3-4 | Ops + Eng | Payment system live |
| P2 | Affiliate landing page | M2 W1 | Frontend + Ops | Platform |
| P2 | Seed partner recruitment | M2 W1-2 | Ops | Affiliate live |
| P3 | Marketplace × Affiliate combo | M2 W3+ | Eng | Marketplace live |
| P3 | Annual Partner Summit planning | M3 | Ops | Scale validated |

---

## 6. Success metrics

| Metric | M1 | M2 | M3 |
|---|---|---|---|
| README contributors | ≥ 20 | ≥ 50 | ≥ 100 |
| Spotlight issues published | 1 | 2 | 3 |
| Certificates issued | 5 | 20 | 50 |
| Certificates added to LinkedIn | 3 | 10 | 25 |
| Affiliate partners | — | 15 | 40 |
| Affiliate-driven signups | — | 50 | 200 |
| Affiliate-driven paid conversions | — | 5 | 25 |

---

## 7. Review triggers

Re-audit recognition system if any of these:

1. Two consecutive months of contributor growth < 10 → consider raising incentives
2. Certificate LinkedIn-add rate < 20% → redesign certificate or amplify student outreach
3. Affiliate partner churn > 30% → adjust commission or improve partner support
4. Affiliate ROI (commission spend / LTV) < 1.5 → restructure commission tiers
5. Community feedback that recognition feels "insincere" → immediately overhaul tone and specificity

---

## Anti-patterns

- ❌ Generic "thanks all" recognition — kills the entire system's perceived value
- ❌ Skipping non-code contributions in the README wall — translators / designers walk away
- ❌ Issuing certificates with typos in contributor names — destroys the artifact's prestige
- ❌ Affiliate without lifetime attribution — partners feel cheated
- ❌ Promising swag and not delivering for months — cheaper to send nothing than send late

---

## Related

- [`02-issue-pipeline-sop.md`](./02-issue-pipeline-sop.md) — points rules align with the difficulty labels defined here
- [`01-good-first-issue-system.md`](./01-good-first-issue-system.md) — first PR threshold = first certificate trigger
- [`04-pr-layer-operations.md`](./04-pr-layer-operations.md) — merge → recognition is the trigger
- [`README.md`](./README.md) — 4-piece system overview
