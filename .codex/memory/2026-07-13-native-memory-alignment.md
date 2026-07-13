---
name: 2026-07-13-native-memory-alignment
description: "v0.2.0 redesign aligning Memory Playbook CX with native Codex memory, automatic project closeout, GitHub publication, and local installation."
metadata:
  type: project
---

## Outcome

Memory Playbook CX was audited against the current official OpenAI documentation and redesigned
for Codex. PR `#4` was merged as commit `e6e4de8`, GitHub Actions passed, and release `v0.2.0`
was published on 2026-07-13.

## Durable decisions

- Separate three layers: `AGENTS.md` for mandatory behavior, native Codex memories for generated
  cross-task recall, and checked-in project memory for inspectable shared knowledge.
- Run a capture gate before the final response of every substantive completed or interrupted task
  in a bootstrapped repository.
- Capture durable decisions, releases, non-obvious root causes, reusable corrections, confirmed
  project facts, and exact resume state. Reject transcripts, routine logs, secrets, duplicates,
  unverified claims, and facts already obvious from Git.
- Support explicit `remember`, task-level `do not remember` / `temporary`, and user-directed
  `forget` with a warning that Git history may retain old content.
- Prefer updating an existing entry or domain status. Create an episode only when future work
  needs reasoning that Git does not provide.
- Keep the storage contract model-agnostic. GPT-5.6 may improve semantic judgment but does not
  change authorization, structure, or validation.
- Do not use a Stop hook for agent-driven memory closeout while prompt and agent hook handlers are
  unsupported. Use checked-in `AGENTS.md` guidance instead.

## Official sources reviewed

- `https://developers.openai.com/codex/concepts/customization`
- `https://developers.openai.com/codex/customization/memories`
- `https://developers.openai.com/codex/build-skills`
- `https://developers.openai.com/codex/hooks`
- `https://developers.openai.com/codex/models`
- `https://help.openai.com/en/articles/8590148`

## Installation and repository state

- Installed skill: `/Users/mtvchk/.codex/skills/memory-playbook-cx` → working repository.
- Compatibility path: `memory-playbook-v2` → `memory-playbook-cx`.
- GitHub release: `https://github.com/itsmynamee/memory-playbook-cx/releases/tag/v0.2.0`.
- Validation: `bash tests/run.sh`, `git diff --check`, system `quick_validate.py`, and GitHub Actions.
