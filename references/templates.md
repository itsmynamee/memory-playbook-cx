# Templates

Copy these skeletons when bootstrapping or migrating project-local memory. Replace `<...>` placeholders. Write the actual content in the language the owner uses with you — EXCEPT the `Domain index` token at the start of every domain file's `description:`, which is machine-checked by `check_memory.sh` and must stay verbatim English.

Frontmatter: every memory file carries `name`, `description`, and `metadata.type` — EXCEPT MEMORY.md itself, which is the index and carries no frontmatter. Use `feedback` for the playbook, `project` for domains/episodes/project-map, and `reference` only for external-resource indexes.

## MEMORY.md skeleton

```markdown
# Memory index

## How this memory works (memory-playbook-cx system)

Two-tier: **MEMORY.md = rules + domain map only** (never holds working status, so it never
hits the size limit). **Domain files (`domain-*.md`) = live status of their area** + one-line
pointers to episode files. Usage rules:

1. **Fresh substantive task: read [project-map](project-map.md) (what this system is) +
   [playbook](playbook.md) (how we work, what triggers corrections) first.** Then, before
   working on area X, read `domain-X.md`. Don't work on an area "from model memory" without
   this step.
2. **Automatic closeout:** before the final response of a substantive completed or interrupted
   task, run the memory-playbook-cx capture gate. Save only verified, reusable project context;
   never log the transcript, routine commands, secrets, or facts already obvious from Git.
   `Do not remember` / `temporary` opts the task out.
3. **Saving eligible detail:** prefer an existing entry. Create an episode only when future work
   needs reasoning Git does not provide → add a one-line pointer in ITS domain file (NOT in
   MEMORY.md!) → refresh that domain's Current status. Routine completion usually needs only
   the status refresh.
4. **Interrupted work = a mandatory resume checklist in the episode** + IN PROGRESS marker
   in the domain.
5. **Self-learning:** when a stable owner correction or reusable lesson passes the capture gate,
   record philosophy/process in playbook and area-specific traps in domain Gotchas. For bug
   classes, root-cause first, then sweep the codebase for siblings before recording the class.
6. **MEMORY.md changes only when:** a new domain appears, a global rule changes, or the
   owner-owes block changes. Domain past ~10KB → move shipped-history to
   `domain-<area>-archive.md` AND link the archive from the domain file.
7. Episode spanning two domains → pointer in both, marked cross-linked. A file with no
   pointer in any domain = an orphan — don't create them. Episodes are never deleted to
   save space.
8. LOCKED rules below are untouchable without explicit owner permission (including during
   memory consolidation).
9. **Contradiction check:** after any save touching a Gotcha, playbook red flag, project-map
   invariant, or LOCKED rule — compare it against the other rule-bearing entries it could
   collide with. Conflict found (or the entry has gone stale — its reason is gone)? Tell the
   owner right away: compact, plain language, what's wrong and why, plus your recommended fix.
   Owner decides; never silently overwrite. `(ASSUMED)` loses to a confirmed fact automatically.
   When a new rule is *meant* to replace an old one, mark the old `(SUPERSEDED by [[<new>]] —
   <date>: <why>)` so it's never re-flagged; if the owner defers, park it in the owner-owes
   block prefixed `CONFLICT:` (or `STALE?:`) so it survives the session.
   For a full-store sweep of all rules at once, ask the memory-playbook-cx skill for an Audit.
10. **Layer boundary:** must-follow behavior lives in AGENTS.md or checked-in documentation.
    Codex-managed global memories are generated state; never edit them directly or copy them
    into this repository without explicit owner approval.

## 🔒 LOCKED — never edit, weaken, or delete without asking the owner first

<move protected process rules here as they accumulate — verbatim. Each entry carries WHEN it
was locked, WHO set it, and WHY (the reason), so a later Audit can tell a genuine conflict from
a legitimate evolution instead of guessing. Format: `- <rule> (locked <date> by <who>: <why>)`.>

## Domain map (look here, dive into the file — status lives THERE)

- [project-map](project-map.md) — **START HERE**: business, repos, architecture invariants,
  verification protocol, key code entry points.
- [playbook](playbook.md) — **self-learning**: owner philosophy, red flags, mandatory
  pre-ship self-review.
- [domain-<area>](domain-<area>.md) — <one-line scope of the area>.

## Global gotchas (not tied to one domain)

- <only truly cross-domain one-liners>

## What the OWNER currently owes (single place; details in domains)

- <external-dashboard actions, pending decisions — with domain references>
- `CONFLICT:` / `STALE?:` <a memory conflict or suspected-stale rule the owner deferred —
  the two entries, the recommended fix, awaiting their call. Re-surfaced by the next Audit.>
```

## domain-<area>.md skeleton

```markdown
---
name: domain-<area>
description: Domain index - <scope>. Dive in here for any <area> work.
metadata:
  type: project
---

**Current status (<YYYY-MM-DD>):**
- [[<episode-name>]] — <IN PROGRESS / SHIPPED / CLOSED>: <one line, incl. what's unpushed/
  unapplied and what the next step is>.
- <At bootstrap, before any episode exists, use exactly one line:>
  Nothing in flight (bootstrapped <YYYY-MM-DD>).

**Shipped / history:**
- [[<episode-name>]] — <one-line hook>.

**Gotchas:**
- [[<gotcha-or-inline>]] — <the trap and the rule>.
```

## project-map.md skeleton

```markdown
---
name: project-map
description: "START HERE in a fresh session - what <project> IS: business, repos, architecture invariants, verification protocol. Stable facts only, no status."
metadata:
  type: project
---

**Business:** <what the product is, who the owner is, how they communicate, key constraint>.

**Repos/services:** <each repo: what it serves, hosts, deploy target, database project ids>.

**Architecture invariants (do NOT violate):**
- <security topology, e.g. who may talk to the DB and how>
- <money/data-integrity rules if any>
- <migration/deploy discipline>
- <UI language(s) and text conventions>
- <Mark any fact not confirmed by the owner or the code as `(ASSUMED)`; upgrade to confirmed
  as the owner verifies them.>

**Verification protocol (before "done"):** <exact commands, e.g. typecheck → test → build;
how visuals are verified; anything banned>.

**Key code entry points:** <the 5-10 paths a fresh session needs first>.
```

## playbook.md skeleton

```markdown
---
name: playbook
description: "Self-learning playbook - owner's philosophy, how to present work, red flags that trigger corrections, and the mandatory pre-ship self-review. Add authorized lessons; NEVER delete/soften an entry without asking the owner."
metadata:
  type: feedback
---

Living distillation of durable owner corrections. **Goal: the owner never has to ask "check it",
"make it consistent", "fix it everywhere" - that is a standard part of every task.** Upkeep
rule: when a stable correction passes the automatic closeout gate, add the lesson here
(philosophy/process) or to the domain's Gotchas (code specifics). Delete/soften only with
owner permission.

## Product philosophy

- <what the owner values: e.g. uniformity without exceptions, honest failure states,
  predictability>

## How to present work

- <answer shape, language register, decision-vs-menu preference, honesty norms>

## What triggers corrections (red flags - self-check BEFORE delivering)

1. <accumulate the concrete recurring correction patterns here>

## Mandatory pre-ship self-review (before every "done")

1. **Verification:** <the project's full command triad — no exceptions, even for one-liners>.
2. **Class, not instance:** root-cause it first — fix only once the cause is certain, then
   sweep: does this same problem/pattern exist elsewhere? Fix every instance before closing.
3. **Uniformity:** new UI checked against the design checklist; states complete; measured,
   not eyeballed.
4. **Honest states:** what does the user see on failure/empty/slow for this exact flow?
5. **Memory:** automatic closeout gate run; smallest eligible delta recorded, or no write when
   the task produced no durable project knowledge.
6. **Committed** (follow the project's push convention).
7. **No new contradictions / stale rules:** any rule-bearing memory edit this turn checked
   against the rules it touches; owner already notified of any conflict or stale entry found,
   with a recommended fix.

## Lessons (append-only journal; promote into sections above when a pattern emerges)

- <YYYY-MM-DD>: <lesson>
```

## Episode file skeleton

```markdown
---
name: <kebab-name-with-date-if-timebound>
description: <one line that lets recall and a skimming session know exactly what's inside>
metadata:
  type: project
---

<Full detail: what/why/how, decisions with reasoning, commit hashes, migration numbers.>

<If interrupted mid-work on OUR side:>
## Resume checklist (in order)
1. <exact, self-contained steps a successor session can follow without this conversation>

<If instead the only remaining steps are the owner's (episode technically done on our side):
no IN PROGRESS marker in the domain — say WAITING ON OWNER there, put the owner's action in
MEMORY.md's owner-owes block, and keep a short closing checklist here (what to update where
once the owner acts).>
```

## AGENTS.md automatic closeout rule (idempotent — add once during Bootstrap/Migration)

Skill matching is best-effort. Put this instruction in the nearest applicable project
`AGENTS.md` so future Codex tasks see it deterministically. Preserve existing instructions;
skip the addition if an equivalent domain-map rule already exists. Replace the default path
when the project uses another project-local memory directory.

```markdown
## Memory
For every substantive completed or interrupted task, before the final response, check
`.codex/memory/MEMORY.md`. If it contains a memory-playbook domain map, run the
`memory-playbook-cx` Closeout protocol and its capture gate. Record only verified, reusable
project context; prefer updating an existing entry, create an episode only when future work
needs reasoning Git does not provide, link it from its domain, refresh that domain's status,
and run the memory checker. Never put live status directly in `MEMORY.md`. An explicit
`do not remember` or `temporary` instruction opts the current task out. Never copy
Codex-managed global memories into the repository without explicit owner approval.
```
