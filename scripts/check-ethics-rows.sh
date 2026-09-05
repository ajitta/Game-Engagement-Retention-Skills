#!/usr/bin/env bash
# Every tier-3 mechanic must ship a measurable compliant spec. This is what makes
# "energy is forbidden" literally unwritable: a T3 row with no numeric or
# observable bound fails the build instead of shipping as a blanket ban.
#
# The match line itself is excluded from the evidence window, because "T3"
# contains a digit and would otherwise satisfy the numeric test on its own.
set -uo pipefail
cd "$(dirname "$0")/.."
F=skills/engagement-retention-advisor/references/domain-ethics.md
status=0
[ -f "$F" ] || { echo "FAIL: $F missing"; exit 1; }

rows=$(grep -nE '(^|[^A-Za-z0-9])T3([^0-9]|$)' "$F" || true)
[ -z "$rows" ] && { echo "FAIL: $F declares no T3 rows — the tiering did not land"; exit 1; }

n=0; bad=0
while IFS= read -r line; do
  ln=${line%%:*}
  n=$((n+1))
  # Evidence window: the row's own text with every tier code stripped, plus the
  # six lines that follow it. A spec must contain a real number, a comparison
  # bound, a cadence, or a named observable test.
  window=$(sed -n "${ln},$((ln+6))p" "$F" | sed -E 's/T[1-4][ab]?//g')
  if printf '%s' "$window" | grep -qE '[0-9]|≥|≤|per day|per week|per session|rolling|inventory|audit|log|enumerate|observable|test account|screenshot|replay'; then :; else
    echo "FAIL: T3 row at $F:$ln has no numeric or observable compliant spec"
    sed -n "${ln}p" "$F" | cut -c1-160
    bad=$((bad+1)); status=1
  fi
done <<< "$rows"

[ $status -eq 0 ] && echo "OK: $n T3 rows, all with a measurable compliant spec"
exit $status
