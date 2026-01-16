#!/usr/bin/env bash
# sync.sh - sincroniza las skills en Agent.md basándose en la propiedad Scope
# Reemplaza el bloque entre <!-- SKILLS-START --> y <!-- SKILLS-END -->

set -euo pipefail
cd "$(dirname "$0")"
AGENT_FILE="Agent.md"
START_MARK='<!-- SKILLS-START -->'
END_MARK='<!-- SKILLS-END -->'

if [ ! -f "$AGENT_FILE" ]; then
  echo "Agent.md no encontrado en el directorio actual"
  exit 1
fi

# Recolectar skills
TMP_OUTPUT="$(mktemp)"

# Mapear scopes a lista
declare -A SCOPE_MAP

for f in skills/*/skill.md; do
  [ -f "$f" ] || continue
  # Extraer metadata YAML-like
  name=$(grep -m1 "^Name:" "$f" | sed 's/^Name:[[:space:]]*//')
  desc=$(grep -m1 "^Description:" "$f" | sed 's/^Description:[[:space:]]*//')
  trigger=$(grep -m1 "^Trigger:" "$f" | sed 's/^Trigger:[[:space:]]*//')
  scope=$(grep -m1 "^Scope:" "$f" | sed 's/^Scope:[[:space:]]*//')
  relpath="$f"
  if [ -z "$scope" ]; then scope="Root"; fi
  key="$scope"
  entry="- \\\`$scope\\\` - \\\`$name\\\` — trigger: \"${trigger}\" — path: ${relpath}"
  # Append to map
  if [ -z "${SCOPE_MAP[$key]:-}" ]; then
    SCOPE_MAP[$key]="$entry\n"
  else
    SCOPE_MAP[$key]="${SCOPE_MAP[$key]}$entry\n"
  fi
done

# Generar bloque nuevo
{
  echo "<!-- SKILLS-START -->"
  echo "<!-- START GENERATED SKILLS: DO NOT EDIT MANUALLY -->"
  echo "\n## Skills por Scope (generado automáticamente)\n"
  for scope in "UI" "Data" "Root"; do
    if [ -n "${SCOPE_MAP[$scope]:-}" ]; then
      echo "### $scope"
      echo -e "${SCOPE_MAP[$scope]}"
      echo ""
    fi
  done
  # Any other scopes
  for key in "${!SCOPE_MAP[@]}"; do
    case "$key" in
      UI|Data|Root) ;;
      *)
        echo "### $key"
        echo -e "${SCOPE_MAP[$key]}"
        echo ""
        ;;
    esac
done
  echo "<!-- END GENERATED SKILLS -->"
  echo "<!-- SKILLS-END -->"
} > "$TMP_OUTPUT"

# Replace block in AGENT_FILE
awk -v start="$START_MARK" -v end="$END_MARK" -v replfile="$TMP_OUTPUT" '
  BEGIN{inside=0}
  {
    if ($0 ~ start){print; while((getline line < replfile) > 0) print line; inside=1; next}
    if ($0 ~ end){print; inside=0; next}
    if (inside==0) print
  }'
  "$AGENT_FILE" > "${AGENT_FILE}.new"

mv "${AGENT_FILE}.new" "$AGENT_FILE"
rm -f "$TMP_OUTPUT"

echo "sync.sh: Agent.md actualizado con referencias a skills."