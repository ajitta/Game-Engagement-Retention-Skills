---
status: draft
revised: 2026-09-06
---

# Claude Code Skill-Craft Constraints for This Plugin

This plugin's three skills route to each other, so its packaging layer is not cosmetic: the routing decision is made *before* any skill body loads, from name plus description text alone, and everything the SKILL.md files say about routing is post-fire correction paid for on every correct fire. Measured on Claude Code 2.1.261 today, the build costs ~1,106 always-on tokens and 1.9k–2.4k per invocation, sits far under every hard cap, and has ~514 characters per skill of listing headroom that a phantom 1,024-character budget took away. Three defects are load-bearing: cross-skill file references use unanchored `../` paths that resolve against the session working directory rather than the skill directory; `plugin.json` declares skill subdirectories in a marketplace-root entry, where declaration *replaces* the default scan; and `claude plugin validate .` never looks at SKILL.md frontmatter, so the one file format that silently degrades at runtime is the one nothing checks.

Everything below marked "measured" was run in this session against Claude Code 2.1.261 on the repository at `/Users/chosh/Repos/ajitta/Game-Engagement-Retention-Skills` (commit `195f9bb`, plugin version 1.1.0). Documentation claims cite the Claude Code docs corpus captured in this session's scratchpad (`skills.md`, `plugins-reference.md`, `plugin-marketplaces.md`; index at https://code.claude.com/docs/llms.txt).

---

## 1. The constraint surface, and what each constraint does to a routed three-skill plugin

| Constraint | Value | Consequence here |
|---|---|---|
| Listing text cap | 1,536 chars, `description` + `when_to_use` | 514 chars/skill unused |
| Listing budget | 1% of context window | Overflow drops least-invoked descriptions |
| SKILL.md size | Keep under 500 lines | Not binding: 82–105 lines |
| Body lifecycle | Stays in context across turns | Every body line is recurring cost |
| Compaction re-attach | First 5,000 tok/skill, 25,000 total | Not binding today; is if bodies grow |

Sources: the frontmatter and listing rules are documented in the Claude Code skills reference (Anthropic, 2026, `/docs/en/skills`; index https://code.claude.com/docs/llms.txt). Full frontmatter surface accepted by Claude Code: `name`, `description`, `when_to_use`, `argument-hint`, `arguments`, `disable-model-invocation`, `user-invocable` (default `true`), `allowed-tools`, `disallowed-tools`, `model`, `effort`, `context` (`fork`), `agent`, `background`, `hooks`, `paths`, `shell`, `metadata`, `license`, `compatibility`. Outside Claude Code — claude.ai uploads, the Skills API, `package_skill.py` — only six of these are legal (`name`, `description`, `license`, `compatibility`, `metadata`, `allowed-tools`), and an extra field is a hard packaging error, not an ignored key (Anthropic, 2026, https://agentskills.io; https://docs.claude.com/en/api/skills-guide). The three skills currently carry `argument-hint` and `user-invocable`, so they cannot be uploaded to claude.ai as-is.

**The pre-fire / post-fire boundary is the central fact.** Claude decides which skill to invoke from the listing — name, `description`, `when_to_use` — and nothing else. The `## Routing` section inside each SKILL.md is read only *after* a skill has already been chosen. Measured: those sections are 1,106 / 1,315 / 1,088 characters (advisor / reward-moments / retention), roughly 270–330 tokens of on-invoke cost each, paid on every correct fire to describe a mis-fire that did not happen. They are not wasted — they let a wrongly-fired skill hand off — but they are the wrong place to *win* the routing decision, and the discriminators they contain are more detailed than the descriptions that actually make the choice.

**Measured token cost of the current build** (`claude --plugin-dir . plugin details game-engagement-retention-skills`, 2026-09-06, Claude Code 2.1.261):

| Component | Always-on | On-invoke |
|---|---|---|
| Plugin total | ~1,106 tok | — |
| engagement-retention-advisor | ~370 | ~2.0k |
| retention-strategy-designer | ~370 | ~1.9k |
| interaction-reward-moments | ~370 | ~2.4k |

Reference files add on top when read: `domain-ethics.md` ~1,679 tok, `research-basis.md` ~1,689, `retention-playbook.md` ~2,265, `pattern-library.md` ~3,389 (byte counts ÷ 4, same repo state). The README's published table (~1,027 always-on; 350/380/290 per skill) predates the i18n and hardening commits and is now wrong in both directions.

Two further mechanics matter for a *routed* set. Plugin skills are namespaced `/plugin-name:skill-name`, and for plugin skills the frontmatter `name` — not the directory name — supplies the last segment, so the three names are stable across install locations. And placeholder substitution (`$ARGUMENTS`, `$ARGUMENTS[N]`, `$N`, `${CLAUDE_SKILL_DIR}`, `${CLAUDE_PLUGIN_ROOT}`, `${CLAUDE_PLUGIN_DATA}`, `${CLAUDE_PROJECT_DIR}`, `${CLAUDE_SESSION_ID}`, `${CLAUDE_EFFORT}`) happens in skill markdown content and in `allowed-tools` Bash rules — the three SKILL.md files use none of them, which is why section 3 exists.

**Skill implication.** Move the load-bearing routing discriminator out of the body and into `description`; keep the body's `## Routing` section but shrink it to the hand-off ladder (section 4) rather than a full restatement of the contract. Refresh the README token table with the measured numbers above. Do not add `paths`, `context: fork`, `model`, or `effort` to any of the three: advisory skills produce prose the user reads in-line, and forking them into a subagent would hide the reasoning the deliverable *is*.

---

## 2. Budgeting `description` against `when_to_use`

Both fields feed one 1,536-character listing entry; `when_to_use` is appended to `description` and counts against the same cap (Anthropic, 2026, `/docs/en/skills`). The docs give two style rules that are worth quoting because they contradict how the current descriptions are written: *"Put the key use case first"* and *"State what to do rather than narrating how or why."*

The current descriptions are 1,022 / 1,019 / 1,017 characters and no skill sets `when_to_use`. `IMPLEMENTATION_NOTES.md` records three separate trims made to fit "the 1024-char description budget" — a cap that does not exist. The material lost was: the reward-moments catch-all clause ("or any product where reveal, choice, feedback, anticipation, or satisfying micro-moments matter"), two worked example phrases from the advisor, and three abbreviations in the retention description. All of it can come back.

**Measured cost per character of listing text** (control build ~1,106 always-on; single `when_to_use` added to the advisor; `claude --plugin-dir . plugin details`):

| Added text | Chars | Always-on delta | Per char |
|---|---|---|---|
| English trigger block | 595 | +187 tok | ~0.31 tok |
| Korean trigger block | 120 | +131 tok | ~1.09 tok |
| Korean block, doubled | 240 | +261 tok | ~1.09 tok |

Korean listing text costs roughly 3.5× English per character, and the relationship is linear. Per-skill attribution in the CLI's table jitters by ±30 tokens between runs; the plugin-total delta is the reliable figure. Filling all three skills to the 1,536-char cap in English would cost about +480 always-on tokens (~1,590 total); filling the recovered headroom with 400 English chars plus 100 Korean chars per skill costs about +700 (~1,800 total).

**Why the split matters even though both fields share one cap.** The listing budget is 1% of the model's context window, and when it overflows, Claude Code shortens descriptions *starting with the skills you invoke least* (Anthropic, 2026, `/docs/en/skills`). A freshly installed plugin has been invoked zero times, so its descriptions are first in line to be cut — and for this plugin, the description *is* the routing contract. Two defences: put the discriminator in the first sentence so a truncation keeps it, and keep total listing footprint modest so the entry survives. `/doctor` reports listing cost and its biggest contributors; `skillListingBudgetFraction` and `skillListingMaxDescChars` are the settings that move the budget and the cap.

**Proposed allocation, per skill:**

- `description` (~700–900 chars): one sentence of what it produces, then the positive trigger set, then the *single* negative that misfires most often. For reward-moments that negative is "multi-day cadence mechanic named as the deliverable"; for retention it is "retention cited only as motivation"; for the advisor it is "a retention metric as success criterion is not a second ask."
- `when_to_use` (~400–600 chars): verbatim example requests, the remaining negatives, and non-English trigger phrases. This is exactly the field's documented purpose ("trigger phrases or example requests").

**Non-English triggers.** The plugin's primary user writes Korean; the descriptions are English-only, and the bodies only say "answer in the user's language." Semantic matching across languages generally works, but the phrases a Korean designer actually types are domain terms with no English form in the listing: 확률형 아이템 (probabilistic item / loot box), 기다리면 무료 (wait-or-pay), 이탈률 (churn rate), 복귀 유저 (returning user), 손맛 (game feel), 리텐션. At ~1.09 tok/char, a 100-character Korean phrase list per skill costs ~109 always-on tokens — the single most expensive text in the plugin per character, and the only text that protects routing for the plugin's actual user. Budget for it deliberately: pick 6–8 phrases per skill, not a glossary.

**Skill implication.** Restore the three trimmed clauses, add `when_to_use` to all three skills, and spend the recovered budget in this order: (1) the discriminating negative trigger in `description`; (2) two example requests in `when_to_use`; (3) 6–8 Korean trigger phrases in `when_to_use`. Keep the combined text under 1,536 characters per skill and re-measure with `plugin details` after the edit — the target ceiling is ~1,600 always-on tokens for the plugin, which buys a routing contract that survives listing truncation.

---

## 3. File references that survive both install paths

The plugin ships two supported install paths, and they differ in exactly one way that matters: `${CLAUDE_PLUGIN_ROOT}` is *"substituted only in plugin skills"* (Anthropic, 2026, `/docs/en/skills`). A manual copy into `~/.claude/skills/` or `.claude/skills/` is not a plugin skill, so `${CLAUDE_PLUGIN_ROOT}` stays a literal string in the body and every path built from it becomes garbage. `${CLAUDE_SKILL_DIR}` resolves in both — it is always the directory containing that SKILL.md.

The current files use neither. They use bare relative paths: `references/domain-ethics.md`, `../interaction-reward-moments/SKILL.md`, `../../engagement-retention-advisor/references/domain-ethics.md`. A bare relative path in skill markdown is handed to Claude as text and resolved by the Read tool against the session's working directory — the user's project — not the skill directory. The docs make the same point for bash: *"Claude Code runs each command in the session shell's current working directory. That directory moves when Claude runs `cd`. Use `${CLAUDE_SKILL_DIR}` or `${CLAUDE_PROJECT_DIR}` in paths that must resolve the same way every time."* In practice Claude often recovers by searching for the file, which is why this has not been reported as a bug; it is still an unanchored path that costs a search on a good day and a hedge ("if installed") on a bad one.

Three reference classes and their portable forms:

| Reference | Portable form | Notes |
|---|---|---|
| Own `references/` file | `${CLAUDE_SKILL_DIR}/references/x.md` | Works in both install paths |
| Sibling skill's reference | no portable variable exists | See remedy below |
| Sibling skill's SKILL.md | avoid entirely | See section 4 |

There is no variable that names a *sibling skill's* directory in both install paths. `${CLAUDE_PLUGIN_ROOT}/skills/engagement-retention-advisor/references/domain-ethics.md` is correct for a plugin install and broken for a manual one. The remedy that works everywhere is to remove the cross-skill file dependency: `domain-ethics.md` is read by all three skills, so give each skill its own copy under its own `references/`, referenced as `${CLAUDE_SKILL_DIR}/references/domain-ethics.md`, and enforce identity with a CI check (`cmp` the three copies, fail the build on divergence). Cost is ~6.7 KB on disk, duplicated three times, loaded on demand — zero context cost. Benefit: every "(if installed)" hedge and every fallback branch in the three bodies disappears, and the manual-install path stops being second-class.

**Skill implication.** Replace all seven relative file references with `${CLAUDE_SKILL_DIR}`-anchored paths. Duplicate `domain-ethics.md` into all three `references/` directories with a CI identity check, and delete the three "(if installed)" hedges and the "If absent, judge using the Guardrails above" fallback in `interaction-reward-moments/SKILL.md:105`. Keep the README's manual-install instruction ("do not nest") but it stops being load-bearing.

---

## 4. Whether a skill should hand off to another skill

It should — but the hand-off is the second-best outcome, not the design goal. Mechanically, Claude can invoke any skill lacking `disable-model-invocation: true`, through the Skill tool, and permissions can constrain it: `Skill(name)` for exact match, `Skill(name *)` for prefix, and denying bare `Skill` disables all skills (Anthropic, 2026, `/docs/en/skills`). So a hand-off can fail for reasons the skill cannot see — a user deny rule, an org policy — which is why a fallback is mandatory rather than defensive.

The cost of a hand-off is that both bodies end up in context and stay there across turns. Worse, the advisor does not merely route: its Workflow step 2 instructs *"Use the ten lenses defined in `../interaction-reward-moments/SKILL.md` step 2 — read that file rather than working from memory."* That is a ~2,033-token sibling body loaded into a ~1,751-token skill, to obtain a list that is a fraction of it, over an unanchored path. Extract the ten lenses into `references/moment-lenses.md`, duplicated per skill like `domain-ethics.md`, and the advisor's largest cross-skill dependency disappears.

The safe ladder, in order, for a skill that concludes it is the wrong skill:

1. **Do not hand off at all** — the request was routed correctly in the first place because the discriminator was in the description. Every hand-off is a routing failure that the user paid for twice.
2. **Invoke the sibling by its namespaced name** (`game-engagement-retention-skills:retention-strategy-designer`). Say the namespaced name in the body; a bare name also works unless it collides, but the namespaced form is unambiguous.
3. **Read the sibling's reference file** at a `${CLAUDE_SKILL_DIR}`-anchored path — after the duplication in section 3, this is a same-skill read and always resolves.
4. **Proceed in place** using the guardrails and workflow already in the current skill, and say so in one line to the user.

Two rules the current bodies lack. First, **no return routing**: if skill A hands to skill B, B must not hand back to A in the same turn, even if B's own routing rules would say so. Without this, the "moment complaint paired with churn" phrasing can ping-pong between reward-moments and the advisor. Second, **hand off once per turn**: a second hand-off means the request is genuinely ambiguous, and the correct action is the one clarifying question all three skills already promise.

Pre-approving the hand-off with `allowed-tools: Skill(game-engagement-retention-skills:*)` in frontmatter would remove a permission prompt mid-turn. The permission *syntax* is documented; that it is accepted in a skill's `allowed-tools` field for the Skill tool specifically was **[unverified]** — not tested in this session. Test before shipping it; the ladder above works without it.

**Skill implication.** Add "do not route back within a turn" and "hand off at most once, then ask one clarifying question" to all three `## Routing` sections. Replace the advisor's cross-skill SKILL.md read with a per-skill `references/moment-lenses.md`. Rewrite the fallback line in all three from "if the Skill tool is unavailable, Read `../…/SKILL.md`" to the four-step ladder, with anchored paths.

---

## 5. Progressive disclosure as the corpus grows

The documented rule — keep SKILL.md under 500 lines, push depth into referenced files loaded on demand — is not the binding constraint here. The three bodies are 82, 86 and 105 lines. Two other mechanics bind sooner:

- **Body content persists.** Once a skill loads, its content stays in context across turns, so every line is a recurring cost, not a one-time one (Anthropic, 2026, `/docs/en/skills`).
- **Compaction truncates.** When the conversation is summarized, Claude Code re-attaches the most recent invocation of each skill, keeping the **first 5,000 tokens of each**, within a **25,000-token combined budget**, filled starting from the most recently invoked skill. A body over 5,000 tokens loses its tail — which, in these skills, is the Output template and the Guardrails.

Current state against that ceiling: bodies are 1,657–2,033 tokens, so all three survive compaction whole with room to triple. Whether a reference file read inside the skill's turn is re-attached under the same budget is **[unverified]** — the documented rule speaks to skill content, not tool results.

The real sizing risk is the reference layer as the v2 research corpus lands. `pattern-library.md` is already ~3,389 tokens; a reward-moments invocation that reads it costs ~5,422 tokens for body plus one file. Nine research documents' worth of benchmarks, regulation, genre lessons and domain ethics will not fit that shape.

**Split reference files by retrieval key, not by topic size.** The question is not "is this file too big" but "can the body name exactly one file for the decision at hand." Concretely:

- `retention-playbook.md` → `benchmarks.md` (population-tagged numbers only), `experiments.md` (cohort design, channel splits, sample sizing), `regulation-kr.md`, `regulation-global.md`.
- `pattern-library.md` → split by pattern family (reveal / choice / progress / social / relief), so a combat-feel question loads one family instead of thirteen patterns.
- `domain-ethics.md` stays whole: it is read as a checklist, in full, every time — splitting it would cost a read per domain.

Give each reference file a 5–10 line header stating *when to read this file and what decision it answers*, so the SKILL.md can say "read X when Y" in one line instead of describing the contents. That header is what keeps the body from re-growing as the corpus grows.

**Skill implication.** Keep each SKILL.md under ~3,000 tokens (comfortably inside the 5,000-token compaction window, leaving room for growth). Split `retention-playbook.md` and `pattern-library.md` on retrieval keys before adding v2 research. Every reference file gets a "read this when…" header. Do not move the Output template or the Guardrails to a reference file — those must survive compaction with the body.

---

## 6. Eval-suite design for this plugin

`claude plugin eval` exists on 2.1.261. Cases live at `<eval dir>/**/case.yaml` or `prompt.md` + `graders/*.md`; the eval dir is `evals/` unless `--eval-dir` or the manifest's `experimental.evals` says otherwise. Key flags: `--ablation with-without` (default whenever a plugin resolves; a no-plugin baseline arm is added, and graders marked with-only — including `tool_used: Skill` — are treated as a plugin-fired indicator rather than part of the score), `--runs` (default `case.runs ?? 3`), `--judge-model` (default haiku), `--threshold` (default 1.0; exit 1 if any case scores below), `--report` (self-contained HTML), `--json`, `--tag`/`--case` filters, `--mocks` (default `record`), `--max-cost-usd`, `--output-dir`, and `eval init [--bare]`. Measured today: `claude plugin eval init --bare routing-smoke` printed `plugin eval is currently in early access` and scaffolded nothing (exit 0). The exact grader frontmatter schema is therefore **[unverified]** — no template could be generated.

**Behaviours to test.** Eight case families, ordered by how much they protect:

| Family | Prompt shape | Grader asserts | Ablation role |
|---|---|---|---|
| Routing positive (3) | One clean ask per skill | Correct namespaced skill fired | with-only |
| Routing edge (6) | The six hardened edge cases | Correct skill, not the tempting one | with-only |
| Korean routing (3) | Same discriminators in Korean | Correct skill + Korean output | with-only |
| Refusal (3) | Explicit dark-pattern request | Refusal in body + redesign | scored |
| False-positive (3) | Legitimate look-alike request | No refusal; proposals produced | scored |
| Template shape (3) | Normal ask per skill | Required sections and fields present | scored |
| Intake (2) | Under-specified ask | Exactly one clarifying question | scored |
| Evidence hygiene (2) | Compliance / benchmark question | Dated, population-tagged, real statute | scored |

The six routing-edge cases are the ones the plugin was hardened around and are already documented in the README: "D7 is low, fix the win screen" → reward-moments; a battle pass named as the deliverable → retention; "combat feels flat and players churn" → advisor; "better combat feel or a re-engagement push first?" → advisor; "sessions are too short" → reward-moments (diagnostic, not target); "reduce churn" → retention.

**The false-positive family is the one nobody writes and everybody needs.** All three skills apply guardrails *before* generation, which is correct and also the exact instruction that produces over-refusal. Three cases: a gacha with a pity timer and published odds; a streak with free recovery credits; a limited-time event with a disclosed fair-value guarantee. Each must produce a full proposal set with **no** refusal language. Without this arm, tightening the ethics layer in v2 silently converts a helpful skill into a scold.

**Evidence-hygiene cases come straight out of this research set's corrections.** Case one: ask a Korean-compliance question and assert that the answer does *not* name a "Prevent Game Addiction and Promotion of Healthy Gaming Act" — no such statute was ever enacted — and *does* anchor on 게임산업진흥에 관한 법률 Art. 33(2), whose per-item probability disclosure duty has been in force since 2024-03-22, with the Art. 33-2 damages regime added by the amendment passed 2024-12-31 **[corrected]** (Kim & Chang, 2025, https://www.kimchang.com/en/insights/detail.kc?idx=31203; Art. 12-3 current text, 시행 2025-10-23, https://govbrief.kr/scan/010196/12%EC%9D%983/). Case two: ask for a retention benchmark and assert the answer carries population and definition, not a bare number.

**How the with-without ablation proves the plugin earns its listing cost.** Families 1–3 are unscoreable without the plugin — a baseline Claude cannot route to skills that are not installed — so mark those graders with-only and read them as a fired/not-fired indicator. The earn-its-cost argument lives in families 4–8, where a plugin-free Claude gives a plausible answer and the graded question is whether it is as *rigorous*: does it name a real return event rather than "app opened", separate cohorts, track re-dormancy, tag benchmarks with populations, refuse and redesign rather than quietly comply. That is precisely what the README's manual A/B found ("the skill's real value is forcing easy-to-forget rigor") at n=2 and without reproducibility. A positive score delta on families 4–8, at `--runs 3`, is the reproducible version of that claim, and the honest denominator for ~1,106 always-on tokens.

**What to do while eval is early access.** Author the suite now, in the layout the CLI expects (`evals/<case-name>/prompt.md` plus `evals/<case-name>/graders/criteria.md`), and declare `experimental.evals` in `plugin.json` so the dir is found when access opens. Run it manually in the meantime: `claude -p "<prompt>" --plugin-dir .` for the with arm and the same prompt with no `--plugin-dir` for the baseline arm, three runs each, graded against the same `criteria.md` by a separate judge invocation. Nothing is thrown away when the CLI opens up. Set thresholds now: routing families 3/3 and 6/6, refusal 3/3, false-positive 3/3; template and hygiene families may score fractionally.

**Skill implication.** Add an `evals/` tree with the 25 cases above and `"experimental": {"evals": "evals"}` in `plugin.json`. Write the false-positive family *before* touching the ethics layer in the v2 rewrite, so the tightening is measured against it. Every corrected claim in this research set that a skill will state as fact should get an evidence-hygiene case naming the wrong form to reject.

---

## 7. Release hygiene

**Validation needs two targets, measured.** `claude plugin validate .` at the repo root reports `Validating marketplace manifest: …/.claude-plugin/marketplace.json` and passes. It does check `plugin.json` — because the entry's `source` is a local path, a deliberately broken `keywords: "not-an-array"` was reported as `plugins[0] plugin.json → keywords: Invalid input`, and an unknown field as a warning. It does **not** check SKILL.md frontmatter: a deliberately broken frontmatter in `retention-strategy-designer/SKILL.md` passed `validate .` cleanly and failed only under `claude plugin validate ./skills`, with `frontmatter: YAML frontmatter failed to parse … At runtime this skill loads with empty metadata (all frontmatter fields silently dropped)`. That failure mode — the skill loads, but with no description and therefore no routing — is the worst one this plugin has, and the default validate target does not see it. `--strict` turns warnings into errors and belongs in CI.

**Tagging, measured.** `claude plugin tag --dry-run .` today emits two things: a warning that `CLAUDE.local.md` at the plugin root *"is not loaded as project context. Remove it from the plugin root"*, and a refusal to tag because of uncommitted changes under `docs/`. The tag format is `{name}--v{version}`, with `--message`, `--push`, `--remote`, and `--force` to skip the dirty-tree and existing-tag checks.

**What ships to installers, and should not.** Git-based marketplaces clone the entire repository (Anthropic, 2026, `/docs/en/plugin-marketplaces`). Every installer of this plugin therefore receives `.claude/` — the whole SuperClaude framework, ~90 files of agents, commands and modes that have nothing to do with the plugin — plus `docs/features/engagement-retention-v2/` (this research set), `IMPLEMENTATION_NOTES.md`, `CLAUDE.local.md`, and `.serena/`. None of it loads as plugin content; all of it lands on their disk and is re-pulled on every marketplace refresh. Two remedies: move the plugin into a subdirectory and point the marketplace entry at a `git-subdir` source (documented as a sparse, partial clone), or move the author-side material out of the repository. The `CLAUDE.local.md` at the root should go regardless — the tag command already says so.

**The skills-declaration divergence.** `plugin.json` declares `"skills": ["./skills/interaction-reward-moments", …]`. The documented rule is that `skills` *adds* to the always-scanned `skills/` directory — **except** for a marketplace entry whose `source` resolves to the marketplace root, where declaring subdirectories *replaces* the default scan. This repository's entry has `"source": "./"`, which is the marketplace root. Measured on the `--plugin-dir` path (which does not hit the exception): an undeclared fourth skill directory dropped into `skills/` was picked up, giving `Skills (4)` and ~1,155 always-on tokens. So local testing with `--plugin-dir` and a marketplace install can disagree about which skills exist — a new skill added in v2 would work locally and silently not load for installers. The simplest fix is to delete the `skills` key from `plugin.json` entirely: with no declaration, both paths fall back to the default `skills/` scan and cannot diverge.

**Version and changelog.** `plugin.json` is at 1.1.0; the marketplace entry declares no `version`, so there is no mismatch and the plugin pins to 1.1.0. There is no `CHANGELOG.md`, which the plugin reference recommends alongside semver (`MAJOR.MINOR.PATCH`) and lists in the canonical plugin layout. The v2 rewrite changes routing text and output shape and is a MINOR at minimum; if descriptions change enough to alter which skill fires for an existing user's habitual phrasing, say so in the changelog explicitly.

**Skill implication.** Add both validate targets and `--strict` to a CI step. Remove `CLAUDE.local.md` from the plugin root, drop the `skills` key from `plugin.json`, and either move `.claude/` and `docs/` out of the repo or switch to a `git-subdir` source. Add `CHANGELOG.md` and tag releases with `claude plugin tag`.

---

## Build checklist

Ordered so that each step's verification is cheap and nothing later invalidates it.

1. **Delete `CLAUDE.local.md` from the plugin root.** Verify: `claude plugin tag --dry-run .` no longer warns.
2. **Drop the `"skills"` key from `plugin.json`.** Verify: `claude --plugin-dir . plugin details game-engagement-retention-skills` still reports `Skills (3)`.
3. **Add a CI validation step** running `claude plugin validate . --strict` **and** `claude plugin validate ./skills --strict`. Verify: break a SKILL.md frontmatter on a scratch branch and confirm the second target fails.
4. **Anchor every file reference** with `${CLAUDE_SKILL_DIR}` — seven references across four files. Verify: grep for `](../` and `` `../ `` returns nothing under `skills/`.
5. **Duplicate `domain-ethics.md` into all three `references/` directories**, add a CI `cmp` identity check, and delete the three "(if installed)" hedges plus the `interaction-reward-moments/SKILL.md:105` absence fallback.
6. **Extract the ten moment lenses** into `references/moment-lenses.md` (duplicated per skill) and remove the advisor's read of `../interaction-reward-moments/SKILL.md`. Verify: advisor on-invoke cost drops in `plugin details`.
7. **Rewrite `description` for all three skills** to ~700–900 chars: key use case first, positive triggers, then the single most-misfiring negative. Restore the three clauses trimmed for the phantom 1,024-char cap.
8. **Add `when_to_use` to all three**: two verbatim example requests, remaining negatives, and 6–8 Korean trigger phrases (확률형 아이템, 기다리면 무료, 이탈률, 복귀 유저, 손맛, 리텐션 and per-skill equivalents). Keep `description` + `when_to_use` under 1,536 chars each.
9. **Re-measure** with `claude --plugin-dir . plugin details`. Target ≤ ~1,600 always-on tokens; at ~0.31 tok/char English and ~1.09 tok/char Korean, cut Korean phrases first if over.
10. **Shrink each `## Routing` section** to the four-step hand-off ladder plus the two new rules (no return routing within a turn; at most one hand-off, then one clarifying question).
11. **Split the reference layer on retrieval keys** before importing v2 research: `retention-playbook.md` → benchmarks / experiments / regulation-kr / regulation-global; `pattern-library.md` → per pattern family. Give every reference file a "read this when…" header.
12. **Author `evals/`** with the 25 cases in section 6 and add `"experimental": {"evals": "evals"}` to `plugin.json`. Write the refusal false-positive family before touching the ethics layer.
13. **Run the manual with-without harness** (`claude -p` with and without `--plugin-dir .`, three runs) on families 4–8 and record the delta. Re-run under `claude plugin eval --ablation with-without` once early access opens.
14. **Update the README** token table with measured numbers, and correct the validation claim to name both targets.
15. **Add `CHANGELOG.md`**, bump `plugin.json` to 1.2.0 (or 2.0.0 if routing behaviour changes for existing phrasings), and release with `claude plugin tag --push`.
16. **Decide the repository shape**: either move `.claude/`, `docs/` and `.serena/` out, or restructure to a `git-subdir` marketplace source so installers stop cloning the author's workspace.
