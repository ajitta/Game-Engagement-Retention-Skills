---
status: draft
revised: 2026-09-06
---

# Remaining work after v2.2.0

A handoff. v2 shipped and is pushed; this document is the list of things the
release states, promises or implies that are not yet true. It is written to be
actionable without the session that produced it.

Read `04-design.md` for the contract and `03-analysis.md` for why v2 exists. Do
not re-derive either. **Scope every check to this repository** — `know-your-unknowns`
and `claude-plugins` are separate and were deliberately left alone.

---

## 1. Where things stand

Shipped, pushed and tagged: `game-engagement-retention-skills--v2.1.0` and
`--v2.2.0`. Working tree clean.

| Fact | Value | How to re-check |
|---|---|---|
| Version | 2.2.0 | `python3 -c "import json;print(json.load(open('.claude-plugin/plugin.json'))['version'])"` |
| Always-on tokens | ~1,845 | `claude --plugin-dir . plugin details game-engagement-retention-skills` |
| Frontmatter budget | 1,423 / 1,436 / 1,494 of 1,536 | see §5 |
| Reference modules | 24 | `ls skills/*/references/*.md \| wc -l` |
| Eval cases | 38, never executed | `ls -d evals/*/ \| wc -l`; `ls evals/results` is empty |
| Invariant scripts | 3, all passing | `bash scripts/check-*.sh` |

Distribution is through the catalog marketplace `ajitta`:

```
/plugin marketplace add ajitta/claude-plugins
/plugin install game-engagement-retention-skills@ajitta
```

### Settled — do not re-litigate

- Four-tier ethics with refusal only on T1/T2a, and a measurable compliant spec
  per T3 mechanic. This deliberately reverses the 2026-07 absolute-prohibition
  pass.
- Monetization is in scope only as retention tension. SaaS is out. Games go
  deep; the five consumer interactive domains stay.
- Cards replace wide tables. Forced by a blind A/B the wide-table version lost
  3-0.
- `contracts.md` is the shipped output contract and **supersedes `04-design.md`
  §4 wherever they disagree**. It forbids the literal `Mode:` line, the section
  `## 읽은 근거` (now `## 근거`), printed tier codes, printed family slugs, and any
  line whose content is that there is nothing to report.
- `when_to_use` is a real field despite the VS Code linter flagging it. Do not
  delete it; Korean routing depends on it.

---

## 2. Method note — read before acting

These items come from a four-lens audit that was **stopped before its
adversarial verification pass finished**. Treat every entry below as a
*candidate* unless this document marks it CONFIRMED.

CONFIRMED means it was checked directly against the files in this session:

- the eval suite has never run (`evals/results/` is empty)
- 16 of 38 cases have `criteria.md`; the rest use other grader filenames
- the read-ceiling arithmetic does not close (§3.2)
- there is no CI in this repository (`.github/` does not exist)

Everything else: verify the quoted line before editing it. Several audit items
in the original sweep were wrong about line numbers.

---

## 3. Outstanding — high

### 3.1 The release gate is stated as binding but has never run — CONFIRMED

Three documents say the six false-positive eval cases gate the release at 6/6.
The suite is authored and committed; it has been executed zero times.

- `README.md:129` — "six false-positive eval cases must pass 6/6 or the ethics change does not ship"
- `README.md:233` — "six refusal false positives that are a release gate at 6/6"
- `CHANGELOG.md:89` — "gate the release at 6/6"
- `evals/README.md:230` — "Two hard gates... They ship together or not at all."

**Fix, one of two.** Either add a clause to each stating that the gate is
declared and not yet met as of 2.2.0, or run families 6 and 7 by hand with the
procedure at `evals/README.md:245-275` and commit the transcripts. Running them
is the better answer, and `claude plugin eval` is not needed for it — the
procedure is a `claude -p` loop.

### 3.2 The three-read ceiling does not close — CONFIRMED

Every body caps reference reads at three. The mandatory ethics read is two files
(`ethics-tiers.md` plus a section of `domain-ethics.md`). `moments` already
spends two on lenses plus a pattern family, so it needs four. The three bodies
resolve this three different ways, and only the advisor's is coherent.

- `retention-strategy-designer/SKILL.md:75` (mode table) vs `:104` — the latter says outright "Both count against the three-read ceiling"
- `interaction-reward-moments/SKILL.md:26`, `:71`, `:103`
- `engagement-retention-advisor/SKILL.md:71` — carries the working carve-out

**Fix.** Copy the advisor's carve-out into the other two: a *section* of
`domain-ethics.md` is not a module and does not count against the ceiling. One
rule, three bodies. Then re-check `README.md:39, :195, :197`, whose ~30k
worst-case figure excludes this read and understates the real cost.

### 3.3 A reference module orders the output the contract forbids

`skills/engagement-retention-advisor/references/systems-catalog.md:36` reads
`- **Ethics** — not a row by default; proceed and say so.` That "say so" is the
null finding banned by `contracts.md:76` and by `ethics-tiers.md:26`, and it is
what the false-positive release gate tests for.

**Fix.** `proceed and say so` → `proceed and emit nothing about it`.

### 3.4 The eval suite is described as running

`README.md:235` says the suite "is authored and run **manually**". It is
documented to run manually and has not run. `CHANGELOG.md:82` words it
correctly; make the README match.

---

## 4. Outstanding — medium

| # | Item | Where | Smallest fix |
|---|---|---|---|
| 4.1 | "in CI" is asserted; there is no CI — CONFIRMED | `README.md:280`, `04-design.md:100, :413, :422` | Add a workflow running the two validators and three scripts, or drop the CI wording |
| 4.2 | "Both validators pass" is false and self-contradicting, and the sentence repeats | `README.md:245` | Say the skills validator and three scripts pass; keep the exits-1 explanation once |
| 4.3 | Manual-run instruction assumes every case has `criteria.md` — CONFIRMED, 16 of 38 | `README.md:235` | Name the grader file per family instead |
| 4.4 | `CONTRIBUTING.md` and its one-topic-one-owner table were never written | promised at `04-design.md:94` | Write it, or state that ownership is enforced by review |
| 4.5 | `benchmarks.md` has no `last-verified` header | promised at `04-design.md:472` | Add it, matching `jurisdictions.md:5` |
| 4.6 | The design's largest-risk mitigation names an eval grader the contract makes impossible | `04-design.md:468` | Strike it, or add a grader asserting a permitted proxy |
| 4.7 | Design still mandates the tier-code ethics stamp | `04-design.md:172, :438, :470` | Rewrite `:172` to the shipped bullet; add supersede markers |
| 4.8 | Design says `docs/` is excluded from the shipped plugin; it is not | `04-design.md:56` vs `:411` | Mark KEEP and note the exclusion was deliberately not taken; correct 480 KB → 648 KB |
| 4.9 | README describes the pre-polish `## 전제` rule | `README.md:105` | At most four lines, only answer-changing guesses |
| 4.10 | The sub-1,024 `description` insurance was spent without a record | all three `SKILL.md:3` | One CHANGELOG line: spent deliberately to move Korean into `description` |
| 4.11 | IRM's body keeps a scene-less example its own frontmatter routes to the advisor | `interaction-reward-moments/SKILL.md:20` | Make the example scene-named, or append the advisor hand-off |
| 4.12 | "dopamine point" claimed removed but ships in `plugin.json` keywords and IRM's description | `.claude-plugin/plugin.json:18`, `SKILL.md:3` | Qualify the claim: removed from every answer, kept as an inbound trigger |

---

## 5. Outstanding — low

Ordered by cost to fix, cheapest first. None of these mislead a user.

- `README.md:245` duplicates its own `CLAUDE.local.md` sentence.
- `churn-and-winback.md` has one bare relative cross-skill path inside a citation bracket; every other module uses the `${CLAUDE_SKILL_DIR}` form.
- `systems-catalog.md` prints a `T<n> <slug>` stamp as copyable prose without the internal-only caveat.
- `evals/README.md` describes the README's A/B history as n=2 with one judge; the README describes three matchups across two rounds.
- CHANGELOG says every release ships a tag; 1.0.0, 1.1.0 and 2.0.0 have none.
- The repository-structure diagram calls 648 KB of research "the design record".
- Nothing in `docs/` records that v2 actually shipped; the set still reads as a draft.
- `04-design.md` still tells an implementer to edit the `marketplace.json` that 2.2.0 deleted.

---

## 6. Suggested order

1. §3.3, then §3.2 — both change skill behaviour, and §3.2 is the one a user can hit.
2. §3.1 and §3.4 with §4.2, §4.3 — one pass over the truthfulness of `README.md` and `CHANGELOG.md`.
3. §4.7, §4.8, §4.6 — one pass over `04-design.md`, which is now a mix of contract and history.
4. §4.1 — decide CI or no CI, then make every document agree.
5. The rest as convenient.

After any skill edit, run all three scripts plus `claude plugin validate ./skills --strict`, and re-measure with `claude --plugin-dir . plugin details game-engagement-retention-skills`. Any user-visible change needs a version bump in the same commit — a declared `version` is what makes an installed copy re-fetch at all — followed by `claude plugin tag . -m "... %s" --push`.

---

## 7. What would make this repeatable

The recurring failure in this project is a claim outliving the thing it
described: benchmark rows, the "Skill wins 2/2" line, the `Mode:` contract, and
now the eval gate. Two of the three invariant scripts exist because of it. A
third check — one that greps `README.md` and `CHANGELOG.md` for assertions about
counts and results, and fails when they disagree with the tree — would close the
loop, and is the highest-value thing not yet built.
