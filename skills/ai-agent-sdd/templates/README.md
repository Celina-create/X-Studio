# SDD Templates

Two templates ship with this skill:

| File | Sections | Time | Use when |
|---|---|---|---|
| [`sdd-template-mvp.md`](./sdd-template-mvp.md) | 12 | ~30 min | Small feature, single-agent product, you must start coding within hours |
| [`sdd-template-full.md`](./sdd-template-full.md) | 23 | ~2 hours | New product, multi-agent system, will be handed off / pitched / open-sourced |

## How to use

1. Copy the template into your project's `docs/sdd/` folder
   ```bash
   mkdir -p docs/sdd
   cp templates/sdd-template-mvp.md docs/sdd/<product-slug>-sdd.md
   ```
2. Fill section by section in order — **don't skip ahead**
3. When stuck on a section, read the parent `SKILL.md` for prompts
4. Get sign-off from one stakeholder before writing code
5. Pass the SDD as context to your coding agent (Cursor / Claude Code / Codex):
   ```
   Read docs/sdd/<product>-sdd.md and implement section-by-section.
   Do not deviate from FRs without updating the SDD first.
   ```

## When to upgrade MVP → Full

- Scope grew beyond original 12 sections
- More than 1 LLM step in workflow
- Multi-agent orchestration
- About to onboard another engineer
- About to pitch to investor / customer
- Going open-source

## Living document

Once SDD is written, treat it as living:
- Behavior-changing PR → update relevant section
- End of phase (MVP → V1 → V2) → bump version + add changelog entry
- Diverges from code by 2+ sections → schedule 30-min reconciliation
