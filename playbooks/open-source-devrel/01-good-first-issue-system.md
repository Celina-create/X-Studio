---
title: Good First Issue System
date: 2026-04
type: playbook / open-source-devrel · piece 1 of 4
status: shipped (battle-tested in production)
goal: Reduce first-time contributor on-ramp time to ≤30 minutes
---

# Good First Issue System — Auto-detect, Label, Mentor

> "Good First Issue" should not be a vibe-based label. This playbook turns it into a **formula** that any maintainer (or LLM) can apply consistently.

---

## 0. Why this exists

The dominant failure mode of "good first issue" labels: **mismatched expectations**. A new contributor picks up an issue thinking it's 30 minutes of work, hits a 4-hour rabbit hole into your codebase, and never comes back.

The fix is not better tutorials. The fix is **a precise definition** + **a detection formula** + **a label matrix that signals difficulty before the contributor commits**.

---

## 1. The definition

> **Good First Issue = a self-contained task in a single area + non-deep-architecture, that hits either a UX-visible signal or a beginner-friendly source type.**

### Detection formula

```
good-first-issue = (B single-area AND C non-deep-architecture)
                   AND
                   (A UX-visible signal OR D beginner-friendly source type)
```

**B and C are the gates.** A and D are the triggers (either is sufficient).

---

### Gate B — Single area

- The fix touches **only 1 area** (e.g., `area/frontend` OR `area/backend` OR `area/docs` — not multiple)
- No cross-module reasoning required (the contributor doesn't need to understand frontend AND backend at the same time)

### Gate C — Non-deep-architecture

The issue does **not** involve any of the following:

| Excluded | Why excluded |
|---|---|
| Refactor | Requires whole-system context, change surface unpredictable |
| Performance optimization | Requires profiling and benchmarks, validation cost high |
| Data migration | Schema changes, irreversible risk |
| Security | Auth / permissions / data — error cost too high for a first PR |
| Concurrency / race conditions | Requires deep runtime understanding |
| P0 blocker | User-critical flow broken — should be fixed by core team urgently |

---

### Trigger A — UX-visible signal hit

| UX signal | Typical phrasing |
|---|---|
| Missing entry / button | "Settings page has no logout button" |
| Display incorrect / layout broken | "Sidebar overlaps content on Windows" |
| Click no-response | "Toggle switch doesn't react" |
| Wrong navigation | "Login should redirect to signup, not direct login" |
| Text truncation / overflow | "Label says 'XYZ' but should say 'ABC'" |
| Icon / image not loading | "Login page missing favicon" |
| Scroll / drag broken | "List scrolling stutters" |
| Login / password / email visibility | "Browser callback page doesn't auto-close" |

### Trigger D — Beginner-friendly source type

| Source | Typical task | Difficulty |
|---|---|---|
| **Documentation** | README translation, tutorial gap-fill, API docs | starter ~ easy |
| **i18n** | New language pack, translation fix | starter ~ easy |
| **UI polish** | CSS / dark-mode / layout tweak | easy |
| **Test coverage** | Unit test addition | easy ~ medium |
| **Small bug** | Edge-case handling, error message improvement | easy ~ medium |
| **Skill / Plugin starter** | Simple plugin templates (weather, summary, format conversion) | medium |

---

### LLM as supplementary judge

If you're running an LLM-powered triage bot (recommended), use it as a *second opinion*:

- LLM judges `easy` → auto-label
- LLM judges `medium` + regex rules pass → auto-label
- LLM judges `hard` → no auto-label, send to human review
- LLM and regex disagree → take the more conservative call

---

### Worked examples

**✅ Pass — "Update Star reward points: 300 → 700"**
- Gate B ✅ Single area: `area/backend`
- Gate C ✅ Non-deep: changing one config value
- Trigger A ✅ UX signal: display value mismatch
- → **(B ∧ C) ∧ A = auto-label `good-first-issue`**

**✅ Pass — "Add tutorial for BYOK configuration"**
- Gate B ✅ Single area: `area/docs`
- Gate C ✅ Non-deep: pure documentation
- Trigger D ✅ Source type: documentation improvement
- → **(B ∧ C) ∧ D = auto-label `good-first-issue`**

**❌ Fail — "API key works but feature still says 'not configured'"**
- Trigger A ✅ UX signal: operation no-response
- Gate B ❌ Cross-module: backend persistence + frontend state sync
- Gate C ❌ Likely P0 blocker
- → **Gates fail, no label**

**❌ Fail — "App permanently stuck on launch screen"**
- Trigger A ✅ UX signal: no response
- Gate B ✅ Single area
- Gate C ❌ Deep: Agent runtime + P0 blocker
- → **Gates fail, no label**

---

## 2. Label system

Every Good First Issue carries **at least three labels**: area + difficulty + type.

```
good-first-issue + area/{direction} + difficulty/{level} + type/{category}
```

### Area labels (`area/`)

| Label | Scope | Typical task |
|---|---|---|
| `area/frontend` | UI components, styles, layout | UI bug fixes, style tweaks |
| `area/backend` | API, database, business logic | Endpoint fixes, config adjustments |
| `area/skill-engine` | Plugin / extension runtime | New plugin templates |
| `area/channels` | Integration adapters (IM, webhooks, etc.) | Message format fixes |
| `area/docs` | Product docs, API docs, READMEs | Doc additions, translations |
| `area/i18n` | Internationalization | Translation fixes, new language packs |
| `area/design` | UI/UX design, icons, brand assets | Visual contributions |

### Difficulty labels (`difficulty/`)

| Label | Time estimate | Audience | Color |
|---|---|---|---|
| `difficulty/starter` | 15–30 min | Zero-experience contributors, students | 🟢 Green |
| `difficulty/easy` | 1–2h | Basic dev experience | 🟡 Yellow |
| `difficulty/medium` | 2–4h | Some project experience | 🟠 Orange |

### Type labels (`type/`)

| Label | Meaning |
|---|---|
| `type/bug` | Bug fix |
| `type/feature` | Small feature addition |
| `type/docs` | Documentation |
| `type/skill` | Plugin / extension |
| `type/style` | Pure CSS / UI tweak |
| `type/config` | Config value change |
| `type/test` | Test case addition |

### Label color spec

| Category | Color | HEX |
|---|---|---|
| `good-first-issue` | Purple | `#7057ff` |
| `area/*` | Blue | `#0075ca` |
| `difficulty/starter` | Green | `#0e8a16` |
| `difficulty/easy` | Yellow | `#fbca04` |
| `difficulty/medium` | Orange | `#e4e669` |
| `type/*` | Light purple | `#d4c5f9` |

---

## 3. Mentor system

### Mentor assignment by area

For each area, designate **a primary mentor and a backup**. (Replace with your team — or for solo maintainers, you're all mentors.)

| Area | Primary Mentor (role) | Backup |
|---|---|---|
| `area/frontend` | Frontend Lead | Frontend Engineer |
| `area/backend` | Backend Lead | Senior Engineer |
| `area/skill-engine` | Plugin System Owner | Backend Engineer |
| `area/channels` | Integrations Engineer | Backend Lead |
| `area/docs` | DevRel Lead | Operations |
| `area/i18n` | Localization Owner | DevRel Lead |
| `area/design` | Design Lead | Frontend Engineer |

### Mentor responsibilities

1. **48h first review SLA** — every GFI PR in your area must get first feedback within 48 hours
2. **Issue clarity gate** — when creating GFIs, ensure description includes file paths, expected behavior, verification steps
3. **Guide, don't write** — point at direction and approach; give answers only when contributor is fully stuck
4. **Maintain AI prompt template** — keep your area's AI prompt template effective and current
5. **Weekly input** — every Friday, send weekly contributor signal to DevRel Lead

### Mentor rotation

- When primary is on PTO, backup takes over automatically
- Operations announces weekly on-call mentor rotation (e.g., on Discord `#contributing`)

---

## 4. Issue template

### 4.1 Description template

Every Good First Issue must include the following structure:

```markdown
## 📋 Task

{1–2 sentences describing what needs to happen}

## 🎯 Expected outcome

{What it should look like after fix — attach screenshots if visual}

## 📍 Relevant files

- `{file/path/1}` — {what this file does}
- `{file/path/2}` — {what this file does}

## ✅ Verification

1. {Step 1}
2. {Step 2}
3. {Step 3}

## 🤖 AI Prompt

> Copy this prompt to Cursor / Claude Code / Codex:

```
{AI prompt — see section 5 below}
```

## 📊 Metadata

- **Area**: `area/{direction}`
- **Difficulty**: `difficulty/{level}` (estimated {X} minutes)
- **Type**: `type/{category}`
- **Mentor**: @{mentor_handle}
- **Points**: {N}

## 💡 Tips

- Stuck? Comment on this issue or join #contributing on Discord
- Mentor @{mentor} will review your PR within 48h
- First time contributing? Read [CONTRIBUTING.md](../CONTRIBUTING.md)
```

### 4.2 GitHub Issue Form

Drop this into `.github/ISSUE_TEMPLATE/good-first-issue.yml`:

```yaml
name: "🌱 Good First Issue"
description: "Mark a beginner-friendly task"
title: "[Good First Issue] "
labels: ["good-first-issue"]
body:
  - type: textarea
    id: description
    attributes:
      label: "📋 Task"
      description: "1–2 sentences"
    validations: { required: true }

  - type: textarea
    id: expected
    attributes:
      label: "🎯 Expected outcome"
      description: "What it should look like (attach screenshots if visual)"
    validations: { required: true }

  - type: textarea
    id: files
    attributes:
      label: "📍 Relevant files"
      placeholder: |
        - `src/components/Sidebar.tsx` — sidebar component
        - `src/styles/sidebar.css` — sidebar styles
    validations: { required: true }

  - type: textarea
    id: verification
    attributes:
      label: "✅ Verification steps"
    validations: { required: true }

  - type: dropdown
    id: area
    attributes:
      label: "Area"
      options: [area/frontend, area/backend, area/skill-engine, area/channels, area/docs, area/i18n, area/design]
    validations: { required: true }

  - type: dropdown
    id: difficulty
    attributes:
      label: "Difficulty"
      options:
        - "difficulty/starter (15–30 min)"
        - "difficulty/easy (1–2h)"
        - "difficulty/medium (2–4h)"
    validations: { required: true }

  - type: dropdown
    id: type
    attributes:
      label: "Type"
      options: [type/bug, type/feature, type/docs, type/skill, type/style, type/config, type/test]
    validations: { required: true }

  - type: input
    id: mentor
    attributes:
      label: "Mentor"
      placeholder: "@mentor_handle"
    validations: { required: true }

  - type: input
    id: points
    attributes:
      label: "Reward Points"
      placeholder: "500"
    validations: { required: true }
```

---

## 5. AI Prompt templates

### 5.1 Universal structure

Every prompt follows this skeleton:

```
Context (project background)
  → Task (specific ask)
  → Files (relevant paths)
  → Constraints (rules to respect)
  → Verification (how to check it works)
```

### 5.2 Frontend / UI fix template

```
You are contributing to <your-project>, an open source product.

Tech stack: React + TypeScript + Tailwind CSS + Framer Motion
Frontend code: frontend/src/

Task: {one-sentence description, e.g. "Fix sidebar collapse button alignment"}

Relevant files:
- {file path, e.g. frontend/src/components/Sidebar.tsx}

Current behavior: {describe}
Expected behavior: {describe}

Constraints:
- Use Tailwind classes; do not create new style files
- Single quotes for string literals
- English code comments only
- Do not modify unrelated code

Verification:
1. Run `pnpm dev` (or your dev command)
2. {specific verification step}

Read the relevant files first to understand context. Modify only what's necessary.
```

### 5.3 Backend / API fix template

```
You are contributing to <your-project>, an open source product.

Tech stack: NestJS + TypeScript + TypeORM + PostgreSQL (or your stack)
Backend code: backend/src/
Module structure: backend/src/modules/{module_name}/

Task: {one-sentence description}

Relevant files:
- {file path}

Current behavior: {describe}
Expected behavior: {describe}

Constraints:
- Use ConfigService (or equivalent) — do not access process.env directly
- Single quotes; English code comments
- Follow existing module patterns

Verification:
1. Start backend with `pnpm start:dev`
2. {specific verification step}

Read the relevant module before making changes.
```

> Build similar templates for `docs`, `i18n`, `skill-engine`, `channels`, `design`. The structure stays identical; only the constraints and tech-stack lines change.

---

## 6. Operating cadence

| Frequency | Action | Owner |
|---|---|---|
| Every Monday | Audit Good First Issue inventory; ensure ≥3 per area | DevRel Lead |
| Every Monday | Push this week's recommended issues to `#contributing` | Operations |
| Every Friday | Stats: claimed / completed this week | Operations |
| Every release | Mine new bugs from release for GFI candidates | DevRel Lead + Mentors |
| Every month | Re-balance areas; backfill underrepresented areas | DevRel Lead |

### New contributor end-to-end flow

```
Discover issue (GitHub label page / Discord recommendation / outreach)
  → Read description + identify mentor
  → Comment "I'd like to work on this" → auto-assign
  → Mentor responds within 48h with confirmation + tips
  → Copy AI prompt → use Cursor / Claude Code
  → Submit PR → mentor reviews within 48h
  → Merged → points awarded automatically + welcome email (if first PR)
  → Recommend next issue → contribution habit forms
```

### Critical SLAs

| Step | SLA | Fallback |
|---|---|---|
| Issue claim → first response | 48h | Backup mentor takes over |
| PR submitted → first review | 48h | Backup mentor takes over |
| PR revised → re-review | 24h | — |
| Points awarded | 1 business day after merge | Manual entry by Operations |

---

## 7. GitHub Labels — bulk creation script

```bash
REPO="<your-org>/<your-repo>"

# Area labels
gh label create "area/frontend"     --color "0075ca" --description "Frontend: React, UI components"           --repo $REPO
gh label create "area/backend"      --color "0075ca" --description "Backend: API, database, business logic"   --repo $REPO
gh label create "area/skill-engine" --color "0075ca" --description "Plugin runtime / extension system"        --repo $REPO
gh label create "area/channels"     --color "0075ca" --description "Integrations: IM, webhooks, adapters"     --repo $REPO
gh label create "area/docs"         --color "0075ca" --description "Documentation, guides, tutorials"         --repo $REPO
gh label create "area/i18n"         --color "0075ca" --description "Internationalization, translations"       --repo $REPO
gh label create "area/design"       --color "0075ca" --description "UI/UX design, icons, brand assets"        --repo $REPO

# Difficulty labels
gh label create "difficulty/starter" --color "0e8a16" --description "15–30 min, perfect for first-timers"     --repo $REPO
gh label create "difficulty/easy"    --color "fbca04" --description "1–2 hours, basic dev experience"         --repo $REPO
gh label create "difficulty/medium"  --color "e4e669" --description "2–4 hours, some project experience"      --repo $REPO

# Type labels
gh label create "type/bug"     --color "d4c5f9" --description "Bug fix"                            --repo $REPO
gh label create "type/feature" --color "d4c5f9" --description "Small feature addition"             --repo $REPO
gh label create "type/docs"    --color "d4c5f9" --description "Documentation"                      --repo $REPO
gh label create "type/skill"   --color "d4c5f9" --description "Plugin / extension"                 --repo $REPO
gh label create "type/style"   --color "d4c5f9" --description "CSS / UI visual adjustment"         --repo $REPO
gh label create "type/config"  --color "d4c5f9" --description "Configuration value change"         --repo $REPO
gh label create "type/test"    --color "d4c5f9" --description "Test case addition"                 --repo $REPO

# Master label
gh label create "good-first-issue" --color "7057ff" --description "Beginner-friendly issue" --repo $REPO
```

---

## 8. Success metrics

Set your own M1/M2/M3 targets. Reference numbers from a real-world deployment:

| Metric | M1 target | M2 target | M3 target |
|---|---|---|---|
| Good First Issue inventory | ≥ 15 | ≥ 25 | ≥ 30 |
| Areas covered | ≥ 4 | ≥ 6 | All |
| Issue claim rate | ≥ 50% | ≥ 65% | ≥ 80% |
| Claim → PR conversion | ≥ 60% | ≥ 70% | ≥ 75% |
| PR → merged conversion | ≥ 70% | ≥ 80% | ≥ 85% |
| AI prompt adoption | tracking | ≥ 30% | ≥ 50% |
| Avg time to first PR | < 3h | < 2h | < 1.5h |

---

## Anti-patterns

- ❌ Labelling deep refactors as "good first issue" because they "look easy on the surface"
- ❌ Auto-labelling without checking for cross-module impact
- ❌ Mentor responding "looks good" without actually testing the PR
- ❌ Awarding points without merge — kills the integrity of the system
- ❌ Translating AI prompt templates and forgetting to update the constraints

---

## Related

- [`02-issue-pipeline-sop.md`](./02-issue-pipeline-sop.md) — where GFI labels get applied automatically
- [`03-contributor-recognition.md`](./03-contributor-recognition.md) — points / certificates that activate after merge
- [`04-pr-layer-operations.md`](./04-pr-layer-operations.md) — what the contributor does *after* picking up a GFI
- [`README.md`](./README.md) — 4-piece system overview
