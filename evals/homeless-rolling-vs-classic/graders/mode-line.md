---
type: llm_judge
ablation: with-only
---

Line 1 of the answer is a plain-language deliverable label, and the artifact under it must be the `read` one. The mode is internal machinery and is asserted through the artifact, never through a literal string.

PASS requires both:
1. Line 1 is a plain-language deliverable label in the output language ("Retention metric definition — rolling vs classic"), with no `Mode:` prefix and no internal mode name.
2. The body is two to four paragraphs of definition and consequence.

FAIL: the body is the `strategy` artifact instead (the tempting mode) or any other mode's artifact, line 1 is missing or is not a deliverable label, the literal string `Mode:` or an internal mode name appears anywhere in the answer, OR proposal cards appear — the `read` artifact emits none, and emitting them here fails the case even with a correct label line.

Supporting check: the answer must not ask a clarifying question. This is the "never ask" calibration case.

With-only.
