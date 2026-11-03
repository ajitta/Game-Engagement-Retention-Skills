# Audit against the skill authoring guide (2026-11-04)

Source guide: `know-your-unknowns/docs/skill-authoring-guide.md` (commit `65a86af`), which maps Anthropic's [Skill authoring best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices) onto that plugin. This note applies the same official practices to the three skills here. Rules that are house rules of that repository (its `.claude/rules/skill-writing.md`, for example rule 17 "cut guard prose") are not applied: this plugin's ethics design and `CONTRIBUTING.md` decide those questions here.

Scope: `plugin/skills/*/SKILL.md` and all 24 reference files. Not in scope: evals text, scripts, README.

## Measured state

| Item | ADV | IRM | RSD | Limit / source |
|---|---|---|---|---|
| `description` chars | 972 | 830 | **1,023** | 1,024 (claude.ai; CHANGELOG 3.x entry on the claude.ai warning) |
| `description` + `when_to_use` chars | 1,452 | 1,436 | 1,475 | 1,536 (Claude Code listing) |
| Body lines | 174 | 189 | 177 | < 500 |
| On-invoke body tokens (`plugin details`, CHANGELOG:126) | ~8.6k | ~9.4k | ~9k | 5,000 kept after compaction |
| "never"/"Never" in body | 54 | 61 | 61 | — |

Commands: `wc -l`, a Python frontmatter parse (`yaml.safe_load`), `grep -oE '\b[Nn]ever\b'`.

## Findings

### H1 — After compaction, the second half of every body is gone

Claude Code docs (skills page, "Skill content lifecycle"): "When the conversation is summarized to free context, Claude Code re-attaches the most recent invocation of each skill after the summary, keeping the first 5,000 tokens of each." The troubleshooting section adds: "put the most important instructions near the top of `SKILL.md`."

At the measured body sizes, the 5,000-token cut falls near `engagement-retention-advisor/SKILL.md:121`, `interaction-reward-moments/SKILL.md:101` and `retention-strategy-designer/SKILL.md:102` (proportional estimate). Lost after compaction:

- the CARD block (output shape, anti-fabrication, fixed section order, "the answer ends at Basis") — all of it in IRM and RSD, most of it in ADV
- the LANGUAGE block: Korean in → Korean out, the internal-vocabulary ban, and "Legal and platform claims are reproduced, never paraphrased", which `CONTRIBUTING.md` calls the most expensive error available
- Quality bar and IRM's Measurement plan

The front of each body is routing (ROUTING block ≈ 35 lines, including rows for the other two skills) and intake, which matter less once a skill is already running.

Proposed fix (needs the measured-batch process in `CONTRIBUTING.md`):

1. Reorder: put the LANGUAGE block and the CARD block before the ROUTING block in all three bodies and in `scripts/contracts.md`. No sentence changes, so the shared-block check still holds.
2. Remove in-body restatements (L1) to pull more of the body under the cut.
3. Run the full suite at 10 runs per case before release; routing and output shape are both touched by position.

### H2 — RSD `strategy` mode is told to read a module its read list excludes

- `retention-strategy-designer/SKILL.md:14`: three modules per invocation, maximum.
- `:75`: `strategy` reads `retention-playbook.md` + `genre-profiles.md` + `ethics-tiers.md` (three).
- `:92`: step 2 applies to every figure and names `metric-definitions.md` as the carrier.
- `references/retention-playbook.md:38`: metric-definitions is to be "read before quoting or comparing any number".
- `references/benchmarks.md:3`: "Read this whenever a retention number is about to be quoted, targeted or compared".

A literal reader in `strategy` mode either breaks the ceiling or skips a read it was told is required. The official page's one-level-deep rule exists for this case: an instruction to read file B that lives inside file A.

Options: (a, recommended) make the SKILL.md step 2 self-sufficient — it already names the four axes — and change the two reference sentences from "read before" to "the conventions live in"; (b) exempt `metric-definitions.md` from the ceiling like `feel-and-accessibility.md`, which raises worst-case token cost.

### M1 — Nine reference files over 100 lines have no table of contents

`korea-market.md` (201), `liveops-cadence.md` (164), `jurisdictions.md` (141), `ethics-tiers.md` (127), `feel-and-accessibility.md` (124), `retention-playbook.md` (121), `benchmarks.md` (109), `research-basis.md` (104), `churn-and-winback.md` (101). Official: "For reference files longer than 100 lines, include a table of contents at the top", because a partial read (`head -100`) must still show the full scope. Already noted in `docs/notes/2026-10-01-token-cost-review/01-research.md:154`, not acted on. A heading list costs about 50–100 tokens per read and changes no rule.

### M2 — Nothing checks the format limits

RSD `description` is one character under claude.ai's 1,024 cap. No script in `scripts/` or CI checks the name pattern, reserved words, the 1,024 cap, angle brackets, the 1,536 combined cap, the 500-line body or YAML parsing; `claude plugin validate` is local-only. Proposed: `scripts/check-frontmatter.py`, wired into CI and `release.sh`. Tooling only, so it goes under `[Unreleased]` without a bump.

### M3 — Evals do not pin model or effort

`evals/README.md:269` runs `claude -p … --plugin-dir ./plugin` with no `--model` or `--effort`, and run records do not state the effort. The official page says to test with the models the skill is meant for; the source guide names Opus 5.5 at medium effort and pins it in its runners. Gate results recorded so far ran at the CLI default and are not comparable with a pinned run.

### M4 — Descriptions are imperative, not third person

"Produce …" (ADV), "Design and improve …" (IRM), "Diagnose and improve …" (RSD). Official callout: "Always write in third person." Routing has measured clean with these descriptions, so the source guide's handling fits: convert only when a description next changes ("Produces", "Designs", "Diagnoses"), then rerun the routing families. RSD has one spare character, so the conversion needs a trim elsewhere.

### L1 — Restatements inside one body

Examples in ADV: step 5 (`:87`) and the CARD paragraph "Audit before proposal" (`:136`) say the same thing; "during generation, not as a filter" appears at `:90`, `:96` and in step 8; the Quality bar measurement bullet (`:178`) repeats the Measurement plan; the four-line Assumptions cap appears at `:20` and `:142`. The token review estimated 1–1.5k tokens per body (`01-research.md:16`). Only restatements within one file are candidates; the shared blocks stay byte-identical by design.

### L2 — Terms that vary

Section names "Procedure" (ADV, IRM) vs "Workflow" (RSD); "## Intake" (ADV) vs "Step 0 — Intake" (IRM, RSD); "reference module" / "module" / "reference file" for one thing; IRM/RSD/ADV in the routing table are never expanded in the body.

### L3 — `${CLAUDE_SKILL_DIR}` inside reference files is not substituted

The docs say the variable is substituted in "the skill's markdown content" and in `allowed-tools`. The 91 occurrences in reference files reach the model literally. All of them use the `/../<skill>/references/` form, so they resolve from any of the three skill directories once the model maps the variable from SKILL.md. No failure observed; watch only.

## Already in line

Name format and reserved words; body under 500 lines; forward-slash paths; no XML in descriptions; no dates or facts in SKILL.md (`check-no-facts-in-skills.sh`) with dated facts kept in single-owner references; one default per mode; a worked card example; medium freedom for deliverables (fixed card grammar, content left to the model); at least three eval cases per skill (grader mentions: ADV 9, IRM 14, RSD 18) and a no-plugin baseline arm (`evals/README.md:271`).

## Decisions needed

1. H1 reorder + L1 dedupe as one measured batch (recommended), or reorder only.
2. H2 option (a) (recommended) or (b).
3. M3: pin Opus 5.5 at medium effort for evals (recommended), or keep the CLI default.
4. M1 and M2 are tooling and reference-only changes that need no rule decision; M4 waits for the next description change.

## Implementation (branch `fix/authoring-guide-audit-v2`, 2026-11-04) — released as 3.6.1

**Base.** The audit and every smoke run above used `main` at 3.5.4 (`4cbe884`): the local clone had not fetched 3.5.5 and 3.6.0 (module split, `korea-fortune.md`, `jurisdictions-korea.md`). Re-checked on 3.6.0 before release: H2 is unchanged there; M1 now covers eight files (`korea-market.md` and `jurisdictions.md` fell under 100 lines with the split, `korea-fortune.md` rose above it); body sizes are ~8.9k / 9.5k / 9.2k tokens, so H1 still applies.

Owner decisions: H1 reorder + L1 dedupe as one batch; H2 option (a); M3 pin Opus 5.5 at medium effort; M1 and M2 applied. The owner cut the measurement from 10 runs per case to 3, then stopped it on cost.

| Item | Result |
|---|---|
| H1 + L1 | **Reverted.** The reorder put CARD and LANGUAGE after intake and routing last; `plugin details` gave ADV ~8.5k, IRM ~9.3k, RSD ~9k tokens, with the 5,000-token cut after the CARD and LANGUAGE blocks. In smoke runs the variant answered with only an intake question message, reading no reference file, in 3/6 runs of `shape-rsd-strategy-cards` + `mode-irm-first-win-tutorial-beat` (main: 0/6). Restoring the intake paragraphs left 1/6. Owner rule set before the rerun: still asking → revert. Likely mechanism, not isolated: with CARD right after intake, its line "The only replies that end in questions are the intake message …" sits next to the ask-or-assume rule, while the procedure ("Generate nothing before the reads land") moved far below. The dedupe saved only ~0.1k tokens per body. |
| H2 | Applied: RSD step 2 and `retention-playbook.md`. `benchmarks.md:3` is that file's own "read when" line, seen only once the file is open, so it was left as is. |
| M1 | Applied on 3.6.0: contents list in the eight reference files over 100 lines. |
| M2 | Applied: `scripts/check-frontmatter.sh` with a negative self-test; CI, `release.sh`, CONTRIBUTING, README. |
| M3 | Applied: `evals/README.md` generation commands pin `--model claude-opus-5-5 --effort medium`. |
| M4, L2, L3 | Not changed. L3 is deliberate: `check-shared-blocks.sh` requires the `${CLAUDE_SKILL_DIR}/../<skill>/` form in modules. |

Smoke data (one run per case unless noted, LLM judge only on output shape, intake, hygiene and mode): skill-fired homeless 6/6 both arms, Korean routing 3/3 vs 2/2; intake 2/2 both; hygiene 1/3 vs 2/3. Generation cost about $23 in total, plus judge runs (not metered).

Open: H1 (compaction drops the output contract) needs another approach. Candidates: shorten the ROUTING block's rows for sibling skills (the token review's OPT ①, ~0.6–0.7k per body) so less precedes CARD; or move only the LANGUAGE block up and keep the procedure next to intake. Either needs a matched A/B on the intake and shape cases before release.
