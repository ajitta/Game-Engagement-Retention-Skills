# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

The version here is the `version` field of `.claude-plugin/plugin.json`. An installed copy stays on its cached version until that number changes, so every user-visible change ships with a bump and a `{name}--v{version}` tag.

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
- **Ethics recalibrated from a prohibition list to four tiers** — T1 illegal, T2a platform-policy with no compliant version, T2b rating-priced, T3 evidence-of-harm, T4 contested preference. Refusal fires **only on T1 and T2a**, is scoped to the failing spec bullet rather than the request, and the rest of the answer is delivered normally; T2b prices the choice and offers the variant that avoids it; T3 and T4 can never emit refusal language and instead ship a measurable compliant spec plus a failure-signal metric. **This deliberately reverses part of the 2026-07 absolute-prohibition pass.** That pass banned energy/stamina, expiring login chains, pass and quest expiry, time-limited offers, paid streak freezes and social-obligation loops outright — which forbids lawful Korean and Japanese F2P standards, Duolingo's own design, and the standard implementation of the battle passes the retention skill advertises by name. Of the eight forbidden families, two are illegal somewhere, two carry a rating price, two rest on harm evidence and two were the author's preference; each is now graded and, where it is not illegal, given a compliant spec instead of a ban. Guarding the other direction: the fall-through is deliver, refusal is bullet-scoped, T3/T4 refusal is a hard branch rather than a tone instruction, escalation above T3 requires naming a currently-rated, currently-listed product that ships the mechanic, and six false-positive eval cases were authored *before* the ethics files were touched and gate the release at 6/6. A minors overlay (EU DSA Art. 28, Brazil Lei 15.211, China, Texas SB 2420, CA SB 243, Australia, Korea) applies before the tier lookup and can move a mechanic two tiers.
- **Ethics has one canonical home.** `ethics-tiers.md` is the sole protocol and a mandatory read before any mechanic-bearing proposal, from all three skills, read across skill directories at `../engagement-retention-advisor/references/ethics-tiers.md`; `domain-ethics.md` is the per-domain catalogue with a tier on every row; `jurisdictions.md` isolates every dated legal claim behind a `last-verified` header. Each answer ends with `## 근거` — one line in the words a designer uses, naming the checks that ran and, above all, any check that could **not** be run; a skipped mandatory read surfaces there as an unrun check, never as a filename or a module name.
- **Language contract tightened.** Korean input produces Korean output with Korean headings — never bilingual headings, never a count instruction as a heading ("3–5 retention proposals" → "제안"), never an internal field name in the output ("Input interpretation" → "전제"). All three judges read the v1 Korean output as a filled-in form.
- **Ordering is by impact per unit effort**, highest first. v1's "impact × difficulty" literally ranked the hardest items first.
- **The advisor stopped being a pure router.** It owns `integration-patterns.md` and `systems-catalog.md`, and it never reads a sibling `SKILL.md` again — v1 pulled in a whole sibling body for ten lens names, importing a competing table and a circular routing block along with them.
- **Frontmatter rewritten** to use the full 1,536-character `description` + `when_to_use` budget, with Korean trigger phrases restored and the three clauses trimmed in 2026-07 for a 1,024-char cap that never bound. Every hardened negative clause from 1.1.0 survives. `user-invocable: true` dropped from all three (it is the default).
- **Measured always-on token cost: ~1,108 → ~1,726** (`claude --plugin-dir . plugin details`, Claude Code 2.1.261, 2026-09-06) — about 620 more tokens per session, roughly a third of one percent of a 200k window, spent on richer routing and mode triggers. On-invoke bodies are ~9.0k / ~9.7k / ~9.9k (ADV / RSD / IRM), and a whole invocation runs **~16k–30k** once the two or three reference modules that mode reads are counted — cheapest RSD `economics`, worst case RSD `cadence`. Every mode therefore costs more than v1.1.0's advisor worst case (~43 KB ≈ 14k), which the reads buy back in sourced, dated material rather than recalled fact. The corpus is 24 modules, ~345 KB; the three-reads-per-invocation ceiling bounds any single invocation to that range rather than to corpus size.
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
