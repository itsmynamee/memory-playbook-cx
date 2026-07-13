# Contributing

Thanks for improving Memory Playbook CX.

1. Open an issue for behavior changes or new protocol rules before implementing them.
2. Keep Codex-specific integration separate from the [Claude Code edition](https://github.com/itsmynamee/memory-playbook).
3. Preserve the safety boundaries in `SKILL.md`, especially explicit write authorization and the separation from Codex-managed global memory.
4. Keep changes small and dependency-free when the standard shell tools are enough.
5. Run `bash tests/run.sh` before opening a pull request.

Pull requests should explain the user-visible behavior, why it belongs in durable project memory, and how it was validated.
