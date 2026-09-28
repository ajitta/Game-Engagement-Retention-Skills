# Research Basis — Reward Moments

Read this when a moment proposal needs its mechanism named, a number defended to a stakeholder, or a claim checked before it enters a design doc.

## Vocabulary that does not survive

| Drop | Use instead |
|---|---|
| dopamine point / dopamine hit | reward moment, outcome beat |
| triggers dopamine | resolves an expectation |
| variable ratio = engagement | uncertainty raises *wanting* |
| this feels rewarding | rated competence X / curiosity Y (PXI) |
| tune into the flow channel | make success gradations legible; set the difficulty expectation |

**"Dopamine point" is deleted as a term**, not softened: striatal dopamine is unmeasurable at the product layer, so the term replaces an argument with an appeal to authority; it asserts *liking* while the mechanism it names delivers *wanting* (Robinson & Berridge, *Annu. Rev. Psychol.* 76, 2025, 30-year review); and "we engineered a dopamine hit" reads to a regulator as an admission of intentional compulsion design.

## RPE — one contested lens, not the mechanism

Three clauses only: (a) a legible baseline expectation is the precondition for an outcome that can exceed it; (b) fully predicted rewards stop producing a prediction signal, so fixed unvarying rewards decay in salience; (c) product-level dopamine claims are unmeasurable and never appear in a design document.

Still "likely one of the most replicated findings in all of neuroscience" (Dudhabhate & Costa, *Front. Comput. Neurosci.*, 2026, review) — but its own field downgraded the original form as "probably too simple," dopamine also tracking salience, novelty, vigor and learning rate (Gershman et al., *Nature Neuroscience* 27:1645–1655, 2024, synthesis review). **[contested]** One 2025 study finds force and licking "fully account for DA dynamics traditionally attributed to RPE" (Bakhurin et al., *Nature Communications* 16, 2025; head-fixed mice, Pavlovian task, n=4 DAT-cre + 6 WT in the inhibition arm) — one lab, one paradigm, small n: *contested*, never *refuted*.

What survives at product level is a **measurement split**: track urge-to-continue separately from enjoyment, and flag any design whose urge metric rises while enjoyment stays flat.

## Anticipation — the pre-outcome window is the designed unit

Skin-conductance slopes were significantly greater during the 2-second anticipatory box-shake than at baseline (t(39)=−3.88, p≤.001); post-reveal, rarity graded SCR, mouse-press force, post-reinforcement pause and urge to open more (legendary M=55.63 > epic M=40.00 > rare M=32.84 on a 0–100 urge scale, all p≤.001) — Larche et al., *J. Gambl. Stud.*, 2019; 40 participants, 49 real Overwatch openings (2 s shake, coin ~2 s, reveal at 5 s). The arousal sits in the 1–2 s *before* the outcome; consummation only confirms it. This is the honest form of the RPE intuition, and it transfers to a stagger bar, a charge attack, a chest-tier glow or a card flip with no money attached.

## Contingency and dose — the conditions on juice

Swink's *Game Feel* real-time-control framing stands as the base. Four conditions added since:

- **Contingency.** Success-**dependent** amplified feedback raised competence, curiosity, effectance and enjoyment; amplification *not* dependent on success **lowered** effectance (−.19) and competence (−.43). Voluntary playtime 6.17 min (standard) → 10.18 min (amplified + success-dependent + varied). Kao et al., CHI 2024, pre-registered, n=1,699 Prolific, purpose-built action RPG. Over-amplification "occludes causal action-feedback links or flattens success gradations."
- **Dose is an inverted U.** "None" and "Extreme" juiciness both reduced playtime, player experience, intrinsic motivation and performance versus Medium/High (Kao, *Entertainment Computing*, 2020, N=3,018).
- **Err low, scale by weight, allow tuning.** Random settings judged "excessive 45% of the time"; charge attacks needed 1.7× stronger presentation than normal ones (within-prototype ratio, not a transferable multiplier); preference spans a 6-fold range across three types (Seki & Ishikawa, CHI EA '26 poster; adjustment N=16, validation N=116, one 2D action prototype).
- **Three make-or-break features:** "hit stop, sound coherence, and camera control may strongly influence players' impact feel" (Lin et al., IEEE GEM 2022; 281,720 Chinese-language Steam comments, 96 fighting games, 5,000 hand-annotated, 44 ranked). Chinese-only corpus, camera finding rests on five beat-'em-ups — keep the "may."

Latency is a precondition, not polish: agency tracks *absolute* action–outcome delay, not its subjective discriminability (Erdogan & Balcı, *QJEP*, 2024), so it degrades whether or not the player notices. With **identical** delays, 57.36% of comparisons favoured the sequence merely labelled "optimized" (*MTI* 9(5):47, 2025, 60 participants) — real, but a manipulation, not a lever.

## Curiosity, not enjoyment, predicts continued play

Same CHI 2024 experiment (n=1,699): "curiosity emerged as the strongest enjoyment and only playtime predictor… Contrary to theoretical predictions, enjoyment did not predict playtime." Curiosity–enjoyment .75–.76; curiosity–voluntary engagement .86; enjoyment–playtime not significant. Mechanism: motivation comes from reducing uncertainty over *action success*, which requires legible, differentiated feedback. Converging from the other side, need satisfaction showed "weak or null associations with short-term gaming behavior, including subsequent play, session length, and return latency" (Ballou et al., PsyArXiv preprint, 2026; pre-registered Study 1 = 11k daily observations, 555 U.S. players, 30 days of trace data; **not peer-reviewed as of 2026-09**).

A satisfying moment is therefore not the one rated most pleasant at the outcome; it is the one leaving a **resolvable open question about the player's own success** that the next attempt answers. If the only open question is "what will I get," the design leans on chance, not curiosity.

## SDT — name the need and the facet, never the checklist

- Ryan, Rigby & Przybylski (*Motivation and Emotion*, 2006) stays as the classic, with the 2024 caveat that HCI games research applies SDT "perfunctorily" as an "oft-unquestioned paradigm" (Tyack & Mekler, *ACM TOCHI* 31(3), 2024; audit of N=259 SDT-based games papers). The named failure mode is the three-item checklist with no mechanism and no falsifiable prediction.
- **Need frustration is a separate axis:** "need satisfaction fosters wellbeing… while need frustration causes illbeing" (Ballou & Deterding, BANG model, *Interacting with Computers* 38(3), 2024). The paper does **not** identify which design elements cause frustration — it is a review question, not a lookup table. Operationally: coercion (autonomy); competence *undermining* — rank loss, retroactive nerfs, punished absence, not merely absent support; exclusion or obligation — alliance duty, guild guilt.
- **Competence is three facets with opposite difficulty predictions:** "competence… as task performance is logically maximised under minimal challenge, while competence as capacity growth is maximised under high challenge" (Deterding et al., *Motivation and Emotion*, 2025). Effectance / task performance / capacity growth — say which one a moment targets. A **mastery moment is a capacity-growth signal** (first clear, personal best, before/after comparison, newly unlocked technique), not generic success feedback.
- **Rewards are informational or controlling.** Free-choice intrinsic-motivation base rates: engagement-contingent tangible rewards **d=−0.40**, completion-contingent **−0.36**, performance-contingent **−0.28**, positive feedback **+0.33** (Deci, Koestner & Ryan, 1999 meta-analysis). A reward carries competence information — what improved, why it was earned — or it costs motivation.
- Need-satisfaction scores are **not** a leading indicator of D1/D7/D30. Never sell SDT as a retention forecast.

## Difficulty and DDA — churn-risk relief with a monetization cost

The v1 citation was misread. PMC8943660 is **Larche & Dixon, *J. Behav. Addict.* 9(3), 2020, n=60, Candy Crush**: easy levels produced the least flow, and flow added **21.8% of variance in "urge to keep playing" beyond arousal** — which the authors read as a risk marker ("high flow may in part account for why problem players report playing for longer than intended"). It belongs to the ethics review, never to the objectives list.

Fisher & Kulshreshth (*Virtual Worlds*, 2024) is a methods survey and carries no retention claim. The retention evidence is a field RCT: easing difficulty for **at-risk** players raised Retention-1/7/14 by **+2.7 / +2.5 / +2.0 pp** (p<0.001), net **+$0.07 per average user**, while "significantly decreas[ing] purchases in the specific round played" (Ascarza, Netzer & Runge, *IJRM* 42(4):975–995, 2025; ~330,000 users, 12-week randomized rollout, free-to-play mobile puzzle). Pulling the other way, early *skill* signals — fewer moves, more stars — were inversely related to retention (Drachen et al., AIIDE 2016): "too easy for skilled players" is a separate failure mode.

## Uncertainty — what replicates, what does not

- **Variable-ratio scheduling is not an engagement lever.** Players "initially opened loot boxes more on highly variable schedules, but the effect was short-lived," variable reward *magnitude* had no effect, and human operant work "often fails to replicate the results of animal learning studies" (Young et al., *Perspectives on Behavior Science*, 2026; modified open-source loot-box simulator). Whether loot boxes even *are* VR is itself contested. Delete the schedule taxonomy.
- **Uncertainty raises wanting.** "An uncertain cue that predicts a reward on 50% of occasions becomes more attractive… than a cue that predicts a reward 100% of the time"; dopamine mediates wanting "but not their hedonic impact (liking)" (Robinson & Berridge, 2025).
- **Odds opacity raises willingness to pay.** Censoring exact top-prize odds ~**+45%**; a curated sample of best outcomes ~**+45%**; both together **+100%**; unbiased distribution information changed WTP not at all (Cordes, Dertwinkel-Kalt & Werner, *JEBO*, 2024; incentivized between-subject experiment, three-prize monetary lotteries). The authors call it a lower bound.
- **Repeat opening is sustained by the affordance, not the reward.** 93.1% of openings sat inside multi-opening streaks, median 14.5 s apart, explicit stopping statements in 3.7% of coded verbal moments; initiation tracked visible monetization cues, continuation was **not** explained by rarity, affect or near-misses (Borja-Block et al., *Frontiers in Public Health*, 2026; observational, 490 livestreamed openings across 13 streams). Removing near-miss animations is not sufficient mitigation; removing one-tap "open again" is closer to the mechanism.

**The line is coupling, not randomness.** Uncertainty on skill outcomes and non-paid rewards is ordinary design; uncertainty coupled to money or to a one-tap repeat loop is the harm surface.

## Measurement — PXI is the default instrument

| Instrument | Status | Use for |
|---|---|---|
| PXI (10 factors) | independently validated, n=1,518, CHI 2024 | default playtest survey |
| miniPXI (11 items) | reliabilities .51–.83, mean .68 | fast A/B iteration only |
| PENS | proprietary (Immersyve) **[unverified]** | licensed studio work only |
| BANGS (18 items) | 5 studies, n=1,246; CSDT withdrew it | experience, not behaviour |
| One behavioural pair | required alongside any scale | replay, return within 24h |

PXI's original 10-factor model fit best (AIC 120417, lowest of the compared models), and two published caveats travel with it: the immersion factor is weak, and there is "weak evidence of a general player experience score" — **never collapse results into one fun score**. Its factors double as moment vocabulary: ease of control, challenge, progress feedback, goals and rules, audiovisual appeal (functional); meaning, mastery, curiosity, immersion, autonomy (psychosocial). Because experience scores and behaviour dissociate, every scale ships paired with one behavioural measure.

## Wellbeing — need frustration and exit quality, not playtime

Playtime is the wrong ethics axis in both directions. A registered report found no wellbeing effect of playtime larger than the pre-registered smallest effect of interest (0.06 scale points per extra daily hour), with >95% power to declare equivalence (Ballou et al., *Technology, Mind, and Behavior* 5(1), 2024; n=414 Xbox players, 12 weeks, ~100,000 logged hours); a 2025 replication (*R. Soc. Open Sci.* 12:241174; n=703 U.S. adults, >140,000 hours across 150 Switch games) found the same null at every timescale, while **"gaming life fit" — the perceived value of one's own gaming — did predict wellbeing**. Against that, lottery-allocated console access during Japan's 2020–2022 shortages cut psychological distress 0.60 SD (Switch) and each extra daily hour improved mental health 0.20 SD, diminishing beyond ~3 h/day (Egami, Hoshino et al., *Nature Human Behaviour*, 2024; n=97,602 respondents, 8,192 in console lotteries; pandemic-setting caveat by the authors). The two are compatible — access effects versus marginal hours among established players — and neither licenses "more play is good" or "more play is bad."

Four instrumented checks replace the time axis: **need frustration** (coercion, competence undermining, manufactured obligation), **life fit** (regret, play past an intended stop), **spend relative to means**, **exit quality**.

Exit quality is designable: "disengagement from games should be constructively designed, allowing players to exit play sessions in a self-determined way" (Alexandrovsky et al., CHI PLAY 2024; 16 interviews + 111-person survey); a 2025 companion study (13 children aged 4–9, 12 parents) found children struggle to exit before reaching closure. Practical form: a natural stopping point, a closure beat, no autoplay "one more" chaining, a visible end-point matching the player's planned duration.

## Numbers that do not exist

- No direct replication of Larche & Dixon 2020; generalization beyond Candy Crush is untested.
- No 2023–2026 near-miss experiment in a *non-gambling* game; the latest game-specific evidence is Larche et al. 2017 (Candy Crush near-misses raised frustration and urge).
- No pre-registered digital replication of endowed progress; the canonical 34%-vs-19% completion figures remain Nunes & Drèze's 2006 car-wash field study.
- No evidence linking visible choice consequences to D7/D30 return; replay decisions track "the likelihood of seeing something new… versus the effort required to replay" (Wang, Ang & Mitchell, PACM HCI 2021, n=12).
- No Korean-language validation of PXI, miniPXI or any need-satisfaction instrument — pilot with back-translation and report item-level reliability rather than assume the published factor structure holds.
- No head-to-head RCT of gamified vs non-gamified versions of the same mental-health app.
- No quantitative estimate of post-break streak abandonment in apps.

## Contested — carry, do not resolve

- **Flow / challenge–skill balance.** *Null:* objective difficulty–skill ratio moved neither enjoyment (F=1.29, p=.277) nor engagement (p=.183) despite a working manipulation — win rates 100% / 12.8% / 5.9% (Cutting et al., *R. Soc. Open Sci.* 10:220274, 2023, pre-registered, n=311). *For:* flow theory concerns *perceived* not objective balance, the study ran two matches with no no-DDA control, and difficulty does move behaviour for at-risk cohorts (Ascarza 2025).
- **Near-miss.** *For:* near-misses raised urge to continue, sped the next spin and increased bet size, and were rated *more positively* than full misses (Palmer, Ferrari & Clark, *Psych. Addict. Behav.* 38(6), 2024; four pre-registered online slot studies, n=169/148/170/172). *Against:* resistance-to-extinction designs in pigeons and humans "failed to provide evidence that near misses have a conditionally reinforcing function," any effect "limited or idiosyncratic" (Pisklak, Yong & Spetch, *J. Gambl. Stud.* 36, 2020). Net: faster and larger spending, not durable retention.
- **Streaks.** *For:* highlighting an *intact* streak raised re-engagement while highlighting a *broken* one lowered it — 66.23% vs 57.86% continued the same exercise on identical underlying behaviour, the drop reduced when repair is offered (Silverman & Barasch, *J. Consumer Research* 49(6), 2023; 7 studies, >4,000 participants incl. language-app field data). *Against:* backfire evidence is qualitative, small-n and exercise-domain only — sadness, anger, running through injury (Dombrowski group, medRxiv preprint, 2024, n=17 streakers at 100–5,000+ days); all-or-nothing thinkers choose complete inaction over a reduced version (Segar, *BMC Public Health* 26:298, 2025, n=27).
- **Gamification in mental-health apps.** *Against:* across 79 RCTs of depression and anxiety apps, attrition was lower in trials offering reminders, human contact and **no gamification features** (Liu, Torous, Linardon et al., *JAMA Psychiatry* 83(1):43–50, 2026; 92 app conditions, search through May 2025). *For:* a trial-level moderator, not a head-to-head randomization; prediction intervals are enormous (post-test attrition PI 2.4–68.3); gamified apps modestly helped physical activity (*eClinicalMedicine* 2024, 36 RCTs, n=10,079) and smoking cessation (RR 1.91 within 6 months decaying to 1.37; *Tobacco Induced Diseases* 2025, 15 RCTs, n=5,075). Scope the claim to mental-health trials.
