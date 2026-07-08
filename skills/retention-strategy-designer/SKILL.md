---
name: retention-strategy-designer
description: "Analyze an app, game, SaaS, content product, interactive narrative, community, or AI product and propose lifecycle retention improvements. Use when the user asks to increase D1, D7, D30, weekly/monthly retention, cohort curves, activation, habit formation, churn reduction, resurrection, onboarding, notification strategy, or return behavior. Do NOT trigger when the requested change is a specific in-session scene, reward reveal, or staging fix — even if D1/D7/onboarding is cited as the motivating metric — use interaction-reward-moments and keep the metric as the validation target. Outputs retention diagnosis, segments, lifecycle loops, experiments, metrics, and anti-dark-pattern guardrails."
user-invocable: true
argument-hint: "<product description + retention problem>"
allowed-tools: Read, Glob
---

# Retention Strategy Designer

Retention is not "getting users addicted." Retention is users returning repeatedly because the product keeps delivering value on a cadence that matches their intent.

See `references/retention-playbook.md` for frameworks, benchmarks, and experiment design.

## Routing

- User asks for **retention only** (churn, D1/D7/D30, lifecycle, habit, return, cohort, notifications, onboarding) → this skill.
- User asks only for **moment-level** satisfaction, reward points, dopamine points, or scene design → `interaction-reward-moments`. Same even if D7/onboarding is cited **only as motivation**, as long as the deliverable is a scene fix.
- User asks for **both deliverables** (moment design + retention strategy), or the moment-to-return link itself is the question → `engagement-retention-advisor`.
- Ambiguous and the choice materially changes the output → ask one clarifying question.

## Workflow

1. Define the retention target:
   - **Return event**: the action that proves meaningful return (not a bare app open).
   - **Usage cycle**: daily / weekly / monthly / episodic / event-driven / seasonal — respect the product's natural cadence. Do not force daily retention on a weekly product.
   - **Lifecycle stage**: new / current / power / lapsing / dormant / resurrected.

2. Diagnose leak points:
   - D0/D1: onboarding, activation, time-to-value, friction to the first useful result (the "aha moment").
   - D2-D7: habit loop, reminder relevance, unfinished goals, value of the second session.
   - D8-D30: content depth, progression, personalization, social loops, identity investment.
   - Long-term: novelty pipeline, compounding value (archive, records, mastery), community, trust.

3. Propose 3-5 retention interventions:
   - Each intervention specifies segment, trigger, user value, implementation, metric, experiment, risk.
   - Value loops > push-notification patches. Notify only when it is genuinely useful to the user right now.
   - Bind each proposal to a specific return event + time window.

4. Measurement / experiment design:
   - Measure by cohort (whole-population averages are contaminated by new inflows).
   - Bound the novelty effect: observe for 2-4+ weeks.
   - Track guardrail metrics in parallel: notification opt-out rate, uninstalls, complaints, session quality.

## Output

```markdown
## Input interpretation
- Product:
- Core value:
- Recommended return event:
- Natural usage cycle:
- Diagnosed leak points:

## 3-5 retention proposals
| # | Proposal | Target segment | Lifecycle stage | When it fires | User value | Implementation | Core metric | Experiment | Risk |
|---|---|---|---|---|---|---|---|---|---|

## Prioritization
(order by impact × implementation difficulty, with a 1-line rationale each)

## Measurement design
- Return event definition:
- D1 / D7 / D30 (or W1/W4, matched to the product cycle):
- Cohort split criteria:
- Guardrail metrics:
```

## Guardrails

Apply guardrails as design constraints **before** generating proposals — not as a post-hoc filter.

- Do not optimize opens, session length, or notification clicks alone. Optimize a meaningful return event.
- Do not recommend spam push, fear, guilt, **FOMO**, fake scarcity, punishing the daily schedule with expiring rewards, hidden friction, or pain-relief monetization.
- Treat staging that periodically reminds users of loss — even truthfully (decaying meters, repeated "before you forget" warnings) — as a fear mechanism.
- Notifications must state a frequency cap (default: recommend ≤1/day). No repeated deadline pressure under the guise of "useful info."
- No guilt streaks — replace with recovery-friendly progress (streak freeze, recovery credit, flexible goals).
- Separate retention from monetization pressure. Flag when return-driving degrades into spend-driving.
- Manipulative loops retain users but destroy trust. When retention numbers conflict with user value, state it and prioritize user value.
