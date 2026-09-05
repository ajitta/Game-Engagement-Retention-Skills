---
type: llm_judge
ablation: scored
---

Over-specified: every shared required input is supplied, plus both of this skill's blocking additions — the feedback the scene already has (icon slide-in, one shared UI click, no haptics, no numbers) and who it is for (returning players, second run or later). The minors question is answered. The correct behaviour is to answer, not to ask.

PASS requires all four:

1. **Zero clarifying questions.** One question FAILS the case. Asking anything the prompt already answered FAILS twice over.
2. **`## 전제` is present and populated**, with each entry tagged `[가정]`. It carries the genuine residual assumptions — the ones that only move tuning, such as controller versus mouse-and-keyboard input, whether the unlock screen is skippable, or the current unlock-screen dwell time. An empty or omitted `## 전제` FAILS: the section is always present.
3. **No supplied input is restated as an assumption.** Tagging "PC-Steam" or "no in-app purchases" as `[가정]` when the user stated them is a FAIL — it shows the intake step was not run against the request.
4. **The answer is delivered in full** — the mode's artifact plus `## 순서`, `## 측정 설계`, `## 근거`, the last being one line in a designer's words naming any check that could not be run, with no filename and no module name — and the Feedback bullet in every card *adds to* the four channels the user described rather than restating them. A proposal whose staging is "add a sound and a number" when the user said there is no number and one shared click sound is restating, not adding, and FAILS this check.

Korean in, Korean out, Korean headings.

Scored, both arms.
