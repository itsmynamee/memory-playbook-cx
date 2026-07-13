---
name: memory-playbook-cx
description: Maintain transparent, project-local, file-based memory for Codex. Use when the user asks to set up, migrate, audit, repair, or improve project memory; asks Codex to preserve project knowledge across tasks; reports repeated corrections or bloated MEMORY.md files; or explicitly asks to save memory in a project whose MEMORY.md contains a domain map. Do not use this as a replacement for Codex-managed global memory.
---

# Memory Playbook CX

Keep durable project knowledge small, navigable, and reviewable:

```text
.codex/memory/
├── MEMORY.md          # rules and domain map only
├── project-map.md     # stable project facts
├── playbook.md        # owner preferences and reusable lessons
├── domain-<area>.md   # current status and episode pointers
└── <episode>.md       # detailed decision, incident, or work record
```

Default to `<project>/.codex/memory/`. If the project already declares another memory directory, keep it. Never directly edit `$CODEX_HOME/memories/MEMORY.md` or other Codex-managed memory files; follow the active Codex memory policy instead.

Only persist memory when the user explicitly asks, or when the current task explicitly includes memory maintenance. A correction is a candidate lesson, not implicit authorization to write it.

## Select a mode

- **Bootstrap:** no project memory or only boilerplate. Read [references/templates.md](references/templates.md), inspect the repository, then create the smallest useful store: `MEMORY.md`, `project-map.md`, `playbook.md`, and 2-5 domains that already have useful status.
- **Migration:** a flat or bloated memory exists. Read every memory file, preserve orphans and LOCKED rules, cluster entries into 5-10 domains, and flag contradictions before moving content.
- **Maintenance:** `MEMORY.md` already contains a domain map. Read `project-map.md`, `playbook.md`, and the relevant domain before changing memory.
- **Audit:** inspect all rule-bearing entries for contradictions, stale rules, and duplicates. Report first; edit only resolutions the owner approves.

## Bootstrap or migrate

1. Read [references/templates.md](references/templates.md).
2. Establish stable facts from repository evidence. Mark anything unverified `(ASSUMED)`.
3. Keep live status out of `project-map.md` and `MEMORY.md`.
4. Add the idempotent memory pointer from the templates to the nearest applicable `AGENTS.md`. Preserve existing instructions.
5. Run `scripts/check_memory.sh <memory-dir>`.

For migration, inventory all files before editing. Adopt every orphan, preserve LOCKED text verbatim, and surface equal-standing rule conflicts to the owner. A confirmed fact automatically replaces a conflicting `(ASSUMED)` fact.

## Maintain

1. Save new detail as an episode.
2. Link the episode from its domain, cross-linking only when it genuinely spans domains.
3. Refresh that domain's dated Current status.
4. For interrupted work, add an ordered resume checklist and mark the domain entry `IN PROGRESS`.
5. Change `MEMORY.md` only for a new domain, a global rule/gotcha, or the owner-owes block.
6. Never delete episodes to save space. When a domain exceeds about 10 KB, move shipped history to a linked `domain-<area>-archive.md`.
7. Never edit a LOCKED rule without explicit owner approval.
8. When editing a rule, compare it with `MEMORY.md`, `project-map.md`, `playbook.md`, the touched domain, and cross-linked domains. Surface confirmed conflicts or suspected stale rules before editing. Record intentional replacements with `(SUPERSEDED by [[<new>]] — <date>: <reason>)`.
9. Run the smallest relevant verification plus `scripts/check_memory.sh <memory-dir>` before claiming completion.

## Audit

Read every rule-bearing entry together: project invariants, playbook philosophy and red flags, all domain Gotchas, global gotchas, LOCKED rules, and deferred `CONFLICT:` / `STALE?:` items.

Return a short numbered report containing:

1. contradictions;
2. rules that may be stale;
3. duplicates that should become one source with cross-links.

Name both entries, explain the problem, and recommend one resolution. Skip pairs already marked `SUPERSEDED`. Audit is read-only until the owner approves edits.

## Structural contract

`scripts/check_memory.sh` enforces:

- every Markdown file is reachable from `MEMORY.md`, a domain, `project-map.md`, or `playbook.md`;
- every non-archive `domain-*.md` starts its frontmatter description with the exact token `Domain index`;
- `MEMORY.md` and domains remain below advisory size ceilings.

The script checks structure, not meaning; Audit checks meaning.
