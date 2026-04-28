---
title: PR Layer Operations
date: 2026-04
type: playbook / open-source-devrel · piece 4 of 4
status: shipped (battle-tested in production)
goal: Cover the full path from "I'd like to work on this" → "PR merged + points awarded", with 48h review SLA and AI-assistance transparency
---

# PR Layer Operations — Step-by-Step + 48h SLA + Agent PR Transparency

> The Issue Pipeline gets contributors to *try*. The PR Layer determines whether they *finish*. This playbook is the difference between a 30% claim-to-PR conversion rate and a 75% one.

---

## 0. Why this exists

Three failure modes kill PR conversion:

1. **Contributor doesn't know what "done" looks like** → no PR template, no self-check, ships incomplete work
2. **PR sits unreviewed for a week** → contributor disengages, never returns
3. **AI-assisted code is invisible to reviewer** → trust erodes when reviewer realizes mid-debate

This playbook addresses all three with: (a) a step-by-step contributor guide, (b) a hard 48h review SLA with auto-escalation, and (c) a transparent AI-assistance framework.

---

## 1. Step-by-step contributor flow

### 1.1 Full pipeline overview

```
Step 1  Environment + Fork & Clone
Step 2  Pick Issue + Claim
Step 3  Branch Creation
Step 4  Coding (AI Prompt assisted)
Step 5  Self-check (lint + test + build)
Step 6  Submit PR
Step 7  Review interaction
Step 8  Merged + Points awarded
```

### 1.2 Detailed steps

#### Step 1 — Environment + Fork & Clone

**Prerequisites** (replace with your stack):

| Tool | Version | Notes |
|---|---|---|
| Git | — | Version control |
| Node.js | LTS | Enforce via `package.json` `engines` field |
| pnpm | latest | Pin via `packageManager` field for consistency |

```bash
# 1. Fork <your-org>/<your-repo> via GitHub UI
# 2. Clone your fork
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>
git remote add upstream https://github.com/<your-org>/<your-repo>.git

# 3. Install dependencies at repo root
pnpm install
```

> If you've forked previously, sync upstream first:
> ```bash
> git fetch upstream
> git checkout main
> git merge upstream/main
> pnpm install
> ```

#### Step 2 — Pick Issue + Claim

1. Open the [Good First Issues](https://github.com/<your-org>/<your-repo>/labels/good-first-issue) page
2. Filter by area label (`area/frontend`, `area/backend`, ...)
3. Comment on the issue to claim:

```
I'd like to work on this!
```

4. Bot auto-assigns you and replies with the starter guide

> **Rule**: one claim at a time. Finish before claiming the next.

#### Step 3 — Branch Creation

```bash
# Naming: {type}/{short-description} or {type}/{issue-number}-{short-description}
git checkout -b fix/901-sidebar-button-align
```

| type | Use case | Example |
|---|---|---|
| `fix/` | Bug fix | `fix/login-validation` |
| `feat/` | New feature | `feat/webhook-integration` |
| `docs/` | Documentation | `docs/byok-guide` |
| `style/` | Style / UI | `style/sidebar-align` |
| `test/` | Tests | `test/api-key-validation` |
| `skill/` | Plugin development | `skill/weather-query` |
| `i18n/` | Localization | `i18n/ja-language-pack` |
| `chore/` | Tooling / deps | `chore/update-deps` |
| `refactor/` | Refactor | `refactor/channel-adapter` |

#### Step 4 — Coding

**AI-assisted (recommended)**:

- Copy the **AI Prompt** from the bottom of the Issue, paste into Cursor / Claude Code / Codex
- AI guides you through reading relevant files, understanding context, implementing changes
- If no prompt is provided, use the universal templates from `01-good-first-issue-system.md` § 5

**Common dev commands** (run from repo root):

| Command | Purpose |
|---|---|
| `pnpm dev` | Dev mode with HMR |
| `pnpm lint` | Lint + typecheck (matches CI) |
| `pnpm lint:fix` | Auto-fix what's auto-fixable |
| `pnpm format` | Format code |
| `pnpm test` | Run unit tests |
| `pnpm build` | Production build |
| `pnpm typecheck` | TypeScript check across repo |

**Coding standards quick-reference** (adjust for your project):

| Item | Standard |
|---|---|
| Format / Lint | Biome (or your chosen tool) — see repo `biome.json` |
| Comments | English only |
| CSS | Tailwind, no new style files |
| Env vars | Use `ConfigService` (or equivalent), not direct `process.env` |
| Secrets | **Never commit** Tokens / API Keys / personal config |

#### Step 5 — Self-check

Before opening PR, confirm:

**Required**:

- [ ] Modified only files relevant to the Issue (one PR = one focused change)
- [ ] `pnpm lint` passes (matches CI)
- [ ] `pnpm test` passes
- [ ] commit message follows Conventional Commits (imperative: `add`, `fix`, not `added`)

**When applicable**:

- [ ] If i18n changed → both Chinese and English updated
- [ ] If build artifacts affected → `pnpm build` + `pnpm check:esm-imports` pass
- [ ] If `docs/` changed → preview locally + both languages updated

**Conventional Commits format**:

```
<type>(<scope>): <description>

# Examples
fix(frontend): align sidebar collapse button
feat(skill-engine): add weather query skill
docs(guide): add BYOK configuration tutorial
style(login): fix favicon display on login page
i18n(zh): update credit label
chore(deps): update biome to v2
refactor(channels): simplify message adapter interface
```

> Split unrelated changes into multiple commits. Keep each commit semantically clear.

#### Step 6 — Submit PR

```bash
git add .
git commit -m "fix(frontend): align sidebar collapse button (#901)"
git push origin fix/901-sidebar-button-align
```

On GitHub:
- **Use the PR template** (see § 2 below)
- Link Issue with `Fixes #123` / `Closes #123`
- UI changes **must include screenshot or screen recording**
- Stay synced with `main` to minimize conflicts

> **CI**: PR triggers `typecheck`, `lint`, `build`, `check:esm-imports`. Docs-only PRs trigger `docs-ci.yml`. Must pass CI before merge.

#### Step 7 — Review interaction

- Mentor delivers first review **within 48h** (see § 3 SLA)
- Review covers four dimensions: **correctness, security/privacy, maintainability, user clarity**
- When you receive feedback:
  1. Read carefully
  2. Make changes locally + push as additional commits
  3. Reply to the review comments explaining your fixes
  4. Ask questions inline if anything is unclear

```bash
git add .
git commit -m "fix: address review feedback — use flex-col instead of block"
git push origin fix/901-sidebar-button-align
```

> **Tip**: Review is collaboration, not exam. Receiving change requests is normal. Smaller PRs typically merge faster. Maintainer may squash commits at merge time.

#### Step 8 — Merged + Points

After merge:

- Bot auto-thanks you in the PR comments
- Points credited within **1 business day**
- Avatar appears on the contributor wall
- DevRel reaches out to invite you to Discord and recommend next contribution
- Questions welcome on [GitHub Discussions](https://github.com/<your-org>/<your-repo>/discussions)

---

## 2. PR templates

### 2.1 Universal PR template (`.github/PULL_REQUEST_TEMPLATE.md`)

```markdown
## What

<!-- 1-2 sentences on what this PR does -->

Closes #{issue_number}

## Why

<!-- Why is this change needed? Link to the Issue's problem description -->

## How

<!-- Brief explanation of the implementation. Which files? What approach? -->

- 

## Screenshots / Recordings

<!-- For UI changes — required. For non-UI, delete this section -->

| Before | After |
|---|---|
|   |   |

## Self-Check

- [ ] Only modified files relevant to the Issue (one focused change)
- [ ] `pnpm lint` passes (lint + typecheck)
- [ ] `pnpm test` passes
- [ ] No tokens / API keys / sensitive info committed
- [ ] i18n synced across languages (if applicable)
- [ ] Build verification passes (if build artifacts affected)
- [ ] commit messages follow Conventional Commits

## AI Disclosure

<!-- If you used AI tools, please disclose honestly. This does NOT affect PR acceptance. -->

- [ ] This PR used AI-assisted coding
- Tools used: <!-- Cursor / Claude Code / GitHub Copilot / other -->
- Scope: <!-- All code / partial logic / reading-only -->
```

### 2.2 Good First Issue PR template

```markdown
## 🌱 Good First Issue PR

### What

Closes #{issue_number}

### Changes

- `path/to/file.ts` — what changed

### Verification

<!-- Tick off the verification steps from the Issue -->

- [ ] Step 1
- [ ] Step 2
- [ ] Step 3

### Screenshot

<!-- Required for UI changes -->

### Self-Check

- [ ] Modified only Issue-relevant files
- [ ] `pnpm lint` passes
- [ ] `pnpm test` passes (if applicable)
- [ ] No sensitive info committed

### AI Disclosure

- [ ] Used AI assistance
- Tool: <!-- Cursor / Claude Code / Copilot / other -->
- Scope: <!-- All / partial / reading only -->

### My experience

<!-- Optional: Is this your first open source PR? Any difficulties? Suggestions? -->
```

### 2.3 PR labels

| Label | Color | Meaning |
|---|---|---|
| `first-contribution` | 🟢 `#0E8A16` | Contributor's first PR |
| `agent-assisted` | 🤖 `#7057FF` | AI-assisted coding declared |
| `needs-review` | 🟡 `#FBCA04` | Awaiting review |
| `changes-requested` | 🔴 `#B60205` | Changes requested by reviewer |
| `approved` | 🟢 `#0E8A16` | Review approved |
| `mentor-review` | 🔵 `#0075CA` | Needs area-specific Mentor |
| `review-overdue` | ⚠️ `#D93F0B` | >48h without review |

---

## 3. 48h Review SLA

### 3.1 Commitments

| Step | SLA | Scope |
|---|---|---|
| **First review** | 48h | All external contributor PRs |
| **GFI first review** | 24h (recommended) | PRs labeled `good-first-issue` |
| **Re-review after changes** | 24h | All PRs |
| **Approve → Merge** | Same business day | All approved PRs |

### 3.2 Review assignment

```
New PR submitted
    ↓
Auto-detect area/ label
    ↓
├── Has area/ label → assign to area's primary Mentor
│     ↓ no response in 24h
│     → auto-add backup Mentor as reviewer
│     ↓ another 24h (cumulative 48h)
│     → label review-overdue + notify ops
│
└── No area/ label → label needs-triage → Maintainer manually assigns
```

**Mentor reviewer map** (align with `01-good-first-issue-system.md`):

| area/ | Primary Reviewer (role) | Backup |
|---|---|---|
| `area/frontend` | Frontend Lead | Frontend Engineer |
| `area/backend` | Backend Lead | Senior Engineer |
| `area/skill-engine` | Plugin Owner | Backend Engineer |
| `area/channels` | Integrations Engineer | Backend Lead |
| `area/docs` | DevRel Lead | Operations |
| `area/i18n` | Localization Owner | DevRel Lead |
| `area/design` | Design Lead | Frontend Engineer |

### 3.3 Auto-escalation GitHub Action

`pr-review-tracker.yml`:

```yaml
name: PR Review Tracker
on:
  schedule:
    - cron: '0 */6 * * *'  # every 6 hours
  pull_request_target:
    types: [opened, ready_for_review]

jobs:
  track-review:
    runs-on: ubuntu-latest
    steps:
      - name: Check pending reviews
        uses: actions/github-script@v7
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
          script: |
            // Replace with your area→mentor mapping
            const AREA_MENTORS = {
              'area/frontend':     { primary: 'frontend-lead', fallback: 'frontend-eng' },
              'area/backend':      { primary: 'backend-lead',  fallback: 'senior-eng' },
              'area/skill-engine': { primary: 'plugin-owner',  fallback: 'backend-eng' },
              'area/channels':     { primary: 'integrations',  fallback: 'backend-lead' },
              'area/docs':         { primary: 'devrel-lead',   fallback: 'operations' },
              'area/i18n':         { primary: 'l10n-owner',    fallback: 'devrel-lead' },
              'area/design':       { primary: 'design-lead',   fallback: 'frontend-eng' }
            };

            // Replace with your team handles
            const TEAM_MEMBERS = [
              'frontend-lead', 'frontend-eng', 'backend-lead', 'senior-eng',
              'plugin-owner', 'integrations', 'devrel-lead', 'operations',
              'l10n-owner', 'design-lead'
            ];

            const prs = await github.rest.pulls.list({
              owner: context.repo.owner,
              repo: context.repo.repo,
              state: 'open'
            });

            for (const pr of prs.data) {
              if (TEAM_MEMBERS.includes(pr.user.login)) continue;
              if (pr.draft) continue;

              const hoursOpen = (Date.now() - new Date(pr.created_at)) / (1000 * 60 * 60);

              const reviews = await github.rest.pulls.listReviews({
                owner: context.repo.owner,
                repo: context.repo.repo,
                pull_number: pr.number
              });

              const hasTeamReview = reviews.data.some(r => TEAM_MEMBERS.includes(r.user.login));
              if (hasTeamReview) continue;

              const labels = pr.labels.map(l => l.name);
              const area = labels.find(l => l.startsWith('area/'));

              // 24h: add fallback reviewer
              if (hoursOpen > 24 && area && AREA_MENTORS[area]) {
                await github.rest.pulls.requestReviewers({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  pull_number: pr.number,
                  reviewers: [AREA_MENTORS[area].fallback]
                });
              }

              // 48h: mark overdue + notify
              if (hoursOpen > 48) {
                await github.rest.issues.addLabels({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  issue_number: pr.number,
                  labels: ['review-overdue']
                });
                await github.rest.issues.createComment({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  issue_number: pr.number,
                  body: `⚠️ This PR has been waiting for review for over 48 hours.\n\n` +
                        `cc @<your-org>/maintainers — please prioritize.\n\n` +
                        `@${pr.user.login} Sorry for the wait!`
                });
              }
            }
```

### 3.4 Review etiquette

#### Four review dimensions

| Dimension | Check |
|---|---|
| **Correctness** | Does it solve the issue? Any logical gaps? |
| **Security & Privacy** | No secrets committed? Inputs handled safely? |
| **Maintainability** | Only relevant files changed? Style consistent? English comments? |
| **User clarity** | UI intuitive? Copy accurate? i18n synced? |

#### Review tone templates

**For first-time contributors** (warm, encouraging):

```
Thanks for the PR, @{username}! Great first contribution 🎉

A few suggestions:

1. **{file}:{line}** — {specific suggestion with code example}

   ```tsx
   // suggestion
   <Button className="flex items-center gap-2" />
   ```

2. **{file}:{line}** — {specific suggestion}

Overall the approach looks good. Once you address these comments, I'll approve.
Feel free to ask if anything is unclear!
```

**For experienced contributors** (direct, efficient):

```
LGTM overall. Two nits:

1. {file}:{line} — prefer `configService.get()` over direct `process.env`
2. {file}:{line} — missing null check for edge case

Approved pending these changes.
```

**For PRs needing significant rework** (constructive, not discouraging):

```
Thanks for working on this, @{username}. The direction is right, but there are some structural changes needed.

Instead of modifying {current approach}, the project convention is to {correct approach}. Here's why: {brief explanation}.

I've left inline comments with specific suggestions. I'd recommend:
1. {step one}
2. {step two}

Don't worry about getting it perfect — this is a learning process. Let me know if you need any help!
```

---

## 4. Agent PR (AI-assisted) Transparency Framework

### 4.1 Why this matters

AI coding tools (Cursor, Claude Code, Copilot, Aider, Codeium) are now part of normal contributor workflow. **Pretending otherwise builds bad reviews.** This framework makes AI assistance transparent and audit-able without penalizing it.

### 4.2 Three principles

1. **Encourage use, do not penalize disclosure** — using AI does not lower PR acceptance; not disclosing it erodes trust
2. **Transparency first** — AI-assisted code receives equal-or-stricter review
3. **Human is responsible for outcome** — regardless of code origin, the PR author owns code quality

### 4.3 Disclosure flow

```
PR submitted
    ↓
Contributor fills "AI Disclosure" in PR template
    ↓
├── Checks "Used AI" → auto-label agent-assisted
│     ↓
│   Reviewer applies Agent Review Checklist (§ 4.5)
│
├── Unchecked → normal review flow
│     ↓
│   Bot auto-detects AI signals (advisory only, no auto-label)
│     ├── Signal detected → polite reminder comment, no label
│     └── No signal → normal flow
│
└── Bot detects + contributor confirms → label agent-assisted
```

### 4.4 AI signal auto-detection (advisory)

Bot checks for these signals (any hit = polite advisory, never auto-label):

| Signal | Detection | Accuracy |
|---|---|---|
| Commit message mentions AI tool | regex `cursor`, `copilot`, `claude`, `aider`, `codeium`, `tabnine` | High |
| `.cursor/`, `.aider*`, `.copilot` files committed | path detection | High |
| Single commit changes many unrelated files | diff analysis | Medium |
| Sudden style shift in comments (e.g., long explanatory blocks) | heuristic | Low |

**Bot reminder comment template**:

```
🤖 Hi @{username}! I noticed some signals that suggest AI tools may have
been used in this PR (e.g., {detected_signal}).

This is totally fine — we encourage AI-assisted development!
If you did use AI tools, please check the "AI Disclosure" box in the PR
description and note which tool. This helps reviewers provide better feedback.

No action needed if this is a false positive.
```

### 4.5 Agent PR Review Checklist (extra checks for `agent-assisted` PRs)

| # | Check | Why it matters |
|---|---|---|
| 1 | **Comprehension** — author can explain core logic | Confirms it's not blind paste-from-AI |
| 2 | **Edge cases** — null, empty arrays, exceptional inputs handled | AI commonly skips boundaries |
| 3 | **Style consistency** — code style matches project conventions | AI may introduce different style |
| 4 | **Dependency hygiene** — no unnecessary new deps added | AI tends to recommend extra libs |
| 5 | **Security** — no hardcoded secrets, safe input handling | AI sample code may contain placeholder secrets |
| 6 | **Scope discipline** — change stays within Issue scope | AI may "over-engineer" |
| 7 | **Test coverage** — AI-generated code has corresponding tests | AI often skips tests |

**Comprehension verification question** (reviewer may ask):

```
Quick question @{username}: Can you explain why you chose to use
{specific pattern/approach} here instead of {alternative}?

(Standard check for AI-assisted PRs — no wrong answer!)
```

### 4.6 Agent PR detection GitHub Action

```yaml
name: Agent PR Detection
on:
  pull_request_target:
    types: [opened, edited]

jobs:
  detect-agent:
    runs-on: ubuntu-latest
    steps:
      - name: Check AI disclosure and signals
        uses: actions/github-script@v7
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
          script: |
            const pr = context.payload.pull_request;
            const body = pr.body || '';

            // Check disclosure box
            const aiDisclosed = body.match(/- \[x\]\s*This PR used AI/i)
              || body.match(/- \[x\]\s*Used AI assistance/i);

            if (aiDisclosed) {
              await github.rest.issues.addLabels({
                owner: context.repo.owner,
                repo: context.repo.repo,
                issue_number: pr.number,
                labels: ['agent-assisted']
              });
              return;
            }

            // Heuristic detection (advisory only)
            const AI_SIGNALS = [
              /cursor/i, /copilot/i, /claude/i,
              /aider/i, /codeium/i, /tabnine/i
            ];

            const commits = await github.rest.pulls.listCommits({
              owner: context.repo.owner,
              repo: context.repo.repo,
              pull_number: pr.number
            });

            const files = await github.rest.pulls.listFiles({
              owner: context.repo.owner,
              repo: context.repo.repo,
              pull_number: pr.number
            });

            let signals = [];

            for (const commit of commits.data) {
              for (const pattern of AI_SIGNALS) {
                if (pattern.test(commit.commit.message)) {
                  signals.push(`commit message mentions "${commit.commit.message.match(pattern)[0]}"`);
                  break;
                }
              }
            }

            const aiConfigFiles = files.data.filter(f =>
              f.filename.startsWith('.cursor/') ||
              f.filename.startsWith('.aider')   ||
              f.filename === '.copilot'
            );
            if (aiConfigFiles.length > 0) {
              signals.push(`AI config files: ${aiConfigFiles.map(f => f.filename).join(', ')}`);
            }

            if (signals.length > 0) {
              await github.rest.issues.createComment({
                owner: context.repo.owner,
                repo: context.repo.repo,
                issue_number: pr.number,
                body: `🤖 Hi @${pr.user.login}! I noticed some signals that suggest AI tools may have been used:\n\n` +
                      signals.map(s => `- ${s}`).join('\n') + '\n\n' +
                      `This is totally fine — we encourage AI-assisted development! ` +
                      `If you did use AI tools, please check the "AI Disclosure" box in the PR description.\n\n` +
                      `No action needed if this is a false positive.`
              });
            }
```

### 4.7 Agent PR data dashboard

Track AI-assistance trends to optimize prompt template effectiveness:

| Metric | How to measure | Use case |
|---|---|---|
| Agent PR % | `agent-assisted` / total external PRs | AI penetration rate |
| Agent PR first-pass rate | Agent PRs approved on first review | AI code quality signal |
| Agent PR avg review rounds | Round-trips on Agent PRs | Compare to human PRs |
| AI tool distribution | PR template tool field | Tool preference signal |
| AI Prompt adoption | PRs that mention using Issue's AI Prompt | Prompt template effectiveness |

**Monthly Agent PR report template**:

```
## Agent PR Monthly — {YYYY-MM}

- Total external PRs: {N}
- Agent-assisted PRs: {N} ({X}%)
- Agent PR first-pass rate: {X}%
- Agent PR avg review rounds: {N}
- Non-Agent PR avg rounds: {N} (control)
- Tool distribution: Cursor {X}%, Claude Code {X}%, Copilot {X}%, Other {X}%
- AI Prompt template adoption: {X}%

### Findings & actions
- {finding 1} → {action}
- {finding 2} → {action}
```

---

## 5. PR lifecycle automation

### 5.1 Full state diagram

```
PR created (Draft or Ready)
    ↓
┌─ Auto-processing ────────────────────────┐
│ ① Detect linked Issue → auto-label area/  │
│ ② AI Disclosure check → agent-assisted    │
│ ③ First-time contributor → first-contribution │
│ ④ Auto-assign Reviewer (per area Mentor)  │
│ ⑤ Apply needs-review label                │
└──────────────────────────────────────────┘
    ↓
┌─ Review phase ───────────────────────────┐
│ Reviewer submits Review:                  │
│   APPROVED → approved label → mergeable   │
│   CHANGES_REQUESTED → changes-requested   │
│     ↓ contributor pushes update           │
│     → auto-remove changes-requested        │
│     → auto-apply needs-review              │
│     → 24h re-review SLA                   │
└──────────────────────────────────────────┘
    ↓
┌─ Timeout monitoring ─────────────────────┐
│ 24h no review → add fallback Reviewer     │
│ 48h no review → review-overdue + notify   │
│ 7d no contributor update → gentle ping    │
│ 14d no update → ask if help needed / release │
└──────────────────────────────────────────┘
    ↓
┌─ Merge & follow-up ──────────────────────┐
│ ① Bot thanks + recommends next Issue      │
│ ② First PR → welcome + wall update        │
│ ③ Trigger DevRel outreach SOP             │
│ ④ Points credited within 1 business day   │
└──────────────────────────────────────────┘
```

### 5.2 PR-merged thank-you GitHub Action

```yaml
name: PR Merged Thank You
on:
  pull_request_target:
    types: [closed]

jobs:
  thank-contributor:
    if: github.event.pull_request.merged == true
    runs-on: ubuntu-latest
    steps:
      - name: Thank contributor
        uses: actions/github-script@v7
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
          script: |
            const pr = context.payload.pull_request;

            // Replace with your team handles
            const TEAM = ['frontend-lead', 'backend-lead', 'devrel-lead', /* ... */];
            if (TEAM.includes(pr.user.login)) return;

            // Detect first-time contributor
            const prs = await github.rest.pulls.list({
              owner: context.repo.owner,
              repo: context.repo.repo,
              state: 'closed',
              sort: 'created',
              direction: 'asc'
            });

            const userMergedPRs = prs.data.filter(p =>
              p.user.login === pr.user.login && p.merged_at
            );
            const isFirstPR = userMergedPRs.length <= 1;

            const body = isFirstPR
              ? `🎉 Congratulations @${pr.user.login} — your first PR has been merged!\n\n` +
                `Welcome to the contributor community! Your contribution matters.\n\n` +
                `**What's next?**\n` +
                `- 🏆 Points credited within 1 business day\n` +
                `- 🖼️ Your avatar will appear on our contributor wall\n` +
                `- 💬 Join us on Discord for questions\n` +
                `- 🔍 More issues: [Good First Issues](../../labels/good-first-issue)\n\n` +
                `Thank you!`
              : `Merged! Thanks @${pr.user.login} for another great contribution 🚀\n\n` +
                `Points credited within 1 business day. Looking for your next challenge? ` +
                `Check out [open issues](../../labels/help-wanted).`;

            await github.rest.issues.createComment({
              owner: context.repo.owner,
              repo: context.repo.repo,
              issue_number: pr.number,
              body: body
            });
```

---

## 6. Metrics

### Weekly

| Metric | Target | Source |
|---|---|---|
| First review time | < 48h (GFI < 24h) | GitHub PRs |
| PR merge cycle (create → merge) | < 72h | GitHub PRs |
| Review overdue rate (>48h no response) | < 10% | `review-overdue` label |
| PR first-pass rate | ≥ 50% | Review records |
| External PRs merged / week | ≥ 5 | GitHub Contributors |
| Agent PR % | tracking | `agent-assisted` label |

### Monthly

| Metric | M1 | M2 | M3 |
|---|---|---|---|
| Avg review time | < 36h | < 24h | < 18h |
| PR first-pass rate | ≥ 40% | ≥ 55% | ≥ 65% |
| External PRs merged / month | ≥ 15 | ≥ 30 | ≥ 50 |
| First PR → 2nd PR conversion | ≥ 15% | ≥ 20% | ≥ 25% |
| Agent PR first-pass rate | tracking | ≥ 50% | ≥ 60% |

---

## Anti-patterns

- ❌ Letting `review-overdue` accumulate — sends "we don't care" signal to contributors
- ❌ "Approve" without reading the actual diff — kills review credibility long-term
- ❌ Penalizing disclosed AI use — drives the rest of contributors to hide it
- ❌ Squashing all commits without preserving the contributor's commit history credit
- ❌ Templating the thank-you so generically that it feels like spam

---

## Related

- [`01-good-first-issue-system.md`](./01-good-first-issue-system.md) — Issue-side definition of difficulty / area / Mentor
- [`02-issue-pipeline-sop.md`](./02-issue-pipeline-sop.md) — Issue lifecycle that feeds into PRs
- [`03-contributor-recognition.md`](./03-contributor-recognition.md) — points / certificate / leaderboard triggered by merge
- [`README.md`](./README.md) — 4-piece system overview
