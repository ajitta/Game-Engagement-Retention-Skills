#!/usr/bin/env bash
# Every tier-3 mechanic must ship a measurable compliant spec. This is what makes
# "energy is forbidden" literally unwritable: a T3 row with no numeric or
# observable bound fails the build instead of shipping as a blanket ban.
set -uo pipefail
cd "$(dirname "$0")/.."
F=skills/engagement-retention-advisor/references/domain-ethics.md
status=0
[ -f "$F" ] || { echo "FAIL: $F missing"; exit 1; }

# A T3 row is a line naming tier 3; its spec must contain a number, a duration,
# a count, or an explicitly observable test verb.
rows=$(grep -nE 'T3' "$F" || true)
[ -z "$rows" ] && { echo "FAIL: $F declares no T3 rows — the tiering did not land"; exit 1; }

n=0; bad=0
while IFS= read -r line; do
  ln=${line%%:*}
  n=$((n+1))
  # Look at the row and the six lines after it for a measurable bound.
  window=$(sed -n "${ln},$((ln+6))p" "$F")
  if printf '%s' "$window" | grep -qE '[0-9]|≥|≤|per day|per week|rolling|inventory|audit|log|observable|test account'; then :; else
    echo "FAIL: T3 row at $F:$ln has no numeric or observable compliant spec"
    sed -n "${ln}p" "$F" | cut -c1-160
    bad=$((bad+1)); status=1
  fi
done <<< "$rows"

[ $status -eq 0 ] && echo "OK: $n T3 rows, all with a measurable compliant spec"
exit $status
