---
type: llm_judge
ablation: scored
---

Output shape. Grade the artifact, not the ideas.

PASS requires all six:

1. **Scan table present, exactly 4 content columns** — `| # | 이름 | 언제 발동 | 핵심 지표 |`, with column 3 carrying return event · window for this skill.
2. **No table anywhere exceeds 5 columns.**
3. **At least 3 integrated cards**, each with a `###` 5–8 word name (Korean: 3–6 space-separated words), a bolded one-line summary label in the output language, ≤25 words, and every canonical bullet this skill emits — this skill emits both the moment side and the lifecycle side: 언제 · 플레이어 행동 · 왜 작동하나 · 피드백·연출 · 다음 훅 · 리턴 이벤트 + 창 · 대상 · 측정 · 가드레일 · 공수/의존/중단. There is **no 윤리 / Ethics bullet** (removed in 3.2.0): a card that carries one FAILS this item; bounds live as numbers inside the spec bullets and residual risks as Guardrails metrics.
4. **Each card actually integrates.** The in-session beat and the next-visit reason are linked inside one card — the 피드백·연출 bullet and the 리턴 이벤트 + 창 bullet must refer to the same designed loop. Three moment cards followed by three retention cards is not an integrated set and FAILS.
5. **`## 따로 볼 것` / Set aside present** — the engagement-only and retention-only residue: candidates that failed to integrate, one line each with why. Any faithful heading for that function passes (`## 따로 볼 것`, `## 보류`, `## 버린 안`, `## Set aside`).
6. **`## 근거` present** — one line in the words a designer uses, whose real substance is any check that could not be run and why. Its absence FAILS. It also FAILS if it names a reference file, a module, a lens, a pattern, a slug or a skill, or if it counts the units above it ("위 세 카드"). A clause saying in designer's words what was checked — the contract's own example is `근거: 공개된 게임필 수치 범위와 국내 규정 확인` — is correct, not a reading list.

Also: bold inline labels (sentence count is graded by script in `bullets.md`), no table for rationale or ethics, and the fixed sections in order.

Scored, both arms, fractionally.

**Headings and labels are graded by function (3.2.0).** The skill now names every section, card label and tag in English and tells the model to translate them into the output language. Any faithful translation counts: `## 전제`, `## 가정` or `## Assumptions` for Assumptions; `## 근거` or `## Basis` for Basis; `[가정]` or `[assumed]` for the tag; `피드백`, `피드백·연출` or `Feedback` for the Feedback bullet; and so on. The Korean strings above are examples, not required spellings. What still fails: a heading in the wrong language for the prompt, both languages side by side, or a missing section.
