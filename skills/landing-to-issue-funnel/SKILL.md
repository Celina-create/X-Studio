# landing-to-issue-funnel

**Purpose** — Replace the traditional "landing page → waitlist form → spreadsheet" funnel with "landing page → pre-filled GitHub Issue Form → labeled, searchable, public lead DB". Invented by products like YouMind; applicable to any developer-flavored B2B.

**Triggers** — "design a lead-capture funnel", "cold email → landing → capture flow", "build a waitlist alternative"

**Why this beats a waitlist**

- Public issues = social proof (others can see real user pain)
- Pre-filled URL = near-zero submission friction (1 click from email)
- GitHub-native = free hosting, auth, search, API, and a labeling system
- Rich fields (dropdowns, textareas) > email-only waitlist capture
- Agents can triage / reply automatically via GitHub Actions

---

## Inputs

- **Repo to host the funnel** — ideally your product's public repo, or a dedicated `community` repo
- **Funnel intent** — 1 sentence on what you want submitters to do (share pain / submit a workflow / request feature)
- **Existing issue-tracker constraints** — does the target repo already use issue labels for engineering triage? (Yes → plan for label namespacing)

## Outputs

- `.github/ISSUE_TEMPLATE/<slug>.yml` — the form definition
- `.github/ISSUE_TEMPLATE/config.yml` — routes blank issues + adds external contact links
- Personalized URL generator — script that takes a CSV (handle, quote, source) → outputs a pre-filled URL per recipient
- Triage workflow — `.github/workflows/lead-triage.yml` that auto-labels, auto-replies, and routes to a Slack/Feishu channel

## Steps

1. **Pick the hosting repo** — Public product repo (max social proof) or dedicated `community` repo (max hygiene). Don't create a new repo just for this unless strictly necessary.
2. **Define form fields** — Dropdowns beat free-text. Default set:
   - `current-tool` (dropdown of competitors they might use)
   - `pain` (textarea, pre-fillable)
   - `team-size` (dropdown)
   - `contact-preference` (checkboxes: GitHub reply / email / X DM)
3. **Write YAML form** — Use GitHub Issue Forms spec. Include `title`, `labels`, `body` array.
4. **Label discipline** — Use a unique prefix like `inbound-pain` or `lead-capture` so engineering triage bots can exclude these issues.
5. **Config file** — Set `blank_issues_enabled: false` + add contact links for private / X channels.
6. **Pre-filled URL generator** — For each recipient:
   ```
   https://github.com/<org>/<repo>/issues/new?
     template=<slug>.yml
     &title=<url-encoded specific title>
     &<field_id>=<url-encoded value>
     &labels=<comma-separated>
   ```
7. **Triage workflow** — GitHub Action on `issues.opened` that:
   - Verifies the `inbound-pain` label
   - Posts a welcome reply ("Thanks! We'll respond within 24h")
   - Pings founder(s) via webhook
   - (Optional) Auto-opens a private Linear / Notion mirror for CRM
8. **Dual-track for sensitive cases** — Add a private form option (Tally / Typeform / email) in `config.yml` contact links, for users who don't want public issues.
9. **Land page CTA** — Any landing page (product README counts) should have 2–3 buttons linking to pre-filled URLs for different use cases.

## Quality bar

- [ ] Every form field is either required or has a sensible default
- [ ] Labels are clearly separable from engineering labels (visually and namespace-wise)
- [ ] Pre-filled URL fits under 2000 characters (most mail clients' URL limit)
- [ ] Triage workflow replies within 60 seconds of submission
- [ ] At least one private fallback exists (email or Tally form)

## Anti-patterns

- **Don't mix inbound-pain issues with engineering bug tracker** without label namespacing — it contaminates GFI / dupe-detection bots
- **Don't require login to submit** — GitHub does, and that's the known trade-off; mitigate with a one-click OAuth or a fallback Tally form
- **Don't make the form >8 fields** — abandonment goes up steeply after 5
- **Don't auto-close stale issues** with a bot — these are leads, not engineering backlog

## Example form shape

```yaml
name: 🔥 Share an agent-workspace pain
description: Tell us what breaks your workflow. We'll reply with a 3-min Loom within 24h.
title: "[Pain] <short headline>"
labels: ["inbound-pain", "needs-triage"]
body:
  - type: dropdown
    id: current-tool
    attributes:
      label: What are you using today?
      options: ['Claude Code alone', 'Slack + bots', 'Competitor A', 'Competitor B', 'Other']
    validations:
      required: true
  - type: textarea
    id: pain
    attributes:
      label: What specifically breaks?
    validations:
      required: true
  - type: checkboxes
    id: contact
    attributes:
      label: How should we reach you?
      options:
        - label: Reply on this issue
        - label: Email (leave yours below)
        - label: X DM
```

## Related

- Upstream skill: [`personalized-cold-outreach`](../personalized-cold-outreach) — produces the pre-filled URL per recipient
- Template: [`templates/issue-forms/`](../../templates/issue-forms/) — ready-to-paste YAML templates
- Playbook: [`02-github-issue-as-lead-capture`](../../playbooks/02-github-issue-as-lead-capture.md)
