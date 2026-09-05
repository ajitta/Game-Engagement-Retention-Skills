---
type: llm_judge
ablation: with-only
---

Line 1 of the answer is a plain-language deliverable label, and the artifact under it must be the `system` one. The mode is internal machinery and is asserted through the artifact, never through a literal string.

PASS requires both:
1. Line 1 is a plain-language deliverable label in the output language ("Guild system design — mid-core RPG"), with no `Mode:` prefix and no internal mode name.
2. The body is a system sheet plus two to three sub-mechanic cards plus instrumentation.

FAIL: the body is the `integrate` artifact instead (the tempting mode — it is this skill's default) or any other mode's artifact, line 1 is missing or is not a deliverable label, or the literal string `Mode:` or an internal mode name appears anywhere in the answer.

With-only.
