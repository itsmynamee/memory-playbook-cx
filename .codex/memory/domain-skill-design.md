---
name: domain-skill-design
description: Domain index - Memory Playbook CX behavior, capture policy, templates, and Codex-native memory alignment.
metadata:
  type: project
---

**Current status (2026-07-13):**

- [[2026-07-13-native-memory-alignment]] — SHIPPED in v0.2.0: selective automatic closeout,
  native-memory boundaries, user controls, conflict handling, and model-agnostic GPT-5.6 policy.

**Shipped / history:**

- [[2026-07-13-native-memory-alignment]] — official-docs-driven redesign of the Codex edition.

**Gotchas:**

- Automatic closeout is made deterministic by the repository `AGENTS.md` rule, not by implicit
  skill matching alone.
- Do not add a Stop hook merely to invoke an agent: current Codex hook documentation says only
  command handlers execute; prompt and agent handlers are parsed but skipped.
- Prefer a domain status refresh over a new episode when Git already explains routine work.
