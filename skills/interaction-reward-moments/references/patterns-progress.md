# Progress and Mastery Patterns

Read this when the beat under design is a bar, a set, a milestone, an unlock, or a proof that the player got better — IRM `moments` on a progression scene, `first-win` for the two-sided difficulty window below.

Per-pattern schema: **Fires when · Player does · Why it works · Feedback · Measure · Guardrail.** Random-outcome reveals are `patterns-reveal.md`; pass, quest and login expiry specs are `domain-ethics.md`.

## 1. Near-completion pull

- **Fires when** — a bar, set, quest, collection or map region is close enough to finish inside the current session.
- **Player does** — decides whether to continue, reroute, or spend a scarce resource to close it now.
- **Why it works** — the remaining distance is legible and the player, not the schedule, owns the decision to close it.
- **Feedback** — final-piece preview plus **numeric remaining steps near the goal**. Visual-only displays make people overestimate progress when far from the reward and *underestimate* it when near, driven by lower confidence, robust across bar, ring and marker formats [Bauer, Khamitov, Isaac & Sevilla, *JAMS*, online 2026-01-08, doi:10.1007/s11747-025-01133-1 | 9 studies, N=3,735, incl. a physical loyalty-card field experiment | **[unverified]** — abstract-level, effect size not read]. So: bar when far, bar **plus the number** when near.
- **Measure** — in-session continuation rate after the near-completion cue, against matched sessions without it.
- **Guardrail** — the target never moves after it is shown; no inflation of the remaining requirement mid-track.

## 2. Milestone markers on a long track

- **Fires when** — a track outlasts one session (season, collection, level band) and needs interior structure.
- **Player does** — reads distance to the next marker instead of distance to the end.
- **Why it works** — motivation is not a smooth climb. Gamified tracks show "non-monotonic motivation patterns across the stages, in contrast to the incremental patterns observed in conventional loyalty programs," with to-go vs to-date framing mattering at advanced stages [Hwang & Choi, *J. Retailing and Consumer Services*, 2026-02 | 4 experiments, N not reported in source | gamified vs conventional loyalty tiers]. **Plan for a mid-journey dip and put a marker in it.**
- **Feedback** — each marker names the capability or content it opens, not only the number reached; switch copy to "to-go" in the late stages.
- **Measure** — per-stage drop-off read as a curve, never a single completion rate.
- **Guardrail** — a stage no ordinary play schedule can reach is a false track, not a stretch goal.

## 3. Set completion

- **Fires when** — the player acquires a piece completing a visible or discoverable set (elements, cards, runes, roster, 도감 entry).
- **Player does** — routes toward the missing piece, sometimes choosing it over a stronger standalone item.
- **Why it works** — the payoff is a **new behaviour** the set enables, so completion carries competence information rather than a larger number.
- **Feedback** — the UI links the pieces, the ability visibly mutates, and the changed behaviour is demonstrable in the same session.
- **Measure** — set diversity across players; selection rate of the completing piece relative to its raw power.
- **Guardrail** — no single dominant set. If the last piece is obtainable only from a paid random draw, the set *is* a paid-random mechanic: read the T1 odds-disclosure row in `domain-ethics.md` before speccing it.

## 4. Unlock reveal (earned, non-random)

- **Fires when** — a threshold the player crossed by playing releases content whose identity is known or previewed.
- **Player does** — crosses the threshold, then holds a bounded anticipation window before the reveal resolves.
- **Why it works** — the arousal lives in the pre-outcome window, not the payout. Skin-conductance-level slopes were significantly greater during a 2-second anticipatory box-shake than baseline (t(39)=−3.88, p≤.001), and rarity graded post-reveal urge (legendary M=55.63, SD 29.46 > epic 40.00 > rare 32.84 on 0–100, all p≤.001) [Larche, Chini, Lee, Dixon & Fernandes, *J. Gambl. Stud.*, 2019 | 49 recorded real Overwatch box openings; shake 2 s, coin ~2 s, full reveal at 5 s | SCL/SCR + self-reported urge]. Loot-box context; the mechanism transfers to a stagger bar, a charge attack or a tier glow with no money attached.
- **Feedback** — cue → hold (1–2 s) → resolve, with pacing the player can configure. Instant reveals "compress arousal into brief peaks and can reduce felt control," while configurable pacing and a consequential micro-choice during the reveal "extend the suspense arc and improve perceived control and fairness" [Tran & Zhao, 2026, doi:10.1145/3772363.3798946 | Pop Mart blind-box flow, HCI study | **[unverified]** — abstract only].
- **Measure** — skip rate by session number (a rising skip rate on a mandatory animation is the instruction to shorten it), and the first action taken after the unlock.
- **Guardrail** — no auto-advance into a repeat; the unlocked thing must be usable in the same session or the reveal is a promissory note.

## 5. Mastery proof

- **Fires when** — the player's *capability* changed: first-time clear, personal best, a technique performed deliberately, a fight won without the crutch.
- **Player does** — nothing extra. The system notices and shows the before/after.
- **Why it works** — competence splits into three facets with opposite difficulty predictions: task performance ("I succeeded") "is logically maximised under minimal challenge, while competence as capacity growth is maximised under high challenge" [Deterding, Guckelsberger, Lintunen & Ady, *Motivation and Emotion*, open access 2025-09-26 | conceptual analysis of the optimal-challenge construct]. A mastery moment must target **capacity growth** by name, or it decays into generic success feedback.
- **Feedback** — a comparison, not a compliment: this run vs your first, moves used vs your record, the technique named so the player can ask for it again.
- **Measure** — voluntary re-attempt of the same content after the proof. Pair any experience scale with one behavioural measure.
- **Guardrail** — never compute the proof from something the player cannot influence. Knowledge-only progression (Blue Prince, Slay the Spire 2) needs a visible artifact — logbook, 도감, discovered-recipe list, annotated map — or a segment reports "no progression between runs" within days **[unverified]**.

## 6. Endowed progress and the goal gradient **[contested]**

- **What it is** — start the card at 2/10 rather than 0/8, so the same work reads as continuing rather than beginning.
- **Evidence** — the canonical numbers are a 2006 field study: **34% vs 19% completion** [Nunes & Drèze, 2006 | car-wash loyalty cards, field | **[unverified]**]. **No pre-registered replication in a game or app context 2022–2026 was found.** Ship it as a cheap A/B, never as a lever of known size.
- **Both sides in one line each** — *for*: the only direct field evidence is positive and large. *Against*: it presumes a monotonic goal gradient, which pattern 2 says does not hold in gamified tracks, so an endowment can land the player inside the dip rather than past it.
- **Guardrail** — the endowment must be real granted progress, not a relabelled requirement; 2/10 that is truly 0/8 is a false-scarcity presentation.

## The two-sided difficulty window

D0/D1 difficulty failure has two sides, and a diagnosis that tests only one misdiagnoses half the cases.

| Side | Telemetry signal | Evidence |
|---|---|---|
| Too hard | Repeated fails, then quit at a named step | Ascarza RCT 2025 |
| Too easy | High stars / low moves early, then churn | Drachen et al. 2016 |

- **Too hard, and fixable.** Lowering difficulty for at-risk players raised Retention-1/7/14 by **+2.70 / +2.46 / +2.0 pp** (control 29.5% / 64.3% / 74.3%), rounds +1.247, continue-within-10-minutes +2.13 pp, all p<0.0001, with net IAP **+$0.07 per average user** [Ascarza, Netzer & Runge, *IJRM* 42(4):975–995, 2025 | ~330,000 users, 12-week randomized rollout | one free-to-play mobile puzzle game]. Cost side, same paper: easier play "significantly decreases purchases in the specific round played," and the effect is heterogeneous — strongest for progress-prone users and previous payers. Frame DDA as **churn-risk relief for an at-risk cohort with a measured monetisation cost**, never as flow tuning.
- **Too easy, and usually missed.** Higher early skill signals — **fewer moves, more stars — were inversely related to retention**, i.e. some players find initial levels too easy; "Current Absence Time" dominates 7-day prediction models [Drachen et al., AIIDE 2016 | first-session/first-day telemetry predicting week-2 retention | title not named in source].
- **[contested] — objective balance may not be the channel at all.** *Against difficulty as a lever*: pre-registered, an MCTS opponent producing win rates of 100% / 12.8% / 5.9% had no significant effect on enjoyment (F=1.29, p=.277) or engagement (p=.183), and players did not notice the manipulation [Cutting, Deterding, Demediuk & Sephton, *R. Soc. Open Sci.* 10:220274, 2023 | n=311 | two matches, no no-DDA control]. *For it*: the Ascarza field RCT above moved retention at ~330,000 users. The proposed reconciliation — difficulty moves at-risk churn, not rated enjoyment — is unresolved, so carry both.
- **The cheap lever either way** is the **difficulty–expectation gap**, not the difficulty level: set the expectation before the attempt (ranked labels, previews, "this one is hard") and expose learning progress explicitly [*Scientific Reports*, Oct 2025, "Leveling up fun" | **[unverified]** — authors not confirmed, full text not opened].

## Numbers that do not exist

- **Endowed progress in a game or app.** No pre-registered digital replication 2022–2026 was located. 34%/19% is 2006 car-wash field data and must never be quoted as a game number.
- **The size of the progress-bar distortion.** Direction is documented, magnitude was not read. Do not state a percentage of over- or under-estimation.
- **Sample size behind the non-monotonic goal gradient.** Four experiments, N not reported in the source. Cite direction only.
- **A replication of the Candy Crush flow result.** No direct replication of Larche & Dixon (2020, n=60, Candy Crush) was found; its difficulty-tier finding does not generalise, and its "urge to keep playing" outcome is framed by its own authors as a risk marker, not a design objective.
