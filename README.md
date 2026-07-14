# Memory Playbook CX

[![Tests](https://github.com/itsmynamee/memory-playbook-cx/actions/workflows/test.yml/badge.svg)](https://github.com/itsmynamee/memory-playbook-cx/actions/workflows/test.yml)
[![Release](https://img.shields.io/github/v/release/itsmynamee/memory-playbook-cx)](https://github.com/itsmynamee/memory-playbook-cx/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Agent: Codex](https://img.shields.io/badge/agent-Codex-111827.svg?logo=openai&logoColor=white)](https://github.com/openai/codex)

**Transparent project memory for Codex that automatically captures meaningful project outcomes without logging everything.**

Memory Playbook CX keeps durable project knowledge in plain Markdown. A compact index routes Codex to one relevant domain at a time; an automatic closeout gate captures only verified, reusable outcomes from substantive work.

Looking for the Claude Code edition? Use [Memory Playbook](https://github.com/itsmynamee/memory-playbook).

## Why Memory Playbook CX

- **Small context footprint:** `MEMORY.md` contains rules and a domain map, never live status.
- **Durable decisions:** incidents, migrations, and interrupted work live in linked episode files.
- **Selective automatic closeout:** meaningful completed or interrupted work updates memory; routine conversation and commands do not.
- **Self-checking rules:** Audit finds contradictions, stale guidance, and duplicate sources of truth.
- **Native-memory compatible:** complements Codex-managed memories and keeps mandatory behavior in `AGENTS.md`.
- **Owner control:** `do not remember`, `temporary`, `remember`, and `forget` have explicit behavior.
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

Codex reads `project-map.md` and `playbook.md`, opens only the domain relevant to the task, then follows episode links when full detail is needed. Before finishing substantive work, the checked-in `AGENTS.md` rule runs the skill's capture gate and writes only the smallest useful delta.

This complements, rather than replaces, Codex's native local memory:

- `AGENTS.md` — required behavior that must apply every time;
- Codex-managed memories — automatically synthesized context across eligible tasks;
- Memory Playbook CX — inspectable, project-local knowledge that can be reviewed and shared in Git.

## Install

```bash
git clone https://github.com/itsmynamee/memory-playbook-cx.git ~/.agents/skills/memory-playbook-cx
```

`~/.agents/skills` is the current documented user authoring location. If your Codex build's `$skill-installer` uses `$CODEX_HOME/skills`, let the installer choose that location instead. Do not install the same skill in both locations.

Start a new Codex task, then ask:

```text
Use $memory-playbook-cx to set up project memory.
```

To update an existing installation:

```bash
git -C ~/.agents/skills/memory-playbook-cx pull --ff-only
```

### Recommended native memory setup

Memory Playbook CX works alongside Codex local memories. Enable them in ChatGPT Desktop under **Settings → Personalization**, then use `/memories` when you need per-task controls. Config-based installations can enable the feature with:

```toml
[features]
memories = true
```

Do not manually edit `~/.codex/memories`; Codex manages that generated state.

## Modes

| Mode | Use it when | Result |
| --- | --- | --- |
| Bootstrap | The project has no durable memory | Creates the smallest useful store and an `AGENTS.md` closeout rule |
| Migration | Existing memory is flat or bloated | Reorganizes it without dropping protected rules or orphaned files |
| Closeout | Substantive work completes or is interrupted | Runs the capture gate and writes the smallest eligible delta |
| Explicit save / forget | The owner asks to remember or forget | Adds or removes the targeted project memory transparently |
| Audit | Rules may conflict, duplicate, or be stale | Reports semantic problems without editing until approved |

## Example prompts

```text
Use $memory-playbook-cx to bootstrap memory for this repository.
Use $memory-playbook-cx to migrate this bloated MEMORY.md without losing anything.
Use $memory-playbook-cx to audit our saved rules for contradictions and stale guidance.
Use $memory-playbook-cx to save this decision in the relevant project domain.
Use $memory-playbook-cx to forget the obsolete deployment rule.
```

## Safety boundaries

- Project memory defaults to `<project>/.codex/memory/`.
- The skill never directly modifies Codex-managed `$CODEX_HOME/memories`.
- Bootstrap installs an `AGENTS.md` closeout rule that authorizes project-local writes only when the capture gate passes.
- `do not remember` or `temporary` opts a task out; `forget` removes the current entry while warning that Git history may retain old versions.
- Secrets, raw transcripts, routine logs, unverified claims, and personal/global memories are never captured automatically.
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

The test suite validates skill metadata, the automatic closeout contract, shell syntax, a healthy memory store, orphan detection, and domain-marker enforcement without third-party dependencies.

## GPT-5.6 and model behavior

The storage design is model-agnostic. GPT-5.6 can improve judgment during large migrations or semantic audits, but the skill does not pin a model or change reasoning effort. Model choice never weakens the capture gate, user controls, or verification requirements.

## Official design basis

- [Codex customization](https://developers.openai.com/codex/concepts/customization) — `AGENTS.md`, memories, and skills are complementary layers.
- [Codex memories](https://developers.openai.com/codex/customization/memories) — local memories are generated state with per-task controls and background consolidation.
- [Build skills](https://developers.openai.com/codex/build-skills) — skill discovery, progressive disclosure, and user installation locations.
- [Codex hooks](https://developers.openai.com/codex/hooks) — lifecycle automation capabilities and current handler limitations.
- [Codex models](https://developers.openai.com/codex/models) — GPT-5.6 selection and reasoning guidance.

## Scope

Memory Playbook CX is a transparent project-memory layer, not a replacement for ChatGPT or Codex native memory. It records durable decisions and operating context, not chat transcripts or Git diffs.

## Contributing and security

See [CONTRIBUTING.md](.github/CONTRIBUTING.md) for changes and [SECURITY.md](.github/SECURITY.md) for private vulnerability reporting.

## License

[MIT](LICENSE) © 2026 itsmynamee
