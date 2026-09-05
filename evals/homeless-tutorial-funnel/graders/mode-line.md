---
type: llm_judge
ablation: with-only
---

Line 1 of the answer is a plain-language deliverable label, and the artifact under it must be the `strategy` one. The mode is internal machinery and is asserted through the artifact, never through a literal string.

PASS requires both:
1. Line 1 is a plain-language deliverable label in the output language ("Tutorial funnel repair — where installs leak"), with no `Mode:` prefix and no internal mode name.
2. The body is the `strategy` artifact: a scan table plus three to five proposal cards, followed by the order and measurement-plan sections in the output language.

FAIL: the body is the `instrument` artifact instead (the tempting mode — diagnosing which step leaks sounds like a tracking-plan ask) or any other mode's artifact, line 1 is missing or is not a deliverable label, or the literal string `Mode:` or an internal mode name appears anywhere in the answer.

With-only.
