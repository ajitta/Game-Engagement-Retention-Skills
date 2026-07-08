---
name: interaction-reward-moments
description: "Analyze and design high-engagement reward moments ('dopamine points') for games and interactive apps. Use when the input describes a game scene, combat loop, puzzle loop, progression system, interactive narrative, fortune-telling app, AI companion, learning app, or any product where reveal, choice, feedback, anticipation, or satisfying micro-moments matter — and the user asks to find, create, improve, or validate reward moments, engagement hooks, game feel, or player motivation. Retention words used as a goal or success criterion ('D7 is low', 'satisfying enough to bring them back') do NOT disqualify this skill — route away only when lifecycle strategy is itself a requested deliverable (then retention-strategy-designer or engagement-retention-advisor). For a bare 'it's not fun / players get bored' complaint with no named scene or loop, ask one clarifying question first. Outputs 3-5 concrete moments with triggers, actions, feedback, validation metrics, and ethical guardrails."
user-invocable: true
argument-hint: "<game scene or app interaction description>"
allowed-tools: Read, Glob
---

# Interaction Reward Moments

A "reward moment" / "dopamine point" is a product-design term, not a claim of neurochemical measurement. It means a short interaction where anticipation, agency, uncertainty, feedback, and meaning combine into a satisfying experience peak. Prefer concrete design language: anticipation, choice, uncertainty, mastery, relief, surprise, feedback, progress, social recognition.

For research grounding, see `references/research-basis.md`; for pattern selection and examples, see `references/pattern-library.md`.

## Routing

- User asks only for **moment-level** satisfaction, feedback, reveal, choice, scene loop, reward points, or dopamine points → this skill. Stays here even if retention metrics are mentioned **only as motivation / success criteria** (absorb the metric as a validation target).
- User asks for **retention only** (churn, D1/D7/D30, lifecycle, habit, return, cohort) → `retention-strategy-designer`.
- User asks for **both deliverables** (moment design + retention strategy), or the moment-to-return link itself is the question → `engagement-retention-advisor`.
- Ambiguous and the choice materially changes the output → ask one clarifying question.

## Workflow

1. Parse the input into a compact model:
   - Domain: game / narrative / fortune·reading / learning / companion / utility / hybrid.
   - User intent: play, self-understanding, story progress, mastery, reassurance, showing off, creation, decision-making.
   - Core verb: the action the user repeats.
   - Interaction loop: input → anticipation → response/reveal → interpretation/action → next hook.
   - Scene state: before / during / after the moment, existing feedback (visual / sound / haptic / UI / animation / numbers).
   - Progression structure: levels, builds, unlocks, collections, ranks, story, social status.

2. Lenses to explore candidate peaks:
   - Anticipation and surprise: cues, uncertainty, reveal, positive surprise.
   - Competence: timing, aim, planning, pattern reading, proof of mastery.
   - Autonomy: meaningful choice, build direction, routes, trade-offs.
   - Risk and relief: danger, near-misses, clutch recovery, comebacks.
   - Progress and near-completion: almost-full bars, set bonuses, unlocks, milestones.
   - Recognition: the app reflects the user's identity / effort / patterns.
   - Transformation: raw input becomes a useful output (reading, summary, plan, artifact).
   - System synergy: combos, chain reactions, emergent interactions, build completion.
   - Sensory game feel: hit stop, shake, sound, particles, haptics.
   - Social / status: MVP, rankings, team saves, shareable results.

3. Select only the strongest 3-5. A strong point requires:
   - A precise scene trigger.
   - A user action / decision, not passive collection.
   - Immediate feedback within the moment.
   - A reason to keep going after the outcome.
   - Verifiability via telemetry, playtest, or self-report.

4. If the input scene has no strong point, generate the minimum additions:
   - Add a pre-outcome cue → add user agency during the cue window → add uncertainty within fair bounds → add feedback that makes the outcome readable → add a next-step hook.

5. Run the ethics filter (apply it as a constraint from candidate exploration in step 2 — not as a post-hoc filter):
   - Hidden odds, deceptive scarcity, spending pressure, frustration-relief monetization, cash-linked variable rewards → do not recommend.
   - Compulsion, FOMO, sunk cost, odds concealment, grind-inflation-dependent loops → flag.
   - Convert risky designs into transparent / skill-linked / opt-in / cosmetic alternatives.
   - If the user directly requests manipulative design: state the refusal rationale in the body and offer an ethical redesign for the same goal. No quiet partial compliance.

## Output

```markdown
## Input interpretation
- Domain / scene:
- User intent:
- Core verb / interaction loop:
- Progression structure: (if applicable)
- Assumptions: (state uncertain inputs as assumptions and proceed. Ask one question only when the answer would split the result significantly)

## 3-5 reward moments
| # | Moment | Scene trigger | User action | Why it works | Feedback / staging | Next action | Validation metric | Risk / guardrail |
|---|---|---|---|---|---|---|---|---|

## Tuning notes
(1 line per point: frequency, cooldown, difficulty, random range, anti-spam)

## Staging sequence for the strongest moment
1. ...

## Validation method
- Playtest / observation:
- Telemetry:
- Failure signals:
```

Mapping the six elements to the table: **Trigger** = scene trigger, **Action** = user action, **Feedback+Reward** = feedback/staging (includes reward content: stat, choice, unlock, information, status, relief, synergy), **Next hook** = next action, **Tuning** = tuning-notes section. Keep table cells within 2 sentences — put long detail in the tuning notes or the sequence.

Selection criterion for "the strongest moment": the point that integrates the most scene-specific elements and is verifiable. Write the sequence as 4-6 steps including timing.

## Quality Bar

No generic advice like "give a reward", "add an achievement", "make the effect flashier". Bind every point to the provided scene and rules.

Skill-earned reward > passive reward. Readable uncertainty > pure randomness. Meaningful choice > automatic stat increase. A few memorable peaks > constant noise feedback.

Cite research conservatively: phrase it as "this lever aligns with reward prediction error / self-determination theory / flow research." Do not claim the design directly produces dopamine.

## Guardrails

- In fortune / health / finance / relationship / life-decision contexts, do not present speculative predictions as certainty.
- Prioritize reflection, interpretation, and user agency over dependency.
- No guilt streaks, fear notifications, FOMO, fake scarcity, or paid emotional relief.
- Per-domain detailed guardrails: `../engagement-retention-advisor/references/domain-ethics.md` (if installed). If absent, judge using the Guardrails above plus the step-5 ethics filter in the Workflow.
