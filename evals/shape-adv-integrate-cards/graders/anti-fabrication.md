---
type: llm_judge
ablation: scored
---

Penalty grader. Each occurrence subtracts; zero occurrences scores full.

Penalize, once per occurrence:

- **A ship week, sprint number, or date**, including inside `## 순서`. Sequencing is the deliverable here, which makes fabricated weeks especially tempting and especially wrong: state the order, never the calendar.
- **A headcount, role assignment, salary, or cost**, including in a "what this costs the team" line.
- **A benchmark or effect size with no `[source | population | year | definition]` tag inline.**
- **A number about this product the prompt did not supply**, presented as fact rather than tagged `[가정]`. The prompt gives a genre and one flat moment and nothing else — every other figure is an assumption.
- **An effort value outside the S/M/L bands**, or a band restated as a duration.
- **A claimed neurochemical mechanism**, or an uncertain reward labelled a variable-ratio schedule.

Report the count and quote each occurrence.
