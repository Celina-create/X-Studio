# [Product Name] — Software Design Document (Full)

> Fill **section by section**. Do not skip ahead. If a section's prerequisites aren't filled, stop and fill them first.

---

## 0. Doc Metadata

| Field | Value |
|---|---|
| **Title** | [Product Name] SDD |
| **Version** | v0.1 |
| **Status** | `Draft` / `In Review` / `Approved` / `Implementing` / `Shipped` |
| **Owner** | [Your name + role] |
| **Last Updated** | YYYY-MM-DD |
| **Reviewers** | [Names] |
| **Code Repo** | [URL or path] |
| **Live URL** | [URL or "TBD"] |
| **Related PRD** | [Link or "N/A"] |

---

## 1. TL;DR (3 sentences)

[What this product is, who it's for, what's the single most important thing it does. Imagine telling your aunt at a dinner party.]

**Example**: *Trend Radar is an AI agent that aggregates trending AI / startup signals from 12 sources daily and generates ready-to-post content angles. It's for solo growth operators who need to be on top of trends without drowning in feeds. The single most important thing: 5 trending topics + 3 ready-to-post tweets, every morning, in under 60 seconds of their attention.*

---

## 2. Problem & Goals

### 2.1 Problem Statement
[1-2 paragraphs: what's broken in the world today? Use evidence — quotes, data, citations.]

### 2.2 Goals
[Each goal has a metric and target. Bullet list of 3-5.]

- **G1**: [Goal description] → measured by [metric] → target: [value by when]
- **G2**: ...
- **G3**: ...

### 2.3 Non-Goals (what we're NOT trying to do)
- **NG1**: [Thing we explicitly won't do]
- **NG2**: ...

---

## 3. Success Metrics

### 3.1 Primary Metric (the one that matters most)
- **Metric**: [Name]
- **Definition**: [Precise calculation]
- **Target**: [Value, by when]
- **Why this metric**: [Rationale]

### 3.2 Guardrail Metrics (these can't get worse)
| Metric | Current baseline | Don't drop below |
|---|---|---|
| Latency p95 | — | <3s |
| Cost / request | — | <$0.05 |
| Error rate | — | <2% |

### 3.3 Counter-Metrics (watch for goodharting)
[Metrics we should NOT optimize but should watch — e.g. session length might increase because users are confused, not engaged]

---

## 4. Personas

### 4.1 Primary Persona
- **Name**: [e.g. "Growth Operator Grace"]
- **Role**: [Job title + context]
- **Daily workflow**: [What they do today, what tools they use]
- **Pain that this product solves**: [Specific moment of friction]
- **Success looks like for them**: [Their words, not yours]

### 4.2 Secondary Persona
[Optional — only if there's a clearly different second user type]

### 4.3 Anti-Persona (NOT for this product)
- **Who**: [Who you're explicitly not targeting]
- **Why**: [Why their needs would distort the product if you tried to serve them]

---

## 5. User Journeys (2-3 narrative flows)

### Journey A: [Happy path]
**Context**: [Where the user is, what they're doing]
**Trigger**: [What makes them open the product]
**Steps**:
1. [Action] → [System response]
2. ...
**End state**: [What they walk away with]

### Journey B: [Edge / discovery flow]
[Same structure]

### Journey C: [Failure flow — when it doesn't work]
[How does the user recover?]

---

## 6. Functional Requirements

> Each FR has: ID, Title, Priority (P0/P1/P2), Description, Acceptance.

### FR-1 [Title]
- **Priority**: P0
- **Description**: [What the system must do]
- **Acceptance**: [How we verify it's done]

### FR-2 [Title]
- ...

### FR-3 [Title]
- ...

[Continue for all P0/P1 requirements]

---

## 7. Non-Functional Requirements

| Category | Requirement | Target | Measurement method |
|---|---|---|---|
| **Latency** | p95 response time for primary action | <3s | Vercel analytics |
| **Throughput** | concurrent users supported | 100 | Load test |
| **Accuracy** | output meets quality bar | >85% match golden set | Eval framework §14 |
| **Cost** | LLM cost per active user / day | <$0.20 | OpenAI dashboard |
| **Availability** | uptime | 99.5% | Status page |
| **Mobile** | usable on iOS Safari | works | Manual QA |
| **Accessibility** | WCAG 2.1 AA | pass axe | Lighthouse |

---

## 8. System Architecture

### 8.1 High-level diagram
```
[ASCII art or Mermaid diagram]

┌─────────┐     ┌──────────────┐     ┌─────────────┐
│  User   │────▶│  Next.js UI  │────▶│  API Routes │
└─────────┘     └──────────────┘     └──────┬──────┘
                                            ▼
                                    ┌───────────────┐
                                    │  Agent Engine │
                                    └───────┬───────┘
                                  ┌─────────┼─────────┐
                                  ▼         ▼         ▼
                             [LLM API] [Source A] [Source B]
```

### 8.2 Components
| # | Component | Responsibility | Tech |
|---|---|---|---|
| 1 | UI | render trends, capture input | Next.js / React / Tailwind |
| 2 | API Layer | request validation, auth, rate limit | Next.js Route Handlers |
| 3 | Agent Engine | orchestrate sources → LLM → format | TypeScript service module |
| 4 | Source Adapters | fetch & normalize from each source | Per-source TS module |
| 5 | LLM Provider | text generation | Vercel AI SDK + chosen model |
| 6 | Cache | reduce duplicate LLM calls | Vercel KV / Upstash |
| 7 | Storage | persist user history (if applicable) | Postgres / sqlite |

---

## 9. LLM Strategy

### 9.1 Model Selection
| Use case | Model | Why | Fallback |
|---|---|---|---|
| Trend summarization | `claude-sonnet-4` | Best quality + JSON mode | `gpt-4o-mini` |
| Tweet generation | `gpt-4o-mini` | Speed + low cost | `claude-haiku` |
| Embedding (clustering) | `text-embedding-3-small` | Cheap | — |

### 9.2 Provider & Routing
- **Primary**: [e.g. Vercel AI Gateway]
- **API key location**: env var `OPENAI_API_KEY` / `ANTHROPIC_API_KEY`
- **Fallback chain**: if primary errors → try secondary; after 3 fails → return cached / error

### 9.3 Prompt Files Location
```
prompts/
├── system/
│   └── trend-summarizer.md
├── tasks/
│   ├── generate-tweet.md
│   └── extract-topic.md
└── eval/
    └── golden-inputs.json
```
> All prompts live in versioned markdown files. No prompts hardcoded in TS.

---

## 10. Agent Workflow

### 10.1 State machine / DAG
```
[fetch sources (parallel)] → [normalize & dedupe] → [cluster by topic]
                                                          ↓
                                       [score heat] → [for each top-N: generate content]
                                                                              ↓
                                                                          [cache & return]
```

### 10.2 Step-by-step
| Step | Inputs | Action | Outputs | Failure handling |
|---|---|---|---|---|
| 1 | filter spec | fetch from each source in parallel | raw posts[] | partial OK; mark missing sources |
| 2 | raw posts[] | normalize fields, dedupe by URL/title | clean posts[] | log skipped |
| 3 | clean posts[] | embed + cluster | trend clusters[] | if embed fails, fallback to keyword group |
| 4 | trend clusters | rank by recency × engagement | ranked trends[] | — |
| 5 | top-N trends | LLM: summarize + generate tweets + angle | enriched trends[] | retry 2x on LLM error |
| 6 | enriched trends | cache & return | response | — |

---

## 11. Tools / Function Calls (if agent uses tool-calling)

| Tool | Purpose | Inputs | Outputs |
|---|---|---|---|
| `fetch_source(name, filters)` | Pull posts from a source | source name, time window, keywords | post[] |
| `embed(texts)` | Get embeddings | text[] | vector[] |
| `cluster(vectors)` | Cluster vectors | vector[] | cluster[] |
| `generate(prompt, model)` | LLM call | prompt, model name | string |

---

## 12. Memory Strategy

| Type | Used? | Where stored | Retention |
|---|---|---|---|
| **None (stateless)** | ✅ | — | — |
| **Short-term (session)** | ❌ | — | — |
| **Long-term (per-user)** | 🟡 | Postgres (user_history table) | 90 days |

---

## 13. Human-in-the-Loop Checkpoints

| Step | Human review? | Why | UI mechanism |
|---|---|---|---|
| Tweet generation | Optional | User may want to edit before posting | Editable text area + copy button |
| Source addition | Manual config | Requires API key setup | Settings page |

---

## 14. Evaluation Framework

### 14.1 Golden Set (V1 minimum: 10 examples)
- Location: `eval/golden-inputs.json`
- Each entry: `{input: ..., expected_output_traits: [...], must_not_contain: [...]}`

### 14.2 Eval Cadence
- **Pre-commit**: smoke test (1 example, must pass)
- **Pre-deploy**: full golden set (>=85% pass rate to deploy)
- **Weekly**: regression check on cumulative golden set

### 14.3 Quality Dimensions
- Faithfulness (no hallucinated facts)
- Recency (today's data, not last week's)
- Diversity (5 trends shouldn't all be the same topic)
- Tone (matches "growth operator voice")

---

## 15. Data Model

```typescript
// Core entities
type Trend = {
  id: string
  topic: string
  sources: SourceRef[]
  heatScore: number
  tags: ('AI' | 'Agent' | 'OSS' | 'Growth' | ...)[]
  summary: string
  generatedTweets: Tweet[]
  redditPost?: string
  borrowAngle?: string
  createdAt: Date
  expiresAt: Date
}

type SourceRef = {
  source: 'X' | 'Reddit' | 'HN' | 'PH' | 'GitHub' | ...
  url: string
  author: string
  engagement: { likes?: number; comments?: number; shares?: number }
  fetchedAt: Date
}

type Tweet = {
  text: string
  angle: 'observation' | 'contrarian' | 'comparison' | 'question'
  hashtags: string[]
}
```

---

## 16. API Design

| Method | Path | Request | Response | Notes |
|---|---|---|---|---|
| GET | `/api/trends/today` | — | `Trend[]` | cached 1h |
| POST | `/api/trends/search` | `{keyword, sources?}` | `Trend[]` | rate limit 10/min/IP |
| POST | `/api/trends/:id/regenerate` | — | `Trend` | rate limit 5/min/IP |
| POST | `/api/trends/:id/favorite` | `{userId?}` | `{ok: true}` | optional auth |
| GET | `/api/sources/health` | — | `{source: status}[]` | for dashboard |

---

## 17. UI / Page Structure

```
/                       Landing (intro + try-it)
/agents/trend-radar     Main app
  ├── Hero: today's 5 trends (cards)
  ├── Search bar
  ├── Sources health indicator (top right)
  └── Trend detail (side panel)
       ├── Summary
       ├── Source posts list
       ├── Generated tweets (3 cards, copy-able)
       ├── Reddit-style post
       └── Borrow angle
/about                  About page
```

---

## 18. Tech Stack & Rationale

| Layer | Choice | Why |
|---|---|---|
| Framework | Next.js 16 App Router | SSR + API routes in one repo |
| Styling | Tailwind 4 + shadcn/ui | Fast, consistent, ships well |
| LLM | Vercel AI SDK | Provider abstraction, streaming |
| LLM Gateway | Vercel AI Gateway | Avoid managing per-provider keys |
| Cache | Vercel KV | Co-located with deploy, cheap |
| DB (if needed) | Vercel Postgres | Same vendor, serverless |
| Hosting | Vercel | Zero-config, great DX |
| Embedding | OpenAI text-embedding-3-small | Cheapest tier with good quality |

---

## 19. Deployment Topology

```
[Browser] → [Vercel Edge Network] → [Vercel Functions (US East)]
                                          ↓
                                ┌─────────┴─────────┐
                                ▼                   ▼
                          [LLM Provider]      [Vercel KV]
                          (us-east-1)         (us-east-1)
```

- **Regions**: US East (matches majority of source APIs)
- **Edge runtime**: only for landing page; agent uses Node runtime (LLM SDK requires)
- **Build**: GitHub → Vercel auto-deploy on push to `main`
- **Environments**: Preview (per PR) / Production (main branch)

---

## 20. Observability

### 20.1 Metrics
- Requests per minute
- Latency p50 / p95 / p99
- Error rate (per endpoint)
- LLM cost per day
- Source success rate (per source)

### 20.2 Logs
- Vercel Function logs (10-day retention free tier)
- Structured JSON: `{ts, level, route, userId?, durationMs, llmTokens?, error?}`

### 20.3 Alerts
- Error rate > 5% over 5min → Slack/email
- LLM daily cost > $10 → Slack/email
- Source success rate < 50% → log warning

---

## 21. Cost Model

| Item | Estimate | Assumption |
|---|---|---|
| LLM (sonnet for summary) | $0.005/trend × 5 trends/day × 100 users = **$2.50/day** | 100 DAU |
| LLM (gpt-4o-mini for tweets) | $0.001 × 15 tweets/day × 100 users = **$1.50/day** | 100 DAU |
| Vercel hosting | **$0/mo** (hobby tier) → **$20/mo** (pro at scale) | — |
| Vercel KV | **$0/mo** (free tier) → **$10/mo** (256MB) | — |
| Source APIs | $0 (RSS) + $X for X API if used | — |
| **Total monthly @ 100 DAU** | **~$140/mo** | LLM dominant |

Break-even: at $5/user/mo SaaS price, need ~30 paying users.

---

## 22. Security & Privacy

### 22.1 Authentication
- v1: anonymous; rate-limit by IP
- v2: GitHub OAuth (Vercel marketplace integration)

### 22.2 Authorization
- v1: all features public
- v2: per-user history requires auth; favorites stored per user

### 22.3 Data Handling
| Data | Stored? | Where | Retention | PII? |
|---|---|---|---|---|
| User search queries | yes (logs) | Vercel logs | 10 days | low |
| User IP | yes (rate-limit cache) | KV | 1 hour | medium |
| Generated tweets | yes (cache) | KV | 24 hours | none |
| User favorites (v2) | yes | Postgres | indefinite (user delete) | medium |

### 22.4 Secrets
- Stored in Vercel env vars (encrypted)
- Rotation: quarterly
- Never logged

---

## 23. Failure Modes

| Mode | Likelihood | Impact | Mitigation |
|---|---|---|---|
| LLM hallucinates fake news in summary | Medium | High (credibility) | Require citation to source URL; eval check |
| LLM stuck in loop generating tweets | Low | Medium (cost spike) | max_tokens cap + retry budget |
| Source RSS goes down | High (RSS feeds change) | Medium (one source missing) | Show "Source X unavailable" badge; continue with others |
| LLM API rate-limit | Medium | High (no output) | Fallback chain (provider B); cached results |
| Spike in concurrent users | Low (early stage) | High (Vercel cost) | Rate limit per IP + per global; daily budget cap |
| User pastes prompt injection in keyword | Medium | Low (just garbage out) | Sanitize input; system prompt has guardrails |

---

## 24. Acceptance Criteria

> Pass / fail must be unambiguous. A non-engineer should be able to test these.

### V1 ship criteria
- [ ] Loading the home page shows 5 trend cards in <3s (cached) or <8s (fresh)
- [ ] Each trend card shows: topic, summary, source count, "view details" button
- [ ] Clicking a card opens a panel with at least 3 generated tweets, each <280 chars
- [ ] "Copy" button on each tweet copies plain text to clipboard (no formatting)
- [ ] Searching keyword "agent" returns at least 3 trends related to AI agents
- [ ] Page works on iPhone 12 Safari (no horizontal scroll, all CTAs reachable)
- [ ] Eval suite passes >=85% on golden set
- [ ] Cost dashboard shows < $5 spent during 1-week beta with 20 users
- [ ] No exposed API keys in client bundle (verified via curl + grep)

---

## 25. Phased Delivery

### MVP (Week 1)
- 4 sources (HN, Dev.to, Reddit r/MachineLearning, GitHub Trending)
- Trend summary only (no tweet generation yet)
- No persistence
- Goal: prove the dedup + cluster + summarize pipeline works

### V1 (Week 2)
- 12 sources (full list)
- Tweet generation + Reddit post
- Cache layer
- Goal: shippable demo for portfolio / interviews

### V2 (Week 3-4)
- User auth + history + favorites
- Source health dashboard
- Email digest opt-in
- Goal: actually useful daily tool

### V3 (later)
- Custom source addition
- Multi-language output
- Schedule send to Buffer / Twitter API

---

## 26. Open Questions & Risks

### Open Questions
- [ ] Q1: Which X / Twitter API path? Paid v2, scrape via nitter, or skip X entirely for v1?
- [ ] Q2: Where to host source secrets (X API key, etc) — Vercel env or 1Password CLI?
- [ ] Q3: How to evaluate "trend quality" objectively — human rating, click-through, or LLM-as-judge?

### Top Risks
- **R1**: RSS feeds break frequently → need monitoring + fast adapter swap. *Mitigation*: source health dashboard
- **R2**: LLM costs explode if viral → daily budget cap. *Mitigation*: rate limit + KV cache
- **R3**: "Trend quality" is subjective → V1 may fail vibe check. *Mitigation*: ship to 5 friendly users first

---

## 27. Glossary

| Term | Meaning |
|---|---|
| Source | A discrete data origin (HN, X, Reddit, etc) |
| Trend | A clustered topic with N source posts + scores |
| Heat Score | engagement-weighted recency rank |
| Borrow Angle | how a creator can comment/repost the trend with their voice |

---

## 28. Changelog

| Version | Date | Author | Notes |
|---|---|---|---|
| v0.1 | YYYY-MM-DD | [name] | Initial draft |
