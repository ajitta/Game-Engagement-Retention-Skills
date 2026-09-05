---
type: llm_judge
ablation: scored
---

Output shape. Grade the artifact, not the ideas.

PASS requires all six:

1. **Scan table present, exactly 4 content columns** — `| # | 이름 | 언제 발동 | 핵심 지표 |`, with column 3 carrying return event · window for this skill.
2. **No table anywhere exceeds 5 columns.**
3. **At least 3 integrated cards**, each with a `###` 5–8 word name, a bolded one-line summary label in the output language, ≤25 words, and every canonical bullet this skill emits — this skill emits both the moment side and the lifecycle side: 언제 · 플레이어 행동 · 왜 작동하나 · 피드백·연출 · 다음 훅 · 리턴 이벤트 + 창 · 대상 · 측정 · 가드레일 · 공수/의존/중단. 윤리 is **conditional and not required**: it appears only when there is a bound to hold, a price to name or a residual risk to flag, so its absence on a clean mechanic is correct, and a 윤리 bullet whose content is that there is nothing to report FAILS.
4. **Each card actually integrates.** The in-session beat and the next-visit reason are linked inside one card — the 피드백·연출 bullet and the 리턴 이벤트 + 창 bullet must refer to the same designed loop. Three moment cards followed by three retention cards is not an integrated set and FAILS.
5. **`## 따로 볼 것` present** — what this answer deliberately did not cover.
6. **`## 근거` present** — one line in the words a designer uses, whose real substance is any check that could not be run and why. Its absence FAILS. It also FAILS if it names a reference file, a module, a lens, a pattern, a slug or a skill, or if it counts the units above it ("위 세 카드").

Also: one sentence per bullet, bold inline labels, no table for rationale or ethics, and the fixed sections in order.

Scored, both arms, fractionally.
