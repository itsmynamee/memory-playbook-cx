#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$ROOT"

bash -n scripts/check_memory.sh
grep -q '^name: memory-playbook-cx$' SKILL.md
grep -q 'default_prompt:.*\$memory-playbook-cx' agents/openai.yaml
grep -q 'references/capture-policy.md' SKILL.md
grep -q 'closing a substantive project task' SKILL.md
grep -q 'For every substantive completed or interrupted task' AGENTS.md
grep -q '~/.agents/skills/memory-playbook-cx' README.md
if grep -q '~/.codex/skills/memory-playbook-cx' README.md; then
  echo "README still documents the obsolete user skill path"
  exit 1
fi

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

make_store() {
  local dir=$1
  mkdir -p "$dir"
  cat >"$dir/MEMORY.md" <<'EOF'
# Memory index

- [project-map](project-map.md)
- [playbook](playbook.md)
- [domain-core](domain-core.md)
EOF
  cat >"$dir/project-map.md" <<'EOF'
---
name: project-map
description: Stable project facts.
metadata:
  type: project
---
EOF
  cat >"$dir/playbook.md" <<'EOF'
---
name: playbook
description: Owner-approved working preferences.
metadata:
  type: feedback
---
EOF
  cat >"$dir/domain-core.md" <<'EOF'
---
name: domain-core
description: Domain index - core project work.
metadata:
  type: project
---

Nothing in flight.
EOF
}

make_store "$tmp/valid"
bash scripts/check_memory.sh "$tmp/valid"

cp -R "$tmp/valid" "$tmp/orphan"
touch "$tmp/orphan/unlinked.md"
if bash scripts/check_memory.sh "$tmp/orphan" >/dev/null 2>&1; then
  echo "Expected orphan validation to fail"
  exit 1
fi

cp -R "$tmp/valid" "$tmp/fake-domain"
sed -i.bak 's/description: Domain index/description: Notes/' "$tmp/fake-domain/domain-core.md"
rm "$tmp/fake-domain/domain-core.md.bak"
if bash scripts/check_memory.sh "$tmp/fake-domain" >/dev/null 2>&1; then
  echo "Expected fake domain validation to fail"
  exit 1
fi

echo "ALL TESTS PASSED"
