---
type: llm_judge
ablation: with-only
---

Korean in, Korean out — and the headings are Korean too.

PASS requires all four:
1. The prose is Korean.
2. Every `##` heading is Korean. The fixed sections are `## 전제`, `## 순서`, `## 측정 설계`, `## 근거`. `## 근거` is one line in a designer's words, naming any check that could not be run; a filename or module name in it FAILS.
3. No bilingual heading anywhere (`## 전제 / Assumptions` fails) and no English fixed-section heading (`## Assumptions`, `## Order`, `## Measurement plan`, `## Basis` all fail).
4. Card bullet labels print only the Korean side of each `A / B` label — `**언제**`, `**플레이어 행동**`, `**측정**`. A bullet reading `**언제 / Fires when**` fails.

Also FAIL if the plain-language deliverable label on line 1 is absent, if it carries a `Mode:` prefix or an internal mode name, or if an English count-instruction or internal field name leaks in as a heading ("3-5 reward moments", "Input interpretation").

With-only — a baseline Claude answering in Korean is not evidence about routing.

**Headings and labels are graded by function (3.2.0).** The skill now names every section, card label and tag in English and tells the model to translate them into the output language. Any faithful translation counts: `## 전제`, `## 가정` or `## Assumptions` for Assumptions; `## 근거` or `## Basis` for Basis; `[가정]` or `[assumed]` for the tag; `피드백`, `피드백·연출` or `Feedback` for the Feedback bullet; and so on. The Korean strings above are examples, not required spellings. What still fails: a heading in the wrong language for the prompt, both languages side by side, or a missing section.
