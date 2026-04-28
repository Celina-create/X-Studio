---
name: competitor-deep-research-sop
description: Run competitor UX research using the v1.3.1 methodology — dual-axis pain mapping (M1×M2), 14 dimensions, 12-layer evidence channels, seed-user signals (S1–S3), Tier-1 outreach list, and monitoring cadence. Use when doing deep user-pain oriented competitor research (not just feature comparison), building seed-user pipelines from competitor communities, or producing S-tier deep-dive reports aligned with a structured SOP.
---

# Competitor Deep Research (SOP v1.3.1)

You guide **pain-first, evidence-backed competitor research** that produces **actionable outputs**: not only analysis, but **Tier-1 reachable contacts**, **outreach angles**, and **ongoing monitoring**.

This skill is the **agent-executable layer** on top of the full written standard:

- **Full text**: `templates/competitor-ux-research-framework-v1.3.1.md` (930 lines — channels, matrices, templates, A-tier lite mode).

If another skill in the workspace is named `competitive-analysis`, distinguish them:

| Skill | Primary lens |
|-------|----------------|
| `competitive-analysis` | Positioning, capability grid, growth/SEO signals, strategic brief |
| `competitor-deep-research-sop` (this) | **User pain × seed users × 12-layer evidence × M1×M2 matrix × Tier-1 list** |

Pairing: run **this** for “who hurts & where”; run **`competitive-intel-mining`** (if present) to operationalize community mining; run **`competitive-analysis`** for product/GTM framing.

---

## When to Use

- Single competitor **deep dive** (S-tier style) with reproducible methodology.
- Need **M1 × M2 pain matrix**, **S1–S3 seed signals**, and **Tier-1 outreach list**.
- Must prove **channel coverage** (12 layers) with sub-channel hits (v1.3.1).
- Building **monitoring** (RSS, alerts) after the research spike.

## When Not to Use

- Quick positioning memo only → use `competitive-analysis` or a short brief.
- Only “mine GitHub issues for leads” → use `competitive-intel-mining`-style narrow workflow.

---

## Non-Negotiable Principles

1. **No official-story-only**: force user-side evidence across **12 layers** (see full doc §3).
2. **Every pain item**: tag **`M1` (who hurts)** × **`M2` (pain type)** when evidence supports it.
3. **Sources**: web links or identifiers; no fabricated metrics (DAU, revenue).
4. **Outputs must ship**: pain report structure + Tier-1 list + ≥2 outreach hooks + monitoring sketch.

---

## Concept Quick Reference (memorize direction; details in full doc)

### 14 dimensions

| Bucket | IDs | Role |
|--------|-----|------|
| Dual axis | **M1** users · **M2** pain types | Build **6×10** heat-style mapping |
| Themes | **M3**–**M9** | Evidence path, business model, trade-offs, onboarding, hype gap, churn/migration, feature gaps |
| Signals | **S1** anger · **S2** alt-seeking · **S3** self-rescue | Feed **Tier-1** prioritization (**S3 first**) |

### 12 layers (L1–L12)

Code hosts → forums → long-form/newsletters → social → review aggregators → search → app stores → Q&A → hiring → finance/disclosures → product-native communities → awesome lists.  
**v1.3.1**: each layer lists **sub-channels**; coverage and hit rules are in full doc §3 + §3.x hit rules.

---

## Execution Phases (map to full doc §5)

Advance phase-by-phase; do not skip **Phase C–E** if the user asked for a full S-tier deliverable.

### Phase A — Charter (§5 stage 1)

Output a scope block:

```md
## Charter
- Competitor(s):
- Tier intent: S full | A lite | custom
- Decision this informs:
- Owner / date:
- Output paths (adapt to user repo): report file, monitoring file, matrix source
```

### Phase B — Product snapshot (§5 stage 2)

Deliver **at top of report**:

- One-line positioning + short description  
- GitHub stats if OSS (stars, contributors, rough age, maintainer handles)  
- Domain / entry points list  
- Audience types (map toward **M1**)  
- **Who they sell to** (commercial target ≠ generic audience)

### Phase C — Evidence sweep — 12 layers (§5 stage 3)

- Work layer-by-layer; record **sub-channel hits** (v1.3.1 granularity).
- Minimum discipline from SOP: strong **L1/L3/L6/L11** coverage when applicable; never skip **L1 + L3 + L11** without explicit rationale (see full doc §3 rules).
- Maintain **appendix evidence list**: URL, quote stub, date, proposed **M1×M2** tags.

### Phase D — Pain mapping (§5 stage 4)

1. **M1×M2 matrix**: aggregate counts or severity per cell (🔴/🟠/🟡/empty); call out **top 3 hot cells**.
2. **M4–M9**: fill theme sections (business model, trade-offs, onboarding, hype gap, flows, feature backlog signals).
3. **S1–S3**: classify leads; **elevate S3** (forks, PRs, workarounds) to Tier-1 priority.
4. **Orphan bucket**: evidence that fits no cell → park in **§orphan**; if ≥3 similar orphans, flag as candidate new dimension (do not rewrite framework ad hoc).

### Phase E — Comparison grid (§5 stage 5)

If multi-competitor: fill comparison table — at minimum **business model** + **self-host / deployment posture** + dimensions user chose; add “differentiation insight” paragraph per table.

### Phase F — Seed pipeline (§5 stage 6)

- Tier-1 list: **P0 5–10** with handles + why (signal type).
- **≥2 outreach angles** (technical pain vs onboarding pain vs self-rescue).

### Phase G — Playbook for “your product” (§5 stage 7)

- **5 insights**, each containing an explicit **“avoid X’s trap”** style lesson where possible.
- **4-step seed motion** (week 1 / week 2 / month 1 / ongoing).
- **Monitoring**: at least one hook each for **L1-class** and **L6-class** signals (RSS, alerts, saved searches — see full doc §8).

### Phase H — Wrap-up (§5 stage 8)

- Short **insights** file (bullet memory).
- Update **competitive matrix / facts** if this workspace keeps them.

### Phase I — External framework check (§5 stage 9, quarterly optional)

Optional: Mom Test, JTBD, Kano, PMF survey — one paragraph each on gaps.

---

## Report Skeleton (must match §6 in full doc)

Use this outline for the main deliverable:

1. **Snapshot** (positioning, GitHub, URLs, audiences)  
2. **TL;DR** + **M5 trade-offs** (≥3)  
3. **Method** — channel coverage table (**L1–L12** with sub-channel hits)  
4. **Pain** — **M1×M2** matrix + top-3 cells deep dives  
5. **Themes** — M4–M9 sections  
6. **Signals** — S1/S2/S3 + **Tier-1 list**  
7. **Playbook** — implications + monitoring + next steps  
8. **Appendices** — evidence chain, templates used

**Evidence citation style** (per full doc):

```text
> "quote"
> — [source](url) · reactions if any
> **Tags**: `M1 …` × `M2 …` · S1/S2/S3 …
```

---

## A-Tier Lite Mode

If user selects **A-tier** (cross-layer watch, less depth):

- Follow **§9** in `templates/competitor-ux-research-framework-v1.3.1.md`: reduced dimension set, drift tracking table, shorter report shell.
- Still keep **L1/L3/L6/L11** signal coverage unless explicitly scoped down.

---

## Quality Gates (before calling research “done”)

- [ ] Every 🔴/🟠 pain has **M1×M2** or explicit “uncategorized” with orphan note  
- [ ] 12-layer table shows **which sub-channels hit** (or “N/A” with reason)  
- [ ] Tier-1 list has **≥5** contacts or explicit “insufficient public identity — next steps”  
- [ ] Monitoring section has **actionable** subscriptions/alerts, not vague “watch Twitter”

---

## Related Skills / Assets

- Full methodology: `templates/competitor-ux-research-framework-v1.3.1.md`
- Pair with seed tooling in same repo (e.g. scrapers, CSV enrichment) when moving from **list → email**.

---

## Maintainer Notes

- **Product names**: user may say Nexu / internal codenames — keep output **product-agnostic** unless scope says otherwise.
- **Language**: this `SKILL.md` is English; use `SKILL.zh-CN.md` for Chinese-first execution.
