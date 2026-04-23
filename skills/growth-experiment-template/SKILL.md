# growth-experiment-template

**Purpose** — Force every growth experiment into a standard doc shape before it runs, so that results are comparable across weeks / months / campaigns and learnings compound instead of evaporating.

**Triggers** — "document this experiment", "new growth test", "pre-register this campaign"

**Why this matters** — Undocumented experiments leave you with vibes instead of data. Three months later you remember "we tried cold email" but not "we tried cold email to n=80 Tier-1 Paperclip users with 34% reply rate". The latter compounds; the former doesn't.

---

## Inputs

- **Experiment name** — short, memorable
- **Source hypothesis** — why you think this will work
- **Time-box** — start date + end date (no open-ended experiments)

## Output

A single markdown file: `experiments/YYYY-MM-DD-<slug>.md` following the template below.

## Template

```markdown
# <Experiment name>

**Status**: [ ] planning · [ ] running · [ ] concluded
**Start**: YYYY-MM-DD
**End**: YYYY-MM-DD
**Owner**: <name>
**Channel**: <email / X / GitHub / SEO / community / paid>

## Hypothesis

We believe that **<change / action>** will cause **<metric>** to **<direction>** by **<magnitude>**,
because **<reasoning grounded in prior data or insight>**.

## Metric

- **Primary**: <single number, measurable, has a baseline>
- **Secondary** (optional, max 2): <number>, <number>
- **Guardrail** (optional): <what must NOT break — e.g., reply-rate >10% while scaling>

## Decision rule (before running!)

- If primary metric **≥ X**, we will **<double down / expand scope>**
- If primary metric **< Y**, we will **<kill / pivot>**
- If between X and Y, we will **<iterate with change Z and rerun>**

## Method

1. Step-by-step what gets done
2. Sample size + duration
3. Any tools / skills / templates used (link them)

## Baseline

What the metric is today, before the experiment. If no baseline exists, state that and flag that we're establishing one.

## Results

(Fill in after experiment ends)

- Primary metric: X → Y (change: Z%)
- Secondary metrics: …
- Guardrail status: held / broken

## Learnings

- 1 thing that surprised us
- 1 thing that confirmed prior belief
- 1 thing to do differently next time

## Decision

- [ ] Double down
- [ ] Iterate and rerun
- [ ] Kill
- [ ] Park / reconsider in <timeframe>

## Artifacts

- Link to raw data / sheet
- Link to skills / templates used
- Link to prior related experiments
```

## Quality bar

- [ ] Hypothesis names a specific mechanism, not just "this might work"
- [ ] Decision rule is set **before** results come in (prevents motivated reasoning)
- [ ] Baseline is stated or explicitly noted as missing
- [ ] Results section is filled in within 7 days of end date (or the experiment is formally abandoned)
- [ ] At least 1 learning is uncomfortable / unexpected (if all 3 confirm priors, the experiment wasn't a real test)

## Anti-patterns

- **Don't start without a decision rule.** You'll rationalize any result as "promising".
- **Don't run experiments longer than 6 weeks** without interim review.
- **Don't skip the "learnings" section** when the experiment fails. Failed experiments are the highest-information density events you run.
- **Don't measure more than 3 metrics total.** You'll goodhart one of them.

## Related

- Skill: [`content-repurpose-engine`](../content-repurpose-engine) — often the thing being experimented on
- Skill: [`personalized-cold-outreach`](../personalized-cold-outreach) — same
- Playbook: (none yet — TBD)
