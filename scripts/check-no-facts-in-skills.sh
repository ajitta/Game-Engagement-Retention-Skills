#!/usr/bin/env bash
# A SKILL.md carries a procedure, never a fact. Benchmarks, statutes, study
# results and prohibition lists belong in the reference modules, which are read
# on demand and can be re-dated in one place. This grep is the enforcement.
#
# NEGATIVE TEST — paste any line below into a SKILL.md body and this script must
# exit 1 naming it. If it prints OK, the check has rotted and the fix is here,
# not in the body. (These are the shapes an earlier version let through: the
# percentage rule needed a literal `%`, the statute rule was a fixed token list
# with no Korean instrument and no date, and the prohibition rule only matched
# `- forbidden` at the start of a line.)
#
#   Korea has required per-item odds disclosure since March 2024.   → jurisdiction + date
#   Puzzle D7 lands between nine and twelve percent for mobile.     → percentage, spelled out
#   Median mobile D7 is 12 for puzzle.                              → benchmark, no % sign
#   Forbidden: paid streak freeze, expiring login chains.           → prohibition list, prose
#   * Never recommend a one-shot event on core content.             → prohibition list, bullet
#   금지: 확률 미표기, 광고 연쇄 보상, 이탈 유도 알림.                  → prohibition list, Korean
#   청소년보호법 시행령에 따라 심야 알림은 보낼 수 없습니다.             → Korean instrument name
#   Hit stop of 120 ms is the researched optimum per Swink.         → citation by author
#
# Deliberately NOT caught, and not a gap: the measurement windows the bodies
# keep inline by design (the week 3–4 novelty re-read, re-dormancy at +7d/+30d)
# and the tier name "T1 illegal" — a bare `illegal` or bare-number rule would
# fail all three shipped bodies on text the blind A/B credited.
set -uo pipefail
cd "$(dirname "$0")/.."
status=0

for f in skills/*/SKILL.md; do
  body=$(sed '1,/^---$/d; 1,/^---$/d' "$f")   # drop frontmatter; descriptions may name triggers

  # Retention percentages — with the sign, and spelled out without it
  hits=$(printf '%s\n' "$body" | grep -niE '\b[0-9]+(\.[0-9]+)? ?%|percent|퍼센트|%p|percentage point' | grep -viE 'e\.g\.|for example|<n>|N%' || true)
  [ -n "$hits" ] && { echo "FAIL($f): percentage in a skill body — move to a reference module"; printf '%s\n' "$hits" | head -5; status=1; }

  # Benchmark-shaped figures that carry no percent sign at all
  hits=$(printf '%s\n' "$body" | grep -nE '\b(D[0-9]{1,2}|DAU|MAU|ARPDAU|ARPU|LTV|retention|리텐션|잔존)[^.|]{0,25}\b(is|are|runs?|sits?|lands?|averages?|hovers?|about|around|roughly|between|below|above|under|over|typically|median|benchmark|평균|약|정도|수준)\b[^.|]{0,25}[0-9]' || true)
  [ -n "$hits" ] && { echo "FAIL($f): benchmark figure in a skill body — belongs in benchmarks.md"; printf '%s\n' "$hits" | head -5; status=1; }

  # Jurisdictions and statutes — named instruments, English and Korean
  hits=$(printf '%s\n' "$body" | grep -nE '게임산업|전자상거래법|정보통신망법|청소년보호법|개인정보|셧다운|확률형|공정거래|문화체육관광부|방송통신위|게임물관리위|여성가족부|시행령|시행일|법률 제|약관법|표시광고법|PEGI|DSA|SB ?243|GBL|FTC|COPPA|GDPR|AADC|Lei 15|ECA Digital|Art\. ?33|33-2' || true)
  [ -n "$hits" ] && { echo "FAIL($f): jurisdiction or statute in a skill body — belongs in jurisdictions.md"; printf '%s\n' "$hits" | head -5; status=1; }

  # A jurisdiction carrying a legal claim, even with no instrument named
  hits=$(printf '%s\n' "$body" | grep -nE '\b(Korea|Korean|한국|일본|중국|EU|US|California|Texas|Brazil)\b[^.]{0,40}(law|Act|statute|regulat|legal|illegal|requir|mandat|ban(s|ned)?|법|규제|의무)' || true)
  [ -n "$hits" ] && { echo "FAIL($f): legal claim about a jurisdiction — belongs in jurisdictions.md"; printf '%s\n' "$hits" | head -5; status=1; }

  # Dates — an in-force date or a study year dates the body instead of the module
  hits=$(printf '%s\n' "$body" | grep -niE '\b(19|20)[0-9]{2}\b|[0-9]{4}년|(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)[a-z]*[[:space:]]+[0-9]{4}|in force|시행 ?(중|일)|last-verified' || true)
  [ -n "$hits" ] && { echo "FAIL($f): a date in a skill body — the module that can be re-dated owns it"; printf '%s\n' "$hits" | head -5; status=1; }

  # Prohibition lists (the v1 shape the tiering replaced) — bullet, heading,
  # bare prose, or Korean. Not bare `illegal`: that is the T1 tier name.
  hits=$(printf '%s\n' "$body" | grep -niE '^[[:space:]]*([-*+]|#+)?[[:space:]]*(forbidden|prohibited|never (recommend|propose|allow)|do not (recommend|propose|use))|^[[:space:]]*금지' || true)
  [ -n "$hits" ] && { echo "FAIL($f): prohibition list in a skill body — belongs in domain-ethics.md"; printf '%s\n' "$hits" | head -5; status=1; }

  # Study citations, including attribution by author name
  hits=$(printf '%s\n' "$body" | grep -nE 'https?://|doi:|et al\.,? [0-9]{4}|\([12][0-9]{3}\)|\bper [A-Z][A-Za-z]+|according to [A-Z]|\bstud(y|ies) show|research shows|연구에 따르면|[A-Z][a-z]+ (found|showed|reports)' || true)
  [ -n "$hits" ] && { echo "FAIL($f): citation in a skill body — belongs in a reference module"; printf '%s\n' "$hits" | head -5; status=1; }

  # Size ratchet. Lines are the wrong unit here — these bodies run 300–800 chars
  # per line, so a 194-line body is already ~8.9k tokens. Bytes are what the
  # context window actually pays: at the measured ~3.1 bytes/token, 32000 bytes
  # is ~10k tokens, and an invocation loads one body plus up to three modules.
  b=$(wc -c < "$f" | tr -d ' ')
  [ "$b" -gt 32000 ] && { echo "FAIL($f): $b bytes, over the 32000-byte body cap"; status=1; }
done

# Modules are read at runtime too, and the ≤3-read ceiling bounds how many load,
# not how large one is. Same cap, so the worst-case invocation stays bounded.
for m in skills/*/references/*.md; do
  b=$(wc -c < "$m" | tr -d ' ')
  [ "$b" -gt 32000 ] && { echo "FAIL($m): $b bytes, over the 32000-byte module cap"; status=1; }
done

[ $status -eq 0 ] && echo "OK: no facts, citations, statutes or prohibition lists in any SKILL.md body"
exit $status
