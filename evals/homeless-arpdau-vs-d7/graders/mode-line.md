---
type: llm_judge
ablation: with-only
---

Line 1 of the answer is a plain-language deliverable label, and the artifact under it must be the `economics` one. A subject after an em dash is fine (`Revenue-versus-retention trade-off — ARPDAU vs D7`). The mode is internal machinery and is asserted through the artifact, never through a literal string.

PASS requires both:
1. Line 1 is a plain-language deliverable label in the output language, with no `Mode:` prefix and no internal mode name.
2. The body is the `economics` artifact: an LTV frame, one worked break-even, and the bounds, with at most two cards.

FAIL: the body is the `strategy` artifact instead (the tempting mode — it is the skill's default and the ask is broad) or any other mode's artifact, line 1 is missing or is not a deliverable label, or the literal string `Mode:` or an internal mode name appears anywhere in the answer.

With-only.
