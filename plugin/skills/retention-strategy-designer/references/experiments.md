# Retention Experiment Design

Read when the answer must say how a change gets measured — RSD `instrument` and `economics` modes, any card's 측정 / 가드레일 / 중단 bullets, or when a user asks whether their change can be tested at their scale.

## Baseline before ship

Record the primary metric and every guardrail on the current build, on the cohort key the read will use, **before** the change reaches anyone: without a pre-period there is no variance reduction and nothing to compare against if the test gets downgraded. Pre/post alone cannot separate the change from seasonality, a UA-mix shift or a store feature — it is not the fallback, it is what holdouts exist to replace.

## Can this be tested at all — power and MDE

Per-arm sample for a two-sided 5% test at 80% power: **n ≈ 7.84 · 2p(1−p) / δ²**.

| Primary metric, baseline | Effect sought | n per arm |
|---|---|---|
| D1, 22% | +2pp absolute | ~6,700 |
| D7, 4% | +1pp absolute | ~6,000 |
| D7, 4% | +10% relative (0.4pp) | ~37,600 |
| D30, 0.7% | +0.2pp absolute | ~27,200 |

Baselines are market medians [GameAnalytics 2026 report | 2025 data | 16,262 live mobile games ≥1,000 MAU | UTC calendar day, strict N-day]. Substitute the team's own baseline whenever one exists.

**The gate:** weekly new users ÷ arms × enrollment weeks ≥ n per arm. Three consequences — **D30 is almost never a viable primary metric for a small product** (monitor it as a guardrail); relative framing costs roughly an order of magnitude more sample than absolute; and most published intervention effects are single-digit relative (a feature RCT moved session-ending hazard −11%, abandonment −14%), so powering for a 20% lift powers for a result that will not happen.

**Mandatory downgrade when the sample cannot support a test.** Never run an underpowered A/B and read it anyway. Instead: (1) before shipping, write the expected direction, the metric, the threshold worth acting on, and the observation window; (2) ship to everyone, comparing against the recorded baseline plus the same phase of the previous weekly or seasonal cycle; (3) report it as **directional, not significant** — no p-value, no "proved" — and name the confounds left uncontrolled.

## One pre-registered primary metric

One metric per experiment, defined as a **return event** at the product's natural interval, declared together with its guardrails before the read. Guardrails are metrics "that the experimenters wish to avoid negatively impacting", and the point is that they are declared before rather than selected after (Larsen, Stallrich, Sengupta, Deng, Kohavi & Stevens, *The American Statistician* 78(2):135–149, 2024, https://arxiv.org/abs/2212.11366). Canonical shape to watch for: click-bait lifts click-through short term and damages retention and revenue long term.

**Mandatory guardrails** — all of these, and at least one user-harm metric:

- uninstall rate · notification opt-out rate · support-complaint rate · refund rate
- **sessions initiated and active days**, not session length: in the Pandora ad-load experiment ~40% of the decline came from users no longer active at all and ~42% from fewer active days, only ~18% from shorter sessions
- one user-harm metric matched to the mechanic — top-decile spend concentration for anything monetised, 강제 / 부담 / 매일 keyword frequency in store reviews, minors' share of the affected cohort wherever the minors overlay applies

## Novelty, τ(t), and when to read

The treatment effect is not a constant; it is "a function of [time]: τ(t)" (Larsen et al. 2024). Novelty flatters a change and fades; primacy does the reverse.

- **Two full weekly cycles minimum** of exposure before any read, with an explicit decay check.
- **Re-measure at week 3–4** on the same arms and report both readings. A lift that has halved by then was novelty.
- Short tests are optimistic, not conservative: in a 21-month randomised experiment on ~35M Pandora listeners, effects kept growing and stabilised only after 12–15 months, so **a one-month test understates churn by about 3×** (Goli, Huang, Reiley & Riabov, *QME* 2025, https://arxiv.org/abs/2412.05516). Assume any change trading user experience for revenue is under-measured at one month.

## No peeking

Fixed-horizon p-values are "wholly unreliable" under continuous monitoring; always-valid p-values exist for exactly this case (Johari, Pekelis & Walsh, https://arxiv.org/abs/1512.04922). Either fix the horizon and look once, or use a sequential method — which is also the ethical requirement, since it is what allows a harmful treatment to be aborted quickly without inflating Type I error (Larsen et al. 2024).

**CUPED** (variance reduction on pre-period covariates) is the standard way to buy power without more users, and the second reason the baseline is recorded first. It helps most where a pre-period metric exists — returning players, not fresh installs. **[unverified]** No CUPED effect size exists in this evidence base: cite the review, never a percentage.

## Holdouts and cohort construction

- **Per experiment.** Hold a randomised slice out for the whole observation window, not just launch week.
- **Long-term global holdout.** A small permanent slice excluded from LiveOps changes and read quarterly is the only way to see cumulative effects a single two-week test cannot. The Pandora 12–15-month result is the argument for it; no published benchmark sets its size.
- **Win-back.** A randomised holdout of *matched lapsed users* is mandatory, and the primary metric is **re-dormancy** — share still active at +7d and +30d after return — not the reactivation click, which any large bribe inflates.
- **Cohorts.** Same-week cohorts are necessary, not sufficient; add acquisition channel as a second dimension with the direction corrected. Non-organic sits at parity or slightly ahead at D1 (26.9% vs 26.1%), the organic advantage opening only later (D7 10.3 vs 9.7; D30 4.5 vs 3.6) [AppsFlyer uninstall report | 2024 data | 2.2K apps, 1.3B installs, 402M uninstalls] — so paid cohorts need **D7–D30 depth work**, not the intuitive D1 fix. The gap is smallest in games and partly artifact (organic uplift, branded-search cannibalisation, post-ATT signal loss): a cohort dimension with a causality caveat, never a rule.
- **Gacha reroll contamination.** Rerollers inflate the install denominator and depress D1 for reasons unrelated to design. Airbridge collapses same-device same-date duplicate installs to the last one; multi-account and multi-device rerolls are not. **[unverified]** — no dataset here quantifies reroll share, so compute a second D1 on a post-tutorial or post-first-gacha denominator and compare, rather than inventing a correction factor.

## Selection bias — the claims to refuse

Any metric computed on people who already did the thing measures selection into the thing.

- **Streaks.** A 7-day streak correlating with 3.6× course completion is selection, never a lift. Only two Duolingo streak figures are A/B effects: two equipped Streak Freezes → **+0.38%** DAU, and new streak animations → **+1.7%** D7 of brand-new learners (Duolingo research blog, 2022, https://blog.duolingo.com/how-duolingo-streak-builds-habit). Trophy's 17.2-vs-11.6-days (+48%) freeze claim is own-platform vendor data.
- **Rewarded ads.** Engagers were 4.5× more likely to make an IAP, spend rose 326% in the 7 days after first engagement, and D30 was ≥50% for users completing one rewarded ad in week 1 against a 13% all-app benchmark — **all self-selected, no randomisation** [Unity | 2022 | 8 high-DAU apps]. The usable figure from the same vendor is a design choice, not a user trait: 38.1% engagement at a resource-out pinch point vs 23.8% between levels (Unity, 2024).
- **Payers.** "Buyers retain ~3×" has the identical shape — a payer cannot be observed before they pay. Use payer splits to size a segment, never to argue a purchase surface causes retention.
- **Vendor "causal" studies on self-selected participants** — Discord's median +25% active game days and +16% sessions for linked players, across 15+ games that chose to integrate its Social SDK (Discord, GDC 2026).

## Pair every read with qualitative

A number says which window leaks, never why. Two cheap instruments, on the same cohort as the experiment:

- **Churn exit survey** at the lapse point or on re-open, asking *cause* rather than satisfaction, with a category-exit vs competitor-switch branch. Of Coupang's 2.36M churned users, **90.3% left the shopping category entirely** and only 9.7% moved to a competitor [Mobile Index | Mar 2026 | Korean app panel]; a win-back offer aimed at category-exiters is wasted spend.
- **Moderated first sessions** on the changed build — a handful watched live is the only way to catch a comprehension failure that reaches the dashboard as an undifferentiated D1 drop.

## Rollout and rollback

| Field | Value |
|---|---|
| Remote config | Every constant the change introduces — rewards, timers, thresholds, cadence, caps — is server-tunable, so a revert is a config push, not a store submission |
| Staged rollout | Widen only after a stage has run one full daily cycle including a weekend day; the stage ladder is a team convention, not a benchmark |
| Rollback trigger | Written before launch, numeric, stated against the **recorded pre-period baseline**: the metric, the threshold, the window, and who may pull it |
| Trigger fires on | Guardrails plus crash/ANR — never the primary metric, which may sit flat while τ(t) resolves |

## Numbers that do not exist

Say so; do not substitute a plausible figure.

- **Win-back / reactivation lift.** No 2024–2026 primary dataset. Vendor claims of "10–25% of lapsed users recovered" and "5–10× cheaper than acquisition" carry no methodology — do not quote them.
- **Re-dormancy.** No published benchmark at any horizon; each product builds its own.
- **Login-calendar A/B results, battle-pass completion rate, season-over-season repurchase rate, pass-fatigue percentage.** None published by any vendor, first party or academic source for 2024–2026.
- **CUPED effect size**, and **reroll share of installs**, in this evidence base.
- **Recap systems on return**, and **in-game stopping cues** (wrap-up screens, "you're caught up") — no published experiment on either.
- **Streak-break abandonment in apps** — no quantitative estimate; the backfire evidence is small-n qualitative and **[contested]**, and the same literature argues for keeping streaks with free repair.
- **Korea-specific install-cohort D1/D7/D30** — verified absence; build an internal baseline and use the Japan rows only as a stated proxy.
