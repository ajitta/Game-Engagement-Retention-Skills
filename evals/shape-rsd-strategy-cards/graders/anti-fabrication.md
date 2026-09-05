---
type: llm_judge
ablation: scored
---

Penalty grader. Each occurrence subtracts; zero occurrences scores full.

Penalize, once per occurrence:

- **A ship week, sprint number, or date.** Ship order is expected; ship weeks are fabricated.
- **A headcount, role assignment, salary, or cost.**
- **A benchmark quoted bare.** Any D1/D7/D30 figure, conversion rate, or effect size introduced by the answer must carry `[source | population | year | definition]` inline. "Industry average D7 is around 10%" with no tag is the exact defect this grader exists for.
- **An average taken across benchmark rows.**
- **A number about this product the prompt did not supply**, presented as fact rather than tagged `[가정]` under `## 전제`. The prompt gives D1/D7/D30, the tool, the day boundary, the denominator and the return event — anything beyond that is an assumption and must be labelled.
- **An effort value outside the S/M/L bands**, or a band restated as a duration.
- **A causal claim from a before/after comparison across a patch**, or a selection statistic presented as lift.

Report the count and quote each occurrence.
