---
type: llm_judge
ablation: with-only
---

Line 1 of the answer is a plain-language deliverable label, and the artifact under it must be the `instrument` one. The mode is internal machinery and is asserted through the artifact, never through a literal string.

PASS requires both:
1. Line 1 is a plain-language deliverable label in the output language ("Retention event taxonomy — first three months"), with no `Mode:` prefix and no internal mode name.
2. The body is the `instrument` artifact: an `Event | Fires when | Properties | Answers` table plus explicit return-event and cohort-key definitions — not proposal cards.

FAIL: the body is the `strategy` artifact instead (the tempting mode — "measure retention" reads as a lifecycle ask) or any other mode's artifact, line 1 is missing or is not a deliverable label, or the literal string `Mode:` or an internal mode name appears anywhere in the answer.

With-only.
