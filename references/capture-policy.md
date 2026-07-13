# Automatic closeout and capture policy

Use this policy before the final response of every substantive task in a repository that has a memory-playbook domain map. The goal is selective automatic maintenance, not transcript logging.

## Capture gate

Write project memory only when the task produced at least one verified, reusable result:

1. a durable project decision, invariant, interface, or verification protocol changed;
2. an implementation, migration, release, incident, or operational process completed and future work needs context not obvious from Git;
3. a non-obvious root cause and reusable prevention rule were established;
4. the owner made a correction or expressed a stable preference likely to matter again;
5. work stopped incomplete or blocked and a successor needs an exact resume sequence;
6. a stable repository, service, deployment, or code-entry fact was confirmed.

If none applies, do not write memory.

## Never capture automatically

- raw chat transcripts, command logs, diffs, or routine test output;
- facts that are obvious from current code or a commit without additional reasoning;
- transient exploration, brainstorming, estimates, or short-lived status;
- guesses with no future value;
- secrets, credentials, tokens, private keys, sensitive personal data, or unrelated personal preferences;
- external or time-sensitive claims without a source and observation date;
- unchanged status or content already represented by an equivalent entry;
- any task where the owner says `do not remember`, `temporary`, or an equivalent opt-out.

Do not copy Codex-managed global memories into a repository automatically. They may contain private or cross-project context.

## Write the smallest useful delta

Route each eligible item to one source of truth:

| Information | Destination |
| --- | --- |
| Confirmed stable architecture, repos, entry points, verification | `project-map.md` |
| Reusable owner preference or correction pattern | `playbook.md` |
| Current status, completion, blocking state | relevant `domain-*.md` |
| Reasoning, incident detail, decision history, resume steps | episode linked from its domain |
| New domain or truly cross-domain invariant | `MEMORY.md` |
| Mandatory behavior for every task | nearest `AGENTS.md`, with a pointer from memory if useful |

Prefer updating or superseding an existing entry. Create an episode only when its reasoning will save future work; a routine completion usually needs only a domain status refresh.

## Resolve freshness and conflicts

- Prefer confirmed evidence over `(ASSUMED)` memory and replace the assumption.
- Prefer a newer dated status over older status, but preserve still-useful history through an episode or archive.
- Do not choose silently between conflicting confirmed rules. Add `CONFLICT:` to the owner-owes block and ask the owner with a recommended resolution.
- Mark deliberate replacements `SUPERSEDED`; do not leave two active sources of truth.
- Add a source and observation date for external or volatile facts that are durable enough to keep.

## User control

- `remember` or `save this` authorizes an explicit project-memory write.
- The installed `AGENTS.md` closeout rule authorizes automatic writes that pass this gate.
- `do not remember` or `temporary` opts the current task out.
- `forget` authorizes removal from the current project-memory files and links. Warn that committed Git history may still contain the old text.
- Never weaken or remove a LOCKED rule unless the owner explicitly targets it.

## Closeout verification

1. Review the memory diff for secrets, duplication, and unsupported claims.
2. Run `scripts/check_memory.sh <memory-dir>`.
3. Mention any write in the final response with the files and reason.
4. If the gate rejected the task, finish without manufacturing a memory update.
