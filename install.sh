#!/usr/bin/env bash
# Symlinks this repo's agents, skills and instructions into the places Copilot reads.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mv "$dest" "$dest.bak.$(date +%s)"
  fi
  ln -sfn "$src" "$dest"
  echo "linked $dest -> $src"
}

link "$REPO/agents"       "$HOME/.copilot/agents"
link "$REPO/skills"       "$HOME/.copilot/skills"
link "$REPO/instructions" "$HOME/.copilot/instructions"
link "$REPO/skills"       "$HOME/.agents/skills"
