#!/usr/bin/env bash
# The recurring failure in this repository is a claim that outlives the thing it
# described: a benchmark row whose edition moved, a "Skill wins 2/2" headline,
# the `Mode:` contract, "both validators pass", and a 6/6 release gate that had
# never been executed. Two of the other invariant scripts exist because of that
# class. This one closes the loop on the documents themselves: it re-derives
# from the tree every count and version the prose asserts, and fails when they
# disagree.
#
# It deliberately checks only what the tree can prove. Measured figures — the
# always-on token cost, an A/B margin — need a tool this script does not have,
# so they are out of scope here and stay the release ritual's job.
#
# NEGATIVE TEST — make any single edit below and this script must exit 1 naming
# it. If it still prints OK, the check has rotted and the fix is here.
#
#   README.md:      "38 cases across ten families" -> "39 cases across ten families"
#   README.md:      "38 cases across ten families" -> "38 cases across nine families"
#   CHANGELOG.md:   "24 reference modules"         -> "23 reference modules"
#   README.md:      "all three scripts pass"       -> "all four scripts pass"
#   README.md:      "three routed skills"          -> "four routed skills"
#   plugin.json:    version 2.2.1                  -> 2.3.0, ahead of the CHANGELOG
#   CHANGELOG.md:   insert "## [2.1.7]" below the newest *released* entry (no tag)
#   README.md:      delete "never been executed"   (while evals/results/ is absent)
#   README.md:      re-add "Skill wins 2/2" or "Both validators"
#   CHANGELOG.md:   delete the [Unreleased] section, then edit the [2.2.1] entry
#                   (a tagged newest entry that no longer matches its tag)
#
# All ten were run against this tree on 2026-09-06 and all ten failed the
# script, which is the only reason to trust the OK line.
#
# Not caught, and not a gap: a count written only in prose with no noun this
# script keys on ("thirty-eight of them"). The house style is to write the
# number next to the thing it counts, which is what makes this check possible.
#
# One interaction worth knowing. `## [Unreleased]` is load-bearing, not
# decoration: without it, the newest entry is a tagged release, and this script
# grades that entry's counts — true when it shipped — against today's tree. The
# resulting failure is correct ("the documents no longer describe the tree") and
# the remedy is to open an Unreleased section, which is what CONTRIBUTING says.
set -uo pipefail
cd "$(dirname "$0")/.."
status=0
DOCS="README.md CHANGELOG.md evals/README.md CONTRIBUTING.md"

fail() { echo "FAIL: $*"; status=1; }

# CHANGELOG.md is a historical record. "three invariant checks" was true when
# 2.0.0 shipped and rewriting it would be falsifying the past, so only the
# newest entry — the one that describes the plugin as it stands — is scanned.
# That is everything above the SECOND `## [` heading of any kind: with an
# `## [Unreleased]` section present the newest entry is that one and the newest
# released version is already history, and without it the newest version is the
# entry. Keying on `## [x.y.z]` instead would make the range span both.
cl_end=$(grep -nE '^## \[' CHANGELOG.md | sed -n 2p | cut -d: -f1)
cl_end=${cl_end:-$(wc -l < CHANGELOG.md)}

# grep over the docs, dropping two kinds of hit that are not assertions:
# a CHANGELOG hit inside a superseded entry, and any line that quotes wording in
# order to correct it — the house style writes those as `old → new`, and the old
# half is a quotation, not a claim.
claims() {
  grep -noE "$1" $DOCS \
    | awk -F: -v end="$cl_end" '$1 != "CHANGELOG.md" || $2 < end' \
    | while IFS=: read -r f l t; do
        sed -n "${l}p" "$f" | grep -q '→' && continue
        printf '%s:%s:%s\n' "$f" "$l" "$t"
      done
}

# Spelled-out numbers, because the house style writes small counts as words.
word2num() {
  case "$1" in
    one) echo 1;; two) echo 2;; three) echo 3;; four) echo 4;; five) echo 5;;
    six) echo 6;; seven) echo 7;; eight) echo 8;; nine) echo 9;; ten) echo 10;;
    eleven) echo 11;; twelve) echo 12;;
    *) echo "$1";;
  esac
}

# --- the tree, re-derived every run -----------------------------------------
n_cases=$(ls -d evals/*/ 2>/dev/null | wc -l | tr -d ' ')
n_families=$(grep -c '^### [0-9][0-9]* — ' evals/README.md)
n_modules=$(ls skills/*/references/*.md 2>/dev/null | wc -l | tr -d ' ')
n_skills=$(ls skills/*/SKILL.md 2>/dev/null | wc -l | tr -d ' ')
n_scripts=$(ls scripts/check-*.sh 2>/dev/null | wc -l | tr -d ' ')
name=$(sed -nE 's/.*"name"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/p' .claude-plugin/plugin.json | head -1)

# --- 1. counts asserted in prose --------------------------------------------
# "38 cases across ten families"
while IFS=: read -r f l text; do
  [ -z "${text:-}" ] && continue
  c=$(printf '%s' "$text" | sed -E 's/^([0-9]+) cases across ([a-z]+) families$/\1/')
  w=$(printf '%s' "$text" | sed -E 's/^([0-9]+) cases across ([a-z]+) families$/\2/')
  w=$(word2num "$w")
  [ "$c" = "$n_cases" ]    || fail "$f:$l claims $c eval cases; the tree has $n_cases"
  [ "$w" = "$n_families" ] || fail "$f:$l claims $w eval families; evals/README.md defines $n_families"
done < <(claims '[0-9]+ cases across [a-z]+ families')

# "24 reference modules". The word form ("three reference modules") is the
# per-invocation read ceiling, a different quantity, so digits only.
while IFS=: read -r f l text; do
  [ -z "${text:-}" ] && continue
  c=${text%% *}
  [ "$c" = "$n_modules" ] || fail "$f:$l claims $c reference modules; the tree has $n_modules"
done < <(claims '[0-9]+ reference modules')

# "all three scripts", "three invariant checks", "three invariant scripts".
# The count token must be a number, or "bash scripts/check-*.sh" matches too.
NUM='(one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|[0-9]+)'
while IFS=: read -r f l text; do
  [ -z "${text:-}" ] && continue
  w=$(printf '%s' "$text" | sed -E 's/^(all )?([a-z0-9]+) (invariant )?(checks|scripts)$/\2/')
  w=$(word2num "$w")
  [ "$w" = "$n_scripts" ] || fail "$f:$l claims $w invariant scripts; scripts/ has $n_scripts"
done < <(claims "(all )?$NUM (invariant )?(checks|scripts)\\b")

# "three routed skills", "the three skills". A number token again, and only
# the full set — "two of the three skills" is a subset, not a count claim.
while IFS=: read -r f l text; do
  [ -z "${text:-}" ] && continue
  w=$(printf '%s' "$text" | sed -E 's/^(the )?([a-z0-9]+) (routed )?skills$/\2/')
  w=$(word2num "$w")
  [ "$w" = "$n_skills" ] || fail "$f:$l claims $w skills; skills/ has $n_skills"
done < <(claims "\\b(the )?$NUM (routed )?skills\\b" | grep -v ' of the ')

# --- 2. the declared version is the one the changelog documents --------------
declared=$(sed -nE 's/.*"version"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/p' .claude-plugin/plugin.json | head -1)
newest=$(grep -oE '^## \[[0-9]+\.[0-9]+\.[0-9]+\]' CHANGELOG.md | head -1 | tr -d '#[] ')
[ -n "$declared" ] || fail "no version in .claude-plugin/plugin.json"
[ "$declared" = "$newest" ] || \
  fail "plugin.json declares $declared but the newest CHANGELOG entry is $newest — an installed copy re-fetches on the declared version, so the two cannot drift"

# --- 3. every release the changelog says is tagged, is tagged ----------------
# CHANGELOG states tags begin at 2.1.0; earlier releases predate the ritual.
if [ -n "$(git tag 2>/dev/null)" ]; then
  for v in $(grep -oE '^## \[[0-9]+\.[0-9]+\.[0-9]+\]' CHANGELOG.md | tr -d '#[] '); do
    case "$v" in 1.*|2.0.*) continue;; esac
    git rev-parse -q --verify "refs/tags/$name--v$v" >/dev/null || \
      fail "CHANGELOG documents $v but there is no tag $name--v$v"
  done
else
  echo "note: no tags fetched, skipping the tag-coverage check (CI needs fetch-depth: 0)"
fi

# --- 4. a tagged release's entry describes the tree that carries that tag -----
# The trap: tag a release, keep working, and write the new work into the entry
# the tag already froze. A reader who checks the tag out then finds a changelog
# describing files it does not contain. This was hit once, in 2.2.1.
#
# Newest entry only, and only when it names a tagged version. Annotating an
# older entry with a correction pointer — "(corrected in 2.2.1: …)" — is good
# practice and is deliberately left alone; 2.1.0 carries one.
entry() {  # $1 = version; reads a CHANGELOG on stdin
  awk -v v="## [$1]" 'index($0,v)==1 {on=1; print; next} on && /^## \[/ {exit} on {print}'
}
newest_heading=$(grep -oE '^## \[[^]]+\]' CHANGELOG.md | head -1)
if [ -n "$(git tag 2>/dev/null)" ] && [ "$newest_heading" != "## [Unreleased]" ]; then
  v=${newest_heading#'## ['}; v=${v%]}
  tag="$name--v$v"
  if git rev-parse -q --verify "refs/tags/$tag" >/dev/null; then
    now=$(entry "$v" < CHANGELOG.md)
    was=$(git show "$tag^{}:CHANGELOG.md" 2>/dev/null | entry "$v")
    if [ -n "$was" ] && [ "$now" != "$was" ]; then
      fail "the [$v] entry has changed since $tag was cut, and it is still the newest entry — a reader checking that tag out gets a changelog describing a tree it does not have. Put post-tag work under '## [Unreleased]' instead"
      diff <(printf '%s\n' "$was") <(printf '%s\n' "$now") | head -6
    fi
  fi
fi

# --- 5. the eval suite's execution state, as the documents describe it -------
# The release gate is declared, not met, until transcripts exist. Whichever way
# that flips, three documents have to move with it.
if [ -d evals/results ] && [ -n "$(ls -A evals/results 2>/dev/null)" ]; then
  for f in README.md CHANGELOG.md evals/README.md; do
    grep -q "never been executed" "$f" && \
      fail "$f still says the suite has 'never been executed', but evals/results/ has transcripts"
  done
else
  for f in README.md CHANGELOG.md evals/README.md; do
    grep -q "never been executed" "$f" || \
      fail "$f must say the suite has 'never been executed' while evals/results/ is empty or absent — the 6/6 gate is declared, not met"
  done
fi

# --- 6. claims retired as false, which must not come back -------------------
# Each was in a shipped document and each was wrong.
retired=(
  "Skill wins 2/2"            # a headline that outlived its test
  "Both validators"           # the plugin.json validator exits 1 locally
  "and run \*\*manually\*\*"  # the suite is documented to run, not run
  "all in CI"                 # two validate targets are local; CI has no CLI
)
# CHANGELOG.md and docs/ are historical records: an entry saying a claim was
# retired has to quote it. Only the documents that assert things about the
# plugin as it stands are scanned, and a line quoting a claim to correct it
# (an arrow, "no longer", "instead of") is not an assertion of it.
for claim in "${retired[@]}"; do
  hits=$(grep -rniE "$claim" README.md CONTRIBUTING.md evals/README.md 2>/dev/null \
         | grep -vE '→|->|no longer|instead of|SUPERSEDED' || true)
  [ -n "$hits" ] && { fail "a retired claim is back: /$claim/"; printf '%s\n' "$hits" | head -3; }
done

[ $status -eq 0 ] && echo "OK: every count, version and gate claim in the docs matches the tree ($n_cases cases, $n_families families, $n_modules modules, $n_skills skills, $n_scripts scripts, v$declared)"
exit $status
