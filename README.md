# Memory Playbook CX

[![Tests](https://github.com/itsmynamee/memory-playbook-cx/actions/workflows/test.yml/badge.svg)](https://github.com/itsmynamee/memory-playbook-cx/actions/workflows/test.yml)
[![Release](https://img.shields.io/github/v/release/itsmynamee/memory-playbook-cx)](https://github.com/itsmynamee/memory-playbook-cx/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Agent: Codex](https://img.shields.io/badge/agent-Codex-111827.svg)](https://github.com/openai/codex)

**Transparent project memory for Codex that stays small, preserves decisions, and checks its own rules for conflicts.**

Memory Playbook CX keeps durable project knowledge in plain Markdown. A compact index routes Codex to one relevant domain at a time; detailed episodes preserve reasoning without bloating every future task.

Looking for the Claude Code edition? Use [Memory Playbook](https://github.com/itsmynamee/memory-playbook).

## Why Memory Playbook CX

- **Small context footprint:** `MEMORY.md` contains rules and a domain map, never live status.
- **Durable decisions:** incidents, migrations, and interrupted work live in linked episode files.
- **Explicit writes:** ordinary conversation is not treated as permission to save memory.
- **Self-checking rules:** Audit finds contradictions, stale guidance, and duplicate sources of truth.
- **Plain files:** everything is readable, diffable, portable, and reviewable in Git.
- **No runtime stack:** no database, daemon, account, API key, telemetry, or background process.

## How it works

```text
.codex/memory/
├── MEMORY.md          # rules + domain map only
├── project-map.md     # stable project facts
├── playbook.md        # owner-approved working preferences
├── domain-payments.md # current status + episode pointers
├── domain-ui.md
└── 2026-07-13-webhook-retry.md
```

Codex reads `project-map.md` and `playbook.md`, opens only the domain relevant to the task, then follows episode links when full detail is needed.

## Install

```bash
git clone https://github.com/itsmynamee/memory-playbook-cx.git ~/.codex/skills/memory-playbook-cx
```

Start a new Codex task, then ask:

```text
Use $memory-playbook-cx to set up project memory.
```

To update an existing installation:

```bash
git -C ~/.codex/skills/memory-playbook-cx pull --ff-only
```

## Modes

| Mode | Use it when | Result |
| --- | --- | --- |
| Bootstrap | The project has no durable memory | Creates the smallest useful store and an `AGENTS.md` pointer |
| Migration | Existing memory is flat or bloated | Reorganizes it without dropping protected rules or orphaned files |
| Maintenance | The user explicitly asks to save or refresh memory | Writes an episode, links its domain, and refreshes status |
| Audit | Rules may conflict, duplicate, or be stale | Reports semantic problems without editing until approved |

## Example prompts

```text
Use $memory-playbook-cx to bootstrap memory for this repository.
Use $memory-playbook-cx to migrate this bloated MEMORY.md without losing anything.
Use $memory-playbook-cx to audit our saved rules for contradictions and stale guidance.
Use $memory-playbook-cx to save this decision in the relevant project domain.
```

## Safety boundaries

- Project memory defaults to `<project>/.codex/memory/`.
- The skill does not directly modify Codex-managed `$CODEX_HOME/memories`.
- Memory is persisted only when the user explicitly asks or the task explicitly includes memory maintenance.
- Audit is read-only until the owner approves a resolution.
- `LOCKED` rules are never changed without explicit owner approval.

## Integrity check

```bash
bash scripts/check_memory.sh <project>/.codex/memory
```

The checker rejects orphaned Markdown files and fake `domain-*` indexes, and warns when index files exceed their intended size. Semantic conflicts remain an Audit responsibility because they require judgment.

## Development

```bash
bash tests/run.sh
```

The test suite validates skill metadata, shell syntax, a healthy memory store, orphan detection, and domain-marker enforcement without third-party dependencies.

## Scope

Memory Playbook CX is a deliberate, transparent alternative to automatic capture or vector search. It records durable decisions and operating context, not chat transcripts or Git diffs.

## Contributing and security

See [CONTRIBUTING.md](.github/CONTRIBUTING.md) for changes and [SECURITY.md](.github/SECURITY.md) for private vulnerability reporting.

## License

[MIT](LICENSE) © 2026 itsmynamee
