# Retention Economics

Read this when the deliverable is a revenue-versus-retention trade-off — LTV/ARPDAU, ad load, ad placement, banner cadence, first purchase, paywall, subscription.

## Boundary

This module answers what monetization does **to** retention. It does not design a monetization system: pricing, eCPM, mediation, gacha rate tables and pity tuning are out of scope — decline those in one line and name the boundary.

## The LTV frame

`LTV ≈ ARPDAU × Σ R(d)`, d = 1…H, where R(d) is the share of one install cohort active on day d under one stated day convention and H is a declared horizon. Three caveats travel with the formula every time it is written:

1. **ARPDAU is not constant in d.** Survivors are richer than the cohort mean, and every payer/non-payer split here is self-selected — rewarded-ad engagers 4.5× likelier to buy, D30 ≥50% against a 13% all-app benchmark [Unity, 2022 | 8 high-DAU apps | self-selected, no randomization]. A flat day-0 ARPDAU misprices the tail.
2. **Truncated and outlier-dominated.** State H (D7 → D90) with any pLTV figure; direct-distribution pLTV models have "limited success due to their vulnerability to outliers" [TapTap, 2025, arXiv 2510.08281 | whale-skewed spend]. Prefer two-part (propensity × amount) models.
3. **An accounting identity, not a causal model.** Levers move both terms, usually in opposite directions — decide on a measured Δ for both, from one kept holdout, never on a re-forecast.

R(d) needs one return rule, one day boundary and one denominator throughout (`${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/metric-definitions.md`): the same raw data yields D1 43% or 32% depending on the rule.

## Worked break-even: one more ad per hour

Illustrative inputs, not benchmarks — substitute the product's own.

| Step | Value |
|---|---|
| Baseline | ARPDAU $0.050 · Σ R(d), d=1…90 = 12.0 retained days/install → LTV₉₀ ≈ $0.60 |
| 4-week test | ARPDAU $0.056 (+12%) · Σ R(d) −1.5% |
| Naive read | 0.056 × 11.82 = $0.662 (+10%) → ship |
| ×3 long-run correction | Σ R(d) −4.5% → 0.056 × 11.46 = $0.642 (+7%) |
| Break-even | Σ R(d) may fall at most 10.7% (1 ÷ 1.12) before the gain is erased |
| Kill line | Holdout Σ R(d) down >10% at 8+ weeks → revert |

## Ad load as a price on the free tier

The best-identified elasticity is out-of-domain and must be labelled an analogy [Goli, Huang, Reiley & Riabov, QME 2025, arXiv 2412.05516 | 2014–2016 | ~35M Pandora listeners, 21-month randomized 9-arm ad-load experiment | mean listening hours]:

- One extra ad per hour cut mean listening time **2.08%** (SE ~0.12–0.23%); the highest-load arm ended ~2% fewer weekly actives.
- Decomposition of the final-month decline: **~40% users gone entirely, ~42% fewer active days, ~18% shorter sessions.** The cost lands on actives and active days — session length is the wrong place to look for it.
- Effects kept growing, stabilizing only after **12–15 months**: a one-month test understates ad-load churn by about **3×**. Treat 1–2 week interstitial tests as directional only.
- Higher load also raised paid ad-free subscriptions: ad-free uptake is evidence of ad pain, not of a healthy load.

Directionally replicated in-app: revenue/user +43% at 6 sponsored slots, daily engagement −2.2% [Rashid & Yoganarasimhan, arXiv 2607.14418, 2026 | **working paper** | 66-day RCT, >5M users].

**[contested] one studio-wide cap.** For segment-adaptive load: ad aversion vs IAP is U-shaped, high- and low-aversion users both outspend moderate ones [Bae, Yang & Ryu, ICIS 2024 | one mobile game]. Against it: one intervention direction moved total revenue up, up and down across three games depending on which segment reacted, so a segment policy does not transfer [Airbridge, 2025 | **vendor, no absolute numbers**].

**Delaying ads is not free** — hypercasual titles earn **63% of Day-60 ad revenue on Day 1** [AppsFlyer, State of App Monetization 2026 | Jan 2025–Mar 2026 | $7.2B IAA verified]; first-interstitial timing across three hybrid-casual hits spans 1–12 min, mean 5.6 [Wehrmann, HAW Hamburg MA thesis, 2025 | **not peer-reviewed**].

## Placement: rewarded pinch point vs forced interstitial

Compliance floor precedes optimisation: interstitials at level start, before the splash screen, or after the user chose another action are violations whatever the test says; they must be closeable within 15s, 5s for child-directed apps; opted-in rewarded and post-score-screen interstitials are exempt [Google Play Better Ads Experiences | effective 2022-09-30, current]. Canonical compliant placement: after the score/result screen.

- **Resource-out pinch point beats between-levels:** 38.1% engagement for rewarded placements fired when the player runs out of resources vs 23.8% between levels; >15 placements up to 46%; top reward types gacha 31.1%, extra moves 30.5%, daily rewards 30.3% [Unity 2024 report via PocketGamer.biz and GameDev Reports | **primary gated**].
- **Forced vs optional, measured:** forced interstitials after every level lowered fun *and* in-game performance (active play 343s vs 627s control — the ad took about half the session); an optional rewarded video letting players avoid demotion scored the highest FunQ mean, 66.9 (SD 16.4), above the no-ads control [Fitton, MacKenzie & Read, IDC 2024, https://eprints.lancs.ac.uk/id/eprint/229351/ | n=95 children aged 9–11, single-game lab study; differences small].
- A non-declinable "reward" is not a choice — grade it as a forced interstitial.

## Gacha and banner cadence

The gacha clock is a **42-day version split into two 21-day banner phases** [Genshin v7.0, 2026-08-12 → 09-22], and spend tracks that clock, not the week: one v2.0 update day lifted daily spend +740% to $8.5M and held above pre-update levels for 10 days [AppMagic estimates via PocketGamer.biz, 2025 | Zenless Zone Zero | estimated store revenue]. So **D30/D42 and version-cycle spend are the health metrics, not D7** — D7 lands mid-phase, and a revenue trough inside a phase is cadence, not churn. Never prescribe cadence compression as the fix for a decaying D7 (`${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/liveops-cadence.md`, `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/genre-profiles.md`).

## First purchase, paywall, subscription month-1

- **First purchase is a selection event before it is a causal one.** "Payers retain better" describes who buys, not an effect of buying; test it with a holdout, never a payer/non-payer split.
- **PC/console has a commercial deadline, not a paywall:** a Steam purchase is refundable within 14 days if played under 2 hours, Early Access playtime included — the first two hours are the D0 gate.
- **Paywall model buys conversion, not durability:** hard paywalls convert 10.7% trial-to-paid by day 35 vs 2.1% freemium (~5×) and earn $3.09 vs $0.38 per install by day 60, yet one-year retention is at parity, 27% vs 28% [RevenueCat, 2026-03-19 | 115,000+ apps, >$16B revenue | subscription apps].
- **Month 1 is the subscription intervention window:** it carries **35% of all annual-plan cancellations**; mid-year monthly cancellation runs 3–10% [same source]. Define subscription retention as M1/M12 paid survival.
- Purchase-surface legality is in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md` (Korea 전자상거래법 six dark-pattern types); ending paywalls and free-path integrity are in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics.md`.

## Guardrails for any monetization-touching change

Pre-register these beside the primary metric; read them against the pre-change baseline on a kept holdout, not against last month.

| Guardrail | Read it as | Trip line |
|---|---|---|
| Payer count × ARPPU, decomposed | Revenue up on fewer, heavier payers is concentration, not growth | Payer count falls while revenue rises |
| Top-decile spend share | Dependence on a shrinking group | Rises vs baseline |
| Refund / chargeback rate | Regret at the purchase surface | Any rise vs baseline |
| Uninstall · opt-out · permission revocation | The exit margin ad load loads onto | Any rise vs baseline |
| Review-keyword share: 강제 · 부담 · 매일 | Coercion, in the players' own words | Weekly share rises vs baseline |

Split revenue into interstitial, rewarded and IAP, and report retention by payer-propensity segment — one ARPDAU number hides the segment that is leaving.

## Numbers that do not exist

Say so rather than substituting a plausible figure.

- No published elasticity of **game** retention to ad load; the Pandora figures are audio streaming, used as a labelled analogy.
- No first-purchase conversion, ARPPU or payer-share benchmark in this evidence base.
- No public 기다리면 무료 conversion rate; the circulating 25% / 2× GMV figures are 2014 case data.
- No battle-pass completion or repurchase rate, no pass-fatigue percentage, no win-back lift.
- **Never quote** "aggressive early ads reduce retention 40–60%" (unsourced vendor blog) or "ad skips earn up to 10× a rewarded impression" (analyst estimate, no disclosed data).
