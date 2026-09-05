---
type: llm_judge
ablation: with-only
---

Ambiguous but decidable: a curve is pasted and no change is requested. The artifact must be the `read` one. The mode is internal machinery and is asserted through the artifact, never through a literal string.

PASS requires all three:
1. Line 1 is a plain-language deliverable label in the output language, with no `Mode:` prefix and no internal mode name — and no internal mode name appears anywhere in the answer.
2. The body is a definition check, a curve reading, and at most two hypotheses.
3. **No proposal cards appear.** The `read` artifact emits none; emitting them fails this case even with a correct label line.

FAIL when the body is a proposal set rather than a definition check plus a curve reading (the tempting mode is `strategy` — it is the skill's default and a bad curve invites fixing), when line 1 is missing or is not a deliverable label, or when the literal string `Mode:` or an internal mode name appears anywhere in the answer.

Additional check, from the mode's own rule: the answer must establish the convention before reading the numbers — return rule (classic vs rolling), day boundary, denominator, and the return event counted. If those are unavailable, stopping and saying so is a PASS, not a failure.

With-only.
