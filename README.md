# Game Engagement & Retention Skills

A Claude Code plugin of **three routed skills** for designing what makes a session satisfying and what makes someone come back.

It keeps apart the two problems that generic advice collapses into one — the **moment** (a single interaction inside a single session) and the **lifecycle** (a cohort returning over days and weeks) — routes each request to the skill that owns the *deliverable*, and answers in a fixed card format where every proposal carries a concrete trigger, a pre-registered metric with its baseline, guardrails including at least one user-harm metric, an effort band, and — only where there is a bound to hold or a price to name — one plain-language ethics line.

Version 2.2.0. Games are the deep case; five consumer interactive domains ride alongside them; SaaS is explicitly out. See [Scope](#scope).

---

## The three skills

| Skill | Owns | Default mode |
|---|---|---|
| `interaction-reward-moments` (IRM) | The scene. Anticipation, reveal, choice, feedback, game feel, mastery, first win, session-exit closure, and the accessibility of every sensory effect it prescribes. Session length is a diagnostic, never a target. | `moments` |
| `retention-strategy-designer` (RSD) | The lifecycle and the calendar. Return events, cohorts, leak windows, activation, habit, churn, resurrection, notifications, cadence systems, LiveOps, meta-progression pacing, metric semantics, instrumentation, and the retention side of monetization. | `strategy` |
| `engagement-retention-advisor` (ADV) | The seam. Two-deliverable asks, the moment-to-return link, cross-layer sequencing, and one named system whose value spans a session and a return: guild/clan, UGC, meta-progression, in-game economy. | `integrate` |

Merging them produces "add rewards and send a notification". Keeping them apart forces each one to stay concrete, and the advisor earns its place only by connecting the layers rather than concatenating two lists.

### Eleven modes

A mode is chosen before anything is written, but it is never printed: line 1 of the answer is a plain-language label of the deliverable in the output language (`Cadence spec — battle pass`, `보상 순간 설계 — 강화 실패 구간`), and the internal mode name never appears. `--mode <name>` still selects the mode explicitly. The mode decides which reference modules are read and what artifact comes out — so a pasted cohort table earns a curve reading instead of five proposals, and a battle-pass ask earns a fillable spec sheet.

| Skill | Mode | Fires when | Output artifact |
|---|---|---|---|
| IRM | `moments` | A named scene, loop, reveal, choice or feel beat is flat; a session-length complaint | Scan table + 3–5 cards + staging sequence + cross-cutting tuning notes |
| IRM | `first-win` | A tutorial beat, the first session, or how a session ends | 1–3 cards + staging timeline with timings + accessibility check |
| RSD | `strategy` | Open lifecycle ask: churn, D1/D7/D30, cohorts, activation, resurrection, FTUE funnel | Scan table + 3–5 cards + ordering + measurement plan |
| RSD | `read` | A number, curve, cohort table or metric definition is itself the object | Definition check + curve reading + ≤2 hypotheses. **No proposal cards** |
| RSD | `cadence` | A named mechanic: pass, quest stack, login calendar, streak, energy, notification, win-back | Two-column spec sheet + acceptance bounds + reviewer flags + one worked fill |
| RSD | `calendar` | A dated multi-week plan: LiveOps calendar, season roadmap, meta-progression pacing | `Week / Beat / Type / Return event / Metric` + 3 mini-cards + collision check |
| RSD | `economics` | Revenue-versus-retention trade-off: ARPDAU/LTV vs D7, ad load, offer cadence, paywall | LTV frame + one worked break-even + bounds. ≤2 cards |
| RSD | `instrument` | Tracking plan, event taxonomy, experiment design | `Event / Fires when / Properties / Answers` + return-event and cohort-key definitions |
| ADV | `integrate` | Two deliverables, or the moment-to-return link itself | Scan table + 3–5 integrated cards + an explicit residue section |
| ADV | `compare` | Which-first, sequencing, prioritization, "should we build it at all" | Options table + measurement order + at most one card |
| ADV | `system` | One named cross-layer system | System sheet + 2–3 sub-mechanic cards + instrumentation |

Each mode names at most **three** reference modules and reads no more. If a fourth seems necessary, the request spans two modes: the skill picks the primary, answers it, and says in one line what it deferred.

---

## How routing works

**Route on the deliverable, not on keyword presence.** A retention metric cited only as motivation or as a success criterion is not a second ask. "D7 is low, fix the reward reveal" is a scene fix with D7 as the validation target — not a retention request. That single rule is what a keyword rule ("contains D7 → retention skill") gets wrong on every request where retention is the stated goal.

When the deliverable is a *named artifact* rather than a layer, it routes by its row here, into the mode named here. The table is identical in all three skill bodies — a rule missing from the file that fired does not exist for that run — and `scripts/check-shared-blocks.sh` fails the build on any divergence between the three copies and the canonical block in `contracts.md`.

| Named deliverable | Skill | Mode |
|---|---|---|
| In-session scene, feel, reveal, choice, staging, "not fun" | IRM | `moments` |
| Session-length / quit-mid-session complaint | IRM | `moments` |
| A named tutorial beat feels flat; the first win does not land | IRM | `first-win` |
| Unlock **reveal** beat itself | IRM | `moments` |
| Accessibility of a feel effect (flash, shake, haptics, motion) | IRM | `moments` |
| Churn, D1/D7/D30, cohorts, activation, resurrection | RSD | `strategy` |
| Tutorial/FTUE **funnel**: which step, order, gating, D0→D1 leak | RSD | `strategy` |
| Pasted curve or cohort table with no change requested | RSD | `read` |
| Retention metric definition; rolling vs classic; D28 vs D30 | RSD | `read` |
| Battle pass, season, daily/weekly quests, login calendar, streak, energy | RSD | `cadence` |
| Notification / push copy | RSD | `cadence` |
| LiveOps / event calendar, season roadmap, 90-day plan | RSD | `calendar` |
| Meta-progression **pacing** between runs | RSD | `calendar` |
| ARPDAU/LTV vs retention, ad load, offer cadence, first purchase, paywall | RSD | `economics` |
| Analytics event taxonomy, tracking plan, experiment design | RSD | `instrument` |
| Two deliverables, or the moment-to-return link itself | ADV | `integrate` |
| Moment complaint **paired** with a churn complaint | ADV | `integrate` |
| Compare / sequence / prioritize moment-level vs lifecycle-level | ADV | `compare` |
| "Should we build a tutorial at all" | ADV | `compare` |
| Guild/clan, UGC & creation-sharing, in-game economy, meta-progression **system** | ADV | `system` |
| Monetization **design**: pricing, eCPM, mediation, gacha rate or pity tuning | — | decline in one line, name the boundary |
| SaaS / B2B activation or churn | — | decline in one line, name the scope |

Two supporting rules: tutorial drop-off is a funnel symptom, not a deliverable — route on the artifact asked for. And a hand-off is a routing failure the user pays for twice, so a skill hands off at most once per turn, never back to the skill that handed to it, and otherwise answers in place under its own guardrails.

---

## What the output looks like

**Tables scan; cards carry.** A table holds a short label, one number or one date, and never more than 5 columns. Anything the reader has to *read* — rationale, ethics, feedback staging — goes in a card bullet, one sentence each. The execution bullets (measure, guardrails, ethics, effort) sit **inside** the card so they cannot be dropped under length pressure.

Abridged example — a real answer carries 3–5 cards, and the scan table lists all of them:

```markdown
Reward-moment design — top-down roguelike, post-room upgrade pick

| # | Name | Fires when | Key metric |
|---|---|---|---|
| 1 | Telegraphed third option | Room clears holding a tagged pair | Tagged-pair completion rate vs chance |
| 2 | Near-death clear payoff | Room clears at ≤15% HP | Re-entry rate into the next room |
| 3 | Elite weakness preview | Upgrade card resolves | Preview-to-loadout-change rate |

### 1. Telegraphed third option
**One-liner** — The third card is drawn from tags the run already owns, so the pick is a build decision, not a stat menu.
- **Fires when**: the room clears and the run holds ≥2 upgrades sharing a tag (evaluated once, at card deal)
- **Player does**: takes the synergy card now, or gambles on a stronger standalone card and keeps the pair open
- **Why it works**: competence read as capacity growth, plus bounded uncertainty the player can actually reason about
- **Feedback**: matching tag pulses on owned icons (2 pulses max) → 120 ms hit-stop on select → synergy resolves as a number, not a word
- **Next hook**: the card preview names the tag the next elite is weak to
- **Measure**: tagged-pair completion rate, against the same rate measured on the current build *before* shipping
- **Guardrails**: decision-time distribution stays multi-modal · no reroll sold for currency · review-keyword frequency for "forced"
- **Effort**: S (client-only, constants remote-configurable) · **Depends on**: nothing · **Kill if**: pair completion lands under chance +5pp
```

Every answer carries the same fixed sections in the same order: the deliverable label → assumptions (every guessed input, tagged) → the mode's body → ordering by **impact per unit effort** → measurement plan → a redesign section only when a legal or platform bound actually failed → jurisdiction flags → **basis — one line in the designer's own words naming the checks that ran, and any check that could not be run**. That last line is a compliance device, not decoration: a skipped mandatory read surfaces there as a check that could not be run, in plain language and never as a filename.

Two rules the format enforces against invention. Effort is a band (S ≤1 week / M 1–3 weeks / L >3 weeks or new art or a systems change); ship **order** is stated, but ship weeks, headcounts and costs never are, because the model cannot know your calendar. And any number the skill introduces carries `[source | population | year | definition]` inline, or it is not written.

**Language.** Answers follow the input language. Korean in → Korean out, with Korean headings; never bilingual headings, never a template that reads as a filled-in form.

---

## Ethics: four tiers, not a ban list

A flat forbidden list refuses ordinary lawful live-service design and blesses nothing measurable. v2 replaces it with a graded model where **refusal fires only on T1 and T2a**, and only on the failing bullet — the rest of the design ships.

| Tier | Meaning | Response |
|---|---|---|
| T1 Illegal | Statute or store rule in force in a named market | Refuse **that configuration**, redesign it, deliver the rest |
| T2a Platform | Store-policy violation with no compliant version | Refuse that configuration, redesign it, deliver the rest |
| T2b Rating | Costs an age band or a classification | **Price the choice** — one line plus the variant that avoids it; refuse only against a rating target you stated |
| T3 Harm | Published evidence of user harm | **Never refuse.** Deliver against a numeric compliant spec plus a failure-signal metric |
| T4 Preference | Contested efficacy; the author's stance | **Never refuse.** Deliver both options, mark the stance in one clause |

Three ordered questions run **during** generation, not as a filter afterwards: does the audience include minors (the overlay applies before the row lookup, and can move a mechanic two tiers); what mechanic family is this and what does its row say; does this configuration meet the compliant spec bullet by bullet. A mechanic that is not a row is not a refusal case — the skill proceeds and emits nothing about the absent row. A fully compliant mechanic emits no ethics bullet at all — no tier code, no family slug, and no line saying there was nothing to report; there is no path by which a compliant design produces prose.

Every previously forbidden mechanic is re-graded with a spec instead of a ban. Energy and stamina, paid streak freeze, learning streaks, social-obligation loops and 기다리면 무료 all ship with numeric bounds — `scripts/check-ethics-rows.sh` fails the build if a T3 row lacks a numeric or observable compliant spec, which makes "energy is forbidden" literally unwritable. Hidden odds on paid random items stay T1 against named, dated instruments; guilt-framed AI-companion farewells keep their ban because no compliant configuration exists. Legal claims are isolated in `jurisdictions.md` with a `last-verified` header and a `## Do not quote` list of the plausible-sounding laws that do not exist.

Five false-positive guards hold the other direction, four of them structural: the fall-through is *deliver*; T3 and T4 can never emit refusal language (a hard branch, not a tone instruction); refusal is bullet-scoped; escalation above T3 requires naming a currently-rated, currently-listed product in your market that ships the mechanic; and six false-positive eval cases must pass 6/6 or the ethics change does not ship.

---

## Scope

**In, deep:** games — genre profiles, platform branches, cadence systems, LiveOps, economy, feel and accessibility bounds.

**In, supported:** five consumer interactive domains — interactive narrative and visual novels, fortune/saju/tarot, AI companions, journaling, and learning apps. Each has domain-correct tuning vocabulary (reveal cadence, personalization threshold, artifact form, prompt cap) rather than translated combat advice, and its own ethics rows.

**In, as tension only — monetization.** The retention *consequence* of a monetization choice is in scope: ARPDAU/LTV against D7, ad load, offer cadence, first purchase, paywall placement. Monetization **design** is not: pricing, eCPM, mediation, gacha rate and pity tuning are declined in one line naming the boundary.

**Out — SaaS and B2B** activation and churn. Declined in one line naming the scope. This is deliberate: the domain has no moment vocabulary, no ethics rows and no genre model here, so a fast decline beats a plausible bad answer.

---

## Installation

Distributed through [ajitta/claude-plugins](https://github.com/ajitta/claude-plugins), a catalog repository that lists this plugin and points at this repository. The catalog holds no code; installs and updates come from here, at the version `plugin.json` declares.

```
/plugin marketplace add ajitta/claude-plugins
/plugin install game-engagement-retention-skills@ajitta
```

Already installed? `plugin.json` declares a `version`, so Claude Code only re-fetches when that string changes — `/plugin update game-engagement-retention-skills@ajitta` is a no-op while the cached version matches. Every release here bumps the field for that reason.

Start a new session for the skills to load, then verify:

```
/plugin details game-engagement-retention-skills@ajitta
```

Expect **Skills (3): engagement-retention-advisor, interaction-reward-moments, retention-strategy-designer**.

### Using them

Slash commands are namespaced by the plugin:

```
/game-engagement-retention-skills:interaction-reward-moments  <named scene, loop, screen or beat> [--mode moments|first-win]
/game-engagement-retention-skills:retention-strategy-designer <product + retention problem or named mechanic> [--mode strategy|read|cadence|calendar|economics|instrument]
/game-engagement-retention-skills:engagement-retention-advisor <product + the two deliverables, or the named system> [--mode integrate|compare|system]
```

Auto-triggering needs no slash command — "our card-flip reveal feels cheap" reaches IRM, "배틀패스 설계해줘" reaches RSD in `cadence`, "combat feels flat and players churn" reaches ADV.

### Manual alternative (no plugin)

Copy the three folders under `skills/` into any `.claude/skills/` directory, keeping all three as **siblings**. The shared ethics modules are read across skill directories at `../<skill>/references/<file>.md`, so a partial copy of one skill breaks those reads. The plugin path is more robust; use it unless you cannot.

---

## Token cost

Measured with `claude --plugin-dir . plugin details game-engagement-retention-skills` on Claude Code 2.1.261, 2026-09-06.

| Component | Always-on | On-invoke |
|---|---|---|
| Plugin total, all three skills registered | ~1,845 tok | — |
| Each skill's routing frontmatter | ~600–630 tok | — |
| `engagement-retention-advisor` body | — | ~9.0k |
| `interaction-reward-moments` body | — | ~9.9k |
| `retention-strategy-designer` body | — | ~9.7k |
| Reference modules | — | 2–3 per invocation, +6k to +21k on top of the body |

**Per-invocation total, by mode** — body plus the modules that mode reads, at the ≈3.1 bytes/token the measured bodies imply. Cheapest is `retention-strategy-designer --mode economics` at ~16k; `--mode instrument` ~16k; `--mode read` ~17k; `engagement-retention-advisor --mode compare` ~17k; `interaction-reward-moments --mode first-win` ~19k; `--mode moments` ~19–22k depending on which pattern family the beat selects; `engagement-retention-advisor --mode integrate` ~20k; `retention-strategy-designer --mode calendar` ~25k; `--mode strategy` ~26k; `engagement-retention-advisor --mode system` ~27k. The most expensive is `retention-strategy-designer --mode cadence` — battle pass, streak, energy — at **~30k, about 15% of a 200k window in a single invocation**. For comparison, v1.1.0's advisor at its worst, following its own pointers, read ~43 KB ≈ 14k: every v2 mode costs more than the v1 worst case, and `cadence` costs more than twice it. The reads buy sourced, dated, jurisdiction-checked material the v1 bodies asserted from memory — but they are not cheap, and the three-read ceiling does not make them cheap.

Always-on cost is paid in every session; on-invoke cost is paid each time a skill fires. v1.1.0 measured ~1,108 always-on tokens, so v2's richer routing and mode triggers cost about 740 more tokens per session — roughly a third of one percent of a 200k context window. The corpus is 24 reference modules, ~345 KB; the three-reads-per-invocation ceiling bounds any single invocation to the range above rather than to corpus size.

The routing text stays inside the frontmatter budget: `description` + `when_to_use` is 1,423 characters for the advisor, 1,436 for reward moments and 1,494 for retention, against a 1,536-character cap that the binary carries as its default. Korean trigger vocabulary now sits inside `description` rather than only in `when_to_use`, so it survives any shortening the listing budget applies.

---

## How it was built and validated

The design rule that shapes everything: **a `SKILL.md` may contain a procedure, never a fact.** Benchmarks, citations, legal claims, tier assignments and patterns live in a reference module read at generation time; the three bodies are 180–193 lines of procedure each. This kills fact drift structurally — v1 restated its ethics in seven places and they had already diverged — and `scripts/check-no-facts-in-skills.sh` enforces it over the shapes that drift: percentages, benchmark figures, jurisdiction and statute names, dates, prohibition lists and citations. The measurement windows the blind judges credited — the novelty re-read at week 3–4, re-dormancy at +30d — are deliberately kept inline as part of the procedure, and the check is written not to fire on them.

### The A/B history, stated honestly

Three things happened, in this order.

1. **2026-07 — a test triad**, run against the pre-i18n **Korean** skill texts. It found real defects and fixed them, but it does not describe the text that ships today.

   | Check | Method | Result |
   |---|---|---|
   | Format validity | Live session registration | 3/3 skills registered |
   | Smoke test | Independent agent runs the skill from files only, then self-scores | Quality 4–5/5; 13 spec defects found and fixed |
   | Baseline comparison | Blind A/B, with vs without the skill | **Withdrawn** — superseded by the 2026-09 A/B below |
   | Routing stress | 6 ambiguous requests against the routing rule | Rule rebuilt around deliverables, not keywords |
   | Adversarial ethics | Role-play requests for dark patterns | 2/2 resisted; refuse-and-redesign made explicit |

2. **2026-09 — a blind A/B on the English-first v1.1.0 texts.** One prompt per skill, one judge per pair. The skill arm finished **behind in all three matchups**, at small margins. The judges named the same three defects each time: 8–10-column tables that collapse in a terminal, output that reads as a filled-in template rather than a document about the product, and missing execution detail. They also credited the skill arm for things the plugin-free baseline never produced — defending a real return event instead of "app opened", same-week cohorts, a kept holdout, the 2–4 week novelty window, +30d re-dormancy, guardrails beyond crash rate, and pricing the ethical option honestly instead of selling it as free.

3. **v2 was rewritten in response** — cards replacing wide tables, named modes, facts moved out to reference modules, the four-tier ethics model — while the seven things the judges credited were preserved verbatim. The same matchups were then re-run.

   The rematch ran in two rounds. In the first, the v2 skill arm won one of three: the lifecycle skill took its matchup, while the judges said the moment skill and the advisor had traded craft depth for rigor, leaked internal machinery into the prose (mode names, reference filenames, tier codes), emitted ethics rows whose content was that there was nothing to report, and — in the advisor's case — declined part of the client's stated question and stated one of the plugin's own recommendations as if it were Korean law.

   Those five defects were fixed, and the two lost matchups were re-judged blind. **Both flipped: the moment skill won at a small margin, the advisor at a large one.** Across the two rounds the v2 arm therefore took all three matchups that v1.1.0 had lost. Both judges also flagged the plugin-free baseline for the failure mode v2's anti-fabrication rule exists to prevent: invented ship weeks, invented headcounts, and target numbers formatted as benchmarks with no population behind them.

The caveats cut both ways and are worth stating plainly: one prompt per matchup, one judge per pair, small margins throughout. A single-trial result does not falsify another single-trial result, and none of these numbers is a benchmark. That is exactly why the reproducible replacement exists.

### The reproducible replacement

`evals/` holds **38 cases across ten families** — routing positives, the six hardened routing edges, six previously homeless asks, Korean routing, mode selection, refusal true positives, **six refusal false positives that are a release gate at 6/6**, output shape with a fabrication penalty, intake, and evidence hygiene.

`claude plugin eval` exists on 2.1.261 but is in early access on this account and currently scaffolds nothing, so the grader frontmatter schema is **unverified** and the suite is authored and run **manually**: `claude -p "$(cat evals/<case>/prompt.md)" --plugin-dir .` for the with arm, the same prompt with no `--plugin-dir` for the baseline, three runs each, graded by a separate judge invocation against the same `criteria.md`. The with-without ablation cannot score the routing families — a baseline Claude cannot route to skills it does not have — so those are marked with-only and read as a fired/not-fired indicator. The earn-its-cost argument lives in the scored families, where a plugin-free Claude gives a plausible answer and the graded question is whether it is as *rigorous*.

### Checks that run on every change

```sh
claude plugin validate .claude-plugin/plugin.json --strict
claude plugin validate ./skills --strict
scripts/check-shared-blocks.sh && scripts/check-no-facts-in-skills.sh && scripts/check-ethics-rows.sh
```

Both validators and all three scripts pass. `claude plugin validate .claude-plugin/plugin.json --strict` exits 1 in a local checkout, on a warning about the untracked personal `CLAUDE.local.md` at the repository root; that file is gitignored and never reaches an installer. `claude plugin validate ./skills --strict` is the load-bearing one: a broken `SKILL.md` frontmatter loads at runtime with empty metadata — a skill with no description and therefore no routing, the worst failure this plugin has. The marketplace manifest is validated in the catalog repository, not here. The `plugin.json` validator warns only about the untracked local `CLAUDE.local.md`, which never reaches installers.

### Research basis

The skills describe design levers *consistent with* published work, never neurochemical guarantees — "dopamine point" never reaches an answer, and an uncertain reward is never labelled a variable-ratio schedule. Reward prediction error is carried as one lens among ten rather than as a mechanism; curiosity rather than enjoyment predicts continued play; PXI/miniPXI is the default instrument. `research-basis.md` carries the citations and a `## Contested — carry, do not resolve` section for the claims the literature has not settled (the flow/difficulty null result, near-miss effects, streaks, gamification contraindicated in mental-health contexts).

---

## Repository structure

```
Game-Engagement-Retention-Skills/
├── .claude-plugin/
│   └── plugin.json          # manifest; skills are auto-scanned, not declared
├── skills/
│   ├── interaction-reward-moments/
│   │   ├── SKILL.md         # procedure only, 193 lines
│   │   └── references/      # 9 modules: lenses, 5 pattern families,
│   │                        #   first-session, feel-and-accessibility, research-basis
│   ├── retention-strategy-designer/
│   │   ├── SKILL.md         # 181 lines
│   │   └── references/      # 8 modules: playbook, metric-definitions, benchmarks,
│   │                        #   experiments, liveops-cadence, genre-profiles,
│   │                        #   churn-and-winback, retention-economics
│   └── engagement-retention-advisor/
│       ├── SKILL.md         # 180 lines
│       └── references/      # 7 modules: ethics-tiers, domain-ethics, jurisdictions,
│                            #   korea-market, integration-patterns, systems-catalog,
│                            #   contracts (canonical shared blocks; never read at runtime)
├── evals/                   # 38 cases, ten families, one prompt + graders each
├── scripts/                 # check-shared-blocks · check-no-facts-in-skills · check-ethics-rows
├── docs/                    # design record and the 2026-07 hardening notes
└── LICENSE
```

`contracts.md` is the canonical source for the routing block, the card grammar and the language rule; the copies inside each `SKILL.md` are byte-compared against it in CI. The duplication is unavoidable — each skill file loads alone at invocation — so divergence, not duplication, is the defect.

---

## License

MIT.
