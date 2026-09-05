---
type: llm_judge
ablation: with-only
---

Ambiguous but decidable: a build-or-not question, which is a comparison, not an integration. The artifact must be the `compare` one. The mode is internal machinery and is asserted through the artifact, never through a literal string.

PASS requires both:
1. Line 1 is a plain-language deliverable label in the output language, with no `Mode:` prefix and no internal mode name — and no internal mode name appears anywhere in the answer.
2. The body is an options table (option, impact, effort, dependency), a measurement order, and at most one card.

FAIL when the body is the `integrate` artifact instead (the tempting mode — it is this skill's default) or the `system` artifact, when line 1 is missing or is not a deliverable label, when the literal string `Mode:` or an internal mode name appears anywhere in the answer, or when the answer emits three to five integrated cards instead of an options table.

Substantive check: "build no tutorial" must appear as a live option in the table, not as a strawman. An answer that assumes the tutorial and only designs it has answered a different question.

With-only.
