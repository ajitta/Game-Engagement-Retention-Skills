---
name: engagement-retention-advisor
description: "Produce integrated proposals that jointly improve moment-level engagement AND lifecycle retention for games, interactive apps, AI companions, fortune/reading apps, visual novels, learning apps, communities. Use ONLY when the request contains TWO deliverables — (a) in-session reward/moment design AND (b) lifecycle/return strategy (e.g. 'both the reward moments and retention', 'analyze the dopamine points AND make people keep using it', 'satisfying moments plus D1/D7/D30') — OR when the question itself is the moment-to-retention link (e.g. 'what in-session moment do I need to raise retention?'). A retention metric cited only as motivation or success criterion is NOT a second ask: 'D7 is low and I want to fix the reward staging' or 'satisfying enough that they come back the next day' → interaction-reward-moments. Retention-only → retention-strategy-designer. Outputs 3-5 integrated proposals pairing a reward moment with a retention mechanism, plus metrics, experiments, domain ethics."
user-invocable: true
argument-hint: "<product description — combined reward-moment + retention request>"
allowed-tools: Read, Glob
---

# Engagement Retention Advisor

Use only when the user explicitly requests **both** moment-level reward design **and** a retention strategy as one proposal set. The value of integration is not concatenating two lists — it is connecting **how a satisfying in-session moment becomes value for the next visit**.

See `references/domain-ethics.md` for detailed per-domain ethical guardrails.

## Routing

- User asks for **both deliverables** (moment design + retention/return strategy), or **the moment-to-return link itself is the question** → this skill.
- Retention mentioned **only as a goal / metric / modifier** ("D7 is low, I want to fix the staging", "satisfying enough that they return") → stay single-skill. If it is moment design → `interaction-reward-moments`.
- User asks for **retention only** → `retention-strategy-designer`.
- Ambiguous and the choice materially changes the output → ask one clarifying question.

## Workflow

1. Build a product model:
   - User intent, core value, core interaction, current loop, return event, natural usage cycle.

2. Split the problem into two layers:
   - **Moment layer**: what is satisfying within a single session? (Use the `interaction-reward-moments` lenses: anticipation / competence / autonomy / reveal / recognition / transformation / progress. If you need patterns, read `../interaction-reward-moments/references/pattern-library.md`.)
   - **Lifecycle layer**: why return tomorrow, next week, next month? (Use the `retention-strategy-designer` diagnosis: return event, usage cycle, lifecycle stage, leak points. If you need benchmarks / experiment design, read `../retention-strategy-designer/references/retention-playbook.md`.)

3. Recombine only where the two layers reinforce each other:
   - Every integrated proposal must contain **both** a reward moment and a retention loop.
   - State the **integration rationale** for each: why this moment is not mere stimulation but leads to next-visit value.
   - Moment is satisfying but has no future value → flag as "engagement only" and separate it.
   - Loop drives return but has no in-session satisfaction → flag as "retention only" and redesign.

4. Per-domain ethics check (`references/domain-ethics.md`):
   - Fortune / saju: no deterministic life prophecy, no fear framing, no paid emotional relief.
   - AI companion / journaling: no dependency, no over-notification, no crisis-counselor role confusion, no misuse of sensitive data.
   - Visual novel: no manipulative cliffhangers, no paywalling core endings.
   - Learning apps: no guilt streaks; recovery-friendly progress.
   - Overall: optimize for user value, not opens or session length.

## Output

```markdown
## Input interpretation
- Product / scene:
- Core value:
- Natural usage cycle:
- Recommended return event:

## 3-5 integrated proposals
| # | Proposal | In-session reward moment | Trigger / user action | Feedback / staging | Retention mechanism | Target segment / lifecycle stage | Return event / time window | Ethical guardrail |
|---|---|---|---|---|---|---|---|---|
(keep each cell within 2 sentences)

## Integration rationale
(1-2 lines per proposal: why this moment is not mere stimulation but leads to next-visit value)

## Measurement design
(per proposal: core metric + experiment method. Measure by cohort, watch the novelty effect for 2-4 weeks, track guardrail metrics — notification opt-out rate, uninstalls, complaints — in parallel)

## Items to view separately
- Strong reward moment only (engagement only):
- Strong retention only (retention only → needs redesign):

## Prioritization
(order by impact × implementation difficulty, with a 1-line rationale each)
```

## Guardrails

Apply guardrails as design constraints **before** generating proposals — not as a post-hoc filter.

- Do not force-convert every good reward moment into a retention loop.
- Do not let a retention goal flatten a concrete scene design into generic lifecycle advice.
- Prefer transparent, user-benefiting loops over compulsion, FOMO, guilt, or anxiety.
- **When a prohibited pattern is the request itself**: state the refusal rationale explicitly in the body (do not bury it in a table-cell footnote) and redesign an ethical alternative that meets the same business goal. No quiet partial compliance.
- Per-domain prohibition list: `references/domain-ethics.md`.
