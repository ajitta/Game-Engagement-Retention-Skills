# Contributing

This plugin's failure mode is not a broken build. It is a claim that outlives the thing it
described — a benchmark row whose edition moved, a rule that changed in one of three
places, a gate that stopped being met. Everything below exists to make that kind of drift
either impossible or loud.

Read `README.md` for what the plugin does, `skills/engagement-retention-advisor/references/contracts.md`
for the shipped output contract, and `docs/features/engagement-retention-v2/05-plan.md` for
what is currently open.

---

## The one invariant

**A `SKILL.md` carries a procedure, never a fact.**

Benchmarks, statutes, study results, prohibition lists and dates belong in reference
modules, which are read on demand and can be re-dated in one place. `scripts/check-no-facts-in-skills.sh`
enforces this and carries its own negative test in a comment block — paste any line from
that block into a body and the script must exit 1 naming it.

## One topic, one owner

A term appearing *normatively* in two modules is the drift this table prevents: the two
copies diverge, the reader gets whichever module was read that invocation, and nothing
fails. **This is enforced by review, not by a script** — no check compares modules against
each other. If you add a fact, find its owner here first.

| Topic | Owner |
|---|---|
| The tier procedure itself — how T1/T2a/T2b/T3/T4 decide a response | `advisor/ethics-tiers.md` |
| Per-mechanic compliant specs, and every mechanic-family row | `advisor/domain-ethics.md` |
| Laws, store rules, rating bodies, in-force dates | `advisor/jurisdictions.md` |
| Korean market product convention (not Korean law) | `advisor/korea-market.md` |
| Guild, UGC, meta-progression, in-game economy systems | `advisor/systems-catalog.md` |
| How the three skills hand work to each other | `advisor/integration-patterns.md` |
| The routing block, card grammar and language rule | `advisor/contracts.md` |
| Retention benchmark numbers and their populations | `rsd/benchmarks.md` |
| Metric definitions and day conventions | `rsd/metric-definitions.md` |
| Per-genre retention profiles | `rsd/genre-profiles.md` |
| Habit and retention evidence | `rsd/retention-playbook.md` |
| Churn diagnosis, at-risk targeting, win-back | `rsd/churn-and-winback.md` |
| Cadence mechanics and their numeric specs — pass, streak, energy, login, quests | `rsd/liveops-cadence.md` |
| LTV, ARPDAU, and the monetization-versus-retention trade-off | `rsd/retention-economics.md` |
| Experiment design and event taxonomy | `rsd/experiments.md` |
| The moment lenses | `irm/moment-lenses.md` |
| First session and FTUE | `irm/first-session.md` |
| Feel-effect strength, safety and accessibility bounds | `irm/feel-and-accessibility.md` |
| Research citations and the contested list | `irm/research-basis.md` |
| Pattern families | `irm/patterns-{reveal,progress,relief,social,nongame}.md` |

Where a topic legitimately touches two owners — streaks, for instance — the split is by
*kind*, not by convenience: the mechanic and its ethics row are `domain-ethics.md`'s, the
cadence and its numbers are `liveops-cadence.md`'s, and the evidence that habits form at
all is `retention-playbook.md`'s. Say the thing once, in the owner, and point at it from
anywhere else.

## Shared blocks

The `ROUTING`, `CARD` and `LANGUAGE` blocks live in `contracts.md` and are copied
**byte-identically** into all three `SKILL.md` bodies. This duplication is unavoidable — a
skill file loads alone at invocation, so a rule missing from the file that fired does not
exist for that run. Divergence, not duplication, is the defect, and
`scripts/check-shared-blocks.sh` fails on any.

Editing a block means editing four files. Copy everything between and including the
`<!-- NAME -->` markers; the extractor keys on them.

## Before you open a PR

```sh
bash scripts/check-shared-blocks.sh
bash scripts/check-no-facts-in-skills.sh
bash scripts/check-ethics-rows.sh
bash scripts/check-claims.sh
```

These four run in CI on every push (`.github/workflows/checks.yml`). The two validators
below need the Claude Code CLI and are run locally:

```sh
claude plugin validate .claude-plugin/plugin.json --strict   # exits 1 locally on CLAUDE.local.md; see README
claude plugin validate ./skills --strict                     # the load-bearing one
```

## Changing a skill

Any user-visible change ships with a `version` bump in `.claude-plugin/plugin.json` **in
the same commit** — a declared version is the only thing that makes an installed copy
re-fetch — plus a `CHANGELOG.md` entry saying *which skill now fires differently*. Then
re-measure and record:

```sh
claude --plugin-dir . plugin details game-engagement-retention-skills
```

Release is `claude plugin tag . -m "… %s" --push`, which refuses on a dirty tree. Note
that it pushes the **tag only** — `git push origin main` is a separate step.

**A change that does not touch a skill does not get a bump.** Tooling, CI and document
fixes go under `## [Unreleased]` at the top of `CHANGELOG.md` and are absorbed by the next
release. A bump exists to make an installed copy re-fetch; if there is nothing for it to
re-fetch, bumping only costs every user a download. The trap this avoids is real and was
hit once: work committed after a tag was written into that tag's entry, so a reader who
checked the tag out found it described files it did not contain.

## Ethics changes

The four-tier model is deliberate and reverses an earlier absolute-prohibition pass; see
the 2.0.0 entry in `CHANGELOG.md` before proposing a ban. Refusal fires only on T1 and
T2a, is scoped to the failing spec bullet, and the rest of the answer still ships.

Two eval families gate an ethics change — family 7 (six refusal false positives) at 6/6
and family 6 (three true positives) at 3/3. **Both gates are declared and neither has been
met**: the suite has never been fully executed. `evals/README.md` has the manual
procedure, including why you must run it from outside this repository.

## Writing a fact

Every number carries `[source | population | year | definition]` or it is not written.
Every legal claim is reproduced from `jurisdictions.md` with the instrument's own name and
its in-force date, or it is not stated. A house recommendation is labelled `권장` or
`기준선` — presenting one as a statute is the most expensive error available here, because
the reader takes it to their legal team.
