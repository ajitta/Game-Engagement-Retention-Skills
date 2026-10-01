# Domain ethics — Interactive narrative and episodic

One of six domain files. `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md` owns the tiers, the three questions, the refusal template and the minors overlay (run before any row lookup); its compliant-spec index names the file holding each family's row, and this file owns its rows. A row runs forbidden → compliant spec → the author's preference; a title ending in a backticked slug keys it to that index. Slug and tier code never reach the answer — the reader gets the bound to hold, the price of the choice or the residual risk, in plain language, and a configuration meeting every bullet of its row produces nothing at all.

**Forbidden (T1/T2a) — two families.**

**Ending paywalls — T2a — `ending-paywall` (the forbidden end of the wait-or-pay family).** Forbidden: for a sold product, an ending unreachable by play alone; for a free-to-read product, final episodes reachable only by payment. "Last three episodes pay-only" and completed works locked behind multi-year waits both fail. The compliant configuration of the same family is the T4 기다리면 무료 table below, whose Free-path bullet is this rule stated positively.

**Coin bundles and subscriptions — T1 in Korea — `currency-obfuscation`.** 전자상거래법 six dark-pattern types: no pre-selected upsell; total price on the first purchase screen; separate explicit consent for free-to-paid and for auto-renewal price increases; no hidden renewal; prominent cancel; no 반복간섭. In force 2025-02-14, first enforcement 2025-10-15. Coin denominations match episode prices, so no bundle leaves an unspendable remainder engineered into the next purchase. Hiatus-migration campaigns may not steer a reader from a paused free series into a paid one without labelling the recommendation as commercial.

**Compliant spec (T2b–T3) — two rows, both domain-scope.**

**Cliffhangers — T3, five tests replacing the old intent test.** (1) **Unit-of-value**: the episode resolves at least one question it raised, readable from the script. (2) **Adjacency**: no purchase or unlock surface on the same screen or in the same session segment as the unresolved beat. (3) **Late-hour**: after 23:00 local time the session-end beat offers a closure variant or an explicit stop card — read the threshold out of the config, and it is one number, not a per-title override. (4) **Metric**: validated on next-session return and season completion, never on same-session continuation or post-cliffhanger unlock revenue — if only unlock revenue moves, it is a paywall dressed as tension. (5) **Recall**: the next episode opens with a spoiler-safe recap of the reader's own prior choices. **[contested]** — written-story studies find cliffhangers raise desire for the next installment [Schibler, Hahn & Green, Media Psychology 2023 | N=202, N=273], a lab replication finds arousal but no rise in intention to continue [Wirz et al., Psychology of Popular Media 2022 | N=133], and the only behavioural study finds serial arcs sustaining repeat sessions [Lu et al., Communication Research 2023 | n=44 children 8–12].

**Earn-rate, recap and hiatus duties — T3.** Any cut to soft-currency earn rates (ad rewards, replay rewards, key refill) requires prior notice, a holdout and a documented rollback path. After N days away: spoiler-safe recap restating the reader's own choices, plus a controls refresher, before new content — N is set to the title's own median inter-session gap and written into the config, so a reviewer can read the number rather than infer it. Pre-announce schedule changes; on paid serials treat a gap past **three consecutive days** as a churn event with a bridging plan [하철승, 2020 | one male-skewed Korean web-novel platform | correlational]. Track **per-title churn** distinctly from app churn.

**Preference (T4 — the author's stance).**

**기다리면 무료 (wait-or-pay) — T4 — `wait-or-pay`, explicitly carved out of the universal absence test.** The free path always completes, so the timer paces rather than withholds and the absence test does not apply to it. Dominant lawful model in the plugin's own Korean and Japanese markets.

| Field | Value |
|---|---|
| Timer | Disclosed per title before the reader starts the series |
| Period | Sub-24h drifting (Piccoma's 23h is the reference) **or** a fixed daily grant — both acceptable. The grant may be fixed; the expiry may not. The failing form of the drifting variant is a 24h refill anchored to last use, which walks the appointment out of waking hours |
| Free path | Reaches every episode including the finale, at the same wait cadence and unlock cost as the rest |
| Tickets | Free tickets never expire, however they were granted — waited for or handed out on a fixed clock, they sit until spent. A grant whose ticket expires unused is the failing form (Naver Series' fixed 22:00 ticket fails on the expiry, not on the fixed hour) |
| Invariance | Identical regardless of spend history |
| Purchase surface | Never on an emotional-stakes cut or cliffhanger screen |
| Paying buys | Time, never advantage |

**Stance on the free branch (same T4 block).** The free branch stays a legitimate, non-humiliating path; paid "clearly superior" choices convert authored meaning into a price tier. **[contested]** — the Choices franchise cut ad rewards 100 → 10/day and removed replay gems in Nov 2025 against a 3.6 Google Play rating [1.29M reviews], and is still a $544M lifetime franchise: a churn signal, not automatically fatal.

## Numbers that do not exist

- **기다리면 무료 conversion.** No platform publishes wait-or-pay conversion, the wait-vs-pay split, or timer-optimisation data. The circulating 25% conversion and ~₩30M → ~₩68M daily GMV figures are one 2019 write-up of a 2014-era 카카오페이지 launch [DBR via 인터비즈 | 2019], not a current rate.
- **Choice consequence.** No study links visible choice consequences to real return rates.
