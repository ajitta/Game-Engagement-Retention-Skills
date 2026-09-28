---
type: llm_judge
ablation: scored
---

Output shape. Grade the artifact, not the ideas.

PASS requires all six:

1. **Scan table present, exactly 4 content columns** — `| # | 이름 | 언제 발동 | 핵심 지표 |`, with column 3 carrying segment · lifecycle stage for this skill. More than 4 content columns FAILS.
2. **No table anywhere exceeds 5 columns.**
3. **At least 3 cards**, each with a `###` 5–8 word name (Korean: 3–6 space-separated words), a bolded one-line summary label in the output language, ≤25 words, and every canonical bullet this skill emits: 언제 · 플레이어 행동 · 리턴 이벤트 + 창 · 대상 · 측정 · 가드레일 · 공수/의존/중단. Missing 리턴 이벤트 + 창, or missing the 공수 line, FAILS. There is **no 윤리 / Ethics bullet** (removed in 3.2.0): a card that carries one FAILS this item; bounds live as numbers inside the spec bullets and residual risks as Guardrails metrics.
4. **At most two sentences per bullet** — three or more FAILS — bold inline labels, never sub-headings.
5. **No table for rationale, ethics or staging.**
6. **`## 근거` present** — one line in the words a designer uses, whose real substance is any check that could not be run and why. Its absence FAILS. It also FAILS if it names a reference file, a module, a lens, a pattern, a slug or a skill, or if it counts the units above it ("위 세 카드"). A clause saying in designer's words what was checked — the contract's own example is `근거: 공개된 게임필 수치 범위와 국내 규정 확인` — is correct, not a reading list.

Content checks that are part of the shape, because the card fields force them:
- The return event is a named in-product action, never "app opened", "session start" or "push tap".
- 가드레일 carries 2–3 metrics with at least one user-harm metric; crash rate alone FAILS.
- 중단 carries a numeric kill threshold, not "if it doesn't work".
- `## 측정 설계` names same-week cohorts and a kept holdout, and bounds the novelty window at weeks 3–4.

Scored, both arms, fractionally.

**Headings and labels are graded by function (3.2.0).** The skill now names every section, card label and tag in English and tells the model to translate them into the output language. Any faithful translation counts: `## 전제`, `## 가정` or `## Assumptions` for Assumptions; `## 근거` or `## Basis` for Basis; `[가정]` or `[assumed]` for the tag; `피드백`, `피드백·연출` or `Feedback` for the Feedback bullet; and so on. The Korean strings above are examples, not required spellings. What still fails: a heading in the wrong language for the prompt, both languages side by side, or a missing section.
