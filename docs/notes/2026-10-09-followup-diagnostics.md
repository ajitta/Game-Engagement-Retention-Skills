# Follow-up diagnostics — 2026-10-09 (after 3.5.0)

Two cases failed on every recent reading. Each was diagnosed on saved transcripts first, at zero generation cost, and then checked with one focused generation run. Harness as in `2026-10-09-measure-3.5.0.md`. Raw files are kept outside the repository, under `ger-review/evals/2026-10-09/`.

## `refusal-tp-hidden-odds` — 3.5.0 is not the cause

From saved transcripts, a refusal paragraph above the first `##` heading appeared in 1/10 (3.4.1), 5/10 (3.4.2), 2/10 (3.4.3) and 9/10 (3.5.0) runs. The 3.4.3 vs 3.5.0 difference read p = 0.006, so 3.5.0 looked like a regression.

That comparison crossed runs made five hours apart. Rerun with both arms in parallel, 10 runs each:

| | 3.4.3 | 3.5.0 |
|---|---|---|
| Case PASS | 0/10 | 2/10 (p = 0.47) |
| Item-1 FAIL (judge) | 7 | 5 |
| Refusal paragraph present (regex) | 3/10 | 3/10 |

**The p = 0.006 does not reproduce.** The case is unstable from one batch to the next on both bodies, and today's judge fails item 1, item 3 (an incomplete redesign spec) and item 4 (Basis over two sentences) at similar rates on both. Neither the "korea-market read" hypothesis (p = 0.11) nor the "cards vs spec sheet" hypothesis (p = 0.26) cleared noise on the saved transcripts. No body change follows. This is recorded as model-side variance on the one case where the skill must refuse and still deliver.

## `mode-adv-compare-build-tutorial` — a routing miss, not a grader problem

**The grader is sound.** Every failing transcript, 18 across 3.4.3 and 3.5.0, fired no plugin skill at all and answered with a plain opinion ("Probably yes, but not a traditional tutorial"). Every saved run in which a skill fired passed: 3/3 on 3.3.1 and 3/3 on 3.4.1b, where RSD fired and handed off to ADV. The model judged a build-or-not question answerable without a skill.

**Fix.** The ADV `when_to_use` now opens with "Build-or-not asks too ('do we even need a tutorial?'), even when an opinion seems enough." This follows CONTRIBUTING's rule: if a skill under-triggers, say in its description why to run it even when a direct answer is possible. Two English examples were trimmed to stay under the 1,536 listing cap; each already has its own routing case. Lengths: description 972, combined 1,517.

Measured with 3.5.0 vs the change in parallel, 5 runs per case:

| Case | 3.5.0 | change |
|---|---|---|
| mode-adv-compare-build-tutorial | 0/5 (no skill fired) | **5/5** (ADV fired; p = 0.008) |
| routing-positive-adv-two-deliverables | 5/5 | 5/5 |
| routing-edge-prioritization | 5/5 | 5/5 |
| routing-edge-paired-complaint | 5/5 | 5/5 |
| routing-edge-session-length (must stay IRM) | 5/5 | 5/5 |
| korean-routing-adv-integrate (skill + Korean output) | 10/10 | 10/10 |
| homeless-tutorial-funnel (must stay RSD) | 10/10 | 10/10 |

The new trigger did not pull the session-length complaint or the tutorial-funnel ask into ADV. Generation cost: $16.53 (3.5.0) and $17.97 (change). Always-on cost: ~1,871 tok (3.5.0: ~1,873).
