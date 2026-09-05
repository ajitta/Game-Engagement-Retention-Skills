---
type: llm_judge
ablation: with-only
---

Ambiguous but decidable: a dated multi-week plan is the deliverable, not a single mechanic. The artifact must be the `calendar` one. The mode is internal machinery and is asserted through the artifact, never through a literal string.

PASS requires both:
1. Line 1 is a plain-language deliverable label in the output language, with no `Mode:` prefix and no internal mode name — and no internal mode name appears anywhere in the answer.
2. The body is a `Week | Beat | Type | Return event | Metric` table plus about three mini-cards plus a cadence-collision check.

FAIL when the body is the `cadence` artifact instead (the tempting mode — banners and seasonal events are named mechanics) or the `strategy` artifact, when line 1 is missing or is not a deliverable label, when the literal string `Mode:` or an internal mode name appears anywhere in the answer, or when the body is a mechanic spec sheet instead of a dated plan.

Anti-fabrication interaction: weeks in the table are plan positions relative to season start (Week 1, Week 2, …). A calendar that asserts staffing, headcount, cost, or real calendar dates the user never gave fails.

With-only.
