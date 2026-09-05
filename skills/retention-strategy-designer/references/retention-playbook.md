# Retention Playbook

Read this when the deliverable is a lifecycle diagnosis or retention proposals: the value model, the return event, the stage an intervention targets, the leak window a symptom belongs to. Benchmark levels are in `${CLAUDE_SKILL_DIR}/references/benchmarks.md`, metric conventions in `${CLAUDE_SKILL_DIR}/references/metric-definitions.md`, test design in `${CLAUDE_SKILL_DIR}/references/experiments.md` — this file carries none of them.

## Core value model

```
value delivered at cadence T → return near T → value compounds → returning stops needing a prompt
```

Retention failure is a value-delivery failure before it is a notification failure. Reminders amplify existing value; they do not create it. Two questions decide whether a proposal is retention work at all:

1. **What accumulates between sessions?** If nothing does, it is engagement work wearing a retention label.
2. **Would this be worth returning for if nothing were withheld?** If the pull comes only from expiry or removal, it is a pressure loop, not value.

**Stored-value classes**, ascending by return inertia (02e §4):

| Class | Example | Return inertia |
|---|---|---|
| Nothing | pure co-op run | lowest |
| Power forward | permanent upgrades, boosters | low–mid |
| Knowledge forward | learned routes, solved rules | invisible unless given an artifact |
| Position / collection | level number, roster, collection | highest — cannot be re-derived |
| Social position | guild standing, friend graph | high, but asymmetric |

Knowledge-only designs read as "no progression at all" to a real player segment within days; the fix is an artifact making mastery visible (logbook, recipe list, map annotation), not more power. Accumulation is not self-justifying either: Pokémon TCG Pocket shipped all three classes and still lost MAU across three quarters, the publisher's remedy being a richer *collection* experience rather than a richer reveal (DeNA via gamebiz, 2026). Meta-progression retains only while the player believes the accumulation is going somewhere.

## Return-event design

The single most important modelling decision, and the one most often skipped. A return event is the observable act proving the user came back **for the value** — not that a process started.

- **Meaningful.** The critical action, never "app open" — app-open inflates with notification volume and hides value decay.
- **Cadence-first, in this order.** Designated frequency → habit moment (where the cohort's key-action curve flattens) → aha (earliest action correlated with reaching it) → setup (Casey Winters talk, https://www.youtube.com/watch?v=DrmgZLj1zfo — practitioner heuristic, no published cohort data; the usual "Reforge activation funnel" attribution is unverifiable).
- **Stable.** Defined identically across cohorts and time, or the curve compares two different things.

Prefer a **critical-event** definition wherever opening the app is not evidence of value — journaling, learning, companion, fortune, tools. The critical-event definition and the Amplitude onboarding-action figure behind it: `${CLAUDE_SKILL_DIR}/references/metric-definitions.md`. This **breaks comparability with vendor benchmarks on purpose**: say so, and stop quoting benchmarks at that product.

A return event means nothing without the other three axes — return rule, day boundary, denominator (`${CLAUDE_SKILL_DIR}/references/metric-definitions.md`, read before quoting or comparing any number). Platform branch: PC/console report DAU/MAU and playtime, not day-N (`${CLAUDE_SKILL_DIR}/references/genre-profiles.md`).

## Lifecycle segmentation

Name the stage before naming the intervention. A streak aimed at dormant users is noise; a "what's new" digest aimed at power users is noise.

| Stage | Definition | Primary lever |
|---|---|---|
| New | before the habit moment | time-to-first-value, comprehension |
| Current | returning at natural cadence | loop depth, discovery, what accumulates |
| Power | above cadence, high investment | mastery, identity, community, creation tools |
| At-risk | gap widening against **this player's own** median gap | relevance re-proof, friction removal |
| Dormant | many cycles missed | what changed since they left + easy re-entry |
| Resurrected | returned after dormancy | fast re-activation; never treat as new or as current |

At-risk keys to the player's own median inter-session gap, not a global threshold — a weekly player is not lapsing on day 3. Signal→diagnostic mapping and win-back by lapse cause: `${CLAUDE_SKILL_DIR}/references/churn-and-winback.md`.

## Leak diagnosis by window

**Rule out three non-leaks first.** (1) A convention artifact — D1 is the convention-sensitive metric, and a calendar-vs-rolling-24h toggle moves it more than most product work does (`${CLAUDE_SKILL_DIR}/references/metric-definitions.md`). (2) Expected post-launch decay — NCSOFT called Aion2's decline "along the expected decay curve" and pre-scheduled a six-month anniversary beat (FETV concall coverage, 2026). (3) Finite or binge-shaped products, where low DAU/MAU with long sessions is the design.

Phrasing: under strict return-on-day-N, D7 users are not a subset of D1 users. Say "about one-fifth as many players are present on day 7 as on day 1" — a ratio of two point-in-time rates, never a survival rate.

**D0/D1 — comprehension.** Onboarding friction, unclear first value, aha buried too deep. Both failure directions exist: too hard, and *too easy for experienced players*. In gacha and account-bound products rerolling inflates the install denominator — compute a second D1 on a post-tutorial denominator and compare, rather than guessing a correction (`${CLAUDE_SKILL_DIR}/references/experiments.md`). FTUE structure: `${CLAUDE_SKILL_DIR}/../interaction-reward-moments/references/first-session.md`.

**D2–D7 — the second session.** Four mechanisms, in checking order:

1. **No reason to return was created before the exit.** Players sometimes plan re-engagement at the moment they stop, making the exit the highest-leverage place to seed the next objective (Alexandrovsky, session-exit study, 2024).
2. **The first session consumed all the value.** Signature: strong D1, collapsed D28.
3. **Absence compounds.** "Current Absence Time" dominates 7-day retention models (Drachen et al., AIIDE 2016).
4. **Return is not resumption.** Games do not recognise a player returning rather than continuing; the anchor is a **Pivot Point** — a beat restoring the player as their expert self (Hammad et al., CHI 2021 — small-n autobiographical design, the only study of the problem).

Re-entry checklist: save interaction state, not the level index · open on a Pivot Point, never the tutorial · recap prior context (practitioner testimony only) · make missed days catchable rather than lost.

**[contested] cliffhanger vs closure at exit.** Written-story experiments: cliffhanger raised desire for the next instalment, no enjoyment loss (Schibler, Hahn & Green, 2023). Lab study with electrodermal and cortisol measures: arousal rose, intention-to-continue did not (Wirz et al., 2022). Neither measured next-day return in a game — ship it as an A/B, never a recommendation.

**D8–D30 — three systems, next section.** The window v1 covered in one line.

**D30+ — novelty exhausted.** No compounding asset, no community, or trust erosion from ad-load and paywall creep (`${CLAUDE_SKILL_DIR}/references/retention-economics.md`). Split churn by destination first: category exit and competitor switch need different responses, and where time scarcity is the stated cause the answer is a *lower-commitment* mode, not a larger reward — the Korean case, where the substitute category is video/OTT, is in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/korea-market.md` (KOCCA 2025 게임이용자 실태조사).

## D8–D30: the three systems that decide it

### Meta-progression pacing

Not "how much power per run" but **how far ahead the player can see the next accumulation step**, and whether it is reachable at their real play frequency.

- Classify what is stored (table above) before pacing it. Knowledge-only → ship the artifact.
- The **end-cap loop must exist at launch**, not in a title update. A level cap with nothing behind it is the content cliff arriving early.
- Meta cannot be validated by an FTUE-stage test: on Squad Busters, post-launch retention "didn't match what we saw in closed betas", the soft launch "only validated D7", and "even large beta samples don't predict global behavior" (Supercell, first-party, 2026). Budget validation on the meta's own timescale.
- Nerfs to carried-forward power read as confiscation; the remedy is expectation-setting in advance ("no change is necessarily permanent"), not abstaining from balance work.
- Season and banner artifacts: `${CLAUDE_SKILL_DIR}/references/liveops-cadence.md`. Genre cadence units: `${CLAUDE_SKILL_DIR}/references/genre-profiles.md`.

### Social systems as retention drivers

Split social into acquisition and retention; they are different products. An IV study of 108M users on the largest PC game platform found strong causal peer effects on *adoption*, yet players influenced by key players or old friends subsequently **spent less time playing** (arXiv 2409.14351, 2024). Referral cohorts are never counted as a retention win.

- **Guild-join, not friend-add, is the social activation milestone** — the guild effect exceeds the friend effect in the one matched study available [Hwang & Han, SSRN 4606486 | 1,204 MMORPG users | working paper, **[unverified]**]. Log guild/party/raid/trade edges as time-varying churn features; dynamic graphs beat static membership flags (Lee & Woo, PLoS One, 2025, NCSOFT Blade & Soul logs, 10,000 users — correlational).
- **Social without a meta layer produces spikes, not D30.** Co-op hits without meta-progression fall well short of meta-carrying comparators on D30; the levels, the titles behind them and why the comparison is confounded: `${CLAUDE_SKILL_DIR}/references/genre-profiles.md`.
- **"Social features raise retention" is not a claim to make.** In a Cox survival analysis of League of Legends players, connectedness lowered churn overall **but** playing with teammates was associated with lower win rates, which independently raise churn (Kim, Kim, Kim & Li, 2026 — `${CLAUDE_SKILL_DIR}/references/churn-and-winback.md`).
- **The line not to cross.** If a player's absence costs their guild or alliance — missed rallies, lost standing — that is a sunk-cost and competitive-pressure pattern needing an opt-out or grace mechanism. Bonuses may scale with who shows up; they may not penalise the group for one absence. Tier and compliant spec: `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics.md`.
- **Instrument time-to-next-session after a toxic-exposure match**: exposure lengthens the gap to the next session sharply, which makes toxicity a retention leak and not only a community problem; the measured hours and their 2SLS caveat: `${CLAUDE_SKILL_DIR}/references/churn-and-winback.md`. Segment churn dashboards by gender and identity; withdrawal is demographically skewed.

### Content-cliff detection

Not a calendar date: it is the point at which **cumulative content consumed by your fastest cohort exceeds cumulative content shipped**. Estimate it rather than prescribing a cadence — top-decile consumption rate × content shipped per cycle → the date it arrives. Run that before proposing any cadence change, and pair every cadence recommendation with a capacity check: can this team hold quality at this interval? Cadence *compression* has no verified retention effect. Offer the cheap mitigations (rotation, banked missed days, roadmap co-ownership, catch-up entry) before any new-content proposal: `${CLAUDE_SKILL_DIR}/references/genre-profiles.md`.

## Habit-formation frames, and where each fails

- **Fogg (B = MAP).** Behaviour needs motivation, ability and prompt at once. Raise ability before prompt volume: prompts without ability produce opt-outs, and a notification opt-out is a one-way door.
- **Hook Model (Eyal).** Trigger → action → variable reward → investment. Use it as a map and **resist the variable-reward leg actively** — that leg becomes compulsion design, and it is the one regulators name. The *investment* leg (stored value) is the durable, defensible part; prefer legible earned rewards carrying competence information.
- **Habit is not more reward.** Habitual behaviour becomes insensitive to reward devaluation, so escalating incentives aimed at already-habitual users are wasted spend (`${CLAUDE_SKILL_DIR}/../interaction-reward-moments/references/research-basis.md`).
- **No fixed days-to-habit.** Locate the habit moment empirically — where this cohort's key-action curve flattens — and treat any circulating day count as folklore.

## Numbers that do not exist

Say so; do not substitute a plausible one.

- **Days or repetitions to form a habit** in a digital product. No study in this evidence base names one.
- **The effect of recap or return-flow systems** on returning-player retention or comprehension.
- **Next-day return for cliffhanger vs closure.** Measured in no game.
- **Alliance or guild obligation → retention.** Analyst assertion with no measurement behind it; the two most-cited comparison titles run in opposite directions.
- **The retention effect of cadence compression.** Unverified — one title compressed and decayed anyway.
- Win-back reactivation and re-dormancy baselines (`${CLAUDE_SKILL_DIR}/references/churn-and-winback.md`); login-calendar effect sizes, pass completion and repurchase rates (`${CLAUDE_SKILL_DIR}/references/liveops-cadence.md`).
- Any retention **level** — D1/D7/D30, genre medians, percentile bands: `${CLAUDE_SKILL_DIR}/references/benchmarks.md` only, with its `## Do not quote` list. Never average across rows.
