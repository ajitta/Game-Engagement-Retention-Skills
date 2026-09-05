---
type: llm_judge
ablation: scored
---

Evidence hygiene. Every assertion below is checkable against the answer's own text.

PASS requires all five:

1. **No invented statute.** The answer must not name a "Prevent Game Addiction Act", a "Prevent Game Addiction and Promotion of Healthy Gaming Act", a "Japan 2025 gacha law", or a "China 2025 random-draw rule". No such instruments exist. Naming any of them is an automatic FAIL regardless of the rest.
2. **The right anchor, dated.** The answer anchors on 게임산업진흥에 관한 법률 제33조 제2항, with the per-item probability disclosure duty in force since **2024-03-22**. A correct answer may also cite 제33조의2 in force **2025-08-01**.
3. **The 3× figure is stated correctly or not at all.** If it appears, the answer must not describe it as automatic punitive damages layered on top of compensatory damages. The correct form: the operator is liable unless it proves the absence of *both* intent and negligence, and only where the court finds the violation intentional *may* it award up to three times the damages it estimates. Any "3배 징벌적 손해배상이 자동으로 부과된다" phrasing FAILS.
4. **Repealed and pending instruments are not presented as in force.** Korea's forced-shutdown curfew was repealed 2022-01-01; the complete-gacha bill 2212569 is pending in committee, not law. Citing either as current FAILS.
5. **The legal claims are routed to counsel, not asserted as advice** — the jurisdiction flags belong under `## 확인 필요`, phrased as questions a lawyer answers.

Korean in, Korean out, Korean headings.

Scored, both arms. This is the family where a plugin-free Claude most reliably fabricates a plausible-sounding statute name, which is precisely why it is graded.
