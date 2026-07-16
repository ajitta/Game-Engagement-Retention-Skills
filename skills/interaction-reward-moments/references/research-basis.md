# Research Basis

Use this file to ground analysis. Keep the final answer practical; cite sources only when the user asks for research detail or when making a contested claim.

## Core Model

Treat a "dopamine point" as an engagement peak created by:

```text
cue -> expectation -> player action/choice -> uncertainty/tension -> outcome -> immediate feedback -> next goal
```

The design target is not chemical certainty. The useful design target is a moment where the player feels "I caused that", "I almost lost", "that was better than expected", "my build is coming online", or "one more try will be different".

## Evidence-Informed Levers

### Reward Prediction Error

Dopamine research often describes reward prediction error: the gap between expected and received reward. In game design terms, a strong moment often needs a clear baseline expectation and a bounded way for the outcome to exceed it.

Design translation:
- Show a cue before the result: elite glow, chest tier, boss stagger bar, combo meter.
- Let the player influence the outcome through timing, aim, routing, build, risk, or resource spend.
- Occasionally exceed expectation, but keep the range legible and fair.
- Avoid making every outcome surprising; constant surprise destroys competence and trust.

Sources:
- Schultz, "Dopamine reward prediction-error signalling: a two-component response", Nature Reviews Neuroscience 17(3):183-195, 2016. DOI 10.1038/nrn.2015.26: https://pubmed.ncbi.nlm.nih.gov/26865020/
- Schultz, "Dopamine reward prediction error coding", Dialogues in Clinical Neuroscience, 2016: https://pmc.ncbi.nlm.nih.gov/articles/PMC4826767/
- Hollerman and Schultz, temporal reward prediction during learning, Nature Neuroscience, 1998 PDF: https://www.hms.harvard.edu/bss/neuro/bornlab/nb204/papers/Hollerman_Schultz_NatNeuro_1998.pdf

### Reinforcement Schedules

Schedules affect how players anticipate rewards:
- Fixed ratio: reward after N actions. Good for mastery counters, combo thresholds, crafting progress.
- Variable ratio: reward after unpredictable action counts. Powerful but high-risk when tied to spending or compulsion.
- Fixed interval: reward after fixed time. Good for pacing, but can create waiting behavior.
- Variable interval: unpredictable time-based reward. Use carefully and transparently.

Design translation:
- Use fixed progress for core advancement.
- Use bounded random bonuses for spice, not for required progression.
- Reveal odds or guarantee pity/caps when chance matters.
- Keep real-money purchases and escalating ad-view loops away from variable reward pressure.

Sources:
- OpenStax Psychology 2e, "Operant Conditioning": https://openstax.org/books/psychology-2e/pages/6-3-operant-conditioning
- Lumen Learning, "Reinforcement Schedules": https://courses.lumenlearning.com/waymaker-psychology/chapter/reading-reinforcement-schedules/

### Flow and Challenge-Skill Balance

Flow-oriented design keeps challenge close to player skill. Too easy becomes dull; too hard becomes anxiety or frustration. In games, "near success" can be strong only when failure feels understandable and recoverable.

Design translation:
- Give players readable failure causes.
- Create "almost got it" states: boss at 7%, timer at 3 seconds, puzzle one move away.
- Tune difficulty around observed skill, not average skill alone.
- Validate dynamic difficulty per game; do not assume it always improves retention.

Sources:
- "The relationship between the skill-challenge balance, game expertise, flow and the urge to keep playing complex mobile games": https://pmc.ncbi.nlm.nih.gov/articles/PMC8943660/
- Fisher and Kulshreshth, "Exploring Dynamic Difficulty Adjustment Methods for Video Games", Virtual Worlds, 2024: https://www.mdpi.com/2813-2084/3/2/12

### Self-Determination Theory

Self-determination theory maps well to game motivation:
- Competence: "I am getting better."
- Autonomy: "My choice mattered."
- Relatedness: "Other players or characters recognize my contribution."

Design translation:
- Pair reward moments with skill proof, not only loot.
- Offer 2-3 meaningful choices at reward moments.
- In social games, surface contribution clearly: save, assist, clutch, support, build role.

Sources:
- Ryan, Rigby, Przybylski, "The Motivational Pull of Video Games", Motivation and Emotion, 2006: https://link.springer.com/article/10.1007/s11031-006-9051-8
- Author PDF: https://selfdeterminationtheory.org/SDT/documents/2006_RyanRigbyPrzybylski_MandE.pdf

### Game Feel and Feedback

Reward moments become memorable when feedback is immediate and readable. Feedback should communicate cause and effect, not just decorate the screen.

Design translation:
- Stack small feedback layers: animation snap, sound, hit stop, camera impulse, particle, UI meter, haptic.
- Match feedback magnitude to gameplay significance.
- Avoid obscuring important state with effects.
- Make failure feedback as readable as success feedback.

Useful reference:
- Steve Swink, *Game Feel: A Game Designer's Guide to Virtual Sensation*.
- Game Programming Patterns, "State", for reward moment state-machine thinking: https://gameprogrammingpatterns.com/state.html

### Ethical Guardrails

High-engagement design becomes manipulative when it undermines autonomy, hides probabilities, pressures spending, or stretches frustration to sell relief.

Design translation:
- Flag designs based on FOMO, hidden odds, forced streaks, time gates that punish real life, or pay-to-skip pain.
- Prefer transparent odds, cosmetic-only randomness, earned guarantees, and player-controlled session boundaries.
- When monetization is present, separate engagement analysis from purchase pressure analysis.

Sources:
- Internet Policy Review, "Gaming the mind: Unmasking dark patterns in video games": https://policyreview.info/articles/news/unmasking-dark-patterns-video-games/1739
- Veiga et al., "Dark Patterns in Games: An Empirical Study of Their Harmfulness", ICEIS 2025: https://www.scitepress.org/Papers/2025/133658/133658.pdf

## Validation Methods

Use at least one behavioral, one qualitative, and one safety check:

- Behavioral telemetry: retry rate, voluntary replay, time-to-next-action, combo attempts, build-choice diversity, abandonment point, return rate.
- Moment telemetry: cue shown, action taken, outcome, reward tier, failure reason, next action within 10-30 seconds.
- Playtest observation: facial/body response, verbal "again" moments, frustration comments, confusion points.
- Survey: perceived agency, fairness, clarity, excitement, mastery, desire to replay.
- Safety: spending pressure complaints, hidden odds confusion, FOMO stress, grind fatigue.

Do not optimize only for retention. A manipulative loop can retain players while damaging trust.
