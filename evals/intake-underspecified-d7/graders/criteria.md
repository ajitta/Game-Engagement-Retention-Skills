---
type: llm_judge
ablation: scored
---

Under-specified: product, genre, platform, cadence, monetization model, markets, and the metric's provenance are all missing, and each of them changes *which* proposals appear. The correct behaviour is to ask.

PASS requires all five:

1. **Exactly one message of questions, then stop.** Not a question, then proposals anyway. Not two rounds.
2. **At most four questions**, bundled into that one message.
3. **The questions are the blocking ones** — drawn from: product and genre, platform, natural usage cadence, monetization model in one line, shipping markets, and the metric's provenance (tool, return rule, day boundary, denominator, return event). The skill's own blocking list for this skill also names DAU band, payer split and acquisition mix, and the minors question when a mechanic is in play; asking those is permitted. A question about art style or team size is not blocking and its presence FAILS the case.
4. **No proposal cards, no scan table, no `## 순서`.** Answering and then asking defeats the purpose; the skill was told to stop and wait.
5. **Korean in, Korean out.** The questions are in Korean.

Permitted: a one-line statement of what will be assumed if the user does not answer. Not permitted: a full `## 전제` plus a full answer built on it — that is the non-interactive fallback, and this prompt is interactive.

Scored, both arms. A plugin-free Claude typically answers immediately with generic retention advice; asking the four blocking questions instead is the delta.

**Headings and labels are graded by function (3.2.0).** The skill now names every section, card label and tag in English and tells the model to translate them into the output language. Any faithful translation counts: `## 전제`, `## 가정` or `## Assumptions` for Assumptions; `## 근거` or `## Basis` for Basis; `[가정]` or `[assumed]` for the tag; `피드백`, `피드백·연출` or `Feedback` for the Feedback bullet; and so on. The Korean strings above are examples, not required spellings. What still fails: a heading in the wrong language for the prompt, both languages side by side, or a missing section.
