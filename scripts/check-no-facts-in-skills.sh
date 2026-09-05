#!/usr/bin/env bash
# A SKILL.md carries a procedure, never a fact. Benchmarks, statutes, study
# results and prohibition lists belong in the reference modules, which are read
# on demand and can be re-dated in one place. This grep is the enforcement.
set -uo pipefail
cd "$(dirname "$0")/.."
status=0

for f in skills/*/SKILL.md; do
  body=$(sed '1,/^---$/d; 1,/^---$/d' "$f")   # drop frontmatter; descriptions may name triggers

  # Retention percentages and benchmark-shaped numbers
  hits=$(printf '%s\n' "$body" | grep -nE '\b[0-9]+(\.[0-9]+)? ?%' | grep -viE 'e\.g\.|for example|<n>|N%' || true)
  [ -n "$hits" ] && { echo "FAIL($f): percentage in a skill body — move to a reference module"; printf '%s\n' "$hits" | head -5; status=1; }

  # Jurisdictions and statutes
  hits=$(printf '%s\n' "$body" | grep -nE '게임산업|전자상거래법|정보통신망법|PEGI|DSA|SB ?243|GBL|FTC|Lei 15|ECA Digital|Art\. ?33|33-2' || true)
  [ -n "$hits" ] && { echo "FAIL($f): jurisdiction or statute in a skill body — belongs in jurisdictions.md"; printf '%s\n' "$hits" | head -5; status=1; }

  # Prohibition lists (the v1 shape the tiering replaced)
  hits=$(printf '%s\n' "$body" | grep -niE '^\s*[-*] *(forbidden|do not recommend|never allow)|^#+ *forbidden' || true)
  [ -n "$hits" ] && { echo "FAIL($f): prohibition list in a skill body — belongs in domain-ethics.md"; printf '%s\n' "$hits" | head -5; status=1; }

  # Study citations
  hits=$(printf '%s\n' "$body" | grep -nE 'https?://|doi:|et al\.,? [0-9]{4}|\([12][0-9]{3}\)' || true)
  [ -n "$hits" ] && { echo "FAIL($f): citation in a skill body — belongs in a reference module"; printf '%s\n' "$hits" | head -5; status=1; }

  # Size guidance
  n=$(wc -l < "$f" | tr -d ' ')
  [ "$n" -gt 500 ] && { echo "FAIL($f): $n lines, over the 500-line guidance"; status=1; }
done

[ $status -eq 0 ] && echo "OK: no facts, citations, statutes or prohibition lists in any SKILL.md body"
exit $status
