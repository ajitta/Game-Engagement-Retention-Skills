# Reveal and Anticipation Patterns

Read this family when the beat under design turns on a hidden or uncertain outcome — a chest, a draw, a crit, a card flip, a daily reading, an end-of-episode cut — and the question is how to stage it.

**The mechanism, restated.** Do not describe any of these as variable-ratio reinforcement: direct tests on a loot-box simulator found the schedule-variability bump "short-lived" and no effect of variable reward magnitude [Young, Hancock, Watson, Howatt, Southern & Payne | 2026 | *Perspectives on Behavior Science*, human operant lab studies | loot-box opening decisions]. Two mechanisms do replicate. **Uncertainty raises wanting** — a 50%-predictive cue becomes *more* attractive than a 100% cue [Robinson & Berridge | 2025 | *Annu. Rev. Psychol.* 76 | incentive-salience review]. **Opaque odds raise willingness-to-pay** — censoring exact top-prize odds +~45%, showing a curated sample of best outcomes +~45%, both together +100%; unbiased distribution info moved WTP not at all [Cordes, Dertwinkel-Kalt & Werner | 2024 | *JEBO*, incentivized between-subject experiment, three-prize monetary lotteries | stated WTP]. The ethical line is **coupling**: uncertainty attached to skill outcomes and non-paid rewards is ordinary design; uncertainty attached to money, or to a one-tap repeat loop, is the harm surface.

## 1. Pre-outcome cue

**Use when** any outcome resolves in a discrete instant — chest, crit, stagger break, draw, reading.

- **Fires when** — the outcome is already determined but not yet shown, and the player is still present and attending.
- **Player does** — waits, or commits one last input under a bounded expectation ("this is at least a rare").
- **Feedback** — one cue that sets a *range*, held 1–2 s. Skin-conductance slopes were significantly greater during a 2-second anticipatory box-shake than baseline, t(39)=−3.88, p≤.001 [Larche, Chini, Lee, Dixon & Fernandes | 2019 | *J. Gambl. Stud.*, 49 real Overwatch opening videos | SCL slope]. The staging in that corpus: 2 s shake → coin reveal ~2 s → full reveal at 5 s.
- **Reward** — the consummation only confirms the expectation the cue set; put the design budget in the window, not the payoff.
- **Validation** — pre-reveal tier-guess accuracy against a chance baseline measured on the current build; share of players who watch the window rather than skipping.
- **Bound** — the window may not be sold, shortened by payment, or attached to a purchase surface. A cue that promises a range the outcome routinely undercuts is a false claim, not suspense.

## 2. Bounded uncertainty

**Use when** the player earns a randomized reward through play.

- **Fires when** — a challenge, route or run completes and a roll is due.
- **Player does** — chooses risk tier, category or timing *before* the roll — the uncertainty is entered, not imposed.
- **Feedback** — the category is visible pre-reveal (icon, colour, "무기 계열"); only the instance is hidden.
- **Reward** — one guaranteed floor plus a chance at a higher tier. A floor converts a gamble into a choice.
- **Validation** — repeat opt-in rate, perceived-fairness item, and whether players can state the odds unprompted.
- **Bound** — disclose per-item odds wherever stakes are meaningful, and never attach the roll to real money without the §5 spec. Banded odds ("희귀 5–10%") are inside the odds-censoring effect above, not outside it.

## 3. Staged reveal

**Use when** the payoff is large, rare, or personally significant.

- **Fires when** — a rare outcome, a set completion, or a first-time unlock lands.
- **Player does** — chooses pacing where possible: savor, skip, or make one consequential micro-choice mid-reveal.
- **Feedback** — 2–4 beats with distinct audio layers; rarer outcomes earn a longer arc. Instant reveals "compress arousal into brief peaks and can reduce felt control," while configurable pacing and consequential micro-choices during the reveal "extend the suspense arc and improve perceived control and fairness" [Tran & Zhao | 2026 | HCI study of Pop Mart's instant-reveal blind-box flow | perceived control, fairness] **[unverified — abstract only]**.
- **Reward** — the artifact plus a legible reason it was rare.
- **Validation** — skip-rate by tier (a high skip rate on the top tier means the arc is padding), and completion of the reveal on repeat encounters.
- **Bound** — skip must always exist and must never cost anything; a reveal that cannot be skipped is a forced ad for the product's own economy. Auto-advance chaining is forbidden (§5).

## 4. Near-miss handling **[contested]**

**Use when** an outcome lands close to a better one — a timing window missed by frames, a draw one pull from 천장, a 2-of-3 set.

- **Fires when** — the system can compute a margin the player could not otherwise see.
- **Player does** — reads the margin and decides whether to retry.
- **Feedback** — legible margin on **skill** outcomes only: how far off, in what direction, what would fix it. Never a manufactured "so close" animation on a random draw.
- **Reward** — information that shortens the next attempt. On paid draws, the only honest near-miss surface is the pity counter stated as a condition.
- **Validation** — retry rate paired with a *stated understanding* check ("what would you change?"); on any paid surface, spend-per-session and time-between-openings are the guardrails, not the success metrics.
- **Bound** — **[contested]** Four pre-registered slot studies found near-misses increased urge to continue, sped up the next spin, increased bet size, and were rated *more positively* than full misses [Palmer, Ferrari & Clark | 2024 | *Psychology of Addictive Behaviors* 38(6):716–727, n=169/148/170/172, 1-in-3 near-miss rate | urge, spin latency, bet size]. Against this, pigeon and human resistance-to-extinction designs "failed to provide evidence that near misses have a conditionally reinforcing function," calling any effect "limited or idiosyncratic" [Pisklak, Yong & Spetch | 2020 | *J. Gambl. Stud.* 36:611–632]. Do not resolve this. The safe reading both sides permit: near-miss reliably produces **faster and larger spending, not durable retention**, so it is never a retention lever.

## 5. Pull staging (확률형 아이템 / gacha)

**Use when** the deliverable is a paid or paid-adjacent random draw and its reveal sequence.

- **Fires when** — the player opens the pull surface. Streak *initiation* in the wild was tied to visible monetisation cues (temporary offers, on-screen virtual currency) [Borja-Block et al. | 2026 | *Frontiers in Public Health*, 490 livestreamed openings across 13 Twitch/YouTube streams, ~27h16m | coded opening sequences].
- **Player does** — one deliberate confirmation per pull batch, with spend-so-far visible at the point of confirmation.
- **Feedback** — per-item exact odds at both the purchase and the reveal surface; pity disclosed as a condition with the 0%-until-N structure stated; a post-N summary screen showing spend so far; cool-down after a rare outcome (the documented escalation point, §1).
- **Reward** — the item, plus a direct fiat path beside any currency path.
- **Validation** — inter-pull interval distribution and batch length. In the observational corpus, 93.1% of openings occurred inside multi-opening streaks, median 14.5 s between openings, 72.7% within 30 s, ~88% of in-streak openings followed by another, explicit stopping statements in only 3.7% of coded verbal moments; continuation was **not** explained by rarity, affect or near-misses, and streaks ended mainly when the flow of the sequence was disrupted.
- **Bound** — no auto-advance, no one-tap "open again". Removing near-miss animations is **not** a sufficient mitigation; the repeat affordance and the currency cues are what sustain the streak. Global "X just pulled a Legendary!" tickers, banded odds and streamer-only showcases are **belief-distorting demand inflation**, not social proof. Hidden or false odds on paid random items is `T1` — Korea 게임산업법 제33조 제2항 (in force 2024-03-22), 제33조의2 (2025-08-01); see `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md` before writing any market claim.

## 6. Fortune reading reveal (사주 · 운세 · 타로)

**Use when** the product delivers interpreted, personalized hidden information on a daily or occasional clock.

- **Fires when** — the day rolls over. Korean traffic peaks at midnight as users check *tomorrow's* fortune before bed; the appointment is **23:30–00:30 KST**, not a Western morning horoscope [포스텔러 self-reported via DBR/인터비즈 interview | 2024 | Korean fortune-app traffic | daily peak hour].
- **User does** — frames a question or picks a lens (work, relationship, self) before the reveal, which converts a passive read into an entered uncertainty.
- **Feedback** — two beats: pattern first, then interpretation, then a reflective question back to the user. The 일진 day boundary changes at 자시 (23:00), not 00:00, and schools disagree **[contested within the tradition]** — pick one rule and apply it identically in the reading engine, the push scheduler and the streak counter, or the same evening yields two fortunes.
- **Reward** — a saveable reading the user can annotate; the growth lever is shareability (MBTI-style self-labelling), never fear.
- **Validation** — question-submission rate, reading save rate, reflective follow-up rate. Do **not** validate on 부적/consultation conversion.
- **Bound** — readings framed as reflection or entertainment, never prediction; no fear copy; **no paid relief from a negative reading**. About a quarter of users arrive in distress: motives were fun 30.1%, New-Year curiosity 30.0%, psychological comfort 23.6%, answers to worries 22.9%, predicting the future 21.0% [롯데멤버스 라임 survey via 중앙일보 | 2025 | Korean fortune-app users, multiple response | self-reported motive]. Night push in Korea needs separate night-send consent, and an expiring-credit nudge is 광고성 정보 — see `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md`. A 시주-모름 path is mandatory and may never be a paywall gate.

## 7. Narrative beat reveal (cliffhanger, 회차 마지막 컷)

**Use when** an episode, chapter or session ends on an unresolved beat.

- **Fires when** — the episode's own question resolves and a new one opens — in that order.
- **User does** — chooses to continue now, later, or stop; the stop must be offered, not merely permitted.
- **Feedback** — the beat itself, plus a spoiler-safe recap on return that restates the reader's own prior choices.
- **Reward** — resolution next episode, reachable on a free path.
- **Validation** — **next-session return and season completion**, never same-session continuation or post-cliffhanger unlock revenue. Cliffhanger readers "desired a future story installment more," with no enjoyment or suspense difference [Schibler, Hahn & Green | 2023 | *Media Psychology*, cliffhanger vs protagonist-victory vs antagonist-victory endings | desire for next installment]; arousal rose but intention-to-continue was **not** supported [Wirz et al. | 2022 | *Psychology of Popular Media*, 3–4 drama episodes, electrodermal activity + cortisol | intention to continue]; the only behavioural evidence found the serial group maintained play duration and showed more moderate-to-vigorous activity at later visits while self-reported immersion and intention did not differ between groups [Lu et al. | 2023 | *Communication Research*, 44 children aged 8–12, four visits ≥5 days apart, accelerometers | play duration, MVPA].
- **Bound** — five reviewer-runnable tests replace the unauditable "is the tension legitimate" intent test: **unit-of-value** (the episode resolves at least one question it raised); **adjacency** (no purchase or unlock surface on the same screen or session segment as the unresolved beat); **late-hour** (past a local-time threshold, offer a closure variant or an explicit stop card — grounded in the arousal-and-sleep note above); **metric** (validated on next-session return and season completion, never on same-session continuation or post-cliffhanger unlock revenue — if only unlock revenue moves, it is a paywall dressed as tension); **recall** (the recap carries the tension, so curiosity replaces fear of having forgotten). 기다리면 무료 is `T4`, not forbidden — timer published per title, and either a sub-24 h refill clock so the appointment drifts (Piccoma's 23 h is the reference) or a fixed daily grant; the grant may be fixed, the expiry may not, so a free ticket never expires unused; a free path to the finale; and no purchase surface on the cliffhanger screen.

## The curiosity test, applied to every pattern here

After the beat, does the player hold a specific question **about their own capability** that another attempt would answer? If the only open question is "what will I get," the design is leaning on chance rather than curiosity. Curiosity was the strongest enjoyment predictor and the *only* playtime predictor; enjoyment did not predict playtime [Kao, Ballou, Gerling, Breitsohl & Deterding | 2024 | CHI, pre-registered, n=1,699 Prolific, purpose-built action RPG | voluntary playtime; curiosity–enjoyment .75–.76, curiosity–voluntary engagement .86]. Pair every survey measure with a behavioural one.

## Numbers that do not exist

- **No 2023–2026 experiment on near-miss in a non-gambling game** was located; the latest game-specific evidence remains Larche et al. 2017 (Candy Crush near-misses increased frustration and urge) **[unverified]**. Do not transfer slot-machine effect sizes to a puzzle or action game.
- **No study links visible choice consequences to real D7/D30 return** **[unknown]**. Measure replay starts and next-session return per variant instead.
- **No randomized cadence study exists for games, visual novels or webtoons** **[unknown]**.
- **No platform publishes 기다리면 무료 / wait-or-pay conversion rates** **[unknown]**.
- **No public D1/D7/D30 exists for any Korean fortune app.** 포스텔러's self-reported "~40% of the 2019 signup cohort still active" carries no stated retention definition — do not use it as a benchmark.
