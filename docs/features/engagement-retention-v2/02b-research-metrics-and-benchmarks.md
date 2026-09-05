---
status: draft
revised: 2026-09-06
---

# Retention Metrics, Benchmarks and Experiment Design (2025–2026)

A retention number is not a measurement of a product; it is a measurement of a product *under a definition, a population and a day convention*. The same app reads 43% or 32% D1 depending only on whether a day is a calendar date or a rolling 24 hours (Amplitude, 2025, https://amplitude.com/docs/analytics/charts/retention-analysis/retention-analysis-time). Across vendors, published D30 for "mobile games" spans 0.68% to 5% to 17.8% — a 25x range that is entirely explained by sample and definition, not by product quality. This document fixes the definitions, gives the benchmark rows that survived verification with their exact populations, deletes the figures that do not survive, and specifies the experiment and intake discipline a designer needs before any of it can be used.

---

## 1. The definitions that change the number

### 1.1 Four orthogonal axes

Each axis moves a retention figure more than most product work does. A number without all four tags is not comparable to anything.

| Axis | Options | Direction of effect |
|---|---|---|
| Return rule | N-day (strict) / unbounded / bracket | Unbounded ≫ strict |
| Day boundary | Calendar day / rolling 24h from install | Calendar ≫ 24h at D1 |
| Denominator | Installs / tutorial-complete / registered | Later gate ⇒ higher rate |
| Return event | Any session / critical event | Critical event ≪ any session |

**Return rule.** Amplitude's docs name three modes: "Return On" (N-day — came back on that exact day), "Return On or After" (unbounded — returned that day *or any later day*), and custom brackets, where "each bracket is measured on its own, not a running total, so later brackets can exceed earlier ones"; Day 0 is always 100% and incomplete days are asterisked (Amplitude Docs, 2025, https://amplitude.com/docs/analytics/charts/retention-analysis/retention-analysis-interpret). The guidance is cadence-matched: single-day retention "when you care whether users come back on a specific cadence", on-or-after "when you care whether users come back at all by a given point".

The size of this gap is easy to underestimate. In the Ascarza field experiment the control group's "Retention 7" — defined as *plays at least once in the subsequent 7 days* — is **64.3%**, and "Retention 14" is **74.3%** (Ascarza, Netzer & Runge, 2025, ~330,000 users, F2P puzzle game, https://evaascarza.com/papers/Ascarza_Netzer_Runge_IJRM25.pdf). The all-mobile-games strict D7 median is just under 4% (GameAnalytics, 2026). These are both real, both correct, and roughly 16x apart. A designer who reads a paper's "Retention 7" as a benchmarkable D7 will conclude their game is catastrophic when it is median.

**Day boundary.** GameAnalytics uses UTC calendar days with strict return-on-day-N logic (GameAnalytics Docs, 2025, https://docs.gameanalytics.com/events-metrics-and-filtering/metrics). Adjust treats install as t=0 and measures 24-hour blocks: "ONLY users who have completed the entire 24 hours of day 2 are included in the calculation", and a month is 30 days (Adjust Help, 2025, https://help.adjust.com/en/article/how-cohorts-work). AppsFlyer states the opposite explicitly: "In AppsFlyer a cohort period doesn't take into account the specific install timestamp… cohort days, weeks, and months are based on the calendar day… This may cause discrepancies when comparing AppsFlyer cohort data to the cohort data of other networks" (AppsFlyer Help, 2025, https://support.appsflyer.com/hc/en-us/articles/207040496-Cohort-and-retention-dashboard). Airbridge — the dominant Korean MMP — is calendar-based and publishes the worked case: install 20:00 on 2024-01-01, open 08:00 on 2024-01-02, "the calendar date has changed and therefore the user is counted as a user who returned to the app in Day 1", 12 hours later (Airbridge Help, 2024, https://help.airbridge.io/en/guides/retention-report-faq).

**The Amplitude worked example.** Amplitude's own published comparison of one app: "Day 1 retention by calendar dates is 43 percent, while Day 1 retention by 24-hour window is only 32 percent. As we move further, the difference becomes less significant… the two lines almost merge" (Amplitude, 2025, https://amplitude.com/docs/analytics/charts/retention-analysis/retention-analysis-time). Three things follow, and all three are actionable:

1. An 11-point D1 gap from a settings toggle is larger than almost any onboarding A/B result in this evidence base — tutorials moved play time 29% in the *most complex* of three games and were null in the other two (Andersen et al., CHI 2012, >45,000 players, https://grail.cs.washington.edu/projects/game-abtesting/chi2012/chi2012.pdf).
2. D1 is the convention-sensitive metric; D7 and D30 converge. Cross-vendor D7/D30 comparison is defensible with a caveat; cross-vendor D1 comparison is not.
3. Calendar-day is not "wrong". Amplitude recommends it when a decision cannot wait a full day (UA spend) and 24-hour when it can. Pick one, write it down, never switch mid-analysis.

**Korea-specific consequence.** GameAnalytics anchors on UTC. A Korean player (UTC+9) who installs at 08:30 KST is still on UTC "yesterday" until 09:00 KST, so a KST-calendar in-house D1 and a GameAnalytics benchmark are offset systematically, not randomly. Korean teams on Airbridge are calendar-day and therefore comparable to AppsFlyer, **not** to Adjust or to a default Amplitude chart.

### 1.2 Vendor conventions, verified against docs

| Vendor | Day convention | Session rule |
|---|---|---|
| GameAnalytics | UTC calendar, strict | Foreground interval; ends on background |
| Adjust | Rolling 24h; month = 30d | ≥30-min gap |
| AppsFlyer | Calendar day/week/month | 10-min min gap, from 6th session |
| Amplitude | Rolling 24h default (hour-rounded) | Configurable |
| Airbridge (KR) | Calendar date | Same-device same-date installs collapsed |

GA4/Firebase adds a 30-minute inactivity timeout (max 7h55m), and an "engaged session" needs >10 seconds, a key event, or 2+ screen views (Google, 2025, https://support.google.com/analytics/answer/12798876?hl=en). The consequence for reward-moment work is direct: a game that backgrounds and foregrounds often reports 2–3x more "sessions" in GameAnalytics than in GA4 for identical behaviour, and AppsFlyer's 10-minute rule inflates session counts relative to 30-minute-timeout vendors. Any "sessions per day" or "session length" target must name its session definition or it is unfalsifiable.

### 1.3 Denominator, D28 vs D30, and stickiness

**Install vs tutorial-complete.** Japanese practitioner heuristics circulate as D1 50% / D7 30% / D30 10%, with puzzle at D1 70% (gamemarketinglab, https://gamemarketinglab.com/dau_retention_rate), against Adjust's measured Japan game medians of D1 26 / D7 11 / D30 4. The gap is the denominator — registered or tutorial-complete players versus all attributed installs — plus survivorship of launched hits. The arithmetic is worth internalising: if 60% of installs finish the tutorial and essentially all D1 returners are tutorial-completers, a 22% install-denominated D1 is a ~37% tutorial-denominated D1 *with no change to the game*. Neither number is wrong; publishing them interchangeably is.

**D28 vs D30.** GameAnalytics' 2025 edition reported D28; its 2026 edition reports D30; Adjust recommends tracking days 1, 3, 7, 14, 28 and 30. For a product with a weekly rhythm this is not a rounding difference: D7, D14 and D28 land on the *same weekday as install*, while D30 lands two weekdays later. A weekend-heavy game will read systematically lower at D30 than at D28 for a reason that has nothing to do with retention. Comparing a D28 benchmark row to a D30 in-house figure is a category error; treat them as different metrics.

**DAU/MAU stickiness.** Mixpanel reports gaming stickiness "leveled off at 32%" in both APAC and North America on a base of 517.6 billion events across 808.2 million devices (Mixpanel, 2026, https://mixpanel.com/blog/mobile-gaming-benchmarks-2026/). GameAnalytics' PC median DAU/MAU is 4–5% (P75 ~7%, P90 13–15%) on 3,582 PC games (GameAnalytics, 2026, https://investgame.net/wp-content/uploads/2026/01/2026-01-27-2026-mobile-pc-benchmarks_compressed.pdf). Both are correct: stickiness measures whether the intended cadence is daily. Tencent's WeChat mini-game platform makes the same point about its own 500M MAU — "5억 月活 중 상당수가 아직 고빈도 습관을 형성하지 못했다" / 「5亿月活里仍有大量用户尚未养成高频习惯」 — while WeChat itself has almost no DAU/MAU gap (WeChat Mini-Game Developer Conference, 2026, https://blog.zengrong.net/post/wechat-minigames-9-year-report). Stickiness is a *fit-to-cadence* diagnostic, never a universal target.

**Return-event retention.** Amplitude argues retention should be defined on a critical event rather than any activity, and reports that users of the finance app Dave who added recurring expenses during onboarding "were 5.7 times more likely to be using the app three months later" (Amplitude, 2025). This is the definition to prefer for products where opening the app is not evidence of value — journaling, learning, companion, fortune apps. It also makes numbers incomparable to every vendor benchmark, which is the correct trade.

> **Skill implication.** `retention-strategy-designer` must carry a four-tag rule: no retention number is quoted, targeted, or compared without (return rule, day boundary, denominator, return event). Add the Amplitude 43%-vs-32% example verbatim as the reason. Add a Korea note (Airbridge = calendar-day; GameAnalytics = UTC). `interaction-reward-moments` must stop stating session-cadence advice ("N sessions of X minutes") without naming a session definition, and should recommend one canonical in-house definition with vendor benchmarks treated as order-of-magnitude only. All three skills should prefer a return-event definition for non-game domains and state that doing so breaks benchmark comparability on purpose.

---

## 2. Why vendor benchmarks disagree by up to 10x

Five mechanisms, in order of magnitude:

1. **Population.** GameAnalytics measures live games running its self-serve SDK, a population skewed to indie and early-stage titles; Adjust and AppsFlyer measure apps running an attribution SDK, which skews to studios buying paid traffic; Sensor Tower's retention figures are *panel-modelled estimates* of the **top 25 games by revenue**. As one practitioner summary puts it, "All three describe their sample honestly and get quoted as if they described the industry" (Game Growth Advisor, 2026, https://gamegrowthadvisor.com/blog/2026-03-17-mobile-game-kpis-benchmarks-2026/).
2. **MAU floor.** GameAnalytics' 2026 edition applies a 1,000-MAU floor to mobile and 100 MAU + 4 months live to PC. Its 2025 edition (11,600 games) stated no such filter and reported a D1 median near 17% against 2026's ~22%. The two editions are **not a time series** — the report attributes the difference to "the refined methodology".
3. **Survivorship.** "Many top-performing studios store data in-house and never appear in public benchmarks" (Iljuk, 2026, https://investgame.net/wp-content/uploads/2026/01/2026-01-20-Mobile_retention_benchmarks_2026.pdf). Top-25-by-revenue rows have the opposite bias: they are the surviving right tail by construction.
4. **Platform and region.** GameAnalytics 2025 put top-quartile D1 at iOS 31–33% vs Android 25–27%. Regional D1 medians in 2026 range from Oceania 25.63% to Asia 17.50%.
5. **Attribution and channel mix.** Attribution-SDK samples are paid-traffic-heavy by definition; organic and paid cohorts differ (see §7).

**The quoting rule.** Never print a retention figure without all five of: *source, edition/data-year, population with its floor, definition tag, and percentile*. If any one is unavailable, the number is context, not a benchmark, and must not become a target. And never average across rows: D30 for "mobile games" is 0.68–0.79% (all games ≥1k MAU), 5% (Adjust-attributed installs), 7–8% (top-25 casual by revenue) and 17.8% (Royal Match, Jan 2026 cohort, panel estimate). Averaging these produces a number describing nothing.

> **Skill implication.** Replace the playbook's single "Benchmark Context" table with a *distribution plus population* block, and add the five-part quoting rule as an output-discipline check. Add an explicit instruction: when a user quotes a benchmark at the advisor, the first move is to ask which of the five fields they can supply — not to accept the number.

---

## 3. Verified benchmark reference

### 3.1 Mobile games — the distribution (the default reference)

Population for every row: **live mobile games, ≥1,000 MAU, iOS+Android, 9 regions, 2025 calendar-year data, 16,262 games**; UTC calendar day, strict N-day (GameAnalytics, 2026, https://www.gameanalytics.com/reports/2026-mobile-pc-gaming-benchmarks). Verification: **confirmed verbatim** by two independent passes.

*Table note: the §3.1–§3.3 tables are at the five-column limit; add an edition or confidence dimension by splitting the table, not by adding a column — including when these rows are copied into 02-research.md or a reference file.*

| Percentile | D1 | D7 | D30 | Status |
|---|---|---|---|---|
| P25 | 12.45% | 1.67–1.94% | <0.5% | confirmed |
| P50 | ~22% | just under 4% | 0.68–0.79% | confirmed |
| P75 | just above 30% | 6–7% | 1.6–1.8% | confirmed |
| P90 | ~40% | 11–12% | — | confirmed |
| P99 | 64–68% | 25–28% | 13–15% | confirmed |

Regional D1 medians (same population): Oceania 25.63, North America 23.28, Europe 22.20, Middle East 21.90, Central America 21.37, South America 20.09, Africa 18.52, Asia 17.50. Regional D30 medians: Oceania 1.39, NA 1.18, Europe 0.92, Asia 0.53. Asia's D7 median is 2.68%.

**[corrected]** Two of the report's own prose sentences fail against its own table and must not be quoted: "the top 1% (P99) exceed 45% in every region" is false for Africa (P99 D1 = 43.30%), and "Asia and Africa trail slightly below 19%" overstates Asia (17.50%). Cite the table, not the prose. **[contested]** The report's TL;DR sentence about regional convergence was transcribed by one verifier as "Regional baselines are stable; differentiation happens at the top" and by another as "Regional baselines are similar; the divergence happens at the top" — do not quote it verbatim in either form; state the finding (baselines converge at the median, spread at the top) in your own words. Also: the sample is 16,262 games, only 8 regions appear in the published regional table despite a stated 9-region scope, and the report page is a living document (PC figures were revised between the January PDF and the August 2026 page).

### 3.2 PC, Roblox and genre — the sub-populations

| Population | D1 | D7 | D30 | Status |
|---|---|---|---|---|
| PC, 3,582 games ≥100 MAU, 2025 | ~7% (P50) | 1.1–1.3% or 1.7–1.8% | ~0.2–0.25% | **[contested]** |
| Roblox, 0–3 min sessions | 4.3% | 0.41% | — | GA 2025 Roblox |
| Roblox, 19–24 min sessions | 11.46% | 1.61% | — | GA 2025 Roblox |
| Genre P50, 2024 data — Card | 19.05% | 6.83% | 2.85% (D28) | last genre cut |
| Genre P50, 2024 data — RPG | 15.27% | 2.05% | 0.42% (D28) | last genre cut |

PC D7 is internally inconsistent between the HTML page (1.1–1.3%) and the PDF text (1.7–1.8%), and PC D1/D30 were revised downward (9%→7%, 0.3%→0.2–0.25%) between the January PDF and the August 2026 page — date any PC figure to the version read. The report itself frames PC correctly: "PC engagement is depth-driven, so mobile-style retention reads differently… success on PC shows up in session length, playtime and DAU/MAU"; median PC playtime is 32–33 min/day over ~18-min sessions.

Roblox rows (GameAnalytics 2025 Roblox report, 47% of platform engagement, https://www.gameanalytics.com/reports/2025-roblox-report) show retention scaling with the session-length band — a reminder that "population" includes intra-platform sub-populations. The Roblox bands are owned by 02e (UGC section) — take the design reading from there.

Genre rows are **2024 data**, GameAnalytics 2025 edition, P50 medians, D28 not D30 (https://www.gameanalytics.com/reports/2025-mobile-gaming-benchmarks). The 2026 edition states: "Due to ongoing improvements to game genre categorization, genre-level benchmarks are unavailable in this report." **No public 2025-data genre medians exist.** Full 2024 ordering: Arcade 22.33 / Puzzle 20.53 / Casual 20.18 / Strategy 19.85 / Board 19.81 / Card 19.05 / RPG 15.27 / Multiplayer 12.80 at D1; Card and Board retain best to D28, Multiplayer worst (D28 0.51%).

### 3.3 UA-attributed installs and top-of-market

| Population | D1 | D7 | D30 | Status |
|---|---|---|---|---|
| Adjust, gaming, 2024 data | 27% | 13% | 5% (D14 8%) | primary |
| Adjust, all verticals | 26% | 13% | 7% (D14 10%) | primary |
| Adjust, hyper-casual | 27% | 8% | 2% (D14 5%) | primary |
| Top-25 casual by revenue, Dec 2025 | ~30% | **14.9%** | 7–8% | **[corrected]** |
| Top-25 midcore by revenue | 44–45% | 20.9% | 11–12%; D365 4–5% | **[corrected]** |

Adjust rows: marketing-attributed installs on Adjust-measured apps, rolling-24h day convention (https://www.adjust.com/resources/guides/user-retention/). Adjust's own framing is honest — "Top games in the market regularly exceed 40-50% D1 Retention. Benchmarking against averages is somewhat misleading." Note the D30 spread against §3.1: 5% vs 0.68–0.79% is ~7x from population alone.

**[corrected]** on the Sensor Tower rows: the figures come from **two different reports** and must not be merged. State of Mobile 2026 carries the 14.9% December-2025 point reading, the midcore D365 4–5%, and a hybridcasual-beats-**hypercasual**-on-D1 claim; State of Gaming 2026 (public PDF, 2026-02-26) carries the longitudinal claim that top-25 casual D7 declined from early 2022 through late 2025 and that hybridcasual now sits above **casual** on D7. The standout title is **Tasty Travels** (plural, Century Games, ~22% D7), not "Tasty Travel". "Top 25" is by revenue. These are **panel-modelled estimates, not measured analytics**. A newer anchor exists: Sensor Tower's H1 2026 Digital Gaming Market Index (July 2026, https://sensortower.com/blog/h1-2026-digital-gaming-market-index) reports mobile IAP $39.8B (−2% YoY), downloads 24B (−12%), playtime 221B hours (flat), and publishes per-title January-2026-cohort estimates — Royal Match D1 60.9 / D7 31.5 / D30 17.8 / D180 6.8; Block Blast! D7 33.4 / D180 7.93; Whiteout Survival D1 42.7 / D7 14.1; Last War D1 39.8 / D7 11.1; MONOPOLY GO! D1 22.6 / D180 1.76. In that data the hypercasual leader out-retains every listed hybridcasual leader at D7, so **do not state the hybridcasual-beats-hypercasual line as a durable rule**.

Context for 14.9%: it sits between P90 (11–12%) and P99 (25–28%) of the whole market. A designer told to hit it is being told to reach roughly the 95th percentile.

### 3.4 East Asia

| Population | Figure | Status |
|---|---|---|
| Japan games, H1 2026 (Jan–May) | D1 26 / D7 11 / D30 4 | primary |
| Japan games, H1 2025 | D1 24 / D7 9 / D30 3 | primary |
| Japan comics/manga, 2025 | D1 23% / D30 7% | primary |
| Korea install-cohort D1/D7/D30 | **does not exist publicly** | verified absence |
| China cross-genre D1/D7/D30 | **no open benchmark found** | verified absence |

Japan rows: Adjust × Sensor Tower, *モバイルアプリトレンド2026：日本版*, top-5,000 Adjust apps (https://sensortower.com/ja/blog/adjust-sensor-tower-2026) — 「1日目の継続率は前年同期の24％から26％へ、7日目は9％から11％へ、30日目は3％から4％へ上昇しました」. Adjust convention (rolling 24h). Japan card-game installs +18% with sessions +113% YoY and time-in-app 30.84 min (+21%) — the Pokémon TCG Pocket effect. **[contested]** "Japan retains best" is dataset-dependent: an older AppsFlyer cut (2022 data) named Japan best at D30 6.4%, against Adjust's 2026 Japan D30 of 4%.

Korea: KOCCA measures *usage rate and daily minutes*, not install cohorts; Mobile Index publishes MAU/installs/usage-time (이탈률 gated); Airbridge's Korea benchmark covers UA channels only, explicitly no D1/D7/D30 or LTV (https://www.airbridge.io/ko/blog/apac-gaming-app-trend-2026). The honest statement for the skills is: *no Korean vendor publishes a Korea-specific retention triple; use Adjust APAC/Japan as a stated proxy and build internal baselines.*

What Korea does publish, and it matters more than a missing D7: **[corrected]** KOCCA's 2025 게임이용자 실태조사 (published 2025-12-18; n=10,000 nationwide, ages 10–69; fieldwork 14 Jul–29 Aug 2025 *per secondary coverage, not the press release*) reports past-year game usage at **50.2%**, −9.7pp YoY from 59.9%, 5-year CAGR −6.8%, the lowest since measurement began in 2015 (74.5%); series 2022 74.4 → 2023 62.9 → 2024 59.9 → 2025 50.2 (https://www.kocca.kr/kocca/koccanews/reportview.do?menuNo=204767&nttNo=1073). Among game users: mobile 89.1% (−2.6pp), PC 58.1% (+4.3pp), console 28.6% (+1.9pp). Daily minutes: PC 117.9 weekday / 193.4 weekend (5-year high), mobile 90.9 / 116.4, console 53.4 / 103.8. **Denominator corrections that must travel with the numbers:** the "time shortage 44.0%" figure is among the **3,828** respondents who played before but do not now (multiple response), and the "video/OTT substitute 86.3%" is among the **1,331** who said they found a substitute leisure activity — not of all non-users. KOCCA's own press release says the sample is "게임이용자 10,000명", which is internally inconsistent with reporting a population usage rate; wire coverage confirms a general-population sample.

Two Korean/Chinese engagement anchors with no cohort equivalent: Zeta (제타) AI character-chat at roughly **40 hours per user per month**, "1인당 월 40시간에 이르는 체류… 리텐션·체류는 이미 메가앱급", against Korean top mobile games at 2.2–2.6M MAU (Mobile Index, 2026, https://bbs.ruliweb.com/amp/news/read/226803 — AI-modelled device estimates); and QuestMobile's China figure of 23 sessions and 114.4 minutes per user per day for mobile games, which is micro-session fragmentation unlike Korea's long sessions. Reward cadences do not transfer across these three markets.

### 3.5 Non-game apps

| Population | D7 | D30 | Status |
|---|---|---|---|
| Consumer apps, iOS (Pushwoosh 2025) | 6.89% | 3.10% | **medium** |
| Consumer apps, Android (Pushwoosh 2025) | 5.15% | 2.82% | **medium** |
| All products, 3-month (Amplitude 2025) | — | 3.8% median / 18.5% top | primary |
| Lifestyle & mental-health, free-living | — | ~70% gone by day 100 | peer-reviewed |
| Education apps (Business of Apps) | — | ~2% | **[unverified]** |

Pushwoosh (https://www.pushwoosh.com/blog/increase-user-retention-rate) discloses neither sample size nor methodology, and its Android action-games row (D1 1.11 / D7 0.16 / D30 0.04, against iOS 21.48 / 5.81 / 2.53) is an artifact — **never propagate it**. Its cross-check row, AppsFlyer full-year-2025 iOS D1 25.4 / D30 5.3 and Android 20.2 / 3.8, was seen only via Business of Apps and is **[unverified]** against a primary.

Amplitude's 2025 Product Benchmark Report (2,600+ companies, 10,600+ products, 17 industries, Sep 2023–Sep 2024) gives the most useful non-game frame: median three-month retention 3.8% vs 18.5% at the top; travel/hospitality highest median (10%); fintech top-decile 19.5%; B2B technology median 2.5% vs top 15.6%; media & entertainment 90th percentile 13.4% (https://amplitude.com/blog/media-entertainment-product-benchmarks). Its day convention is Amplitude's rolling-24h default and its "activation" is a return-on-day-N metric, not a milestone — this matters in §4.

Health and learning: median 70% of users abandon lifestyle/mental-health apps within 100 days, curvilinear (18 free-living studies, 525,824 users; JMIR 2024, https://www.jmir.org/2024/1/e56897); mental-health apps 89–92%, alcohol 95–97%. But trial attrition in 79 RCTs of depression/anxiety apps is 18.6% post-test and 28.4% at follow-up, comparable to face-to-face psychotherapy (~17%) and pharmacotherapy (15–30%), and was **lower in trials with reminders, human contact and no gamification** (Liu, Torous, Linardon et al., JAMA Psychiatry 2026, https://doi.org/10.1001/jamapsychiatry.2025.3439). Low retention in this domain is partly the domain, not the design.

Subscriptions are a different metric entirely: RevenueCat's 2026 report (115,000+ apps, >$16B revenue, 19 Mar 2026, https://www.revenuecat.com/blog/growth/subscription-app-trends-benchmarks-2026) finds the first month accounts for **35% of all annual-plan cancellations**, mid-year monthly cancellation runs 3–10%, hard paywalls convert 10.7% trial-to-paid by day 35 vs 2.1% for freemium (~5x) and earn $3.09 vs $0.38 per install by day 60 — yet **one-year retention is at parity** (27% vs 28%). Paywall model buys conversion, not durability.

> **Skill implication.** Ship §3.1 as the default reference table with its population header attached, not as loose rows. Add the PC branch (report DAU/MAU, playtime, session length — not mobile D-N targets) and the Roblox session-band rows as evidence that sub-populations move retention more than most mechanics. State the two verified absences (Korea, China) as facts rather than leaving a blank. For non-game domains, use Amplitude's 3-month percentiles and the JMIR/JAMA attrition frame instead of game numbers, and define subscription retention as M1/M12 paid survival with the intervention window inside month 1.

---

## 4. Myths to stop quoting

**40/20/10.** Presented as a median expectation, it is roughly P95–P99 of the current market: median is 22 / ~4 / 0.7. GameAnalytics' own 2026 guidance keeps it only as a contextual reference and states "Different genres and business models produce different retention shapes" (https://www.gameanalytics.com/blog/how-to-think-about-retention-in-games). A defensible modern replacement for a funded, paid-UA title is roughly **35 / 15 / 5**, proposed explicitly as a successor to 40/20/10 (Iljuk, 2026, https://investgame.net/wp-content/uploads/2026/01/2026-01-20-Mobile_retention_benchmarks_2026.pdf) — and even that is a top-decile-to-P95 target, not a median.

**The "7% = product-market-fit" rule.** The real Amplitude finding is that returning **7% of a cohort on Day 7** places a product in the **top 25% for activation**, and that 69% of top seven-day-activation performers were also top three-month-retention performers (Amplitude, 2025, https://amplitude.com/blog/7-percent-retention-rule). It is a **D7 activation percentile**, not a D30 flattening threshold, and the 69% is a **correlation between D7 return and 3-month retention across products** — closer to "D7 predicts D90" than to "aha-moment causes retention". A product could hit 7% D7 on acquisition quality alone. The playbook's current "D30 curve flattening above ~7% is a product-market-fit signal" conflates the metric, the day and the causal claim.

**The misattributed Adjust composite.** A row reading "Consumer apps, cross-industry median D1 ~25–26% / D7 ~11–13% / D30 ~5–7%, Adjust Mobile App Trends 2026 (via aggregator)" is wrong four ways: Adjust publishes **averages of attributed installs**, not cross-industry medians; the figures are 26 / 13 / 7 (all verticals) and 27 / 13 / 5 (gaming) from the retention handbook and the 2024-data report, not a range; the 2026 edition's public material shows install and session growth only, with no retention triple (**[unverified]** whether the 2026 edition changed them); and the population — marketing-attributed installs, rolling-24h days — is missing entirely.

**The Bain battle-pass burnout number.** "Bain 2025 found 64% of players experience battle-pass burnout" is a misattribution. Bain's Gaming Report 2025 (5,243 respondents across six countries, 12 Aug 2025, https://www.bain.com/insights/gamer-survey-great-gameplay-is-no-longer-enough-gaming-report-2025/) reports that **64% say ads interrupt their gaming experience** (+5pp YoY) — and, in the same survey, that 46% often make in-game purchases triggered by those ads (+6pp). There is no battle-pass fatigue statistic in it. Quote no burnout percentage.

**Anything tracing to 2022 AppsFlyer data.** Genre grids circulating as "2026 benchmarks" — puzzle 31.85 / 12.18 / 5.35; hyper-casual 33 / 12 / 4; mid-core 45 / 22 / 10; casual 23 / 8 / 3.6 (e.g. https://www.digitalapplied.com/blog/mobile-app-marketing-statistics-2026-install-data) — are top-quartile figures from AppsFlyer's Q3 2022 breakdown, the last broadly published genre cut. GameAnalytics' 2024-data puzzle median is 20.53 / 4.51 / 1.19 (D28). The two families are incompatible; a skill that prints both is self-contradicting. Any "2026 genre grid" should be assumed to be reprinted 2022 data until its primary is opened.

**Three more not to propagate.** Mixpanel's "92% weekly retention (APAC)" and "+86% YoY one-week retention" are undefined in the public post and conflict with every N-day source — probably WAU ratios, not cohort retention. Publisher prototype gates ("Voodoo 45% D1") circulate as norms but are top-decile greenlight thresholds **[unverified]** in this evidence base. Aggregator "Genshin Impact weekly retention 78/82/85%" pages have no first-party basis and mutually inconsistent sourcing; the only first-party HoYoverse disclosure (Jul 2025) gives 300M+ players, 50/50 China/overseas, 60/40 M/F, 70% aged 18–30 — and **no retention**.

**"7 friends in 10 days."** From Chamath Palihapitiya's 2012 Startup School talk, with his own caveat in the same talk: "for you it's going to be different" (https://genius.com/Chamath-palihapitiya-how-we-put-facebook-on-the-path-to-1-billion-users-annotated). No cohort chart, threshold analysis or causal test has ever been published. The "curve flattens at 7 friends" embellishment is not in the talk. Use it only to illustrate the *form* of an activation metric (action × count × window).

> **Skill implication.** Add a "do not quote" list to the playbook naming these seven items with the corrected version beside each, because the failure mode is regurgitation, not ignorance. Where the skills need an aspirational band, use 35/15/5 labelled "funded, paid-UA, top-decile" — never 40/20/10 as an expectation. Rewrite the 7% line to Amplitude's actual claim and mark it a correlation. Delete any battle-pass burnout number from the ethics module.

---

## 5. Reading a cohort curve

**The shapes.** Sequoia's taxonomy remains the right vocabulary — flattening ("the higher the level at which the curve flattens, the higher the long-term retention"), declining (no product-market fit; growth is a leaky bucket), and smiling (the curve rises as "product development and network effects propel churned users to return") (https://articles.sequoiacap.com/retention). **Demote its numbers**: the page is undated (embedded image timestamped 2018) and its "leading casual 20%+ D30" now sits beyond P99 (13–15%).

**What a shape does prove.** A flattening level is the closest thing to a durable retention read, and the D30/D1 ratio is a usable flattening proxy. GameAnalytics' window mapping is serviceable: D1 drop → onboarding and comprehension; D7 → reason to return beyond novelty; D30 → depth and live-ops.

**What a shape does not prove.** A smile is not proof that the product improved — it is the arithmetic of resurrection plus survivorship, and it is generated by anything that brings lapsed users back, including a marketing burst. Duolingo's June 2026 one-time "Streak Revival" restored longest-ever streaks for three lessons and revived **15.4 million** learners, **nearly 8 million of whom had no active streak** (Duolingo Q2 2026 shareholder letter, https://investors.duolingo.com/static-files/3c8277ee-bc94-4f5d-9b77-0db3e46f88b8). A curve containing that event says nothing about the base product. Conversely, a decaying curve on a top-3 IP is normal, not a verdict: DeNA disclosed Pokémon TCG Pocket average MAU of 51M (Jan–Mar 2025) → 39M → 30M → 28M (Oct–Dec 2025), with its own diagnosis 「ログイン頻度やユーザーの継続率の向上に課題がある」 and its remedy collection-experience updates and events rather than more pack-opening (gamebiz, 2026, https://gamebiz.jp/news/420505). Note that gamebiz's read that the measures "had a certain effect" is the reporter's inference from a slowing decline — a decay curve flattens on its own.

**Two shapes that are not churn.** (a) *Expected decay after a launch spike.* NCSOFT's CEO described Aion2 as having declined "along the expected decay curve" and scheduled a six-month anniversary event plus a Season 4 update to bring back lapsed users (FETV concall transcript, 2026, https://www.fetv.co.kr/news/articleView.html?idxno=302274). Korean MMO cohorts are dominated by server/region launch events — model those as distinct cohort events, not as a single curve. (b) *Finite or binge-style products.* GameAnalytics: "Games with lower DAU vs MAU but long sessions and high playtime often reflect binge-style or finite experiences", and PC medians (D30 ~0.2%) are not a failure signal for them.

**Engagement and revenue diverge.** Krafton grew PUBG-IP revenue +24% YoY past ₩1T in Q1 2026 on collaboration items (Krafton IR, Q1 2026) while PC average concurrents reportedly fell 749K → ~640K across 2025 **[unverified — BusinessPost industry estimate, no article URL retrieved; not a first-party disclosure]**. Judging live-ops health on revenue alone hides a shrinking base; judging it on CCU alone hides a working monetisation strategy. Report both.

**Split churn before treating it.** Mobile Index runs churn-destination analysis — for Coupang (Mar 2026), 2.36M churned users of whom **90.3% left the shopping category entirely** and only 9.7% moved to a competitor (https://insight-report.mobileindex.com/post/2026-h1-mobileapp-top100). Category-exit and competitor-switch need different responses; a win-back offer aimed at category-exiters is wasted. For Korea specifically, KOCCA names the category-exit destination: video/OTT, with time scarcity as the stated cause — which argues for *lower-commitment* sessions on return, not more rewards. NetEase's clearest resurrection case is exactly that: Fantasy Westward Journey PC's 畅玩服 removed the time-based fee and simplified systems, 「召回大量流失用户」, with peak concurrency reaching a record 3.58M (NetEase Q3 2025 coverage, https://www.nbd.com.cn/articles/2025-11-21/4152168.html).

> **Skill implication.** Keep the three-shape taxonomy and the D30/D1 flattening proxy; delete Sequoia's numeric heuristics or label them "legacy top-grossing". Add three rules: a smile must be attributed to a named event before it is claimed as improvement; expected post-launch decay and finite/binge products are not churn diagnoses; and churn must be split into category-exit vs competitor-switch before a win-back tactic is chosen. Add "friction removal" (lower-commitment mode, fee removal, simplified systems) as a first-class resurrection pattern alongside reward-based win-back, and use a 6-month anniversary/season checkpoint as the Korean MMO resurrection default.

---

## 6. Churn prediction and uplift in practice

**The loop that works is predict → explain → intervene**, not a standalone churn score.

- *Survival models handle censoring.* A difficulty-aware D-Cox-Time model plus a dynamic-difficulty intervention, A/B tested online in a live puzzle game, cut average next-day churn **10.9%** and week churn **~20%**, with treated users spending **10% more time** in game (Li et al., KDD 2021, Tsinghua + Beijing Microfun, https://jiayuli-997.github.io/files/KDD2021-LiJY-Churn_Prediction.pdf).
- *Prediction without decision support does not deploy.* Publishers "are usually unable to apply high-accuracy prediction methods in practice… due to the lack of the specific decision support (e.g., why they leave and what to do next)" — hence XAI churn-cause analysis (Xiong et al., NetEase Fuxi, KDD 2023).
- *Difficulty relief is the best-evidenced intervention lever.* The Ascarza RCT (~330,000 users) reports intent-to-treat effects of **+2.70pp on Retention 1** (control 29.5%), **+2.46pp on Retention 7** (64.3%), **+2.0pp on Retention 14** (74.3%; +1.99pp before rounding), +1.247 rounds and +2.13pp continue-within-10-minutes, all p<0.0001. **[contested] cost side:** easier play "significantly decreases purchases in the specific round played", but because it raises both engagement and retention, net spend rises in both the short and long run — strongest for progress-prone users and previous payers. DDA is not costless and is heterogeneous: skilled players who find early levels too easy have been found to churn *more*.
- *Target by uplift, not by churn risk.* Multi-treatment multi-task uplift networks are deployed for gaming bonuses with the outcome "whether to play the game" (Wei et al., 2024, https://arxiv.org/abs/2408.12803). Push-frequency uplift must model delayed response because "inappropriate push frequencies often trigger users to close notification switches, directly harming long-term user retention" (Zheng et al., AAAI 2026, validated on a 14-day A/B test with >1 billion users). Ranking by churn probability sends the heaviest pressure to the people most likely to opt out.
- *Tenure checkpoints.* Cox analysis of 295,008 League of Legends players: churn probability rises ~8% after 60 days and ~20% after 90 days of tenure; play-variety (champion diversity) lowers churn; social connectedness generally lowers churn **but** "playing with teammates was associated with lower win rates, which may negatively influence player retention" (Kim, Kim, Kim & Li, 2026, https://www.emerald.com/sbm/article/16/4/453/1333130/Analyzing-player-churn-in-esports-games-a-survival). Do not assert "social features always raise retention".
- *LTV.* Use two-part zero-inflated models (propensity × amount); state-of-the-art direct-distribution models "achieve limited success due to their vulnerability to outliers" (TapTap, 2025, https://arxiv.org/abs/2510.08281). Whale outliers dominate the loss function. Every pLTV-driven decision must state its horizon (D7 → D90).

> **Skill implication.** Rewrite the churn block as predict → explain → intervene with difficulty/pacing as the named lever and three independent deployed results behind it. Rewrite the resurrection block to target **persuadables by uplift**, model delayed outcomes, and cap notification frequency with an opt-out guardrail. Add 60/90-day tenure checkpoints for competitive products, with the caveat that squad play depresses win rate. Mark the 2016 survival-ensemble and 2018 NCSOFT references as legacy.

---

## 7. Experiment design

**Cohort discipline.** Same-week cohorts are necessary but not sufficient. Add **acquisition channel** as a second dimension — and get the direction right. **[corrected]** AppsFlyer's uninstall report (2024 data; 2.2K apps, 1.3B installs, 402M uninstalls, https://www.appsflyer.com/resources/reports/app-uninstall-benchmarks-report/) finds organic installs uninstall ~22% less than non-organic on average, but the retention split shows non-organic at **parity or slightly ahead at D1** (26.9% vs 26.1%) with the organic advantage opening only later (D7 10.3 vs 9.7; D30 4.5 vs 3.6). So paid cohorts need **D7–D30 depth work**, not the intuitive D0/D1 fix. Two caveats: the gap is *smallest in games*, because store-browsing blurs intent, so channel is a secondary axis for a games-first skill; and the measured difference is partly artifact — organic uplift, branded-search cannibalisation and post-ATT signal loss contaminate both buckets. It is a cohort *dimension with a causality caveat*, never a "paid = fix D1" rule.

**Reroll and install-cohort contamination.** In gacha and account-bound products, players who reroll for a good opening pull inflate the install denominator and depress D1 for reasons unrelated to design. Airbridge collapses duplicate installs on the same device ID on the same date to the last install, so same-device rerolls are partly absorbed; multi-account and multi-device rerolls are not. **[unverified]** — no dataset in this evidence base quantifies reroll share. The operational response is to compute a second D1 on a post-tutorial or post-first-gacha denominator and to compare the two, rather than to guess at a correction factor.

**Novelty and the time-varying effect.** The ATE "should not be viewed as a constant… it should more appropriately be regarded as a function of [time]: τ(t)". A novelty effect makes a change look good and fade; a primacy effect does the reverse (Larsen, Stallrich, Sengupta, Deng, Kohavi & Stevens, *The American Statistician* 78(2):135–149, 2024, https://arxiv.org/abs/2212.11366). Minimum two full weekly cycles, with an explicit decay check, before any read. The strongest available evidence on how badly short tests mislead comes from ad load: in a 21-month randomised experiment on ~35M Pandora listeners, treatment effects kept growing and stabilised only after 12–15 months, so **a one-month test understates churn by about 3x**; of the final-month decline, ~40% came from users no longer active at all and only ~18% from shorter sessions (Goli, Huang, Reiley & Riabov, *QME* 2025, https://arxiv.org/abs/2412.05516). Any change that trades user experience for revenue must be assumed to be under-measured at one month.

**Holdouts over pre/post.** Pre/post cannot separate the intervention from seasonality, a UA change or a store-feature. Hold back a randomised slice for the whole observation window, not just the launch week — the Pandora result is the argument for a long holdout specifically.

**Sequential testing and variance reduction.** Fixed-horizon p-values are "wholly unreliable" when tests are continuously monitored; always-valid p-values exist precisely for this (Johari, Pekelis & Walsh, https://arxiv.org/abs/1512.04922). Sequential methods are also the ethical requirement: "it is extremely important to quickly detect and abort treatments that are negatively impacting the user experience… without inflating Type I error rates" (Larsen et al., 2024). Variance reduction using pre-period covariates (CUPED) is the standard way to buy power without more users, and it is covered in the same review; **[unverified]** — the original CUPED paper is not in this evidence base, so cite the review rather than a specific effect size, and note that CUPED helps most where a pre-period metric exists (returning players, not fresh installs).

**Primary vs guardrail.** One primary metric per experiment, at the product's natural interval, defined as a return event. Guardrails must be pre-registered alongside it: uninstalls, notification opt-outs, session count, support complaints, refunds. Larsen et al. define them as metrics "that the experimenters wish to avoid negatively impacting" — the point is that they are declared *before* the read, not selected after. Their canonical illustration is the shape to watch for: "click-bait advertising has a positive short-term effect on click-through-rates, but a negative long-term effect on user retention and revenue".

**Power at small scale.** Per-arm sample for a two-sided 5% test at 80% power is n ≈ 7.84 · 2p(1−p) / δ². Three worked cases at market-median baselines:

| Metric, baseline | Effect sought | n per arm |
|---|---|---|
| D1, 22% | +2pp absolute | ~6,700 |
| D7, 4% | +1pp absolute | ~6,000 |
| D7, 4% | +10% relative (0.4pp) | ~37,600 |
| D30, 0.7% | +0.2pp absolute | ~27,200 |

The lesson is not "get more users" — it is that **D30 is almost never a viable primary metric for a small product**, that relative-lift framing costs an order of magnitude more sample than absolute framing, and that most published intervention effects are single-digit relative (feature RCT: session-ending hazard −11%, abandonment −14%; incentive RCT: downloads +7pp on a 14% base with "engagement across all groups… extremely low"). Pick D1 or a D7 return event as primary, power for the effect you would actually act on, and treat D30 as a monitored guardrail rather than a decision metric.

> **Skill implication.** Replace the bare Kohavi citation with four operational rules (τ(t) with a two-weekly-cycle minimum; pre-registered guardrails; no peeking without anytime-valid methods; holdout for the whole window) and the Pandora 3x result as the reason short tests are not conservative. Add the channel cohort dimension with its corrected direction and causality caveat. Add the power table so the skill can tell a user their test is unpowered instead of interpreting noise. Add reroll/denominator contamination as a named check for gacha products.

---

## 8. Data intake checklist — what to ask before diagnosing anything

Ask in this order; stop and say so if the first four cannot be answered, because everything downstream is then guesswork.

1. **Tool and convention.** Which analytics/MMP produces the number — GameAnalytics, Adjust, AppsFlyer, Airbridge, Amplitude, Mixpanel, GA4? Calendar or rolling-24h? Strict, unbounded or bracket? Which timezone?
2. **Denominator.** Installs, first-open, tutorial-complete, or registered? Are reinstalls and multi-account users deduplicated, and how?
3. **Return event.** Any session, or a defined critical event? What is the session definition (timeout, or foreground interval)?
4. **Cadence intent.** Is the product meant to be daily, weekly or episodic? This decides whether D1/D7, W1/W4, or DAU/MAU is even the right metric.
5. **Cohort shape.** Cohort size per week, install-week series, channel mix (organic vs paid share), platform split, top regions.
6. **Curve, not a point.** D0→D30 for at least three consecutive install weeks — a single D7 cannot distinguish flattening from declining.
7. **Lifecycle events overlaying the window.** Launches, server/region openings, seasons, collabs, marketing bursts, store features, price or ad-load changes.
8. **Segment splits available.** Payer/non-payer, tenure band, device tier, progression checkpoint, first-session length band.
9. **Churn destination, if known.** Category exit vs competitor switch (Korean and Chinese panel vendors publish this; most teams can approximate it from a survey).
10. **Experiment capacity.** Weekly new users, ability to randomise, holdout availability, minimum detectable effect at that volume — cross-check against §7's power table before promising a measurable result.
11. **Constraints.** Market(s) served, minors in the audience, monetisation model, and applicable disclosure duties (for Korea, 확률형 아이템 disclosure under 게임산업진흥에 관한 법률).

If a user supplies a benchmark instead of their own data, apply the §2 quoting rule to it before it enters the diagnosis.

> **Skill implication.** Put this list in `retention-strategy-designer` as a workflow step-0 gate and in `engagement-retention-advisor` as the first move when a user opens with a metric complaint. The skill's honest failure mode is "I cannot diagnose D7 without knowing your day convention and denominator" — that sentence is a better answer than a confident wrong one.

---

## What the retention playbook must change

| Current line | Verdict | Replacement |
|---|---|---|
| "Mobile games, top quartile ~26.5–27.7% D1 — GameAnalytics 2025" | Mislabelled | Keep as **2024-data P75**; add 2026 edition P75 "just above 30%"; never present as a series |
| "Mobile games, global median ~22% D1 (declining), low single-digit D7" | Half right | Replace with the full P25/P50/P75/P90/P99 table, population header, D30 0.68–0.79% |
| "Consumer apps, cross-industry median 25–26 / 11–13 / 5–7 — Adjust 2026 (via aggregator)" | Misattributed composite | Adjust handbook, 2024 data: all verticals **26 / 13 / 7**, gaming **27 / 13 / 5**; population = attributed installs, rolling-24h |
| "Consumer apps, platform average Android 21.1 / iOS 23.9 D1 — BusinessOfApps 2026" | Untraceable | Delete; use Pushwoosh iOS/Android D7–D30 with its "methodology undisclosed" flag, or AppsFlyer 2025 marked **[unverified]** |
| "Median app, all verticals ~4% D30 — Appcues 2026" | No dataset exists | Delete; use Amplitude 3-month median 3.8% (2,600+ companies) |
| "~7% retention rule: D30 flattening above 7% = PMF" | Wrong metric and claim | Amplitude: **7% D7 return = top-25% activation**; 69% is a D7↔3-month correlation |
| ">90% abandon before D30; benchmarks survivorship-biased" | True but vague | Keep the caution; attach the five-part quoting rule and the 25x D30 spread example |
| "Strongest primary sources: GameAnalytics (games), Adjust (apps)" | Incomplete | Add population labels to both; add Sensor Tower (top-25, panel estimate), Amplitude (non-game), RevenueCat (subscription) |
| Genre guidance (implicit; no rows) | Missing + risky | Add GameAnalytics **2024-data** genre medians labelled D28; state that no 2025-data genre cut exists; ban 2022 AppsFlyer grids |
| Korea / East Asia (absent) | Gap | Add: no public Korea cohort data; KOCCA 50.2% usage, −9.7pp; Japan 26/11/4 (H1 2026); Airbridge = calendar-day |
| "Novelty guard: 1–2 weeks, min 2–4 week observation" | Understated | τ(t) framing; two full weekly cycles minimum; one-month tests understate churn ~3x (Pandora) |
| "Cohort-based measurement only: compare same-week cohorts" | Incomplete | Add channel dimension with corrected direction (paid needs D7–D30 depth) and causality caveat |
| Reforge activation-funnel URL (line 95) | Unverifiable (403) | Cite **Casey Winters' talk** and label it practitioner heuristic; add the operational order (frequency → habit → aha → setup) |
| "Novelty/primacy, Microsoft arXiv 2102.12893" (line 101) | Keep, thin | Add Larsen et al. 2024 (arXiv 2212.11366) as the operational source; add Johari et al. for sequential testing |
| Kohavi book, guardrail blog links (lines 102–103) | Keep | Add pre-registration requirement and the power table; name uninstalls/opt-outs/complaints as mandatory guardrails |
| Benchmark source URLs (lines 106–109) | Aggregators | Repoint to primaries: GameAnalytics report pages, Adjust handbook, Sensor Tower State of Gaming PDF, Amplitude, RevenueCat |
| Battle-pass burnout figure (if quoted anywhere) | Fabricated attribution | Delete; Bain's 64% is about **ads interrupting play**, not passes |
