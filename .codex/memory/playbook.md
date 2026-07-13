---
name: playbook
description: "Owner-approved quality, release, memory, and presentation expectations for Memory Playbook CX."
metadata:
  type: feedback
---

## Product philosophy

- Preserve the useful Claude-edition concept while adapting behavior to real Codex surfaces;
  do not simulate Claude hooks or claim unsupported automation.
- Automatic memory must be selective: capture meaningful outcomes, not everything.
- Keep Codex and Claude editions visibly separate in IDs, repositories, install instructions,
  and release messaging.

## Quality and presentation

- Public repositories must have evidence-backed badges, real CI, useful releases, community
  files, security posture, and clear installation/update instructions.
- Public visuals are release artifacts. Inspect the final bitmap at target resolution and reject
  clipping, font drift, overlap, weak contrast, or unsafe margins before publication.
- Lead with the concrete result and state honestly what remains manual or unverified.

## Pre-ship review

1. Verify repository tests and skill validation.
2. Compare changed memory rules for contradictions and duplicates.
3. Check README, `SKILL.md`, templates, tests, and UI metadata remain consistent.
4. Confirm the GitHub default branch, CI, release, and local installation all match.
5. Run the project-memory closeout gate and disclose any memory write.
