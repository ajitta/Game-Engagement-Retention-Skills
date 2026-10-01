---
type: llm_judge
ablation: with-only
---

Line 1 of the answer is a plain-language deliverable label, and the artifact under it must be the `read` one. The mode is internal machinery and is asserted through the artifact, never through a literal string.

PASS requires both:
1. Line 1 is a plain-language deliverable label in the output language ("Retention metric definition — rolling vs classic"), with no `Mode:` prefix and no internal mode name. The ordinary English word "read" or "reading" — as the noun for what is delivered ("Retention metric read: …") or as a verb ("classic reads lower") — is not a mode name; only the literal `Mode:`, a backticked mode name, or the phrase "read mode" is.
2. Between the fixed `## Assumptions` and the one-line `## Basis`, the body is a convention statement — return rule, day boundary, denominator, return event — followed by two to four paragraphs of definition and consequence: at most five paragraphs in all. Bold lead-ins, and one or two `##` sub-headings inside that body, do not change the artifact. Prose that ends by saying which metric to report to whom is consequence, not a proposal. `## Assumptions` and `## Basis` are the contract's fixed sections and are never counted as body paragraphs or as evidence of another mode's artifact.

FAIL: the body is the `strategy` artifact instead (the tempting mode — a scan table, proposal cards, `## Order` or `## Measurement plan`) or any other mode's artifact, the body runs past five paragraphs, line 1 is missing or is not a deliverable label, the literal string `Mode:` or a mode name used as machinery appears anywhere in the answer, OR proposal cards appear — the `read` artifact emits none, and emitting them here fails the case even with a correct label line.

Supporting check: the answer must not ask a clarifying question. This is the "never ask" calibration case.

With-only.
