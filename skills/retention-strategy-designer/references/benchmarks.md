# Retention Benchmarks and Their Populations

Read this whenever a retention number is about to be quoted, targeted or compared — including when the user pastes one at you; day conventions live in `metric-definitions.md`, per-genre reads in `genre-profiles.md`.

## Standing rules

- **Five fields or it is not a benchmark**: source · data year and edition · population with its floor · percentile · day convention. Missing one, it is context, never a target — and when a user quotes a number, first ask which of the five they can supply rather than accepting it.
- **Never average across rows.** D30 for "mobile games" is 0.68–0.79% (all games ≥1k MAU), 5% (Adjust-attributed installs), 7–8% (top-25 casual by revenue) and 17.8% (Royal Match, Jan 2026 cohort, panel estimate) — ~25× from population alone. The mean of those describes nothing.
- **Editions are not a time series.** GameAnalytics 2025 reported a D1 median near 17% (11,600 games, no MAU floor); 2026 reports ~22% (16,262 games, 1,000-MAU floor). The report attributes the move to "the refined methodology", not to the market.

## Mobile games — the default distribution

**Population:** live mobile games ≥1,000 MAU, iOS+Android, stated 9-region scope, 2025 calendar-year data, 16,262 games · UTC calendar day, strict return-on-day-N · percentiles across *games*, not players · GameAnalytics 2026, https://www.gameanalytics.com/reports/2026-mobile-pc-gaming-benchmarks

| Percentile | D1 | D7 | D30 |
|---|---|---|---|
| P25 | 12.45% | 1.67–1.94% | <0.5% |
| P50 | ~22% | just under 4% | 0.68–0.79% |
| P75 | just above 30% | 6–7% | 1.6–1.8% |
| P90 | ~40% | 11–12% | — |
| P99 | 64–68% | 25–28% | 13–15% |

Regional D1 medians, same population: Oceania 25.63 · NA 23.28 · Europe 22.20 · Middle East 21.90 · Central America 21.37 · South America 20.09 · Africa 18.52 · Asia 17.50. Asia D7 median 2.68%, D30 0.53% against Oceania 1.39.

**[corrected]** Cite that table, never the report's prose: "the top 1% exceed 45% in every region" is false for Africa (P99 D1 = 43.30%) and "Asia and Africa trail slightly below 19%" overstates Asia. Only 8 regions appear in the published regional table despite the 9-region scope, and the page is a living document.

**PC, same report** (3,582 games, ≥100 MAU and 4+ months live, 2025 data): D1 median ~7%, D30 ~0.2–0.25%, DAU/MAU 4–5%, playtime 32–33 min/day over ~18-min sessions. D7 is **[contested]** — 1.1–1.3% on the HTML page against 1.7–1.8% in the PDF — and D1/D30 were revised down (9%→7%, 0.3%→0.2–0.25%) between the January and August 2026 versions, so date any PC figure to the version read.

## Genre medians — 2024 data, D28, the last genre cut

**Population:** 11,600 mobile games, iOS+Android, 9 regions, Jan–Dec 2024 calendar data, P50 across games · UTC calendar day, strict · **D28, not D30** · GameAnalytics 2025 edition, https://www.gameanalytics.com/reports/2025-mobile-gaming-benchmarks

| Genre | D1 | D7 | D28 |
|---|---|---|---|
| Arcade | 22.33% | — | — |
| Puzzle | 20.53% | 4.51% | 1.19% |
| Casual | 20.18% | — | — |
| Strategy | 19.85% | 3.18% | 0.68% |
| Board | 19.81% | 5.96% | 2.23% |
| Card | 19.05% | 6.83% | 2.85% |
| RPG | 15.27% | 2.05% | 0.42% |
| Multiplayer | 12.80% | — | 0.51% |

Card and Board retain best to D28, Multiplayer worst. The 2026 edition drops genre cuts ("due to ongoing improvements to game genre categorization"), so **no public 2025-data genre medians exist**. D28 and D30 are different metrics on a weekly rhythm: D7/D14/D28 land on the install weekday, D30 two weekdays later, so a weekend-heavy game reads lower at D30 for reasons unrelated to retention.

## UA-attributed installs

**Population:** marketing-attributed installs on Adjust-measured apps, 2024 data · rolling 24-hour blocks from install, month = 30 days · averages, not medians · Adjust retention handbook, https://www.adjust.com/resources/guides/user-retention/

| Segment | D1 | D7 | D14 | D30 |
|---|---|---|---|---|
| All verticals | 26% | 13% | 10% | 7% |
| Gaming | 27% | 13% | 8% | 5% |
| Hyper-casual | 27% | 8% | 5% | 2% |

Gaming D30 5% against the GameAnalytics median 0.68–0.79% is ~7× from population alone. Adjust's own framing: "Top games in the market regularly exceed 40-50% D1 Retention. Benchmarking against averages is somewhat misleading."

## Top of market

**Population:** panel-**modelled estimates**, not measured analytics; top 25 games *by revenue*, install cohorts · Sensor Tower. Top-25 casual, December 2025: D1 ~30% / D7 14.9% / D30 7–8%. Top-25 midcore: D1 44–45% / D7 20.9% / D30 11–12% / D365 4–5%. Per-title January-2026 cohort estimates (H1 2026 Digital Gaming Market Index, https://sensortower.com/blog/h1-2026-digital-gaming-market-index): Royal Match D1 60.9 / D7 31.5 / D30 17.8 / D180 6.8 · Whiteout Survival D1 42.7 / D7 14.1 · MONOPOLY GO! D1 22.6 / D180 1.76.

14.9% sits between P90 (11–12%) and P99 (25–28%): a designer told to hit it is told to reach roughly the 95th percentile. **[corrected]** That 14.9% and the "top-25 casual D7 declining since early 2022" trend come from two different Sensor Tower reports and must not be merged; and do not state "hybridcasual out-retains hypercasual" as a durable rule — in the same H1 2026 per-title data the hypercasual leader out-retains every listed hybridcasual leader at D7.

## East Asia, and the Korea proxy

**Population:** top-5,000 Adjust-measured apps in Japan, games vertical · Adjust rolling-24h · Adjust × Sensor Tower, モバイルアプリトレンド2026：日本版, https://sensortower.com/ja/blog/adjust-sensor-tower-2026

| Cut | D1 | D7 | D30 |
|---|---|---|---|
| Japan games, H1 2026 (Jan–May) | 26% | 11% | 4% |
| Japan games, H1 2025 | 24% | 9% | 3% |
| Japan comics/manga, 2025 | 23% | — | 7% |

**Use the Japan row as the Korea proxy, and say out loud that you are doing so and why.** The reason is an absence, not a preference: KOCCA's 게임이용자 실태조사 measures usage rate and daily minutes, Mobile Index publishes MAU / installs / usage time with 이탈률 gated, and Airbridge's Korea benchmark covers UA channels only — no D1/D7/D30, no LTV. Japan is the nearest published market on a documented convention. Order of magnitude only, and the clocks differ: Japan is rolling-24h, while Korean teams on Airbridge are calendar-day and therefore comparable to AppsFlyer, not to Adjust. Non-cohort Korean anchors are in `korea-market.md`.

**[contested]** "Japan retains best" is dataset-dependent — an older AppsFlyer cut (2022 data) named Japan best at D30 6.4%, against Adjust's 2026 Japan D30 of 4%.

## Non-game apps

**Population:** 2,600+ companies, 10,600+ products, 17 industries, Sep 2023–Sep 2024 data · Amplitude rolling-24h default · three-month retention · Amplitude 2025 Product Benchmark Report, https://amplitude.com/blog/media-entertainment-product-benchmarks

Median **3.8%**, top 18.5%. Travel and hospitality highest median (10%); B2B technology median 2.5% against 15.6% at the top; media and entertainment P90 13.4%.

- Consumer apps D7 / D30 — iOS 6.89 / 3.10, Android 5.15 / 2.82 (Pushwoosh 2025, https://www.pushwoosh.com/blog/increase-user-retention-rate) — **medium confidence: sample and methodology undisclosed**. Its Android action-games row (D1 1.11 / D7 0.16 / D30 0.04) is an artifact; never propagate it.
- Health and learning: a median 70% abandon lifestyle and mental-health apps within 100 days, curvilinear — mental-health 89–92%, alcohol 95–97% (18 free-living studies, 525,824 users; JMIR 2024, https://www.jmir.org/2024/1/e56897). Yet attrition across 79 RCTs of depression/anxiety apps is 18.6% post-test and 28.4% at follow-up, comparable to face-to-face psychotherapy (~17%), and **lower in trials with reminders, human contact and no gamification** (JAMA Psychiatry 2026, https://doi.org/10.1001/jamapsychiatry.2025.3439). Low retention here is partly the domain, not the design.

## Do not quote

- **"7% D30 flattening = product-market fit."** Amplitude's finding is that returning **7% of a cohort on Day 7** puts a product in the **top 25% for activation**; the companion 69% is a **correlation** between D7 return and three-month retention across products (https://amplitude.com/blog/7-percent-retention-rule). Wrong metric, wrong day, wrong causality.
- **40/20/10 as an expectation.** It is roughly P95–P99 of the current market; the median is 22 / ~4 / 0.7. If a band is genuinely required for a funded, paid-UA title, use **35 / 15 / 5** labelled top-decile-to-P95 and explicitly not a median (Iljuk 2026, https://investgame.net/wp-content/uploads/2026/01/2026-01-20-Mobile_retention_benchmarks_2026.pdf).
- **"Median app ~4% D30 — Appcues."** No such dataset exists. Use the Amplitude three-month median 3.8%.
- **"Platform average Android 21.1 / iOS 23.9 D1 — BusinessOfApps."** Untraceable to a primary. Use the Pushwoosh rows with their undisclosed-methodology flag, or AppsFlyer 2025 marked **[unverified]**.
- **2022 AppsFlyer genre grids** — puzzle 31.85 / 12.18 / 5.35, hyper-casual 33 / 12 / 4, mid-core 45 / 22 / 10, casual 23 / 8 / 3.6. Top-quartile Q3-2022 figures recirculating as "2026 benchmarks", incompatible with the medians above (2024-data puzzle median 20.53 / 4.51 / 1.19 at D28). Printing both families is self-contradiction; assume any "2026 genre grid" is reprinted 2022 data until its primary is opened.
- **"Bain 2025: 64% of players experience battle-pass burnout."** Misattribution. Bain's Gaming Report 2025 (5,243 respondents, six countries, 12 Aug 2025) reports **64% say ads interrupt their gaming experience** (+5pp YoY) and 46% often purchase after those ads (+6pp). It carries no battle-pass fatigue statistic — quote no burnout percentage.
- **"Adjust 2026: cross-industry median 25–26 / 11–13 / 5–7."** Wrong four ways: Adjust publishes averages of attributed installs, not cross-industry medians; the figures are 26/13/7 all verticals and 27/13/5 gaming; the 2026 edition's public material shows install and session growth with no retention triple; and the population is missing.
- **Four aggregator artifacts.** Mixpanel's "92% weekly retention (APAC)" and "+86% YoY" are publicly undefined and conflict with every N-day source, probably WAU ratios. "Genshin Impact weekly retention 78/82/85%" has no first-party basis — HoYoverse's only 2025 disclosure gives 300M+ players and **no retention**. Sequoia's "leading casual 20%+ D30" is from an undated page and now sits beyond P99 (13–15%) — keep its shape vocabulary (flattening / declining / smiling), demote its numbers. "7 friends in 10 days" is a 2012 talk with no published cohort chart and the speaker's own caveat "for you it's going to be different"; use it only to illustrate the *form* of an activation metric — action × count × window.

## Numbers that do not exist

State the absence rather than substituting a plausible figure — an invented benchmark becomes a target within one meeting.

- **Korea install-cohort D1/D7/D30.** Verified absence; no Korean vendor publishes one. Use the Japan row as a stated proxy and build internal cohort baselines.
- **China cross-genre D1/D7/D30.** Verified absence; no open benchmark found. QuestMobile's 23 sessions and 114.4 minutes per user per day is session shape, not cohort retention.
- **FTUE and tutorial-completion benchmarks.** No vendor publishes them, and onboarding effects run single-digit to low-teens relative: tutorials were null in two of three games and moved play time 29% only in the most complex (Andersen et al., CHI 2012, >45,000 players, https://grail.cs.washington.edu/projects/game-abtesting/chi2012/chi2012.pdf).
- **Battle-pass completion, pass repurchase and pass-fatigue rates.** None published.
- **Win-back lift, login-calendar A/B results, 기다리면 무료 conversion rates.** None published. Design these as measured experiments against a randomized holdout, never against a benchmark.
