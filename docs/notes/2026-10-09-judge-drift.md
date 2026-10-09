# Why the 10-09 gate reading dropped — cross-judge diagnosis (2026-10-09)

The 3.4.3 comparison (`2026-10-09-gate-10x-3.4.3.md`) scored fp 47/60 and tp 13/30 on the 3.4.2 baseline. On 2026-10-02, the 3.4.1 body scored fp 58/60 and tp 27/30. The skill bodies the gate reads are identical between 3.4.1 and 3.4.2, so the drop comes from the judge, the generation, or both. The 10-02 transcripts were saved, so the two can be separated without generating anything new.

**Two judge harnesses, same model (claude-opus-5-5), same grader files (`evals/` is byte-identical):**
- **old judge** — the 10-02 runner. Frontmatter stripped, `--tools ''`, JSON output, `VERDICT:` line.
- **new judge** — the 10-09 runner. Whole grader file, default tools, `OVERALL:` line.

| Transcripts × judge | fp | tp |
|---|---|---|
| 3.4.1 (10-02) × old judge, as recorded on 10-02 | 58/60 | 27/30 |
| 3.4.1 (10-02) × old judge, re-run today | 56/60 | 20/30 |
| 3.4.1 (10-02) × new judge | 55/60 | 21/30 |
| 3.4.2 (10-09) × old judge | 50/60 | 13/30 |
| 3.4.2 (10-09) × new judge | 47/60 | 13/30 |

## What this says

- **The judge harness is not the cause.** On the same transcripts, the old and new harnesses agree within a run or two (56 vs 55 on fp, 20 vs 21 on tp).
- **Re-judging the same transcripts with the same harness lost 7 tp passes in a week:** 27 → 20 out of 30 (Fisher p = 0.06). Of the 90 transcripts, 81 got the same verdict as on 10-02. All nine that changed went from PASS to FAIL; none went the other way, which is directional (sign test p ≈ 0.004). Same prompt, same grader text, same transcript: the stricter reading comes from the judge model's behaviour, not from anything in this repository.
- **Generation also moved.** The 10-09 transcripts score lower than the 10-02 transcripts under either judge: fp 56 → 50 (p = 0.15) and tp 20 → 13 (p = 0.12). Neither delta clears noise on its own, but both point the same way.
- **Net effect:** about 7 tp passes come from the judge drifting stricter, and about 6 fp and 7 tp come from generation. Both sit at or near noise individually. No SKILL or grader change in this repository explains either.

## A script grader for "silent, not stamped" was tried and not shipped

The mechanical half of fp item 4 (a `✓`, a tier code, a backticked or hyphenated family slug, a reference filename) was written as a script and run over all 180 saved fp transcripts:

- It flags 2 / 2 / 3 transcripts across the three sets.
- Six of those seven the judges had already failed. The seventh is a `✓` inside a mock-up of the user's own streak screen, which the judge passed and the script would fail.
- So the judges apply the mechanical half consistently.

The failures that move the score are semantic: "your rule is the ethical choice", "nothing below needs a consecutive-day streak", re-arguing the user's design. A script cannot grade those. CONTRIBUTING's rule — move a form rule to a script grader — has nothing to act on here, so no grader change was made.

## Consequence for the gate

The gate threshold stays as written. A gate reading is only comparable to another reading made in the same week with the same judge. The baseline-vs-variant comparison CONTRIBUTING already requires is the valid unit; an absolute reading against 55/60 and 29/30 from a different week is not. The 3.4.3 and 3.5.0 entries report both arms for that reason.
