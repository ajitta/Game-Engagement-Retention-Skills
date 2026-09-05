#!/usr/bin/env bash
# Every SKILL.md must carry the ROUTING, CARD and LANGUAGE blocks byte-identically.
# A skill file loads alone at invocation, so a rule missing from the file that
# fired does not exist for that run. Duplication is unavoidable; divergence is
# the defect, and this script removes the mechanism.
set -uo pipefail
cd "$(dirname "$0")/.."
CONTRACTS=skills/engagement-retention-advisor/references/contracts.md
status=0

extract() { # $1=file $2=block name
  awk -v b="$2" '
    $0 ~ "<!-- " b " -->"        { on=1; next }
    $0 ~ "<!-- /" b " -->"       { on=0 }
    on                            { print }
  ' "$1"
}

for block in ROUTING CARD LANGUAGE; do
  ref=$(extract "$CONTRACTS" "$block")
  if [ -z "$ref" ]; then
    echo "FAIL: $CONTRACTS has no $block block"; status=1; continue
  fi
  for skill in skills/*/SKILL.md; do
    got=$(extract "$skill" "$block")
    if [ -z "$got" ]; then
      echo "FAIL: $skill is missing the $block block"; status=1
    elif [ "$got" != "$ref" ]; then
      echo "FAIL: $skill $block block diverges from $CONTRACTS"
      diff <(printf '%s\n' "$ref") <(printf '%s\n' "$got") | head -20
      status=1
    fi
  done
done

# A reference module cannot assume which skill is reading it: ${CLAUDE_SKILL_DIR}
# resolves to the FIRING skill's directory, so an own-directory pointer inside a
# module breaks the moment a sibling skill reads it. Modules must always name the
# owning skill (`${CLAUDE_SKILL_DIR}/../<skill>/references/<file>.md`), which
# resolves correctly for a same-skill read too. SKILL.md bodies are exempt —
# there the own-directory form is the correct one.
if grep -rn '\${CLAUDE_SKILL_DIR}/references/' skills/*/references/*.md; then
  echo "FAIL: reference modules must not use own-directory paths — a module cannot assume which skill is reading it" >&2
  status=1
fi

[ $status -eq 0 ] && echo "OK: ROUTING, CARD and LANGUAGE blocks identical across $(ls skills/*/SKILL.md | wc -l | tr -d ' ') skills; no own-directory pointers in reference modules"
exit $status
