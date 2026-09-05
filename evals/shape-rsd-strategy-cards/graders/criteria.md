---
type: llm_judge
ablation: scored
---

Output shape. Grade the artifact, not the ideas.

PASS requires all six:

1. **Scan table present, exactly 4 content columns** — `| # | 이름 | 언제 발동 | 핵심 지표 |`, with column 3 carrying segment · lifecycle stage for this skill. More than 4 content columns FAILS.
2. **No table anywhere exceeds 5 columns.**
3. **At least 3 cards**, each with a `###` 5–8 word name, a bolded one-line summary label in the output language, ≤25 words, and every canonical bullet this skill emits: 언제 · 플레이어 행동 · 리턴 이벤트 + 창 · 대상 · 측정 · 가드레일 · 공수/의존/중단. Missing 리턴 이벤트 + 창, or missing the 공수 line, FAILS. 윤리 is **conditional and not required**: it appears only when there is a bound to hold, a price to name or a residual risk to flag, so its absence on a clean mechanic is correct, and a 윤리 bullet whose content is that there is nothing to report FAILS.
4. **One sentence per bullet**, bold inline labels, never sub-headings.
5. **No table for rationale, ethics or staging.**
6. **`## 근거` present** — one line in the words a designer uses, whose real substance is any check that could not be run and why. Its absence FAILS. It also FAILS if it names a reference file, a module, a lens, a pattern, a slug or a skill, or if it counts the units above it ("위 세 카드").

Content checks that are part of the shape, because the card fields force them:
- The return event is a named in-product action, never "app opened", "session start" or "push tap".
- 가드레일 carries 2–3 metrics with at least one user-harm metric; crash rate alone FAILS.
- 중단 carries a numeric kill threshold, not "if it doesn't work".
- `## 측정 설계` names same-week cohorts and a kept holdout, and bounds the novelty window at weeks 3–4.

Scored, both arms, fractionally.
