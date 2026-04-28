---
title: Issue Pipeline SOP
date: 2026-04
type: playbook / open-source-devrel · piece 2 of 4
status: shipped (battle-tested in production)
goal: Every issue gets a triage decision within 24h, every Good First Issue auto-detected, every health check automated
---

# Issue Pipeline SOP — Triage, Lifecycle, Health Checks

> Issue pipelines fail in two ways: (1) issues sit untouched for weeks ("stale repo" signal), or (2) maintainers burn out doing triage by hand. This playbook automates everything that can be automated and structures everything else.

---

## 0. Why this exists

The signal a contributor reads from your issue tracker decides whether they ever submit a PR:

- **No labels, no responses** → "abandoned project"
- **Long debate, no decision** → "core team can't ship"
- **Quick triage + clear status** → "this place ships"

The third state is what this playbook produces, *systematically*.

---

## 1. Label taxonomy (4 dimensions)

Every issue carries labels across **4 dimensions**: difficulty, type, priority, area. Plus *workflow* labels that flow with the issue's state.

### Difficulty

| Label | Color | Meaning | Audience |
|---|---|---|---|
| `good-first-issue` | 🟢 `#0E8A16` | Beginner-friendly, self-contained | First-time contributors, students |
| `intermediate` | 🟡 `#FBCA04` | Requires some project understanding | Active contributors |
| `advanced` | 🔴 `#B60205` | Deep architecture understanding | Core contributors |

### Type

| Label | Color | Meaning |
|---|---|---|
| `type:bug` | `#D73A4A` | Bug fix |
| `type:feature` | `#0075CA` | New feature |
| `type:docs` | `#0075CA` | Documentation |
| `type:skill` | `#7057FF` | Plugin / extension |
| `type:i18n` | `#E4E669` | Localization |
| `type:ongoing` | `#BFD4F2` | Recurring task |

### Priority

| Label | Color | Meaning | SLA |
|---|---|---|---|
| `priority:p0` | `#B60205` | Blocking core function | Same day |
| `priority:p1` | `#FF9F1C` | Important, not blocking | 48h |
| `priority:p2` | `#0E8A16` | Nice-to-have | Sprint queue |

### Area

| Label | Scope |
|---|---|
| `area/frontend` | Web / Desktop UI |
| `area/backend` | Controller / API / Runtime |
| `area/skill-engine` | Plugin / extension layer |
| `area/docs` | Docs / Tutorials / README |
| `area/channels` | IM / webhook integrations |
| `area/credit` | Points / rewards |

### Workflow labels (flow with state)

| Label | Meaning |
|---|---|
| `needs-triage` | New issue, awaiting maintainer decision |
| `confirmed` | Bug confirmed reproducible |
| `accepted` | Feature accepted into roadmap |
| `triage:accepted` | Maintainer confirmed (via `/triage accepted` command) |
| `triage:declined` | Maintainer rejected (via `/triage declined`, auto-closes) |
| `triage:duplicated` | Confirmed duplicate (via `/triage duplicated #N`, auto-closes) |
| `possible-duplicate` | LLM flagged similar issue, awaiting human check |
| `needs-information` | Missing repro / env info, paused |
| `response-needed` | >24h without team response |
| `mentor-available` | A mentor is available for guidance |
| `help-wanted` | Open for community contribution |

---

## 2. Issue lifecycle (full pipeline)

```
User submits issue
    ↓
┌─ Pre-processing layer (automatic) ────────────────┐
│ ① Roadmap-hit check                                │
│   → If matches roadmap → auto-reply with ETA       │
│ ② Duplicate detection (LLM-based)                  │
│   → Suspected duplicate → label possible-duplicate │
│   → Auto-comment with similar issues               │
│ ③ Internal-author filter                           │
│   → Skip auto-labelling for internal team          │
│ ④ First-time contributor welcome                   │
│   → Send welcome message on first-ever issue       │
└────────────────────────────────────────────────────┘
    ↓
┌─ Smart label layer (LLM-assisted) ────────────────┐
│ Type:        type:bug / type:feature / type:i18n   │
│ Area:        area/frontend / area/backend / ...    │
│ Priority:    priority:p0 / p1 / p2                 │
│ Difficulty:  good-first-issue / intermediate / adv │
│ Platform:    windows / macos / linux               │
│ Workflow:    needs-triage                          │
│                                                    │
│ Good First Issue formula: (A || D) && B && C       │
│   Gate B) Single area — no cross-module            │
│   Gate C) Non-deep — no refactor / perf / security │
│   Trigger A) UX signal — missing entry, broken UI  │
│   Trigger D) Source type — docs / i18n / UI / test │
└────────────────────────────────────────────────────┘
    ↓
┌─ Manual triage (maintainer comment commands) ─────┐
│ /triage accepted                                   │
│   → Apply triage:accepted, remove needs-triage     │
│   → Auto-comment notification                      │
│ /triage declined                                   │
│   → Decline with reason, auto-close                │
│ /triage duplicated #N                              │
│   → Confirm duplicate, point to original, close    │
└────────────────────────────────────────────────────┘
    ↓
┌─ 24h response tracker (scans every 6h) ───────────┐
│ Bug timeout: nudge "confirm repro → confirmed"    │
│ Feature timeout: nudge "align roadmap → accepted" │
│ Auto-apply response-needed label                  │
│ Auto-remove on team response                      │
└───────────────────────────────────────────────────┘
    ↓
┌─ Lifecycle management (label / comment / close) ──┐
│ confirmed → guide contribution + add help-wanted  │
│ accepted → invite community contribution          │
│ "I'd like to work on this" → auto-assign          │
│   → good-first-issue: push starter guide          │
│   → intermediate/advanced: push architecture doc  │
│ Issue closed → thank external contributor         │
└───────────────────────────────────────────────────┘
    ↓
┌─ Pool health + potential PR detection ────────────┐
│ Every Monday: check good-first-issue ≥ 10         │
│ Below threshold → auto-create tracking issue      │
│ enhancement / needs-triage → flag as potential PR │
└───────────────────────────────────────────────────┘
```

### State transition diagram

```
New issue → [auto pre-processing]
  ├── Roadmap match → reply with ETA (end)
  ├── Missing info → needs-information (paused)
  ├── Suspected dup → possible-duplicate + needs-triage
  └── Pass checks → needs-triage
         ↓
  /triage accepted → triage:accepted (enters dev backlog)
  /triage declined → triage:declined (closed)
  /triage duplicated → triage:duplicated (closed)
         ↓
  confirmed / accepted → help-wanted (open for contribution)
         ↓
  Contributor claims → assign → submit PR → merge → thank
```

---

## 3. The 24h response promise

### Mechanism

- **GitHub Actions auto-detect**: scan all open issues every 6 hours
- **Timeout flag**: if open >24h with no team response → auto-apply `response-needed`
- **Auto-clear**: team response automatically removes the label

### Maintainer / team list

Maintain `TEAM_MEMBERS` array in `.github/workflows/issue-response-tracker.yml`. Update when team changes.

### Response templates

**Bug Report — first response:**

```
Thanks for reporting this! I can reproduce the issue on [env].
- Priority: P[x]
- Estimated fix: [timeline]
- Workaround: [if any]
```

**Feature Request — first response:**

```
Great idea! Some thoughts:
- This aligns with [direction]
- Trade-offs to consider: [list]
- Priority: P[x]

Would you be interested in contributing a PR for this?
```

---

## 4. Contribution pool health

### Goal

Always have **≥10 actionable `good-first-issue`** on the board.

### Automation

- `contribution-pool-stats.yml` runs every Monday
- Below threshold → auto-creates a tracking issue assigned to maintainers
- Pings team in `#contributing` until pool is replenished

### Weekly replenishment flow

| Step | Owner | Frequency |
|---|---|---|
| Split dev sprint tasks suitable for external contribution | Tech Lead | Weekly |
| Curate doc / translation / test tasks | Operations | Weekly |
| Score new issues for difficulty + apply labels | Maintainer | Continuous |
| Audit pool health | Automation | Mondays |

### GFI sources to actively cultivate

1. **Documentation** — README translation, tutorial gap-fill, API docs
2. **i18n** — new languages, translation fixes
3. **UI polish** — CSS / dark-mode / theme adjustments
4. **Test coverage** — unit / integration tests
5. **Small bugs** — edge cases, error message improvements, typos
6. **Plugin starters** — minimal extension templates

---

## 5. Issue classification SOP

### Bug Report flow

1. **Issue created** → automatic pre-processing:
   - LLM duplicate check → flag `possible-duplicate` if similar
   - Roadmap check → reply ETA if matches
   - Auto-label `type:bug` + `needs-triage` + area + priority
   - GFI auto-detection → label if criteria pass
2. **Within 24h**: Maintainer triage
   - Reproducible → `/triage accepted` or manual `confirmed` + priority
   - Insufficient info → `needs-information` + request repro steps
   - Confirmed dup → `/triage duplicated #N` (auto-closes + redirects)
   - Won't fix → `/triage declined` (auto-closes + explains)
3. **Difficulty assessment**: label `good-first-issue` / `intermediate` / `advanced`
4. **P0**: pull internal team for immediate fix
5. **P1/P2**: label `help-wanted` and open to community

**Bug Report template requirements:**

- Repro steps (numbered)
- Environment (OS, runtime versions, app version)
- Actual vs expected behavior
- Screenshots / logs (if applicable)

### Feature Request flow

1. **Issue created** → automatic pre-processing:
   - LLM dup check
   - Roadmap match → reply ETA
   - Auto-label `type:feature` + `needs-triage` + area
2. **Within 24h**: Maintainer triage
   - Accept → `/triage accepted`
   - Defer / reject → `/triage declined` (auto-closes with reason)
   - Duplicate → `/triage duplicated #N`
3. **Discuss feasibility**: align with roadmap, assess priority
4. **Difficulty estimate**: label
5. **Open to contribution**: `help-wanted`

**Feature Request template requirements:**

- Use-case description
- Expected behavior
- Alternatives considered

### Maintainer command quick-reference

| Command | Effect |
|---|---|
| `/triage accepted` | Apply `triage:accepted`, remove `needs-triage`, auto-notify |
| `/triage declined` | Apply `triage:declined`, comment reason, auto-close |
| `/triage duplicated #123` | Apply `triage:duplicated`, redirect to #123, auto-close |

> Restricted to org members and collaborators.

---

## 6. Automation stack

### GitHub Actions (production-ready)

| Workflow | File | Trigger | Function |
|---|---|---|---|
| Issue Triage Bot | `issue-triage-bot.yml` | issue created/edited | Auto-label type / area / priority / difficulty + GFI detection + welcome |
| 24h Response Tracker | `issue-response-tracker.yml` | every 6h cron | Bug/Feature timeout nudges, apply `response-needed` |
| Issue Lifecycle | `issue-lifecycle.yml` | label change / comment / close | `/triage` commands + confirmed/accepted guidance + auto-assign + close-thank |
| Contribution Pool Stats | `contribution-pool-stats.yml` | every Monday | If GFI < 10 → auto-create tracking issue |

### Local script (LLM-powered)

| Script | File | Function |
|---|---|---|
| Issue Lifecycle Bot | `scripts/issue-lifecycle-bot.py` | LLM smart-labelling + dup detection + roadmap match + 24h tracking + pool health + potential-PR detection |

**Usage:**

```bash
# Dry run
python3 scripts/issue-lifecycle-bot.py --dry-run --limit 30

# Live execution
python3 scripts/issue-lifecycle-bot.py --limit 50
```

> Use a low-cost LLM (Claude 3.5 Haiku, GPT-4o-mini equivalent) — this script runs on every triage cycle, so cost-per-call matters.

---

## 7. Metrics

### Weekly

| Metric | Target | Source |
|---|---|---|
| Avg first response time | < 24h | GitHub Issues |
| Available Good First Issues | ≥ 10 | GitHub Labels |
| New contributors / week | ≥ 3 | GitHub Contributors |
| Issue close rate | ≥ 60% | GitHub Issues |
| PR merge cycle | < 72h | GitHub PRs |

### Monthly

| Metric | Target |
|---|---|
| Cumulative contributors | M1: 20 / M2: 50 / M3: 100 |
| Community PR % | ≥ 30% |
| Contributor retention (2nd PR) | ≥ 40% |

---

## 8. Internal author filter

The auto-labelling system **skips internal team members** to avoid polluting internal workflows.

- **Internal members list**: maintain in `INTERNAL_AUTHORS` in `scripts/issue-lifecycle-bot.py`
- **Internal bots list**: `INTERNAL_BOTS` (e.g., sentry, slack-code-review-channel, dependabot)
- **In GitHub Actions**: judge via `TEAM_MEMBERS` and `ORG_MEMBERS` arrays

> When a team member leaves or joins, **update both lists in the same PR** to avoid drift.

---

## Anti-patterns

- ❌ Letting `needs-triage` accumulate past 1 week — kills the "alive repo" signal
- ❌ Aggressive auto-close without explanation — burns first-time contributors
- ❌ Running LLM duplicate detection without a confidence threshold — false positives anger reporters
- ❌ Skipping `good-first-issue` checks on big-name contributors' issues — they're often perfect GFI candidates
- ❌ Maintaining the team list in the bot but forgetting GitHub Actions config — drift causes mystery failures

---

## Related

- [`01-good-first-issue-system.md`](./01-good-first-issue-system.md) — the GFI formula referenced throughout
- [`04-pr-layer-operations.md`](./04-pr-layer-operations.md) — what happens after `accepted` + `help-wanted`
- [`03-contributor-recognition.md`](./03-contributor-recognition.md) — points / recognition triggered post-merge
- [`README.md`](./README.md) — 4-piece system overview
