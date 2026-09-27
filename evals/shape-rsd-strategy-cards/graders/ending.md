---
type: llm_judge
ablation: scored
---

The answer ends at the basis section. A check a script could run on the final assistant message:

1. The last `##` heading is `## 근거` (or `## Basis` for English output).
2. Under it there are at most two non-empty lines, and nothing after them.
3. No line anywhere after `## 순서` offers further work or asks the user to pick a next step — e.g. "필요하시면", "원하시면", "해드릴까요", "Want me to", "Let me know", "I can also".

PASS when all three hold. FAIL otherwise, quoting the offending line.

Why: on newer models a closing offer or menu of next steps ends the turn waiting for an answer that blocks nothing; the skill bodies forbid it.
