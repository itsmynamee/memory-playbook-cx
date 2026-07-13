---
name: project-map
description: "START HERE - stable facts for the Memory Playbook CX repository, its verification, distribution, and key files."
metadata:
  type: project
---

**Product:** Memory Playbook CX is the Codex-specific edition of Memory Playbook. It provides
transparent, project-local, Markdown memory that complements native Codex memory rather than
replacing it.

**Repository:** `https://github.com/itsmynamee/memory-playbook-cx`; default branch `main`;
skill ID and folder name `memory-playbook-cx`. Keep it clearly separated from the Claude Code
edition at `itsmynamee/memory-playbook`.

**Architecture invariants:**

- Mandatory behavior lives in `AGENTS.md`; project memory is a reviewable recall layer.
- Native Codex memories remain Codex-managed generated state under `CODEX_HOME`.
- Automatic project closeout records only verified, reusable outcomes that pass the capture gate.
- No secrets, transcripts, routine logs, or unrelated personal/global memory enter the repository.
- Storage behavior is model-agnostic; GPT-5.6 does not change the contract.

**Verification protocol:** run `git diff --check`, `bash tests/run.sh`, and the system
`skill-creator/scripts/quick_validate.py` when its PyYAML dependency is available. Public visual
assets must be rendered and inspected at their final dimensions before release.

**Key entry points:**

- `SKILL.md` — executable workflow and mode selection.
- `references/capture-policy.md` — automatic closeout eligibility and safety rules.
- `references/templates.md` — project-memory and `AGENTS.md` templates.
- `scripts/check_memory.sh` — deterministic structural checker.
- `tests/run.sh` — repository test suite.
- `agents/openai.yaml` — Desktop skill metadata.

**Local installation:** `/Users/mtvchk/.codex/skills/memory-playbook-cx` is a symlink to this
working repository. The legacy task path `/Users/mtvchk/Documents/Codex/memory-playbook-v2`
is a compatibility symlink to `/Users/mtvchk/Documents/Codex/memory-playbook-cx`.
