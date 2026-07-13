---
name: domain-release
description: Domain index - GitHub repository presentation, releases, social preview, and local Codex installation.
metadata:
  type: project
---

**Current status (2026-07-13):**

- [[2026-07-13-native-memory-alignment]] — SHIPPED: PR #4 merged, CI passed, v0.2.0 published,
  and the updated skill installed locally through a symlink.

**Shipped / history:**

- v0.1.0 — initial public Codex release.
- v0.1.1 — rebuilt deterministic 1280x640 social preview.
- v0.1.2 — removed overlap between Domain A and Domain B cards.
- [[2026-07-13-native-memory-alignment]] — v0.2.0 automatic closeout architecture.

**Gotchas:**

- The current public authoring documentation uses `~/.agents/skills`, while this Codex build's
  system installer uses `$CODEX_HOME/skills`; document both without installing duplicate copies.
- The GitHub social preview upload remains a repository-settings UI action when no supported CLI
  or API surface is available.
