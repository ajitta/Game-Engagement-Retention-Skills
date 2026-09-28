---
type: script
ablation: scored
run: python3 scripts/count-bullet-sentences.py --max 2
---

The contract's two-sentence limit per bullet, counted by `scripts/count-bullet-sentences.py`
on the final assistant message (stdin). PASS when the script's last line is `OVERALL: PASS`.

It counts every markdown list item in the answer — card bullets and every list outside the
cards (Order, Measurement plan, diagnosis lists). A leading bold label, a trailing tag such
as `[assumed]`, and a bracket citation are not sentences; decimals and common abbreviations
do not end one.

Why a script: seven Opus 5.5 rounds of an LLM judge applying this rule disagreed between
runs on the same transcript, and the rule is mechanical.
