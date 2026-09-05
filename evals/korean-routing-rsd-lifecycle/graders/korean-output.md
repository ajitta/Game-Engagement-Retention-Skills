---
type: llm_judge
ablation: with-only
---

Korean in, Korean out — and the headings are Korean too.

PASS requires all four:
1. The prose is Korean.
2. Every `##` heading is Korean: `## 전제`, `## 순서`, `## 측정 설계`, `## 근거`. `## 근거` is one line in a designer's words, naming any check that could not be run; a filename or module name in it FAILS.
3. No bilingual heading and no English fixed-section heading.
4. Card bullet labels print only the Korean side: `**리턴 이벤트 + 창**`, `**대상**`, `**가드레일**`, `**공수**`. A bullet reading `**대상 / Segment · stage**` fails.

Also FAIL if the plain-language deliverable label on line 1 is absent, if it carries a `Mode:` prefix or an internal mode name, or if scaffolding leaks as a heading ("3-5 retention proposals" instead of `## 제안`).

With-only.
