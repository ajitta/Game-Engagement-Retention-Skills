---
type: llm_judge
ablation: scored
---

Penalty grader. Every item below subtracts from this case's score; the presence of any one of them is a defect even when the rest of the shape is perfect. LLM judges reward comprehensive-looking output, and a baseline that invents "2 sprints, week 1, one engineer" reads as rigor. It is not.

Penalize, once per occurrence:

- **A ship week or a date.** "Week 1", "sprint 2", "ship by March" — the model cannot know this team's calendar. Ship *order* is correct and expected; ship *weeks* are fabricated.
- **A headcount, a role assignment, a salary, or a cost.** "One engineer and one artist", "about $4k".
- **A benchmark or effect size with no `[source | population | year | definition]` tag inline.** "This typically lifts D1 by 5%" with no tag is fabricated even if the number is plausible.
- **An effort value outside the S/M/L bands**, or a band restated as a duration ("S (about 3 days)").
- **A claimed neurochemical mechanism.** Any assertion that a design produces dopamine, or an uncertain reward labelled a variable-ratio schedule.
- **A number invented about this product** that the prompt did not supply — a session length, a DAU figure, a current conversion rate presented as fact rather than as a `[가정]` under `## 전제`.

Zero occurrences is a full score on this grader. Report the count and quote each occurrence.
