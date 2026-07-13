---
name: memory-playbook-cx
description: Maintain transparent, project-local, file-based memory for Codex. Use when setting up, migrating, auditing, repairing, forgetting, or improving project memory; preserving project knowledge across tasks; closing a substantive project task whose repository has a memory-playbook domain map; handling repeated corrections, interrupted work, stale or contradictory memories, or an explicit remember/forget request. Complement Codex-managed memories and AGENTS.md; never replace or directly edit Codex-managed global memory.
---

# Memory Playbook CX

Maintain a small, reviewable project memory that complements Codex's native memory:

```text
.codex/memory/
├── MEMORY.md          # compact summary, global rules, domain map
├── project-map.md     # confirmed stable project facts
├── playbook.md        # durable owner preferences and reusable lessons
├── domain-<area>.md   # current status and episode pointers
└── <episode>.md       # detailed decision, incident, or resume record
```

Treat the layers differently:

- Put required behavior in the nearest `AGENTS.md`; it must not depend on recall.
- Let Codex-managed memories provide automatically synthesized cross-task context.
- Use this store for project-local knowledge that should be inspectable, shared, and versioned.
- Never edit `$CODEX_HOME/memories` directly or copy personal/global memories into a repository without explicit owner approval.

Default to `<project>/.codex/memory/`. Keep an existing declared memory directory.

## Select a mode

- **Bootstrap:** no project memory or only boilerplate. Read [references/templates.md](references/templates.md) and [references/capture-policy.md](references/capture-policy.md), inspect the repository, create the smallest useful store, and install the idempotent `AGENTS.md` closeout rule.
- **Migration:** flat, bloated, or legacy memory exists. Read every memory file, preserve orphans and LOCKED rules, cluster entries into 5-10 useful domains, flag contradictions, and install the closeout rule.
- **Closeout:** before the final response of a substantive completed or interrupted task, read [references/capture-policy.md](references/capture-policy.md), run its capture gate, and write only the smallest eligible memory delta.
- **Explicit save:** when the owner says remember/save, persist the requested durable fact unless it is secret, unsafe, or conflicts with a protected rule.
- **Forget:** when the owner says forget/remove, remove the current project-memory entry and its links. Explain that Git history may retain prior versions; history rewriting needs separate authorization.
- **Audit:** inspect all rule-bearing entries for contradictions, stale guidance, duplicates, and misplaced must-follow rules. Report first; edit only resolutions the owner approves.

## Bootstrap or migrate

1. Read [references/templates.md](references/templates.md) and [references/capture-policy.md](references/capture-policy.md).
2. Establish stable facts from repository evidence. Mark useful but unverified facts `(ASSUMED)`.
3. Keep live status out of `project-map.md` and detailed history out of `MEMORY.md`.
4. Add the idempotent closeout instruction from the templates to the nearest applicable `AGENTS.md`. Preserve existing instructions.
5. Do not import Codex-managed memories, chat history, or personal preferences into a checked-in store without explicit owner approval.
6. Run `scripts/check_memory.sh <memory-dir>`.

For migration, inventory all files before editing. Adopt every orphan, preserve LOCKED text verbatim, and surface equal-standing rule conflicts. A confirmed fact replaces a conflicting `(ASSUMED)` fact automatically.

## Close out or maintain

1. Run the capture gate in [references/capture-policy.md](references/capture-policy.md). An installed closeout rule is owner authorization for eligible project-local writes; an explicit `do not remember`, `temporary`, or equivalent instruction always opts the task out.
2. Prefer updating an existing entry over creating a duplicate.
3. Save durable detail as an episode only when future work needs reasoning that Git history cannot provide.
4. Link a new episode from its domain, cross-linking only when it genuinely spans domains.
5. Refresh the touched domain's dated Current status. For interrupted work, add an ordered resume checklist and mark the entry `IN PROGRESS`.
6. Put confirmed stable topology or verification changes in `project-map.md`; put reusable owner preferences or correction patterns in `playbook.md`.
7. Change `MEMORY.md` only for a new domain, a truly global rule/gotcha, or the owner-owes block.
8. Never delete episodes merely to save space. When a domain exceeds about 10 KB, move shipped history to a linked `domain-<area>-archive.md`. User-directed forgetting and sensitive-data removal are exceptions.
9. Never edit a LOCKED rule without explicit owner approval.
10. Compare any changed rule with `MEMORY.md`, `project-map.md`, `playbook.md`, its domain, and cross-linked domains. Do not silently resolve conflicts between confirmed entries. Record intentional replacement with `(SUPERSEDED by [[<new>]] — <date>: <reason>)`.
11. Run the smallest relevant project verification plus `scripts/check_memory.sh <memory-dir>`.
12. In the final response, disclose a write in one short line: `Memory: updated <files> — <reason>.` Do not claim a write when the capture gate rejected the task.

## Audit

Read every rule-bearing entry together: `AGENTS.md`, project invariants, playbook philosophy and red flags, all domain Gotchas, global gotchas, LOCKED rules, and deferred `CONFLICT:` / `STALE?:` items.

Return a short numbered report containing:

1. contradictions;
2. rules that may be stale;
3. duplicates that should become one source with cross-links;
4. must-follow rules incorrectly stored only as memory instead of `AGENTS.md` or checked-in documentation;
5. sensitive, personal, or externally derived content that should not be in project memory.

Name both entries, explain the problem, and recommend one resolution. Skip pairs already marked `SUPERSEDED`. Keep Audit read-only until the owner approves edits.

## Model behavior

Keep the workflow model-agnostic. Do not pin a GPT model or change the user's reasoning level for routine capture. GPT-5.6 may improve judgment on large migrations or semantic audits, but it does not change the storage contract, capture gate, user controls, or verification requirements.

## Structural contract

`scripts/check_memory.sh` enforces:

- every Markdown file is reachable from `MEMORY.md`, a domain, `project-map.md`, or `playbook.md`;
- every non-archive `domain-*.md` starts its frontmatter description with the exact token `Domain index`;
- `MEMORY.md` and domains remain below advisory size ceilings.

The script checks structure. The capture gate controls relevance. Audit checks meaning.
