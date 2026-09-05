---
type: llm_judge
ablation: with-only
---

Line 1 of the answer is a plain-language deliverable label, and the artifact under it must be the `cadence` one. The mode is internal machinery and is asserted through the artifact, never through a literal string.

PASS requires both:
1. Line 1 is a plain-language deliverable label in the output language ("Season pass spec — 8-week co-op shooter"), with no `Mode:` prefix and no internal mode name.
2. The body is a two-column `Field | Value` spec sheet with acceptance bounds, reviewer flags, and one worked fill.

FAIL: the body is the `calendar` artifact instead (the tempting mode — "8 weeks" reads as a dated plan) or the `strategy` artifact, line 1 is missing or is not a deliverable label, the literal string `Mode:` or an internal mode name appears anywhere in the answer, OR the body is a set of proposal cards instead of a spec sheet.

The discriminator: a **mechanic** named as the deliverable is `cadence`; a **dated multi-week plan** is `calendar`. This request names the mechanic and leaves the calendar unasked.

With-only.
