---
type: llm_judge
ablation: with-only
---

Korean in, Korean out — and the headings are Korean too.

PASS requires all four:
1. The prose is Korean.
2. Every `##` heading is Korean, including this skill's own `## 따로 볼 것` alongside `## 전제`, `## 순서`, `## 측정 설계`, `## 근거`. `## 근거` is one line in a designer's words, naming any check that could not be run; a filename or module name in it FAILS.
3. No bilingual heading and no English fixed-section heading.
4. Card bullet labels print only the Korean side of each `A / B` label.

Also FAIL if the plain-language deliverable label on line 1 is absent, or if it carries a `Mode:` prefix or an internal mode name.

With-only.
