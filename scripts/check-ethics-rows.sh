#!/usr/bin/env bash
# Every tier-3 mechanic must ship a measurable compliant spec. This is what makes
# "energy is forbidden" literally unwritable: a T3 row with no numeric or
# observable bound fails the build instead of shipping as a blanket ban.
#
# The match line itself is excluded from the evidence window, because "T3"
# contains a digit and would otherwise satisfy the numeric test on its own.
#
# The rows live in one file per domain under references/domain-ethics/ (since
# 3.4.0). Every file is checked; a file with no T3 row at all fails, because
# each of the six domains declares at least one. The shared preamble of those
# files carries no tier code, so only rows and row-group headings match here.
set -uo pipefail
cd "$(dirname "$0")/.."
D=plugin/skills/engagement-retention-advisor/references/domain-ethics
status=0
[ -d "$D" ] || { echo "FAIL: $D missing"; exit 1; }

n=0; bad=0
for F in "$D"/*.md; do
rows=$(grep -nE '(^|[^A-Za-z0-9])T3([^0-9]|$)' "$F" || true)
[ -z "$rows" ] && { echo "FAIL: $F declares no T3 rows — the tiering did not land"; status=1; continue; }

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
done

[ $status -eq 0 ] && echo "OK: $n T3 rows across $(ls "$D"/*.md | wc -l | tr -d ' ') domain files, all with a measurable compliant spec"
exit $status
