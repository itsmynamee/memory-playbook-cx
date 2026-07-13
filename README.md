# Memory Playbook CX

A transparent, project-local memory skill for long-running Codex work. It keeps `MEMORY.md`
small, moves live state into domain files, preserves detailed episodes, and audits saved rules
for contradictions, staleness, and duplication.

Looking for the Claude Code edition? Use [Memory Playbook](https://github.com/itsmynamee/memory-playbook).

## Why use it

- `MEMORY.md` remains a compact rule-and-domain index instead of becoming a status dump.
- Each task loads only the relevant domain and its linked episodes.
- Decisions and incidents remain plain Markdown: inspectable, diffable, and portable.
- `check_memory.sh` catches orphan files, domain naming collisions, and size overruns.
- Audit mode checks meaning-level conflicts that a shell script cannot judge.

This is intentionally manual. It complements Codex-managed memory; it does not replace or
directly modify `$CODEX_HOME/memories`.

## Shape

```text
.codex/memory/
├── MEMORY.md
├── project-map.md
├── playbook.md
├── domain-payments.md
├── domain-admin-ui.md
└── 2026-07-13-webhook-retry.md
```

## Install

Clone or copy this directory to Codex's skills directory:

```bash
git clone https://github.com/itsmynamee/memory-playbook-cx.git ~/.codex/skills/memory-playbook-cx
```

Then ask: `Use $memory-playbook-cx to set up project memory.`

The bootstrap adds a small pointer to the project's `AGENTS.md`, creates the project-local
memory store (default `.codex/memory/`), and validates it. Existing flat memory is migrated
without dropping orphaned files or protected rules.

## Modes

- **Bootstrap** — create the smallest useful project memory store.
- **Migration** — reorganize an existing flat or bloated store.
- **Maintenance** — save an authorized episode and refresh its domain.
- **Audit** — report contradictions, stale rules, and duplicates without editing.

## Limits

- No background capture or vector search.
- No silent memory writes: the user must explicitly ask to save or maintain memory.
- No direct edits to Codex-managed global memory.
- Not a replacement for git history; episodes preserve reasoning, not diffs.

## License

MIT — see [LICENSE](LICENSE).
