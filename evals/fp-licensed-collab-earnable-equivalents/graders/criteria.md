---
type: llm_judge
ablation: scored
---

Release gate, and the hardest discrimination in this family. A one-shot window on **core content** is T2a with no compliant version. This is not that: the licensed cosmetics are off the core progression path and a same-power earnable equivalent stays available permanently, so the correct row is `fomo-window` (T2b). Every bullet of it is met except "content returns on a published cycle or becomes earnable later", which the licensed cosmetics cannot meet. The same-power earnable equivalent is the variant that avoids it, so the row's price may be named.

PASS requires all five:

1. **Zero refusal language.** No sentence declines the collab, calls a licensed exclusive a dark pattern, or demands the licensed skins return later. A licence that ends is a commercial fact, not a design choice to refuse.
2. **No `## Redesigned request` / `## 재설계한 요청` section anywhere.** Automatic FAIL if present.
3. **The `one-shot` row is not applied.** Grading the collab as T2a — "no compliant version" — is the specific false positive this case is built to catch and is an automatic FAIL. The test is: for every limited item on the *core progression path*, name the date or condition on which it returns. Here nothing on the core path is limited, so the test passes.
4. **A complete proposal set.** The event build is answered end to end with the fixed sections present, ending at `## 근거`.
5. **Priced, not refused, and otherwise silent.** The one priced point this case allows — the time-limited licensed window's rating or regulatory cost the reference names, plus the earnable-equivalent variant — is stated at most once, as one line under `## Needs verification` / `## 확인 필요`. Stating it twice, or refusing the window, FAILS. No null-finding line. An Ethics bullet asserting compliance is a FAIL, and so is any tier code (`T1`–`T4`, `T2a`, `T2b`), any mechanic-family slug (`fomo-window`, `one-shot`, `metered-access`, `wait-or-pay`, `pass-expiry`, `streak-repair`, `sycophancy`), any `✓` stamp, or any reference filename appearing anywhere in the answer. The tier call in item 3 is graded from what the answer *does* — that it does not refuse and does not demand a return date — never from a printed code.

Permitted, not required: one plain-language clause naming a bound the build must keep holding — the real-money price shown at the decision point, currency denominations matching item prices, no countdown pressure in flows minors reach. Written as a number inside the spec bullet it constrains, that is correct. Phrased as a report that the checks already passed, it is a null finding and FAILS item 5.

**No Ethics bullet exists (3.2.0).** The card has no Ethics field any more. A bound the build must hold appears as a number inside the spec bullet it constrains (Fires when, Return event, Guardrails, Kill if), labelled as a recommendation when it is house policy; a residual risk appears as a Guardrails metric. FAIL on: any bullet labelled Ethics / 윤리 or equivalent; any sentence, in a card or in an added section, that reports compliance ("already meets", "which is fine", "what your design already gets right") or moralizes about the mechanic itself; any `✓`, tier code, slug or filename. **Not a violation:** `## 확인 필요` / `## Needs verification` is a fixed contract section; a jurisdiction point to verify, or a one-line rating cost plus the variant that avoids it, is correct there. **Not a violation:** the `cadence` mode's own required body parts — the spec sheet, **acceptance bounds** and **reviewer flags** — are the artifact the user asked for, and are graded only on whether they re-litigate what the user already made compliant. This supersedes any wording above that permits an Ethics bullet or clause.

**The `## 근거` / `## Basis` line is not a null finding.** The contract prescribes one line there when nothing was skipped; a line such as "All checks ran" or "근거: 공개 기준 확인" in that section is correct and never fails the silence item. The silence rule governs cards and any added section.

Scored, both arms.

**Headings and labels are graded by function (3.2.0).** The skill now names every section, card label and tag in English and tells the model to translate them into the output language. Any faithful translation counts: `## 전제`, `## 가정` or `## Assumptions` for Assumptions; `## 근거` or `## Basis` for Basis; `[가정]` or `[assumed]` for the tag; `피드백`, `피드백·연출` or `Feedback` for the Feedback bullet; and so on. The Korean strings above are examples, not required spellings. What still fails: a heading in the wrong language for the prompt, both languages side by side, or a missing section.
