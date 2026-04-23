# stargazer-email-scraper

**Purpose** — Extract public email addresses of GitHub stargazers from a list of competitor repositories, outputting a clean CSV ready to feed into the outreach pipeline.

**Triggers** — "get stargazer emails for X", "scrape emails from these repos", "who starred competitor-Y and left an email"

**Why stargazers are 5–10× higher intent than random seed lists**

- They have actively pressed the "interested" button on a product in your category
- GitHub requires 2FA on most actions — they're real humans, not bots
- They voluntarily made their email public — you're not bypassing any privacy choice
- Historical hit rate on public profiles: **15–17% have `email` set** (≈2,000 emails from a 14,000-star repo)

---

## Inputs

- **List of competitor repositories** — 3–10 `owner/repo` slugs. Sweet spot is repos with 100–5,000 stars (bigger repos introduce too much noise; fans of famous repos are not necessarily pained users in your category).
- **A valid GitHub `gh` CLI login** — your personal account's 5,000 req/hour quota.

## Outputs

- `data/emails.csv` — one row per unique user with a public email. Columns: `repo, login, name, email, company, location, bio`
- `data/all_stargazers.txt` — raw stargazer list (with duplicates across repos)
- `data/unique_users.tsv` — dedup list `login \t source_repo`

## Prerequisites

| Tool | Why | Install |
|---|---|---|
| `bash` 4+ | runs the script | macOS/Linux built-in; Windows → Git Bash or WSL |
| `gh` CLI | authenticated GitHub API calls (5000/hr) | `brew install gh` |
| `jq` | JSON parsing | `brew install jq` |
| `gh auth login` | MUST run once before first invocation | see [GitHub CLI docs](https://cli.github.com/) |

Anonymous GitHub API is capped at 60/hr — not enough to run this for even one small repo.

## Steps

1. **Edit `REPOS` array** in `scrape-stargazers-emails.sh` (lines 4–11). Replace with your competitor repos:
   ```bash
   REPOS=(
     "competitor-org/main-repo"
     "competitor-org/cli-tool"
   )
   ```
2. **Run it**:
   ```bash
   cd skills/stargazer-email-scraper
   chmod +x scrape-stargazers-emails.sh
   ./scrape-stargazers-emails.sh
   ```
3. **For large repos** (>5,000 total stargazers), run in background with logging:
   ```bash
   nohup ./scrape-stargazers-emails.sh > run.log 2>&1 &
   tail -f run.log
   ```
4. **Check output** — `data/emails.csv`. Expect 15–17% of unique stargazers to appear.
5. **Hand off** — feed `emails.csv` into the next skill in the pipeline: [`seed-user-pool-stratification`](../seed-user-pool-stratification) to rank by ROI before any outreach.

## Runtime estimate

| Total stargazers across all repos | Estimated runtime |
|---|---|
| 1,000 | ~15 min |
| 5,000 | ~1 hour |
| 14,000 | ~3 hours |
| 50,000 | ~10 hours (will cross multiple quota windows — current script exits on 403, need manual batching) |

## Quality bar

- [ ] Every row in `emails.csv` has a non-empty `email` (script enforces this)
- [ ] No `noreply@github.com` addresses (GitHub profiles can't actually set these as public, so you're safe by design)
- [ ] Total row count ≈ 15–17% of unique stargazers (if substantially less, GitHub API may have rate-limited silently)
- [ ] Before sending anything, run a validator (see next skill [`contact-enrichment`](../contact-enrichment) when built) to check MX + SMTP reachability

## Anti-patterns

- **Don't target repos with >10k stars.** Fans of famous repos ≠ pained users in your category. 100–2,000 star repos are sharpest.
- **Don't merge >3 competitor repos' stargazers into one outreach campaign.** Each competitor has a different user profile; mixing contaminates your signal about which message works for which audience.
- **Don't send to `emails.csv` directly.** Always stratify first (the bottom 50% of stargazers, ranked by recent activity, will never reply).
- **Don't skip SMTP verification.** Some stargazers set emails they no longer use; sending to dead addresses hurts sender reputation.
- **Don't run this on public product's production GitHub account.** GitHub's Acceptable Use Policy allows reading public data but restricts bulk use — rate limits and quota exhaustion on a shared account can cause collateral damage.

## Compliance — read this before using

This script only reads fields that users **voluntarily made public** on their own GitHub profile. Technically fully legal. But "can access" ≠ "can use for anything":

- **GitHub Acceptable Use Policies** explicitly prohibit using GitHub data for unauthorized marketing, spam, or bulk contact. Violation can result in account ban.
  https://docs.github.com/en/site-policy/acceptable-use-policies
- **GDPR (EU)** — even public emails typically require opt-in consent for marketing-purpose processing
- **PIPL (China)** — using public personal information for "commercial marketing" still requires notice + consent in principle
- **CAN-SPAM (US)** — commercial emails must have truthful sender identity + one-click unsubscribe

### Compliant use cases

- Open-source community collaboration invitations / contributor recruiting
- Academic / industry research (social network analysis, user personas)
- One-time, highly relevant, unsubscribe-enabled notifications to a relevant audience

### Non-compliant / risky use cases

- Cold-start product marketing / bulk promotional email
- Bulk signup to third-party services
- Reselling / sharing the list with third parties

### Outreach-design checklist (if you do use it for outreach)

- [ ] Each email is individually relevant to that specific recipient (their repo / their profile / their pain signal)
- [ ] Plain-text, first-name sender, no branded HTML template
- [ ] Clear unsubscribe path in every message
- [ ] Maximum 5 emails per day per same sender domain (avoids spam filter triggers + feels human)
- [ ] Never use it to send the same generic message to all emails in the CSV

**User assumes all compliance risk and legal liability. The script and this skill are provided as-is with no warranty.**

## Troubleshooting

| Symptom | Fix |
|---|---|
| `gh: command not found` | `brew install gh` then `gh auth login` |
| `jq: command not found` | `brew install jq` |
| `HTTP 403: API rate limit exceeded` | Wait until next hour, or `gh api rate_limit` to check reset time |
| `HTTP 401 Unauthorized` | Run `gh auth login` to refresh token |
| CSV field misalignment | Some `bio`/`name` fields contain unicode commas not stripped by `tr -d ','` — switch to TSV output if strict format needed |

## Related

- Upstream: this skill is usually the **first step** in a competitive outreach pipeline
- Downstream skill: [`seed-user-pool-stratification`](../seed-user-pool-stratification) — rank the ~2,000 emails by ROI before sending
- Downstream skill: [`personalized-cold-outreach`](../personalized-cold-outreach) — write per-recipient messages
- Sibling skill: [`competitive-intel-mining`](../competitive-intel-mining) — complementary; mines issue/discussion text for pain quotes (stargazers show intent, mining shows pain)
- Playbook: [`00-competitive-seed-pipeline`](../../playbooks/00-competitive-seed-pipeline.md)
- Script: [`scrape-stargazers-emails.sh`](./scrape-stargazers-emails.sh) — the actual executable
