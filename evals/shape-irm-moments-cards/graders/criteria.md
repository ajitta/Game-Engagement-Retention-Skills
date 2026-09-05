---
type: llm_judge
ablation: scored
---

Output shape. Grade the artifact, not the ideas.

PASS requires all six:

1. **Scan table present, exactly 4 content columns** — `| # | 이름 | 언제 발동 | 핵심 지표 |`. Present because there are ≥3 cards. A scan table with 5 or more content columns FAILS.
2. **No table anywhere in the answer exceeds 5 columns.** Count every table, including any appendix.
3. **At least 3 cards**, each a `###` heading with a 5–8 word name, a `**한 줄**` one-liner of ≤25 words, and every canonical bullet this skill emits: 언제 · 플레이어 행동 · 왜 작동하나 · 피드백·연출 · 다음 훅 · 측정 · 가드레일 · 공수/의존/중단. A card missing 측정, 가드레일 or the 공수 line FAILS — those three are the execution layer and sit inside the card so they cannot be dropped. 윤리 is **conditional and not required**: it appears only when there is a bound to hold, a price to name or a residual risk to flag, so its absence on a clean mechanic is correct, and a 윤리 bullet whose content is that there is nothing to report FAILS.
4. **One sentence per bullet.** A bullet running to three or more sentences, or a bullet rendered as a sub-heading instead of a bold inline label, FAILS.
5. **No table is used for rationale, ethics, or feedback staging.** Those belong in card bullets.
6. **`## 근거` is present** — one line in the words a designer uses, whose real substance is any check that could not be run and why. Its absence FAILS regardless of content quality. It also FAILS if it names a reference file, a module, a lens, a pattern, a slug or a skill, or if it counts the units above it ("위 다섯 카드"): the line reports the unrun check, not the reading list.

Also check: the fixed sections appear in order — the plain-language deliverable label line (no `Mode:` prefix, no internal mode name), `## 전제`, body, `## 순서`, `## 측정 설계`, `## 근거`. `## 순서` must be ranked by impact per unit effort, highest first; a ranking that puts the L-effort items on top is the "impact × difficulty" bug and FAILS.

Scored, both arms, fractionally. A baseline Claude produces prose or a wide table; the shape delta is the measurement.
