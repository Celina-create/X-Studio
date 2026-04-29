---
name: ai-agent-sdd
description: Write a professional Software Design Document (SDD) for an AI agent or AI-powered product before writing code. Forces the team / vibe-coding agent to clarify problem, users, success metrics, agent workflow, LLM strategy, evaluation framework, failure modes, and acceptance criteria — so implementation is bounded, testable, and shippable. Use when starting a new AI agent project, before vibe-coding a prototype, when an existing AI feature is over-running scope, or when handing off an AI product to a new owner / external developer. Two depth levels: MVP (12 sections, ~30-min fill) and Full (23 sections, ~2-hour fill).
---

# AI Agent SDD — Software Design Document for AI Agents

You guide product teams to **write a professional SDD before writing AI agent code**, so vibe-coding doesn't drift into a swamp of unboundable scope, fake metrics, and untestable behavior.

A good SDD answers, in order:

1. **Why** — what problem, for whom, measured how
2. **What** — functional + non-functional requirements
3. **How** — system architecture + LLM strategy + agent workflow + data + APIs + UI
4. **Bounds** — failure modes, security, evaluation, acceptance criteria
5. **Sequence** — phased delivery, risks, open questions

Without this, a vibe-coded AI product will (1) hallucinate its own goals mid-build, (2) be impossible to evaluate, (3) be impossible to hand off, and (4) demo well once but be unmaintainable.

---

## When to Use

- 🚀 Starting a new AI agent / AI-powered product (greenfield)
- 🔁 An existing AI feature is mid-flight and scope is drifting
- 🤝 Handing off an AI product to a new engineer, contractor, or co-founder
- 📊 Pitching an AI product to investors / partners — need a single source of truth
- 🎯 Vibe-coding session where you want the agent to write good code, not random code
- 🧪 Defining an evaluation framework (golden set, regression checks) before shipping

## When NOT to Use

- Tweaking copy / prompt one-liners (overhead too high)
- Pure infrastructure work with no LLM or agent logic (use a regular tech spec)
- Throwaway prototypes you'll abandon in <1 day (use a 5-line README)

---

## Non-Negotiable Principles

1. **Problem before solution** — fill sections 1-4 (Problem, Goals, Success Metrics, Personas) BEFORE writing any feature requirements
2. **Goals are testable** — every goal has a metric and a target. "Improve UX" is not a goal
3. **Non-goals are explicit** — what you're choosing NOT to do is as important as what you are
4. **No magic in agent workflow** — every LLM call has model, prompt location, expected input/output documented
5. **Failure modes are first-class** — list hallucination, infinite loops, downstream API failures BEFORE writing happy-path code
6. **Acceptance criteria are check-able by anyone** — including a non-engineer; pass / fail must be unambiguous
7. **Eval framework is part of MVP** — at least 10 golden inputs + expected outputs before shipping V1

---

## Two Templates

| Template | Sections | Fill time | Use when |
|---|---|---|---|
| `templates/sdd-template-mvp.md` | **12** | ~30 min | Small feature, single agent, pre-existing infra; or you need to start coding within hours |
| `templates/sdd-template-full.md` | **23** | ~2 hours | New product, multi-agent system, will be handed off, will be pitched, will be open-sourced |

**Default: start with MVP. Promote to Full when scope exceeds the MVP template.**

---

## Workflow — How to Run This Skill

### Step 1: Decide template depth
Ask the user: "Is this a new standalone product (Full), or a feature inside an existing product (MVP)?"

### Step 2: Copy the template
```bash
mkdir -p docs/sdd
cp .cursor/skills/ai-agent-sdd/templates/sdd-template-mvp.md docs/sdd/<product-slug>-sdd.md
# or sdd-template-full.md for the bigger version
```

### Step 3: Fill section-by-section (don't skip ahead)

The template enforces a fill-order. **Force the user/agent to answer each section in sequence**:

1. Don't allow Section 6 (Functional Requirements) to be filled until Sections 1-5 are done
2. Don't allow Section 9 (Agent Workflow) to be filled until Section 8 (System Architecture) is done
3. Don't allow Section 19 (Acceptance Criteria) to be filled until Sections 6-7 (FRs/NFRs) are done

This is because skipping ahead is what causes vibe-coded products to fail.

### Step 4: Get sign-off before code

Once SDD is filled:
- Show it to a stakeholder (advisor, co-founder, friend with PM background) — get 1-2 critical questions
- If 50%+ of FRs are vague, send back for refinement
- If acceptance criteria can't be tested, send back

Only then start coding.

### Step 5: Treat SDD as living doc

- Every PR that changes behavior must update the SDD section it affects
- At end of each phase (MVP → V1 → V2), bump version and add a changelog entry
- If SDD diverges from code by >2 sections, schedule a 30-min sync to reconcile

---

## Section Checklist (Full template — 23 sections)

| # | Section | Required? | What it answers |
|---|---|---|---|
| 0 | Doc Metadata | ✅ | version, owner, status, last_updated, reviewers |
| 1 | TL;DR | ✅ | 3-sentence elevator pitch |
| 2 | Problem & Goals | ✅ | what's broken, what we want to achieve, what we won't try |
| 3 | Success Metrics | ✅ | primary metric + guardrails + targets |
| 4 | Personas | ✅ | primary + secondary user roles |
| 5 | User Journeys | ✅ | 2-3 narrative flows |
| 6 | Functional Requirements | ✅ | FR-1, FR-2 ... with ID, priority, acceptance |
| 7 | Non-Functional Requirements | 🟡 | latency, throughput, accuracy, cost ceiling |
| 8 | System Architecture | ✅ | high-level diagram + component list |
| 9 | LLM Strategy | ✅ (AI) | model selection, fallback chain, prompt files location |
| 10 | Agent Workflow | ✅ (AI) | state machine / DAG of steps |
| 11 | Tools / Function Calls | ✅ (AI) | list of tools agent can invoke |
| 12 | Memory Strategy | 🟡 (AI) | none / short-term / long-term |
| 13 | Human-in-the-Loop | 🟡 (AI) | where humans intervene |
| 14 | Evaluation Framework | ✅ (AI) | golden set, eval cadence, regression checks |
| 15 | Data Model | ✅ | entities, relationships, schema sketch |
| 16 | API Design | ✅ | endpoint table |
| 17 | UI / Page Structure | 🟡 | wireframe sketch, route map |
| 18 | Tech Stack & Rationale | 🟡 | why each choice |
| 19 | Deployment Topology | 🟡 | where each component runs |
| 20 | Observability | 🟡 | metrics, logs, traces, alerts |
| 21 | Cost Model | 🟡 | LLM tokens, infra, third-party APIs |
| 22 | Security & Privacy | ✅ | authn/authz, data handling, secrets |
| 23 | Failure Modes | ✅ | hallucination, infinite loop, downstream failure |
| 24 | Acceptance Criteria | ✅ | testable, verifiable |
| 25 | Phased Delivery | 🟡 | MVP → V1 → V2 |
| 26 | Open Questions & Risks | 🟡 | what's unresolved |
| 27 | Glossary | ⚪ | domain terms |
| 28 | Changelog | ⚪ | v0.1, v0.2 ... |

✅ = required · 🟡 = recommended · ⚪ = optional · (AI) = AI-specific

> The MVP template (`sdd-template-mvp.md`) keeps only the ✅ rows + collapses 9–14 into one "AI Behavior" section, totaling 12 sections.

---

## Anti-Patterns to Reject

| Anti-pattern | Why it kills the SDD |
|---|---|
| "We'll add metrics later" | If you can't measure success, you can't ship |
| "The agent will figure it out" | LLM behavior must be specified, not hoped for |
| "Acceptance criteria: works as expected" | Untestable = won't be tested = silent failure in prod |
| "We'll handle errors gracefully" | List actual failure modes; "gracefully" is meaningless |
| Copying every section header but leaving content blank | A blank section is worse than no section |
| Writing SDD AFTER code is built | The doc loses its point — it's now just documentation, not design |

---

## Pairing with Other Skills

- **Before SDD**: `pm-feature-spec` for the broader product PRD; `persona-research` for personas
- **After SDD**: `growth-experiment-template` for launch experiments; `daily-review-update` for execution tracking
- **Implementation**: run a vibe-coding session with Cursor / Claude Code, **passing the SDD as context** in the system prompt — "read docs/sdd/<product>.md, then implement section-by-section"

---

## Output Artifact Structure

After running this skill, the workspace should contain:

```
docs/sdd/
└── <product-slug>-sdd.md          # the filled SDD
```

If the product also has a PRD (from `pm-feature-spec`):

```
docs/
├── prd/<product-slug>.md          # what & why (product framing)
├── sdd/<product-slug>-sdd.md      # how & bounds (technical design)
└── eval/<product-slug>-golden.json # evaluation set (referenced by SDD §14)
```

---

## Strategic Note

A great SDD is a **forcing function for clarity**. Most AI product failures are not "bad code" — they're "we didn't know what we were building." Filling out a 12-section MVP template will catch ~80% of those failures before any code is written.

Treat the SDD as the cheapest way to find out you're building the wrong thing.
