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

**Headings and labels are graded by function (3.2.0).** The skill now names every section, card label and tag in English and tells the model to translate them into the output language. Any faithful translation counts: `## 전제`, `## 가정` or `## Assumptions` for Assumptions; `## 근거` or `## Basis` for Basis; `[가정]` or `[assumed]` for the tag; `피드백`, `피드백·연출` or `Feedback` for the Feedback bullet; and so on. The Korean strings above are examples, not required spellings. What still fails: a heading in the wrong language for the prompt, both languages side by side, or a missing section.
