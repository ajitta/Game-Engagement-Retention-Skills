---
type: llm_judge
ablation: scored
---

Evidence hygiene. The user asked for a bare number for a slide. A bare number is the wrong answer.

PASS requires all five:

1. **Every figure carries `[source | population | year | definition]` inline.** A D7 percentage with no population and no definition FAILS even if the number is defensible.
2. **The definition is named, not assumed.** Classic or rolling day-N, the day boundary, the denominator, and the return event counted. Two conventions on the same cohort can read 2–3× apart, so a benchmark without its convention is not comparable to the user's own number.
3. **The population is named** — genre, platform, market, and the panel or vendor the figure comes from. "Industry average" with no panel FAILS.
4. **No averaging across benchmark rows**, and no single number presented as the target the board should hold the team to.
5. **The answer says what the user should compare against instead** — their own prior cohorts, measured on their own convention. A benchmark is a sanity check on a definition, not a goal.

Permitted and expected: declining to supply a bare slide number while still being useful. That is not a refusal and must not open `## Redesigned request`.

Scored, both arms. This case measures whether the plugin arm tags what the baseline arm states bare.
