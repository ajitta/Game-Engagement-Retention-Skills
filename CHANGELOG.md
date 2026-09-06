# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

The version here is the `version` field of `.claude-plugin/plugin.json`. An installed copy stays on its cached version until that number changes, so every user-visible change ships with a bump and a `{name}--v{version}` tag. Tags start at
2.1.0: 1.0.0, 1.1.0 and 2.0.0 were released before the tagging ritual and have none.

---

## [3.0.0] — 2026-09-06

The plugin's name is shorter, and that is why this is a major. `name` is the install
ID, so every copy installed as `game-engagement-retention-skills` has to be removed
and installed again as `game-engagement-retention` — `/plugin update` cannot cross a
rename. Nothing the skills do changed: the major marks the reinstall, not new
behaviour. Tooling and document fixes from the same session ride along.

### Added

- **`scripts/check-claims.sh` — a fourth invariant, aimed at the failure this project actually has.** Every count, version and gate claim the documents make is re-derived from the tree and compared: eval cases and families, reference modules, skills, scripts, `plugin.json` against the newest CHANGELOG entry, a git tag for every release the CHANGELOG says is tagged, and the declared-not-met marker on the 6/6 gate for as long as `evals/results/` is absent. It also holds a list of claims retired as false — "Skill wins 2/2", "Both validators", "all in CI" — that must not come back. Two exemptions keep it honest rather than merely loud: a CHANGELOG entry below the newest one is history and is not rewritten to match today's tree, and a line quoting old wording in order to correct it (`old → new`) is a quotation, not an assertion. The header carries nine negative tests, all of which were run and all of which failed the script. It caught its own arrival: adding it made "three invariant scripts" false in four documents.

### Changed

- **The invariant scripts are now four, and every document says so.** CI runs all four scripts; README, `CONTRIBUTING.md` and the `05-plan.md` status table moved from three to four. This correction was made *by* the new script, on its first run.
- **`scripts/release.sh` — the release ritual as one command, because its two halves were separable and that cost a release.** `claude plugin tag . --push` pushes the tag and not the branch; the tagged commit then reaches the remote on no branch, and a git-based marketplace clones the default branch, so an installer gets the previous release while the tag advertises the new one. That happened on 2.2.1 and was caught by hand. The script gates on a clean tree, an untagged version, and agreement between `plugin.json` and the newest CHANGELOG entry; runs the four scripts and both validators; records the always-on cost; then pushes the **branch first and the tag second**, and verifies afterwards that the tag is reachable from the published branch.
- **`check-claims.sh` exempts the version `plugin.json` declares from the tag-coverage check.** That version's entry is written and its tag does not exist yet, by definition, so requiring one deadlocked `release.sh` — which runs the checks *before* tagging. Found by rehearsing a release in a throwaway worktree; the release script's first real act was to expose a chicken-and-egg bug in the check it runs.
- **`check-claims.sh` fails on a tag that is not on the published branch**, which makes the state above detectable and not merely avoidable. Verified by reproducing it: rewinding `origin/main` to before the 2.2.1 tag's commit makes the check fail with the remedy in the message.
- **`check-claims.sh` now verifies that a tagged release's entry still describes the tree that carries the tag.** The trap it closes was hit in this repository: 2.2.1 was tagged, work continued, and the new work was written into the `[2.2.1]` entry — so a reader checking that tag out found a changelog describing a file the tag does not contain. The check applies to the newest entry only, and only when it names a tagged version; annotating an *older* entry with a correction pointer is good practice and is deliberately left alone, as 2.1.0 carries one. It also documents why `## [Unreleased]` is load-bearing rather than decorative: without it the newest entry is a tagged release, and its counts — true when it shipped — get graded against today's tree.
- **`05-plan.md` §7 is marked built**, with what the new check deliberately does not do — rewrite history, or read a quotation as an assertion — and what it still cannot check: a measured figure such as the always-on token cost. A new §8 lists the two things genuinely still open: the eval gates remain declared and unmet, and nothing enforces that the two local `claude plugin validate` targets were run.
- **The README hid its own install instructions.** `## Installation` sat at line 145 of 289, below the three-skill table, the routing rule, the output format, the ethics tiers and the scope section — and nothing above it linked there, the only in-document link at the top pointing at `#scope`. A four-line install block now sits under the version line: the two `/plugin` commands and a pointer to the full section for verification, updates, the slash commands and the no-plugin path. The section itself did not move; the order below it is a design record and is deliberate.
- **The plugin `name` is now `game-engagement-retention`, seven characters shorter and one word less redundant.** `-skills` said nothing that a catalog of plugins-that-ship-skills does not already say, and the namespace it prefixed made the longest slash command 61 characters — `/game-engagement-retention-skills:retention-strategy-designer`. It is 54 now, and `displayName` has read "Game Engagement & Retention" the whole time, so the two finally agree. Changed in the manifest, in the hand-off ladder in all three bodies and byte-identically in `contracts.md`, in 18 eval graders, and in `README.md`, `CONTRIBUTING.md` and the live instructions in `05-plan.md`. Not changed, deliberately: the three skill names, their directories, the repository name, every CHANGELOG entry below this one, and the design record — `04-design.md` and `02i-research-skillcraft.md` keep their drafted text under a one-line header note dating the move, because they record the plan and not the tree.
- **`check-claims.sh` resolves a legacy tag prefix, because the name it derives tags from just moved.** `claude plugin tag` cuts `{name}--v{version}`, so shortening `name` orphaned all three existing tags at once: the tag-coverage check failed on 2.1.0 and 2.2.0 the moment the manifest changed. A `LEGACY_NAMES` list resolves those, and nothing new is ever written under one, since both `release.sh` and `claude plugin tag` read the prefix from `plugin.json`. Re-cutting the three old tags was the alternative and was rejected for the same reason the script already refuses to rewrite old CHANGELOG entries — a tag is a historical fact, and three new ones would claim a name those releases never shipped under. The header's negative-test list grows to twelve; the new case was run, and blanking `LEGACY_NAMES` fails on 2.1.0 and 2.2.0 exactly as it should.
- **`README.md` says what a rename costs someone who already installed.** Claude Code keys an installed copy on `name`, so a shortened one is a different plugin and no `/plugin update` carries the old copy across. The Installation section now names the old ID and the `uninstall` line that precedes a fresh install.
- **Always-on cost re-measured: ~1,845 → ~1,836 tokens.** The rename took seven characters out of each of the three registered skill names, and `CONTRIBUTING.md` requires a re-measure after any skill edit. Run on Claude Code 2.1.263; the token table's other rows are still the 2.1.261 measurement and the provenance line now says which is which. `README.md` and the `05-plan.md` status table both moved.
- **Three stale counts in `05-plan.md`, in the blind spot the new script has by design.** `check-claims.sh` scans `README.md`, `CHANGELOG.md`, `evals/README.md` and `CONTRIBUTING.md`; `docs/` is not in that list, so "CI runs the three scripts", "run all three scripts" and "nine negative tests" survived the correction the script made everywhere it does look. They now read four, four and twelve. Widening the scan to `docs/` was considered and not done here: the design record is full of quoted past states that are correct as history, and the two exemptions the script has — superseded CHANGELOG entries, and `old → new` corrections — do not cover that shape.
- **`README.md` said "Version 2.2.0" while `plugin.json` said 2.2.1**, and had since that release. `check-claims.sh` compares `plugin.json` against the newest CHANGELOG heading, not against a version written in prose, so this survived the run that corrected the counts around it. It reads 3.0.0 now, and the `05-plan.md` status table and its tag list — which still said 2.2.1 was untagged — with it. The prose-version case is a real gap in the script and is left open deliberately rather than patched in a release commit.

---

## [2.2.1] — 2026-09-06

Correctness and truthfulness. Three skill-behaviour fixes, the release-gate claim corrected, and the false-positive graders repaired — the first release informed by actually running an eval case. Every promise `04-design.md` made and this repository had not kept is now either kept or marked superseded.

### Added

- **CI, which three documents had been asserting for two releases.** `.github/workflows/checks.yml` runs the three invariant scripts on every push and pull request. The two `claude plugin validate --strict` targets stay local release checks — CI has no Claude Code CLI — and README, `CONTRIBUTING.md` and `04-design.md` now all say exactly that instead of "all in CI".
- **`CONTRIBUTING.md`**, promised at `04-design.md` §2 and never written. It carries the one-topic-one-owner table across all 24 reference modules, the shared-block rule, the release ritual, and the note that topic ownership is enforced by review — no script compares modules against each other.
- **`last-verified: 2026-09` on `benchmarks.md`**, matching `jurisdictions.md`. Benchmark rows are tied to the vendor edition that published them and editions reissue annually; a row does not become wrong when it ages, it becomes *about a different year*.

### Fixed

- **A reference module ordered the output the contract forbids.** `systems-catalog.md`'s meta-progression row told the skill to "proceed and say so" when a mechanic family has no ethics row — the null finding banned by `contracts.md` and by step 2 of `ethics-tiers.md`, and the exact behaviour the false-positive gate exists to catch. It now reads `proceed and emit nothing about it`.
- **The basis line leaked a mechanic-family slug.** The `## 근거` spec in the shared card block banned filenames, module names, lens and pattern names — but never the family slug itself, and a graded run caught `metered access` in a basis line, the hyphen dropped and the taxonomy label otherwise intact. The spec now bans the slug in either form and the tier code with it, in `contracts.md` and byte-identically in all three bodies; `retention-strategy-designer`'s own ethics-read instruction said "never as filenames" and now says "never as filenames and never as family slugs".
- **The three-read ceiling did not close.** The mandatory ethics read is two files, so `retention-strategy-designer --mode cadence` and `interaction-reward-moments --mode moments` each needed four reads under a three-read cap, and the three bodies resolved that three different ways. The advisor's carve-out is now the single rule in all three bodies: `ethics-tiers.md` counts against the ceiling; a *section* of `domain-ethics.md` is a section, not a module, and never does.
- **Two false-positive graders would have failed a correct answer.** `fp-stamina-published-refill` and `fp-pass-weeklies-monthly-bucket` carry English prompts but demanded the Korean headings `## 전제 / ## 순서 / ## 측정 설계 / ## 근거`. The shipped output-language rule is that English input produces English output with English headings, so both graders scored a contract-compliant answer as FAIL. They now grade the sections by function and assert the prompt's own language. Found by actually executing `fp-stamina-published-refill` against 2.2.0 — the first time any eval case in this repository has been run. Re-graded against the repaired grader, that single run returned **FAIL on item 4 only**, and for neither of the repaired reasons: items 1–3 passed, the Ethics bullets were accepted as bounds rather than stamps, and the sole violation was the slug leak fixed above. One case, one run, one arm — a diagnostic, not a gate result, and the gate remains unmet.
- **Five graders forbade an Ethics bullet the skill is required to emit.** All six demanded that a compliant configuration emit no Ethics bullet at all. That is right for the configuration the prompt describes, but the answer proposes *changes*, and a proposed change can introduce a bound of its own — cutting a live free stamina allowance ships with prior notice and a grandfathering window, or it does not ship. `fp-licensed-collab-earnable-equivalents` already carried the correct rule; it is now in all six. A bullet naming a bound to hold is legal; a bullet reporting that the checks passed is still a null finding and still FAILs.

  **This weakens the independence claim these graders were given.** The 2.0.0 entry cites that they were authored *before* the ethics files were touched. Two of the six have now been edited after the fact and five have had a permission added, so discount that claim accordingly. What the gate asserts is unchanged: no refusal language, no redesign section, no tier codes or family slugs, no compliance stamps.

### Changed

- **The 6/6 false-positive release gate is now stated as declared, not met.** `README.md`, `evals/README.md` and the 2.0.0 entry here all said the gate binds the release. The suite has never been executed and `evals/results/` does not exist. The gate still binds — the standard did not move — but no document now implies it has been cleared.
- **The manual eval procedure ran in a place that silently corrupts its own results.** `evals/README.md` showed the judge invocation being run from the repository root. `claude -p` prints only the final assistant message, and a project-level `Stop` hook takes that slot — on the first grading run made here the verdict came back as the hook's reply rather than a PASS/FAIL list, while the generation transcript was unaffected. The procedure now says to run every invocation from outside the repository with absolute paths. Hooks under `.claude/` are gitignored, so whether a given machine hits this is invisible from the tree.
- **`04-design.md` is now marked as what it is: the plan, not the contract.** It carried a status of `draft` while describing a system that shipped three releases ago, and specified a tier-code ethics stamp, a literal `Mode:` line and a `docs/` exclusion that the shipped contract forbids or that was deliberately not taken. A header now names `contracts.md` as superseding §4, and eight points carry inline `[SUPERSEDED]` markers with the shipped rule beside them. The stale 480 KB figure is corrected to ~648 KB, and the `marketplace.json` edit instructions are marked as removed in 2.2.0. The reasoning around each is kept, because it records why.
- **The largest-risk mitigation named an eval grader the contract makes impossible.** `04-design.md` §11 said a grader asserts the mandatory ethics read fired; no grader can, because the answer may never name a file or module. The shipped proxy — a mechanic-bearing answer carries a bound in the reader's words, and its absence is the signal — is named there instead.
- **The sub-1,024 `description` budget was spent without a record.** `04-design.md` §11 held every `description` under 1,024 characters as insurance against an older client enforcing that cap. All three now run 1,122–1,254. It was spent deliberately, in the 2.1.0 routing rewrite, to move the Korean triggers into `description` where routing actually reads them; the risk accepted is that a client still enforcing 1,024 would drop the frontmatter.
- **`interaction-reward-moments` kept a calibration example its own routing sends elsewhere.** A scene-less "our game isn't fun" is the advisor's by this skill's own frontmatter; the body now says so, and says that if it fired here anyway the answer is one question — the scene — not a hand-off back.
- **Low-severity truthfulness.** The one bare relative cross-skill path in `churn-and-winback.md` now uses the `${CLAUDE_SKILL_DIR}` form every other module uses. `systems-catalog.md` says its `T<n> <slug>` stamps are internal keying that never reaches an answer. `evals/README.md` described the A/B history as n=2 with one judge; README describes three matchups across two rounds, and they now agree. The tag claim at the top of this file notes that 1.0.0, 1.1.0 and 2.0.0 predate the tagging ritual and have none. The repository-structure diagram no longer calls ~648 KB of tracked research that ships to installers "the design record".
- **README corrections.** "authored and run **manually**" → "**documented to run manually**", matching the 2.0.0 entry which was already correct. The manual-run instruction now names the grader file per family under `evals/<case>/graders/` rather than assuming every case has `criteria.md` — only 16 of 38 do. "Both validators and all three scripts pass" → "The skills validator and all three scripts pass", which is what the following sentence already explained. A duplicated `CLAUDE.local.md` sentence removed.

---

## [2.2.0] — 2026-09-06

Distribution only. No skill, reference module or routing text changed.

### Changed

- **Distributed through a catalog marketplace, [ajitta/claude-plugins](https://github.com/ajitta/claude-plugins).** Install is now `/plugin marketplace add ajitta/claude-plugins` then `/plugin install game-engagement-retention-skills@ajitta`, replacing `game-engagement-retention-skills@game-engagement-retention-skills` — a marketplace whose name only repeated the plugin's own. The catalog holds no code and points back at this repository, so installs and updates still resolve here at the version `plugin.json` declares.

### Removed

- **`.claude-plugin/marketplace.json`.** Keeping it would leave two install paths for one plugin. The marketplace manifest is validated in the catalog repository, so this repository's release checks drop the `claude plugin validate .` target and keep the `plugin.json` and `./skills` ones.

---

## [2.1.0] — 2026-09-06

Routing only. No skill body, reference module or output rule changed — this release moves and rewords the text that decides whether a skill fires at all.

### Changed

- **Routing trigger text rewritten** after a three-router test over 68 requests against this user's real 33-skill listing. Six defects were measured and fixed:
  - Korean trigger vocabulary moved from `when_to_use` into `description`, so it no longer sits behind the field that a listing-budget shortening trims first. First Hangul now appears at character 42-130 of each entry instead of 1,136-1,149.
  - A complaint that names no scene and no metric — "our players are bored", "make it more addictive", "the game feels grindy", "재미없대요" — now has an owner. Previously the Korean phrasings fired and the English ones matched nothing.
  - The monetization clause is preconditioned on retention being the constraint being protected. "Retention is fine but nobody pays" previously fired the lifecycle skill; it is now declined.
  - Route-away is keyed on the axis rather than the mechanic noun, so the *staging* of a pass tier-up, a reward claim or a streak-break screen stays with the moment skill while the *schedule* goes to the lifecycle skill.
  - The onboarding/FTUE funnel, win-back, and A/B and experiment design are claimed positively by the lifecycle skill. The funnel route previously rested entirely on a disclaimer in the moment skill's tail.
  - Meta-progression is split on a stated axis — the system belongs to the advisor, the pacing and unlock schedule to the lifecycle skill — replacing a one-word separator that real requests do not contain.
- Feel-effect strength, safety and accessibility (flash, shake, haptics, camera motion) is claimed by the moment skill, which previously had no vocabulary for it while three installed design skills claimed all of it.
- Domain lists end in "and similar consumer interactive apps" rather than reading as closed enumerations; a fitness or habit app previously routed only by accident.
- Plugin and marketplace descriptions no longer sell the skills as designing "dopamine points", the term this release removed from the skills themselves. *(Precisely, and corrected in 2.2.1: removed from every **answer** — the body forbids it reaching the reader. `도파민 포인트` is deliberately kept in `interaction-reward-moments`'s `description` and in `plugin.json` keywords as an inbound routing trigger, because it is what users type.)*

### Fixed

- **2.0.0 shipped in three pushes with no version bump between them.** `plugin.json` declares a `version`, and Claude Code skips `/plugin update` and auto-update whenever the resolved version matches the cached one — so anyone who installed at the first 2.0.0 commit would never have received the eval suite, the rewritten README, or any of this release. The bump to 2.1.0 is what makes them reachable. Every future release bumps the field.

---

## [2.0.0] — 2026-09-06

A rewrite of what the skills say and what shape they say it in. The three skills keep their names, their directories and the deliverable-based routing rule; everything downstream of that changed.

The reason: a blind A/B against a plain-model baseline — one prompt per skill, one judge per pair, judged without knowing which arm was which — put the v1.1.0 skill arm behind in all three matchups, every margin small. The judges named the same three defects each time: 8–10-column output tables that collapse in a terminal, output that reads as a filled-in template rather than a document about the product, and missing execution detail. The seven things the same judges credited to the skill arm — return-event rigor, same-week cohorts, kept holdouts, the 2–4 week novelty window, +30d re-dormancy, guardrails beyond crash rate, and naming the exact dark pattern instead of issuing a disclaimer — are preserved verbatim. One prompt per matchup with one judge is a directional signal, not a verdict; it justifies the direction of this work and no claim beyond it.

### Which skill now fires differently

**Read this section before re-using a phrasing that worked in 1.x.** Routing is now stated in terms of the *named artifact* asked for, and five classes of request that used to land elsewhere — or nowhere — now have an owner.

| If you ask for… | 1.1.0 did | 2.0.0 does |
|---|---|---|
| ARPDAU/LTV vs D7, ad load, offer cadence, first purchase, paywall | Fired no skill; monetization existed only as forbidden vocabulary | `retention-strategy-designer`, mode `economics` — an LTV frame, one worked break-even, bounds, ≤2 cards |
| Analytics event taxonomy, tracking plan, experiment design | Fired no skill | `retention-strategy-designer`, mode `instrument` — an `Event / Fires when / Properties / Answers` table plus return-event and cohort-key definitions |
| A metric definition, or a pasted curve with no change requested ("rolling vs classic?", "D28 or D30?") | Answered with a full proposal set — three to five retention proposals for a question that asked for none | `retention-strategy-designer`, mode `read` — a definition check, a curve reading, at most two hypotheses, and **no proposal cards**. It is permitted to stop and say the number cannot be diagnosed without the day convention and denominator |
| A named cross-layer system: guild/clan, UGC and creation-sharing, in-game economy, meta-progression **system** | Had no owner; the request landed on whichever skill the wording favoured | `engagement-retention-advisor`, mode `system` — a system sheet, 2–3 sub-mechanic cards, instrumentation |
| SaaS / B2B activation or churn | Claimed by the retention skill's description, with no ethics domain and no moment home behind it | **Declined in one line**, naming the scope. Games are the deep case; interactive narrative, fortune/saju, AI companion, journaling and learning ride alongside |

Four more shifts worth knowing:

- **Monetization *design* is declined too** — pricing, eCPM, mediation, gacha rate and pity tuning. The boundary is now a stated decision rather than a silence: the skills answer what monetization does *to* retention, and do not design a monetization system.
- **Tutorials split by artifact.** A named tutorial beat that feels flat → `interaction-reward-moments`, mode `first-win`. The FTUE *funnel* (which step, what order, gating, the D0→D1 leak) → `retention-strategy-designer`, mode `strategy`. Tutorial drop-off is a funnel symptom, not a deliverable.
- **A named cadence mechanic gets a spec sheet, not proposals.** Battle pass, quest stack, login calendar, streak, energy, notification and win-back all route to `cadence`, which emits a two-column spec with acceptance bounds, reviewer flags and one worked fill.
- **Every answer now opens with a plain-language deliverable label** in the output language, naming what is being produced (`보상 순간 설계 — 강화 실패 구간`). The internal mode name never reaches the reader; `--mode <name>` still selects the mode explicitly.

The rule that did not change: route on the deliverable, not on keyword presence. A retention metric cited only as motivation ("D7 is low, fix the reward reveal") is still not a second ask, and still reaches the moment skill.

### Added

- **Eleven named output modes** across the three skills — IRM `moments`, `first-win`; RSD `strategy`, `read`, `cadence`, `calendar`, `economics`, `instrument`; ADV `integrate`, `compare`, `system`. Each declares a default, names the artifact on line 1 in plain language rather than printing its own name, names at most three reference modules and reads no more; if a fourth seems necessary the request spans two modes, and the skill answers the primary and says in one line what it deferred.
- **24 reference modules** under one invariant: *a `SKILL.md` may contain a procedure, never a fact.* Every number, citation, legal claim and tier assignment now lives in a module read at generation time, which kills the seven-place ethics drift structurally rather than by discipline. New modules: `moment-lenses.md`, five pattern families (`patterns-reveal`, `patterns-progress`, `patterns-social`, `patterns-relief`, `patterns-nongame`), `first-session.md`, `feel-and-accessibility.md`, `metric-definitions.md`, `benchmarks.md`, `experiments.md`, `liveops-cadence.md`, `genre-profiles.md`, `churn-and-winback.md`, `retention-economics.md`, `ethics-tiers.md`, `jurisdictions.md`, `korea-market.md`, `integration-patterns.md`, `systems-catalog.md`, `contracts.md`.
- **Content behind routes that had none.** Seven LiveOps cadence specs (pass, quest, login, energy, streak, notification, win-back) as derivation rules rather than constants; eleven genre profiles with a hard PC/console platform branch; the four metric axes and a vendor convention table; population-tagged benchmarks with a `## Do not quote` list; experiment design; churn signals and win-back keyed to lapse cause; retention economics; Korean market and jurisdiction modules.
- **Accessibility as a first-class bound on game feel** — flash rate, adjustable-to-zero shake and blur, OS reduced-motion, haptics-off, telegraphs never carried by hue alone — with a pre-ship checklist. v1 had zero coverage of it.
- **Step 0 intake**, worded identically in all three skills: fill what you can, ask once in one bundled message of at most four questions when a wrong guess would change *which* proposals appear, otherwise record the guess under `## 전제` tagged `[가정]` and proceed. Non-interactive sessions assume everything and lead with the assumptions.
- **`evals/` — 38 cases across ten families**, wired via `"experimental": {"evals": "evals"}`. Includes six **refusal false-positive** cases that are a release gate at 6/6, an output-shape family that scores fabricated specifics as a penalty, and Korean routing cases that assert Korean headings. `claude plugin eval` is in early access on the authoring machine and scaffolded nothing, so the grader frontmatter schema is unverified and the suite is documented to run manually; nothing is wasted when the CLI opens.
- **`scripts/` — three invariant checks**, all passing: `check-shared-blocks.sh` (the routing block, card grammar and language contract are byte-identical across the three bodies and the canonical `contracts.md`), `check-no-facts-in-skills.sh` (no percentages, benchmark figures, jurisdiction or statute names, dates, prohibition lists or citations in a `SKILL.md`; the measurement windows the bodies keep inline by design are exempt, and the script's header carries the negative test), `check-ethics-rows.sh` (no tier-3 row without a numeric or observable compliant spec — which makes "energy is forbidden" literally unwritable).

### Changed

- **Output shape: cards replace wide tables.** The 8/9/10-column proposal tables are gone. Output is now a scan table of at most four content columns (only when there are three or more items) plus one card per proposal, with bold inline labels and one sentence per bullet. The execution bullets that lost all three A/B runs — pre-registered measure with a baseline recorded *before* shipping, two to three guardrails including at least one user-harm metric, an ethics line in plain language whenever there is a bound to hold or a price to name, effort band, dependency, numeric kill threshold — sit **inside** the card so they cannot be dropped under length pressure. A wide all-fields table is emitted only on an explicit spreadsheet/CSV/Notion/PRD request, and then after the cards, never instead of them. Two-column mechanic **specs** stay tables, because a two-column table cannot collapse in a terminal.
- **Anti-fabrication rule attached to the card.** Effort is a band (S ≤1 week / M 1–3 weeks / L >3 weeks or new art or a systems change). Ship *order* is stated; ship weeks, headcounts, salaries and costs never are. Any number a skill introduces carries `[source | population | year | definition]` or is not written.
- **Ethics recalibrated from a prohibition list to four tiers** — T1 illegal, T2a platform-policy with no compliant version, T2b rating-priced, T3 evidence-of-harm, T4 contested preference. Refusal fires **only on T1 and T2a**, is scoped to the failing spec bullet rather than the request, and the rest of the answer is delivered normally; T2b prices the choice and offers the variant that avoids it; T3 and T4 can never emit refusal language and instead ship a measurable compliant spec plus a failure-signal metric. **This deliberately reverses part of the 2026-07 absolute-prohibition pass.** That pass banned energy/stamina, expiring login chains, pass and quest expiry, time-limited offers, paid streak freezes and social-obligation loops outright — which forbids lawful Korean and Japanese F2P standards, Duolingo's own design, and the standard implementation of the battle passes the retention skill advertises by name. Of the eight forbidden families, two are illegal somewhere, two carry a rating price, two rest on harm evidence and two were the author's preference; each is now graded and, where it is not illegal, given a compliant spec instead of a ban. Guarding the other direction: the fall-through is deliver, refusal is bullet-scoped, T3/T4 refusal is a hard branch rather than a tone instruction, escalation above T3 requires naming a currently-rated, currently-listed product that ships the mechanic, and six false-positive eval cases were authored *before* the ethics files were touched and gate the release at 6/6. *(Corrected in 2.2.1: the gate is declared and has never been executed, and two of those six graders have since been fixed.)* A minors overlay (EU DSA Art. 28, Brazil Lei 15.211, China, Texas SB 2420, CA SB 243, Australia, Korea) applies before the tier lookup and can move a mechanic two tiers.
- **Ethics has one canonical home.** `ethics-tiers.md` is the sole protocol and a mandatory read before any mechanic-bearing proposal, from all three skills, read across skill directories at `../engagement-retention-advisor/references/ethics-tiers.md`; `domain-ethics.md` is the per-domain catalogue with a tier on every row; `jurisdictions.md` isolates every dated legal claim behind a `last-verified` header. Each answer ends with `## 근거` — one line in the words a designer uses, naming the checks that ran and, above all, any check that could **not** be run; a skipped mandatory read surfaces there as an unrun check, never as a filename or a module name.
- **Language contract tightened.** Korean input produces Korean output with Korean headings — never bilingual headings, never a count instruction as a heading ("3–5 retention proposals" → "제안"), never an internal field name in the output ("Input interpretation" → "전제"). All three judges read the v1 Korean output as a filled-in form.
- **Ordering is by impact per unit effort**, highest first. v1's "impact × difficulty" literally ranked the hardest items first.
- **The advisor stopped being a pure router.** It owns `integration-patterns.md` and `systems-catalog.md`, and it never reads a sibling `SKILL.md` again — v1 pulled in a whole sibling body for ten lens names, importing a competing table and a circular routing block along with them.
- **Frontmatter rewritten** to use the full 1,536-character `description` + `when_to_use` budget, with Korean trigger phrases restored and the three clauses trimmed in 2026-07 for a 1,024-char cap that never bound. Every hardened negative clause from 1.1.0 survives. `user-invocable: true` dropped from all three (it is the default).
- **Measured always-on token cost: ~1,108 → ~1,845** (`claude --plugin-dir . plugin details`, Claude Code 2.1.261, 2026-09-06) — about 740 more tokens per session, roughly a third of one percent of a 200k window, spent on richer routing and mode triggers. On-invoke bodies are ~9.0k / ~9.7k / ~9.9k (ADV / RSD / IRM), and a whole invocation runs **~16k–30k** once the two or three reference modules that mode reads are counted — cheapest RSD `economics`, worst case RSD `cadence`. Every mode therefore costs more than v1.1.0's advisor worst case (~43 KB ≈ 14k), which the reads buy back in sourced, dated material rather than recalled fact. The corpus is 24 modules, ~345 KB; the three-reads-per-invocation ceiling bounds any single invocation to that range rather than to corpus size.
- **README rewritten**: the "Skill wins 2/2" headline is gone, the 2026-07 triad is relabelled as historical and pre-i18n rather than contradicted, slash commands are shown namespaced (`/game-engagement-retention-skills:<skill>`), examples are card-shaped, the token table is re-measured and dated, and the validate section names the three targets actually run.
- **Packaging**: version `2.0.0`; `displayName: "Game Engagement & Retention"` added; the redundant `skills` key **dropped** from `plugin.json` (for a marketplace entry resolving to the repository root, declaring it *replaces* the default scan, so a new skill directory would work under `--plugin-dir` and silently not load for installers); `"experimental": {"evals": "evals"}` added; the dead `marketplace.json` `$schema` URL replaced with `https://code.claude.com/schemas/marketplace.json`; `.gitignore` gained `.claude/`, `CLAUDE.local.md` and `.serena/`, which previously lived only in `.git/info/exclude` and did not travel with a clone.

### Removed

- **`pattern-library.md`** — superseded by the five pattern-family files, which split on retrieval key rather than size. It was also the last place hard-coding the old output contract ("full skill output uses the 9-column schema from SKILL.md", with all nine columns named), so an in-context few-shot no longer overrides the card grammar.
- **SaaS/B2B** from scope, and monetization *design* (pricing, eCPM, mediation, gacha rate and pity tuning) from what the skills will attempt. Both are declined in one line that names the boundary.
- **The absolute prohibition lists inside the three `SKILL.md` bodies.** They carry the four tier names, the refusal rule and one mandatory read; they enumerate nothing.
- **"Dopamine point" as a term.** It is unmeasurable at the product layer, asserts *liking* while the mechanism it names delivers *wanting*, and reads to a regulator as an admission of intentional compulsion design. A vocabulary-replacement table ships in its place.
- **`IMPLEMENTATION_NOTES.md` from the plugin root** → `docs/notes/2026-07-hardening.md`. It shipped to every installer with a private-command reference, a path to a missing scratchpad JSON and an identity note.

### Fixed

- **Reward prediction error demoted** from *the* mechanism to one contested lens among ten, with its own field's downgrade recorded and a 2025 contrary result marked contested rather than refuted. The v1 operant-schedule taxonomy, sourced to OpenStax and Lumen Learning, is gone — an uncertain reward is never labelled a variable-ratio schedule.
- **A misattributed flow citation corrected and its framing reversed.** PMC8943660 was cited as challenge-skill-balance support; it is Larche & Dixon (*J. Behav. Addict.* 9(3), 2020, n=60, Candy Crush), where flow adds 21.8% of variance in *urge to keep playing* and the authors read it as a risk marker. It now belongs to the ethics review, not the objectives list. A DOI attributed to CHI PLAY resolves to MUM '24; the venue is corrected.
- **Curiosity, not enjoyment, is carried as the predictor of continued play** (Kao et al., CHI 2024, pre-registered, n=1,699 — enjoyment did not predict playtime), with contingency stated as the condition on juice: amplification not dependent on success *lowered* competence and effectance.
- **PXI/miniPXI named as the default instrument**, with its two published caveats (weak immersion factor; weak evidence of a general score — never collapse to one fun number) and the note that no Korean-language validation exists.
- **A `## Contested — carry, do not resolve` section** added for claims the literature has not settled: the flow/difficulty null (n=311), near-miss effects, streaks, and gamification contraindicated in mental-health contexts.
- **Benchmarks re-sourced.** Every row is stamped `[source | data year | population | percentile | day convention]`, with a `## Do not quote` list covering the 7% PMF rule, 40/20/10, the Appcues D30 figure, the 2022 AppsFlyer grids, "64% battle-pass burnout" and the 31.85/12.18/5.35 genre table. Standing rule: never average across rows — D30 spans 0.68% to 17.8% on population alone.
- **Legal claims dated and bounded.** `jurisdictions.md` carries a `last-verified` header, ends every line with a verify-with-counsel note, and lists what does not exist: no "Prevent Game Addiction Act", no "Japan 2025 gacha law", no "China 2025 random-draw rule" (the 2023 NPPA draft was withdrawn 2024-01-23), Korea's shutdown curfew repealed 2022-01-01, and Korea's complete-gacha bill pending in committee rather than law.
- **The "(if installed)" hedges deleted**, which licensed judging a mechanic from memory when a reference read failed. A `## Preflight` rule replaces them: if a read fails, say so in one line and answer with reduced confidence — never silently proceed.

---

## [1.1.0] — 2026-07-17

A hardening pass driven by a blind-spot workflow (six scouts, then adversarial verification; 1 of 22 findings refuted), plus the conversion of the skills to English-first text and the first detailed README. An independent review passed 21/21 fixes. Deviations from the plan are logged in [`docs/notes/2026-07-hardening.md`](docs/notes/2026-07-hardening.md).

### Added

- MIT `LICENSE`.
- A **comparison mode** on `engagement-retention-advisor`, for requests that ask which of two layers to invest in first.
- A **refuse-and-redesign protocol** on `retention-strategy-designer`, which previously had none.
- A detailed README covering the moment-versus-lifecycle architecture, the deliverable-based routing rule, research basis with citations, the three-generation build and its test triad, plugin install, worked examples and the three-layer ethics guardrails.

### Changed

- **Routing hardened on four edges**: multi-day cadence mechanics (battle pass, login rewards, streaks) → `retention-strategy-designer`; a moment complaint paired with a churn complaint, and cross-layer priority questions → `engagement-retention-advisor`; session-length complaints → `interaction-reward-moments`. Contradictions between each skill's description and its body were removed.
- **Skills converted to English-first, Claude-optimized text** — descriptions, argument hints, routing, workflow, output templates and guardrails. Routing logic, table schemas and guardrail semantics were preserved unchanged. The "answer in the user's language" line, dropped by that conversion, was restored in all three skills later in the same release, and the README reworded to match: the skill files are English-first, the *output* follows the user.
- Identity unified to `ajitta` across `plugin.json`, `marketplace.json` and `LICENSE`.
- README validation claims date-stamped to the pre-i18n build they were measured against.
- Descriptions trimmed to 1,024 characters each — for a cap that, as 2.0.0 established, did not bind. The trimmed clauses returned in 2.0.0 at no cost.

### Removed

- `allowed-tools` from the skill frontmatter, which was blocking the skills' own hand-off between each other.
- The orphaned Passion.io benchmark row, deleted rather than sourced; the qualitative "learning apps skew low" note carries the point.

### Fixed

- **Ethics tightened** — ad-chained variable rewards, engineered energy refill cadence, resetting login chains, social-obligation loops and paid streak freezes were all forbidden; the absence-test loophole was closed; notification defaults were content-gated. *2.0.0 deliberately reverses part of this, replacing the absolutes with four tiers and compliant specs.*
- Benchmark sourcing: a ghost CORE-MBA row removed.
- An advisor lens misquote replaced with a pointer to the source module.
- `.gitignore` coverage for `.serena/` and `loop_guard_state.json`.

### Known gaps at this release

The token-cost table was not re-measured (a README caveat was added instead), and the test triad was not re-run against the English-first texts. Both are addressed in 2.0.0 by `evals/` and a dated re-measurement.

---

## [1.0.0] — 2026-07-08

Initial release: three routed skills bundled as an installable Claude Code plugin.

### Added

- **`interaction-reward-moments`** — in-session reward moments: anticipation, reveal, choice, feedback and game feel, with `references/pattern-library.md` and `references/research-basis.md`.
- **`retention-strategy-designer`** — lifecycle retention: cohorts, return events, activation, habit, churn and resurrection, with `references/retention-playbook.md`.
- **`engagement-retention-advisor`** — the seam between the two, routing single-layer requests to the owning skill and answering two-deliverable requests itself, with `references/domain-ethics.md`.
- **Deliverable-based routing** — route on the artifact the request asks for, not on keyword presence — shared by all three skills.
- Ethics guardrails as a prohibition list in `domain-ethics.md`, restated inline in each skill.
- `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json` for local `/plugin` install, and a short README.
