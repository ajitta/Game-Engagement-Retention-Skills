#!/usr/bin/env bash
# The release ritual, in one command, because its two halves were separable and
# that cost a release.
#
# `claude plugin tag . --push` pushes the TAG. It does not push the branch. The
# tagged commit then reaches the remote as a dangling object — `git ls-remote`
# resolves the tag, and the commit is on no branch. A git-based marketplace
# clones the default branch, so for as long as that lasts an installer gets the
# PREVIOUS release while the tag advertises the new one. It happened here on
# 2.2.1 and was caught by hand.
#
# Order matters and is the reason this is a script rather than a checklist:
# branch first, then tag. A tag that names a commit already on the published
# branch is never wrong; a branch that lags a tag is.
#
# Usage:  scripts/release.sh "one-line release message"
#         scripts/release.sh --dry-run "…"     everything except the two pushes
set -uo pipefail
cd "$(dirname "$0")/.."

dry=0
[ "${1:-}" = "--dry-run" ] && { dry=1; shift; }
msg=${1:-}
[ -n "$msg" ] || { echo "usage: scripts/release.sh [--dry-run] \"release message\"" >&2; exit 2; }

step() { printf '\n\033[1m==> %s\033[0m\n' "$*"; }
die()  { printf '\nFAIL: %s\n' "$*" >&2; exit 1; }

version=$(sed -nE 's/.*"version"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/p' .claude-plugin/plugin.json | head -1)
name=$(sed -nE 's/.*"name"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/p' .claude-plugin/plugin.json | head -1)
tag="$name--v$version"
branch=$(git rev-parse --abbrev-ref HEAD)

step "Releasing $name $version as $tag from $branch"

step "Working tree is clean"
[ -z "$(git status --porcelain)" ] || die "dirty tree — commit or stash first"

step "This version is not already tagged"
! git rev-parse -q --verify "refs/tags/$tag" >/dev/null || \
  die "$tag already exists. Bump the version in plugin.json and add a CHANGELOG entry first"

step "CHANGELOG documents this version, and it is the newest entry"
newest=$(grep -oE '^## \[[0-9]+\.[0-9]+\.[0-9]+\]' CHANGELOG.md | head -1 | tr -d '#[] ')
[ "$newest" = "$version" ] || \
  die "plugin.json says $version but the newest CHANGELOG entry is $newest. If work has landed since the last tag, it belongs under '## [Unreleased]' until you bump"

step "Invariant scripts"
for s in scripts/check-*.sh; do
  printf '  %-34s' "$(basename "$s")"
  out=$(bash "$s" 2>&1) && echo "PASS" || { echo "FAIL"; printf '%s\n' "$out" | head -10; die "$s"; }
done

step "Validators (these need the Claude Code CLI and do not run in CI)"
if command -v claude >/dev/null 2>&1; then
  printf '  %-34s' "validate ./skills --strict"
  claude plugin validate ./skills --strict >/dev/null 2>&1 && echo "PASS" || die "skills validator"
  printf '  %-34s' "validate plugin.json --strict"
  if claude plugin validate .claude-plugin/plugin.json --strict >/dev/null 2>&1; then echo "PASS"
  else echo "warns (expected locally: untracked CLAUDE.local.md — see README)"; fi
else
  die "the claude CLI is not on PATH; the two validators are release checks and cannot be skipped"
fi

step "Always-on cost, for the record"
if command -v claude >/dev/null 2>&1; then
  claude --plugin-dir . plugin details "$name" 2>/dev/null | grep -E 'Always-on' || echo "  (not reported)"
fi

if [ "$dry" = "1" ]; then
  step "--dry-run: stopping before the branch push and the tag"
  echo "  would run: git push origin $branch"
  echo "  would run: claude plugin tag . -m \"$msg %s\" --push"
  exit 0
fi

# Branch BEFORE tag. This is the whole point of the script.
step "Pushing $branch"
git push origin "$branch" || die "branch push failed — nothing has been tagged, so nothing is inconsistent"

step "Tagging and pushing $tag"
claude plugin tag . -m "$msg %s" --push || die "tagging failed; the branch is pushed, so re-run once fixed"

step "Verifying the tag is reachable from the published branch"
git fetch --quiet origin
git merge-base --is-ancestor "$(git rev-parse "$tag^{}")" "origin/$branch" || \
  die "$tag is not on origin/$branch — run: git push origin $branch"

step "Done — $tag is published and on origin/$branch"
