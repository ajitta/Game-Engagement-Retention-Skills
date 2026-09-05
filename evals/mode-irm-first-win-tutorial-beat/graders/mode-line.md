---
type: llm_judge
ablation: with-only
---

Ambiguous but decidable: a named tutorial beat and a first win that does not land. The artifact must be the `first-win` one. The mode is internal machinery and is asserted through the artifact, never through a literal string.

PASS requires both:
1. Line 1 is a plain-language deliverable label in the output language, with no `Mode:` prefix and no internal mode name — and no internal mode name appears anywhere in the answer.
2. The body is one to three cards plus a staging timeline with timings plus an accessibility check.

FAIL when the body is the `moments` artifact instead (the tempting mode — it is this skill's default and "fix that beat" reads as ordinary moment work), when line 1 is missing or is not a deliverable label, when the literal string `Mode:` or an internal mode name appears anywhere in the answer, or when the answer emits three to five moment cards with no staging timeline.

This case is the beat half of the tutorial pair. The funnel half — "which tutorial step is bleeding" — is tested by `homeless-tutorial-funnel` and must route to retention-strategy-designer instead.

With-only.
