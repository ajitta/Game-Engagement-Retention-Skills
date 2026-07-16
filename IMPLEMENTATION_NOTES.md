# Implementation Notes — 2026-07-17 blind-spot hardening pass

Deviation log per `/unknowns:notes`. Plan: 21 verified findings from a 29-agent blind-spot workflow (6 scouts → dedup → adversarial verify; 1 of 22 refuted). Findings JSON: session scratchpad `confirmed-findings.json`.

## Assumption decisions (autonomous run — user can reverse)

- **ASSUMPTION-1 (language-contract finding)**: Interpreted the i18n commit `7f2b3fc` as "skill files English-first for Claude", NOT "output English-only". Restored one output-language line in all three SKILL.md ("Answer in the user's language... headings may stay in English") AND reworded the README usage note to match. Verifier suggested doing only one of the two; did both because they are now consistent, not contradictory. Reverse by deleting the three Output lines and rewording README to English-first.
- **ASSUMPTION-2 (identity + license findings)**: Chose GitHub owner `ajitta` (same email as `chosh1179` in git history) for plugin.json author, marketplace.json owner, and LICENSE copyright. Reverse by swapping the name back; LICENSE holder should then change too.

## Deviations from the verified fixes

1. **Version bump 1.0.0 → 1.1.0** (plugin.json) — in no finding; added so installed copies pick up the behavior change. Standard semver minor.
2. **IRM description catch-all dropped**: removed "or any product where reveal, choice, feedback, anticipation, or satisfying micro-moments matter" to fit the 1024-char description budget (now 1019). Slight trigger narrowing; the listed app types remain. Re-add by trimming elsewhere.
3. **ADV description examples trimmed**: dropped two long example quotes ("both the reward moments and retention", "analyze the dopamine points ...") for budget (now 1022). The remaining examples cover the new edge cases instead.
4. **Passion.io benchmark row deleted** (retention-playbook) rather than adding its source URL — verifier offered either; the row was low-confidence and the qualitative "learning apps skew low" note carries the point.
5. **Token-cost table not re-measured** — README caveat added instead ("pre-i18n build, approximate"), as the verified fix explicitly allowed deferral.
6. **README "Three edge rules" paragraph added** after the routing table — not a listed fix, but required to keep README's routing story truthful after the description changes (the cadence-mechanic, paired-complaint, session-length, and comparison-mode findings).
7. **RSD description trims for budget**: "churn reduction"→"churn", dropped "metrics" from the Outputs tail, "daily login rewards"→"login rewards" (now ≤1024). No semantic loss intended.

## Not done (out of scope)

- Full test-triad re-run against the English-first texts (README now states this explicitly).
- Rewriting git history for the chosh1179 identity (explicitly excluded by the verifier).
