#!/usr/bin/env bash
# setup.sh - crea symlinks por IA para cada skill.md
# Uso: ./setup.sh [claude gemini gpt ...]

set -euo pipefail
cd "$(dirname "$0")"

IA_LIST=("claude" "gemini" "gpt")
if [ "$#" -gt 0 ]; then
  IA_LIST=()
  for a in "$@"; do IA_LIST+=("$a"); done
fi

for skilldir in skills/*/; do
  [ -d "$skilldir" ] || continue
  skillfile="$skilldir/skill.md"
  [ -f "$skillfile" ] || continue
  base="$(basename "$skilldir")"
  for ia in "${IA_LIST[@]}"; do
    link="$skilldir/${base}.${ia}.md"
    target="skill.md"
    # Remove existing link if present
    if [ -e "$link" ] || [ -L "$link" ]; then
      rm -f "$link"
    fi
    # Try to create POSIX symlink
    if ln -s "$target" "$link" 2>/dev/null; then
      echo "Created symlink $link -> $target"
    else
      # Fallback for Windows (requires admin or developer mode)
      if command -v cmd.exe >/dev/null 2>&1; then
        # Use cmd to create symlink (mklink) - will fail without perms
        cmd.exe /c mklink "$(cygpath -w "$link")" "$(cygpath -w "$skillfile")" >/dev/null 2>&1 || echo "Could not create Windows symlink $link (insufficient permissions)."
      else
        echo "Could not create symlink $link; please create manually on this platform."
      fi
    fi
  done
done

echo "setup.sh completed. Created model-specific symlinks for skills/."