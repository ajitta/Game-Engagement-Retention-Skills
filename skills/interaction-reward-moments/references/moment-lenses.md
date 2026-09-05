# Moment lenses

Read before generating or auditing candidate reward moments in a named scene.

A reward moment is a short interaction where anticipation, agency, uncertainty, feedback and meaning combine into an experience peak — a design term, never a claim about neurochemistry.

**Gate above all ten lenses: curiosity, not enjoyment.** Curiosity was the strongest enjoyment predictor and the *only* predictor of voluntary playtime; enjoyment did not predict playtime at all [Kao et al., CHI 2024 | n=1,699 Prolific adults, purpose-built action RPG | outcome = voluntary playtime in minutes]. A beat that answers every question is finished; a beat that leaves a specific answerable question about the player's own capability is the one they come back to.

## The ten lenses

1. **Anticipation** — the pre-outcome window, not the payoff, is the designed unit; skin-conductance slopes were higher during a 2-second box-shake than at baseline [Larche et al., *J. Gambl. Stud.* 2019 | viewers of 49 real Overwatch loot-box openings, df=39 | t(39)=−3.88, p≤.001]. Name the cue, its 1–2 s duration, and the expectation it bounds — a stagger bar or a charge attack does this with no money attached.
2. **Competence — three facets, opposite difficulty predictions.** Say which one the beat targets: *effectance* (I caused that), *task performance* (I succeeded), *capacity growth* (I am better than I was). Task performance is maximised under minimal challenge, capacity growth under high challenge, so "optimal challenge" is undefined until you pick [Deterding et al., *Motivation and Emotion* 2025]. Mastery moments are visible capacity-growth signals — first clear, personal best, before/after, a newly unlocked technique — not success confetti.
3. **Autonomy / meaningful choice** — foreseeable difference between options, immediate acknowledgment, occasional visible consequence, relational rather than a karma score; consequence-free QTEs and fake branches are read as "a bit emotionally manipulative" [*Computers in Human Behavior* 2024 | review + survey n=30 + video-elicitation interviews n=11, six moral-choice mechanics]. Expect *appreciation*, not enjoyment [Iten et al., CHI 2018].
4. **Risk and relief** — clutch recovery, comeback, forgiveness, re-entry. **[contested]** Near-miss raised urge, next-spin speed and bet size [Palmer et al., *Psych. Addict. Behav.* 2024 | four pre-registered slot studies, n=169/148/170/172]; against it, no conditionally reinforcing function, effects "limited or idiosyncratic" [Pisklak et al., *J. Gambl. Stud.* 2020 | pigeon + human extinction designs]. Net: faster and larger spending, not durable return. Relief is recovery from a *skill* failure; the relief is never the thing sold.
5. **Progress and near-completion** — the bar alone misleads, so put numeric remaining steps beside it near the goal and plan for a mid-journey dip rather than a smooth goal gradient. Evidence, populations and the two-sided difficulty window: `patterns-progress.md`.
6. **Recognition** — the product reflects the user's identity, effort or pattern back at them, *informationally* (what improved, why it was earned) rather than controllingly. Free-choice intrinsic motivation: engagement-contingent tangible rewards d=−0.40, completion-contingent −0.36, performance-contingent −0.28, positive feedback **+0.33** [Deci, Koestner & Ryan 1999 | meta-analysis]. "Log in and get X" loses; "here is what you got better at" wins.
7. **Transformation** — raw user input becomes a usable artifact: a reading, a summary, a plan, a build, a clip. The moment is the instant input becomes legible as output; the strong version lets the user carry the artifact out of the session.
8. **System synergy** — combos, chain reactions, emergent interactions, build completion. Carries the strongest curiosity question available ("does this build come online?") at zero randomness and zero money, so try it first when a scene must stay ethically clean.
9. **Sensory game feel (손맛)** — not a volume knob; two preconditions. **Contingency**: fires only on success and scales with degree of success — amplification that was *not* success-dependent lowered effectance (−.19) and competence (−.43) [Kao et al., CHI 2024 | n=1,699]. **Legibility**: one effect per action, occluding nothing the player must read. Dose is an inverted-U: "None" and "Extreme" both cut playtime, experience, intrinsic motivation and performance versus Medium/High [Kao, *Entertainment Computing* 2020 | N=3,018]. Ranges and accessibility bounds: `feel-and-accessibility.md`.
10. **Social and status** — MVP beats, team saves, shareable artifacts, ranking reveals, contribution visibility. Counter-rule on each: reward presence, never penalise absence, never gate a shared reward on one member's per-day quota. Manufactured obligation is relatedness *frustration*, which causes illbeing on a separate axis from the one satisfaction acts on [Ballou & Deterding, *Interacting with Computers* 2024].

## The strong-point test

Four of five, or the candidate is a decoration on an existing beat — say so instead of shipping it as a proposal.

- **Trigger is a game state, not a category** — "gauge ≤1 match from full and a 3-match of that colour exists on the board", not "after combat".
- **Agency inside the window** — the player commits, holds, aims, re-targets or chooses while the cue runs. Passive collection fails.
- **Contingent, legible feedback** — on success, graded by degree, one effect per action, occluding nothing.
- **Curiosity residue** — a specific question about *their own* capability that one more attempt would answer. If the only open question is "what will I get", the beat runs on chance.
- **Verifiable as a pair** — one telemetry event plus one PXI construct (curiosity, mastery, progress feedback, autonomy). The pair is mandatory because experience and behaviour dissociate: need satisfaction associated weakly or not at all with subsequent play, session length and return latency [Ballou et al., PsyArXiv 2026 | pre-registered, 555 U.S. players, 11k daily observations, 30-day multi-platform trace | **[contested]** — preprint, and BANGS's own authors still distribute the scale].

Never grade a candidate on a single "fun score": PXI's own validation reports weak evidence for a general player-experience score [CHI 2024 | n=1,518 players | 10-factor model fit best].

## Minimum-additions ladder

For a scene with no strong point. Apply in order, **stop at the first rung that produces one**.

1. A **pre-outcome cue** with a stated duration (1–2 s) and a bounded expectation.
2. **Something to do inside the cue window** — commit, hold, aim, re-target, choose.
3. **Uncertainty about the outcome of their own action**, not a dice roll. Uncertainty on a skill outcome is ordinary design; uncertainty attached to money or to a one-tap repeat is the harm surface.
4. A **readable outcome** — what happened, why, by how much, in gradations comparable across attempts.
5. A **next hook** that is the curiosity question, not the next reward.

Climbing past the rung that worked is the over-juicing failure mode (lens 9 inverted-U). If rung 5 yields nothing the scene is not a moment site: say so in one line and move to the adjacent beat rather than decorating this one.

## Numbers that do not exist

- **How many moments a loop should hold.** No published target; "3–5" bounds the length of an answer, not the design.
- **A moment-level → retention coefficient.** No study links visible choice consequences to D7/D30 return, and need-satisfaction scores do not forecast behaviour. Never present a moment redesign as a retention forecast — name the behavioural measure to record instead.
- **A transferable juice constant.** The one published multiplier, charge attacks needing 1.7× stronger presentation, is a within-prototype ratio between attack types in one 2D action game [Seki & Ishikawa, CHI EA '26 poster | adjustment N=16, validation N=116], not a cross-genre number.
- **Near-miss outside gambling.** No experiment located in a non-gambling game after 2017; do not import slot-machine near-miss numbers into a puzzle or action beat.
- **Korean-language instrument validation.** None established for PXI, miniPXI or any need-satisfaction scale. Back-translate, pilot and report item-level reliability rather than assume the published factor structure holds.
