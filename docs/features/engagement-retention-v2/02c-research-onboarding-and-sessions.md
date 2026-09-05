---
status: draft
revised: 2026-09-06
---

# Onboarding, First Session and Session Design

D0/D1 is the most measured and least causally understood part of retention work. The strongest evidence here is negative: tutorials only pay in complex games, the famous "9-minute first session" rule is a 2016 game-level correlation whose own author disowned the causal reading, and the day-1 number itself moves ~11 points on measurement convention alone. What *is* well supported is narrower and more actionable — scale guidance to mechanic complexity, define one activation event and one day convention before setting any target, design the exit as deliberately as the entry, and treat session length as a diagnostic that is never a target. This document supplies the populations, definitions and corrections a designer needs to act without opening the sources.

---

## 1. What D0/D1 evidence actually supports

### 1.1 D1 is a convention before it is a fact

The single most consequential thing to fix before any onboarding target is set is the definition, not the design. Amplitude publishes a worked example where the same app measures **43% D1 by calendar date and 32% D1 by rolling 24-hour window** (Amplitude blog, Oleg Yakubenkov / GoPractice; convention documented at https://amplitude.com/docs/analytics/charts/retention-analysis/retention-analysis-time). That ~11-point gap is larger than almost any onboarding A/B lift anyone will ever ship.

| Vendor | Day-N convention | Session rule |
|---|---|---|
| GameAnalytics | UTC calendar day, strict return-on-day-N | Foreground interval; ends on background |
| Adjust | Rolling 24h from install; month = 30 days | New session after ≥30-min gap |
| AppsFlyer | Calendar day/week/month | 10-min minimum, from 6th session on |
| Amplitude | Rolling 24h (hour-rounded), calendar optional | Configurable |
| Airbridge (KR) | Calendar date | — |

Sources: GameAnalytics metrics docs (2025, https://docs.gameanalytics.com/events-metrics-and-filtering/metrics); Adjust cohorts (2025, https://help.adjust.com/en/article/how-cohorts-work); AppsFlyer cohort dashboard (2025, https://support.appsflyer.com/hc/en-us/articles/207040496-Cohort-and-retention-dashboard); Airbridge retention FAQ (2024, https://help.airbridge.io/en/guides/retention-report-faq); GA4 session glossary, 30-min inactivity timeout, max 7h55m (Google, 2025, https://support.google.com/analytics/answer/12798876?hl=en).

Three consequences that belong in the skills verbatim:

- **Calendar-day D1 always reads higher than rolling-24h D1 for the same app.** Airbridge's own example: an 8 PM install and an 8 AM open next morning — 12 hours apart — counts as Day-1 retained. Adjust would not count it.
- **Korean teams are affected twice.** Airbridge, the dominant Korean MMP, is calendar-based (comparable to AppsFlyer, not to Adjust); and GameAnalytics' UTC day boundary falls at 09:00 KST, so KST evening play straddles the boundary a Korean studio's in-house KST-calendar D1 does not.
- **"Return On" ≠ "Return On or After."** Strict N-day and unbounded retention are different metrics; unbounded is always higher, and bracketed retention is not cumulative, so later brackets can exceed earlier ones (Amplitude Docs, 2025, https://amplitude.com/docs/analytics/charts/retention-analysis/retention-analysis-interpret).

The convention distortion is worst at D1 and shrinks as N grows — Amplitude's own commentary notes the two lines almost merge by the later days, and recommends calendar dates when a UA decision cannot wait a day **[contested framing: calendar-day retention is not simply "wrong"]**.

### 1.2 The actual D1 population numbers

| Population (mobile, 2025 data) | D1 | D7 | D30 |
|---|---|---|---|
| All games ≥1k MAU — P50 | ~22% | just under 4% | 0.68–0.79% |
| same — P75 | just above 30% | 6–7% | 1.6–1.8% |
| same — P90 | ~40% | 11–12% | — |
| same — P99 | 64–68% | 25–28% | 13–15% |
| Asia — P50 | 17.50% | 2.68% | 0.53% |

GameAnalytics, 2026 Mobile & PC Gaming Benchmarks, 16,000+ mobile games with a 1,000-MAU floor, 9 regions, calendar-2025 data (https://www.gameanalytics.com/reports/2026-mobile-pc-gaming-benchmarks). **[corrected]** — adversarial verification confirmed the numbers and fixed two quotations: the P99 D7 band is stated as **25–28%** (not ">25%, peaking >28%"), and the report's sentence is "Regional baselines are stable; differentiation happens at the top." Other regional D1 medians: Oceania 25.63%, North America 23.28%, Europe 22.20%, Africa 18.52%.

PC is a different species: median D1 ~7%, D7 ~1.1–1.8% (an unresolved discrepancy between the January PDF and the later HTML page), D30 ~0.2–0.25%, median 32–33 min/day across ~18-min sessions (GameAnalytics 2026, 3,582 PC games, ≥100 MAU, 4+ months live). The report's own framing: "PC engagement is depth-driven, so mobile-style retention reads differently."

Do not import publisher gate numbers as norms. Voodoo lowered its hypercasual gates from 55% D1 / 22% D7 to **45% D1 / 13% D7 / $0.20 CPI**; GameAnalytics itself frames 40/20/10 as "a useful baseline… not a mandate" (GameAnalytics, 2026, https://www.gameanalytics.com/blog/how-to-think-about-retention-in-games). A 45% D1 gate sits above the P90 of the live-game population.

### 1.3 Activation-metric definition practice

Three different things are all called "activation" in the sources the skills currently cite, and they are not comparable.

- **Return-on-day-N activation.** Amplitude's 2025 Product Benchmark Report (2,600+ companies, 10,600+ products, 17 industries) defines activation as new users returning on day N: returning **7% of a cohort on Day 7 puts a product in the top 25%**; the 90th percentile runs ~21% Day-1, ~12% Day-7, ~9% Day-14; three-month retention is 18.5% (top) vs **3.8% (median)**; "for half of all products, more than 98% of new users aren't active two weeks after their first action" (https://amplitude.com/blog/7-percent-retention-rule). The much-quoted "69% of top seven-day activation performers were also top three-month retention performers" is therefore a **D7-predicts-D90 correlation, not evidence that an aha moment causes retention**. The report's own day convention (Amplitude defaults to rolling 24h) is not stated in the public pages **[unverified]**, and the circulating "median Day-1 activation 5%" figure appears only in a LinkedIn summary **[unverified]**.
- **Milestone activation** (user reaches a defined key action). Two usable public datasets: median **25%** across 500+ products / **30%** for SaaS only (Lenny Rachitsky & Yuriy Timen survey, 2022 data, self-reported, https://www.lennysnewsletter.com/p/what-is-a-good-activation-rate) and median **37%** across 62 B2B SaaS companies with an activation dashboard, range 5% (FinTech/Insurance) to 54.8% (AI/ML), average time-to-value about 1 day 12 hours (Userpilot SaaS Product Metrics Benchmark Report, 2024 data). Both are self-selected samples with heterogeneous definitions; **only ~6% of Lenny's respondents even time-bounded their activation metric** (median window 10 days, mode 7), so most published "activation rates" are not comparable to each other.
- **Critical-event retention.** Amplitude argues retention should be defined on a critical/return event rather than any session, and reports that users of the finance app Dave who added recurring expenses during onboarding were **5.7× more likely to be active at three months** (Amplitude Docs, 2025) — correlational, single-app.

The framework the skills use ("setup → aha → habit") is attributable to **Casey Winters**, not to a citable Reforge page: every Reforge guide URL refused fetch (403) and the Wayback capture rendered only the toolbar **[unverified as a Reforge document]**. His talk gives the operational ordering the skills currently omit — pick a designated frequency first (Grubhub's came from asking users how often they order), find where the cohort's key-action curve flattens (habit moment), then define aha as the earliest action correlated with reaching it (https://www.youtube.com/watch?v=DrmgZLj1zfo).

"7 friends in 10 days" is a 2012 retrospective anecdote from Chamath Palihapitiya's Startup School talk, with no published cohort chart, threshold analysis or causal test, and with his own caveat "for you it's going to be different" (https://genius.com/Chamath-palihapitiya-how-we-put-facebook-on-the-path-to-1-billion-users-annotated). It is usable only as an illustration of the **form** of an activation metric — action × count × window — never as evidence that social connections cause retention.

Also on the do-not-quote list: "core gameplay within 60 seconds," "aha within 90 seconds," "onboarding lifts retention up to 50%," "personalized onboarding +52% D30," and the blog claim that "GameAnalytics 2025 shows strong FTUE completion gives 2× D1." **No vendor — GameAnalytics 2025/2026, Liftoff, Sensor Tower — publishes tutorial or FTUE completion benchmarks at all**, and the GameAnalytics report contains no tutorial data of any kind. Apple, Google and Roblox publish no numeric first-session thresholds either.

**Skill implication.** `retention-strategy-designer` must open its D0/D1 branch with a definition gate, not a target: (a) which MMP or analytics tool produced the number, (b) calendar-day or rolling-24h, (c) strict return-on-day or on-or-after, (d) any-session or critical-event. Only then may a benchmark row be quoted, and it must carry its population. Replace the current Appcues/BusinessOfApps benchmark rows in `references/retention-playbook.md` — Appcues publishes a definition and case studies, not a dataset. Give designers the definition template ("earliest predictive action, within a stated window — most teams that bound it use 7–10 days") instead of a target number. Keep the Winters three-moment structure, re-attributed to the talk and labelled practitioner heuristic.

---

## 2. Tutorial design evidence: when a tutorial is worth building

### 2.1 The controlled result

The largest controlled tutorial study remains Andersen, O'Rourke, Liu, Snider, Lowdermilk, Truong, Cooper & Popović, CHI 2012 — **8 tutorial designs across 3 games of differing complexity, 45,000+ players**, multivariate online A/B deployment (https://grail.cs.washington.edu/projects/game-abtesting/chi2012/chi2012.pdf; DOI 10.1145/2207676.2207687). Findings:

- Tutorials raised play time by **up to 29% only in the most complex game** and had **no significant engagement effect in the two simpler games**.
- Context-sensitive delivery (teach at the moment of need) raised play time 16% and progress 40% **in Foldit only**, with no effect in the other two.
- "Investment in tutorials may not be justified for games with mechanics that can be discovered through experimentation."
- **Tutorials can harm retention** in some implementations.

No 2024–2026 study of comparable scale exists. This is a 2012 result and should be labelled as such, but it is behavioural telemetry at a scale nothing since has matched.

### 2.2 The flow / continuance result, and the contradiction

A lab experiment on a simple mobile RPG found a tutorial **increased non-expert players' perceived flow and continuous-use intention, with no negative effect on experts** — "neither positive nor negative" for experts (MDPI *Multimodal Technologies and Interaction* 4(3):41, 2020, https://www.mdpi.com/2414-4088/4/3/41). Scope limits matter: **n=40, self-reported flow and intention, not behaviour**, and a simple game — exactly the case where Andersen found no behavioural effect.

**[contested]** Andersen (45,000 players, behavioural, no effect in simple games) and MDPI (n=40, self-report, positive effect in a simple game) point opposite ways for simple games. The reconciling read is that a tutorial can improve how a novice *feels* about a simple game without changing what they *do* — which means a tutorial justified on flow grounds must still be A/B-tested on behaviour, because harm is documented.

And the opposite failure is real too: Supersonic (Unity) reports a hybrid-casual case where **60% of players churned during the tutorial** when mechanics were introduced too rapidly, and that up to a minute of unguided play at the start caused confusion (Sari Berkovich, Supersonic, 3 March 2025, https://supersonic.com/learn/blog/optimizing-ftue/). This is vendor BI with no disclosed methodology, but it is the documented counterweight to "get out of the player's way."

Over-assistance has its own cost: AI action-suggestions reduced cognitive load, but **reducing it too far impaired learning**, and players consistently asked for preserved agency and transparency (Choong, Cmentowski, Kukshinov, Tu & Nacke, CHI 2025, n=20, within-subjects, turn-based strategy; summary at https://hcigames.com/using-ai-supported-onboarding-systems-in-video-games-to-improve-player-experience/).

### 2.3 The decision rule

| Mechanic complexity | Recommended form | Evidence |
|---|---|---|
| Discoverable by experiment | Contextual hints only | Andersen 2012 |
| One system, timing-based | Guided first 60–90 s, then free | Supersonic 2025 |
| Layered meta + currencies | One mini-tutorial per unlock | Supersonic 2025 |
| High rule density | Full tutorial, in-context | Andersen 2012 (+29%) |

Platform text is the free anchor and costs nothing to comply with: prefer interactive onboarding, keep prerequisite flows brief, **let people skip tutorials, do not re-show them, keep them findable in settings/help**, and let people experience the app before prompting for ratings or purchases (Apple Human Interface Guidelines — Onboarding, updated 10 June 2024, https://developer.apple.com/design/human-interface-guidelines/onboarding). Roblox's creator docs add: model FTUE as a player funnel, A/B test tutorial steps to measure causal impact, teach the core loop early, keep early XP thresholds low.

Expect small effects. In the same evidence family, a mobile-game feature RCT cut the hazard of session-ending by 11% and of app abandonment by 14% (Gu, Bapna, Chan & Gupta, *Management Science* 68(2), 2022), and paying university students to engage with an app lifted downloads 7 points from a 14% base while "engagement across all groups remained extremely low" (Delavande et al., *Frontiers in Behavioral Economics*, 2026, n=1,812, randomized). Single-digit-to-low-teens relative effects are the realistic prior; power calculations and holdouts come before any claimed lift.

**Skill implication.** Both game-facing skills should ask one question before any tutorial recommendation: **"can the core mechanic be discovered by experimentation?"** If yes, recommend contextual hints and no scripted tutorial. `interaction-reward-moments` owns the *content* of the guided beats (does the first taught action produce a satisfying outcome?); `retention-strategy-designer` owns the *funnel* (which step loses whom). Both must carry: skippable, non-repeating, findable; one focused tutorial per system unlock; no monetization inside the tutorial; and an explicit warning that tutorials can reduce retention, so ship them behind an A/B test.

---

## 3. The "longer first session → higher D1" claim

### 3.1 Provenance

The rule traces to a single 2016 deltaDNA analysis by Mark Robinson: across **275 comparable games** analysed Oct 2015 – Feb 2016, games whose **median first session exceeded 9 minutes averaged 31% D1 versus 20% for games under 9 minutes**; the mean first session was 9 minutes and 90% of games had median first sessions under 20 minutes (Game Developer / deltaDNA, 2016, https://www.gamedeveloper.com/business/how-first-session-length-impacts-game-performance).

Two facts kill the causal reading:

1. **The unit of analysis is the game, not the player.** This is a between-game correlation across 275 titles, so it cannot support a within-game intervention claim.
2. **The author said so.** His own caveat: games "probably do not have short sessions by design, but rather because of high churn rates" — i.e. the causal arrow plausibly runs backwards, from a bad game to short first sessions.

No 2024–2026 replication at comparable scale exists, and **no large-scale telemetry study or RCT establishing a causal link between first-session length (or time-to-first-value) and D1 in mobile games was found** in this research set.

### 3.2 The correlational company it keeps

- Meta's first-party Horizon Store data (Action genre, April 2025): users who played **>30 minutes on their first day were 3× as likely to return** as those who played <5 minutes. Correlational, VR-specific, top Quest titles (https://developers.meta.com/horizon/blog/growth-insights-series-building-competency-new-user-onboarding/).
- Roblox experiences by median-session-length band (GameAnalytics 2025 Roblox report, covering ~47% of platform engagement): median D1 **4.3% for 0–3 min experiences vs 11.46% for 19–24 min**; D7 0.41% vs 1.61%; median session 6.62 min, 2.02 sessions/day (https://www.gameanalytics.com/reports/2025-roblox-report). Again: the unit is the experience, not the player.

### 3.3 The failure mode the rule hides

Retention failure at D0/D1 is two-sided. Drachen et al. found that **higher early skill signals — fewer moves, more stars — were inversely related to retention**, suggesting some players find initial levels too easy; "Current Absence Time" dominates 7-day prediction models, and first-session/first-day telemetry already predicts week-2 retention (AIIDE 2016, https://andersdrachen.com/wp-content/uploads/2014/07/aiide_rapid-prediction-player-1.pdf). A skill that only names "too hard" as the D1 cause will misdiagnose half the cases.

### 3.4 How to use it without inverting cause and effect

**Legitimate uses.** Median first-session length as a *screening* signal when comparing builds of the same game in the same test; as a *prioritisation* signal when it is far below the genre norm; as an input to the two-sided difficulty diagnosis above.

**Illegitimate uses — name these as anti-patterns.** Padding the first session with unskippable cutscenes, forced tutorial length, or artificial gating to hit a minutes number. Setting "median first session ≥ 9 minutes" as an OKR. Quoting the 31%-vs-20% figures as an expected lift from a design change. Reading the Roblox band table as "make sessions longer to get D1."

**Skill implication.** `retention-strategy-designer` should carry the 9-minute rule only as a **pre-2020, game-level, correlational diagnostic**, with the author's own caveat quoted. `interaction-reward-moments` already treats session length as a diagnostic rather than a target (`interaction-reward-moments/SKILL.md:16`) — keep that line and extend it explicitly to *first*-session length. Add the "too easy for experienced players" failure mode alongside "too hard" wherever the D1 cliff is diagnosed.

---

## 4. Hybrid-casual and casual FTUE practice, 2025–2026

### 4.1 What the segment leaders actually do

Top hybrid-casual puzzle titles run **deliberately long first sessions**: Color Block Jam's first session runs 20–30 minutes, with completion times shortening and challenge intensifying only from **level 20–25** to push boosters; Screwdom's 5–15-minute levels make failure costly and drive coin-pack IAP; hybrid titles layer 3–5-minute levels, LiveOps and a battle pass onto a hypercasual core (AppMagic, "Top 10 Hybridcasual Games in Q1 2025," https://appmagic.rocks/blog/hybridcasual-q1-2025/). This is teardown inference, not published telemetry.

The pattern that generalises: **the first session is intentionally longer than steady state**, built as an easy-win runway of roughly 20+ short levels; meta layers are introduced within the first few sessions; monetization pressure is withheld until the runway ends. Supersonic's guidance matches — linear guided opening, per-unlock mini-tutorials, gradual currency introduction, **ads delayed until players are hooked**.

### 4.2 The documented tutorial-churn case

Supersonic's Trash Tycoon case: **60% of players churned during the tutorial** when mechanics arrived too fast; the fix was a tightly guided opening plus one focused tutorial per system unlock. Their recommended primary FTUE metric is **tutorial-step drop-off** — which is the right instrument precisely because no benchmark for it exists.

### 4.3 The segment context

Hybrid-casual is the growth story and the shrinking-pool story at once. **[corrected]** — the Sensor Tower material must be split across two reports and not merged:

- *State of Mobile 2026*: average D7 among the **top-25-by-revenue casual** games was **14.9% in December 2025**; leading hybrid-casual titles have surpassed **hypercasual** leaders on D1, with the gap widening by D7 (https://gamedevreports.substack.com/p/sensor-tower-the-state-of-the-mobile).
- *State of Gaming 2026* (separate, later report): top-25 casual D7 has **declined since early 2022**, and hybrid-casual now sits **above casual** on D7; the standout is **Tasty Travels** (plural, Century Games) at ~22% D7 (https://gamedevreports.substack.com/p/sensor-tower-state-of-gaming-2026).
- *H1 2026 Gaming Digital Market Index*: hybridcasual IAP **+23% to $2.4B**, mobile downloads **−12% to 24B**, playtime flat at 221B hours (https://sensortower.com/blog/h1-2026-digital-gaming-market-index).

These are panel estimates for the extreme right tail (top 25 by revenue), against a live-game median D7 under 4%. A shrinking install pool raises the cost of every failed FTUE.

### 4.4 Two results that cut against FTUE folklore

- **Harder is not more monetizable.** A large randomized field experiment in a popular F2P mobile puzzle game found that making the game **easier** increased engagement (+1.25 rounds and +0.746 levels on day 1; ~one extra play-day and ten more rounds over 30 days), raised D7/D14 retention, and **increased total spending short- and long-run** despite reducing per-round purchase propensity — contradicting the firm's own belief that difficulty drives IAP (Ascarza, Netzer & Runge, *International Journal of Research in Marketing* 42(4):975–995, 2025, https://www.hbs.edu/ris/Publication%20Files/Personalized%20Game%20Design_628b85ef-5028-4032-a0b7-4d0f3edf33a1.pdf). Scope note: the treatment was applied to **existing** users, so it is not literally an FTUE experiment; the direction is nonetheless the opposite of the difficulty-spike-for-revenue heuristic.
- **Strong FTUE metrics do not validate a game.** Supercell's Squad Busters posted beta figures of **D1 61% / D3 44% / D7 38% (May 2023 beta, 140,000+ players)** and 29% D7 in a 5,000-player first beta, took 40M pre-registrations into 75M installs — and most players left. Stated lessons: "even large beta samples don't predict global behavior," "don't skip testing meta and long term retention," and the shutdown note that "too few players connected with it deeply enough to find the fun" (Ilkka Paananen, 10 February 2026, https://supercell.com/en/news/the-best-games-havent-been-made-yet).

**Skill implication.** Add an explicit hybrid-casual FTUE pattern to both game-facing skills: long first session by design, easy-win runway of ~20 levels, meta introduced early, monetization deferred past the runway, tutorial-step drop-off as the primary instrument. Add the Squad Busters rule to `retention-strategy-designer`: **a beta that validates only D7 has validated onboarding, not depth** — require meta/long-horizon validation before UA scale. Replace any "early difficulty spikes drive IAP" guidance with the Ascarza RCT, and flag the inverse claim as both unsupported and a dark-pattern risk.

---

## 5. Session design

### 5.1 Session-length norms, with populations

| Genre (P50, 2024 data) | Session | Sessions/day | D1 |
|---|---|---|---|
| Action | 3.8 min | 3.54 | — |
| Puzzle | 5.6 min | 4.59 | 20.53% |
| Board | 7.3 min | 5.08 | 19.81% |
| Card | 8.2 min | 4.78 | 19.05% |
| Multiplayer | 9.3 min | 2.36 | 12.80% |

GameAnalytics 2025 Mobile Gaming Benchmarks, **11,600 games, 1.48B MAU, Jan–Dec 2024, median (P50) by genre** (https://www.gameanalytics.com/reports/2025-mobile-gaming-benchmarks). Daily playtime medians: Card ~48.9 min, Board ~40.8 min, Arcade ~12.9 min. D7 leaders: Card 6.83%, Board 5.96%, Casino 5.53%, Puzzle 4.51%. **This is the last edition with genre cuts** — the 2026 edition states plainly that genre-level benchmarks are unavailable, so no 2025-data genre session norms exist from this source.

All-mobile aggregates by edition: GameAnalytics 2025 (2024 data) reports median ~22 min playtime/day, 5–6 min sessions, ~4 sessions/day; GameAnalytics 2026 (2025 data, ≥1,000 MAU floor) reports **3.1–3.5 min sessions, 3.8–3.9 sessions/day, ~12 min/day**. Do not read the drop as a behavioural collapse: the 2026 edition also raised median D1 from ~17% to ~22% and attributes the shift to "the refined methodology." Treat editions as separate populations.

Two more numbers a designer will want: **PC median ~18-min sessions at 1.65–1.70 sessions/day** (GameAnalytics 2026, 3,582 PC games), and **Korean daily mobile play 90.9 min weekday / 116.4 min weekend** among game users (KOCCA / 문화체육관광부, 2025 게임이용자 실태조사, published 18 Dec 2025, https://www.kocca.kr/kocca/koccanews/reportview.do?menuNo=204767&nttNo=1073). **[corrected]** — the survey is a nationally-framed sample of 10,000 aged 10–69 with a game-user/non-user screen; KOCCA's own press-release wording ("최근 1년간 게임이용자 10,000명") reads as 10,000 game users and should not be quoted literally, since the same release reports a 50.2% population usage rate.

### 5.2 Why session length is a diagnostic and never a target

- **The vendor definition changes the number more than design does.** A GameAnalytics "session" is a foreground interval that ends the moment the app is backgrounded, with no inactivity timeout; GA4/Firebase uses a 30-minute inactivity timeout; AppsFlyer counts re-opens 10+ minutes apart separately from the sixth session on. A game that backgrounds and foregrounds often will show **2–3× more "sessions" in GameAnalytics than in GA4 for identical behaviour**. Sessions/day and session-length benchmarks are not portable across vendors.
- **Every published "longer sessions → better retention" number is a between-title correlation** (deltaDNA 275 games, GameAnalytics Roblox bands, Meta Horizon day-0 playtime). None supports lengthening a session inside a fixed title.
- **Length can be pure idle time.** Roughly 30% of Korean players report using auto-play **[secondary source]** (secondary coverage of the KOCCA 2025 survey) — session minutes there are not engagement minutes.
- **Korea's structural context argues for shorter sessions, not longer.** Past-year game usage fell to **50.2%, down 9.7pp YoY** (2024: 59.9%; 2022: 74.4%), the lowest since measurement began in 2015; among non-players the top reason is **lack of time (44.0%)** and the substitute leisure is video/OTT (86.3% of those who named a substitute) (KOCCA 2025, sample notes above). The counter-move for a time-poor, shrinking audience is shorter, interruptible, low-commitment sessions.

### 5.3 Positive disengagement and the designed stopping point

The first game-specific study of session exits — 16 interviews plus a 111-respondent survey — found that **positive exits come from satisfaction plus closure at a structural end-point that matches the player's planned duration**; games that obscure their structure or chain "just one more mission" hamper agency and produce rage/regret exits; save and progress-retention options shift when players stop; and a neutral "bored, not frustrated" exit type also exists (Alexandrovsky, Gerling, Opp, Hahn, Birk & Alsheail, *PACM HCI* 8, CHI PLAY, article 301, 2024, https://doi.org/10.1145/3677066). Players plan sessions before play, adjust goals during play, and sometimes plan their re-engagement — which means the exit is where the next session is booked.

Outside games, an event-based experience-sampling study (**118 participants, 1,893 sessions on TikTok/Instagram**) found the most prevalent stopping cues were **competing activities, goal achievement and push notifications**, and that most disengagement was an effortless resolution of activity conflicts; self-determined exits dominate ordinary daily life (Ernst & Schnauber-Stockmann, *Communication Research*, 2026, https://journals.sagepub.com/doi/10.1177/00936502251378582). Two design reads: **an explicit, completable session goal is the best-evidenced natural stopping cue**, and an incoming notification ends the session of the app currently in use — a timing consideration for any push strategy.

The field is thin and should be labelled as such: a systematic review found only **27 publications covering 90 distinct media cues**, organised across five levels — device, application, feature, interaction, message — and concluded the area is fragmented and lacking theory-driven work (Gilbert, Schöne, Kreling, Dietrich & Reinecke, CHIGREECE 2025, https://felix-dietrich.de/research/publications/25_chigreece_gilbertetal_pub.html). **No published A/B experiment on in-game stopping cues** (wrap-up screens, "you're caught up" signals, session-goal prompts) was found — evidence is qualitative or from social media.

### 5.4 Session-end grace: the concrete checklist

Organised on the five review levels, with evidence strength marked:

- **Feature level.** Visible session structure — show level/mission length before it starts, so the player's plan can match the game's end-point (Alexandrovsky 2024, qualitative). *Moderate.*
- **Interaction level.** A completable session goal offered at entry ("3 runs" / "one chapter") and marked done at the end (Ernst 2026, adjacent domain). *Moderate.*
- **Feature level.** Closure/wrap-up beat: what you gained, what changed, what is next — then stop. *Weak, qualitative.*
- **Application level.** Save-anywhere and progress retention, because save options change when players stop (Alexandrovsky 2024). *Moderate.*
- **Message level.** Do not chain "one more" hooks that conceal the end-point; that is an autonomy-reducing pattern, not a retention feature. *Moderate, and an ethics item.*
- **Device level, Korea, mandatory.** 게임산업진흥에 관한 법률 제12조의3 and its 시행령 제8조의3 require online game providers to display elapsed play time on screen **every hour for at least 3 seconds**, and to post the warning **'과도한 게임이용은 정상적인 일상생활에 지장을 줄 수 있습니다.'** every hour for at least 3 seconds, alongside real-name/age verification, guardian consent for minors and 게임시간 선택제 time limits (easylaw.go.kr summary of the current statute, effective 2024-03-22, https://easylaw.go.kr/CSP/CnpClsMainBtr.laf?popMenu=ov&csmSeq=718&ccfNo=2&cciNo=2&cnpClsNo=5). The compulsory shutdown law was abolished on 1 January 2022 — any reference to it must be removed. *Legal requirement.* The design move is to **align a natural wrap-up beat with the hourly notice** rather than fight it.

**Skill implication.** `interaction-reward-moments` should own a named **stopping-point** pattern with these items, and should state the evidence strength per item rather than presenting them as established practice. `engagement-retention-advisor` should classify end-point-concealing chained hooks in its ethics module. Both must stop treating session length as a lift target: the only defensible instrumentation is *distribution* of session length by cohort, plus exit type where it can be surveyed.

---

## 6. The second-session problem

### 6.1 The size of the cliff, stated correctly

At the all-mobile median, D1 is ~22% and D7 is just under 4% (GameAnalytics 2026, population above). **State the arithmetic carefully**: under strict return-on-day-N, D7 users are not necessarily a subset of D1 users, so "4/22 = 18% survive" is *not* a survival rate — it is the ratio of two point-in-time rates. The honest statement is: **at the median, about one-fifth as many players are present on day 7 as on day 1.** Anyone wanting a true survival number needs on-or-after retention or an explicit cohort trace.

The genre signature to teach: **Arcade wins D1 (22.33%, best of the 2024 genre table) and collapses by D28 (0.93%)** — the canonical shape of "FTUE works, depth missing." Card runs the opposite way (D1 19.05%, D7 6.83%, D28 2.85%).

The diagnostic mapping, from the vendor that publishes the benchmarks: **D1 drop → onboarding and core-loop comprehension; D7 drop → engagement beyond novelty; D30 drop → depth and live-ops**, with curve shape dependent on business model and a **mandatory cohort split by acquisition source** to separate UA quality from product (GameAnalytics, 2026, https://www.gameanalytics.com/blog/how-to-think-about-retention-in-games).

### 6.2 Why the second session does not happen

Four mechanisms, each with its own evidence quality:

1. **No reason to return was created before the exit.** The session-exit study shows players sometimes *plan re-engagement* at the moment they stop — which makes the exit the highest-leverage place to seed a next objective (Alexandrovsky 2024).
2. **The first session consumed all the value.** This is the diagnostic reading of the Arcade curve, and of Squad Busters' beta-versus-global gap.
3. **Absence compounds.** "Current Absence Time" dominates 7-day retention models — the longer since the last session, the sharper the drop (Drachen et al., AIIDE 2016).
4. **Return is not resumption.** Games "do not recognize that the player is returning to rather than continuing gameplay uninterrupted"; returning players lose tutorials and mid-narrative context, and the anchor for a return flow is a **"Pivot Point" — a moment that reminds the player of their expert self** (Hammad, Brierley, McKendrick, Somanath, Finn, Hammer & Sharlin, "Homecoming," CHI 2021, autobiographical-design study, https://dl.acm.org/doi/fullHtml/10.1145/3411764.3445357). Small-n and qualitative, but the only study of the problem.

### 6.3 Unfinished goals: contested

**[contested]** Whether to end a session on an open loop or on closure has evidence on both sides. Two experiments (N=202, N=273) found cliffhangers increased desire for the next installment with no enjoyment loss (Schibler, Hahn & Green, *Media Psychology*, 2023, https://www.buffalo.edu/news/releases/2023/06/hahn-cliffhangers.html); a lab study (N=133) with electrodermal activity and cortisol found cliffhangers raised arousal but **not** enjoyment or intention to continue (Wirz et al., *Psychology of Popular Media*, 2022 — no URL in this source set). The only behavioural evidence is 44 children, where a serial arc sustained repeat sessions better than self-contained episodes (Lu et al., *Communication Research*, 2023, https://pmc.ncbi.nlm.nih.gov/articles/PMC12192482/). None of these tested interactive or branching narrative, and none measured next-day return in a game.

Meanwhile the session-exit study says the opposite for games: **closure at a structural end-point produces the positive exit**, and end-point concealment produces rage/regret. The synthesis that respects both: **partial closure plus a named, visible next objective** — finish the unit, then show what tomorrow's unit is. And A/B it against pure closure on next-session return, because nobody has.

Adjacent evidence favouring paced return over front-loading: a randomized field trial with **84,000 viewers over 5 weeks** at a major telecom SVoD found gradual "drip" release made users **48% more likely to keep using the platform** and raised end-of-trial subscription 1.7 percentage points from a 3.48% base (Godinho de Matos, Mamadehussene & Ferreira, *Marketing Science* 45(1):189–202, 2025, https://pubsonline.informs.org/doi/10.1287/mksc.2023.0106). Different medium; consistent direction.

### 6.4 Save-state and re-entry design

- Save the exact interaction state, not just the level index — the session-exit study found progress-retention options change *when* people stop.
- Open the second session with a Pivot Point: restore the player as competent, not as a novice re-reading the tutorial.
- Recap the narrative or run state on return; practitioner testimony is the only evidence, so label it as such.
- Make missed days catchable rather than lost. Marvel Snap's September 2025 patch added a **30-day, non-resetting Bonus Challenge** (50 missions advancing from the same daily missions as the weekly challenge) explicitly so players who "miss a couple of days… still have the opportunity to earn everything" within a 35-day window (Second Dinner, https://marvelsnap.com/patch-notes-september-16-2025/).
- Predict the drop-off per *content unit*, not just per app: Naver Webtoon runs a per-title "stop reading this series" churn model (작품 감상 이탈 예측) alongside platform-abandonment, reactivation and payment models, and nudges readers to similar works when a series goes on hiatus or nears completion; ML targeting beat heuristic targeting on CTR, read rate and pay rate (no numeric lifts disclosed) (AB180/Braze case study, 2025, https://blog.ab180.co/posts/braze-cloud_data_ingestion-naverwebtoon).

**Skill implication.** `retention-strategy-designer` should replace its single-line D2–D7 diagnosis (`references/retention-playbook.md:44`) with the four mechanisms above plus the re-entry checklist, and must carry the corrected D7/D1 phrasing. `interaction-reward-moments` owns the exit beat itself — the wrap-up, the named next objective, the Pivot Point on return. The cliffhanger-versus-closure choice is **[contested]** and should be presented as an experiment to run, never as a recommendation.

---

## 7. Non-game activation: when the product is a ritual, not a game

### 7.1 The baselines are far lower, and the shape is different

| Population | Metric | Value |
|---|---|---|
| 93 unguided mental-health apps | Day-1 open (rel. day 0) | 69.4% median |
| same | Day-15 / Day-30 open | 3.9% / 3.3% median |
| 18 free-living studies, 525,824 users | Abandon within 100 days | ~70% median |
| same, mental-health subset | Abandonment | 89–92% |
| 10,600+ products (Amplitude) | 3-month retention | 3.8% median / 18.5% top |

Sources: Baumel et al., *JMIR* 2019 (Google Play panel data; **>80% of the drop occurs between day 1 and day 10**; median daily use ~13 min among active users; day-30 medians by technique: peer support 8.9%, tracker/diary 6.1%, mindfulness 4.7%, https://www.jmir.org/2019/9/e14567); Kidman et al., *JMIR* Dec 2024 scoping review (curvilinear abandonment; physical activity 54–75%, diet 86%, alcohol 95–97%, https://www.jmir.org/2024/1/e56897); Amplitude 2025 Product Benchmark Report (https://amplitude.com/blog/7-percent-retention-rule). Note the Baumel/Kidman rates exceed the ~43% attrition seen in controlled trials — trial engagement is not in-the-wild engagement.

### 7.2 The aha moment is a completed ritual, not a first win

In a game the first session must prove that the *loop* is fun. In a ritual product it must prove that **one complete cycle of the ritual produced something the user wanted, at a time of day they can repeat.** The evidence pattern:

- **The activation event should be the outcome, not the setup.** Amplitude's Dave example — users who added recurring expenses during onboarding were 5.7× more likely to be active at three months — is the shape: a configuration action that makes the *next* use valuable. In a journaling app the equivalent is a first entry that produces a reflection back; in a fortune app, a reading delivered and read.
- **Anchor to a time, not to a count.** 포스텔러 reports average use ~6 times/week with traffic peaking at midnight, because users check tomorrow's fortune before bed; ~140만 MAU on ~750만 members, 75% female, 83% in their 10s–30s (DBR/인터비즈 interview with CEO 심경진, 2024, self-reported, https://m.blog.naver.com/businessinsight/223327604618). Demand is also strongly seasonal — the 신년 특수 December–February window runs ~20% above baseline, and January 2026 fell YoY for the first time in three years (점신 1,130,577 → 875,499 MAU; 포스텔러 678,052 → 657,272, Mobile Index via 헤럴드경제, 2026, https://v.daum.net/v/20260210214150495). For a ritual product, **the activation window is the ritual's own period** — daily for a journal, nightly for a fortune reading, seasonal for a new-year reading — not an arbitrary 7 days.
- **Streak evidence is real but correlational and older than the window.** Duolingo reports learners reaching a 7-day streak are 3.6× more likely to complete their course (selection into streaks — correlational), that new streak animations raised **7-day retention of brand-new learners by +1.7%**, and that allowing two equipped Streak Freezes raised daily active learners **+0.38%** (Duolingo blog, 31 January 2022, internal A/B results, https://blog.duolingo.com/how-duolingo-streak-builds-habit). The 2025 Hearts→Energy change is framed around beginners being **2× more likely to run out of hearts mid-lesson**, with no completion number published and the feature still in A/B at publication (https://blog.duolingo.com/duolingo-energy).
- **Onboarding personalization has a measured cost.** In a SMART trial on the Mental Health America screening site with **n=169,647 randomized**, adding tailoring questions **increased the odds of disengaging by 14% (OR 1.14, 95% CI 1.11–1.16)**; demographic tailoring then reduced disengagement by 10% (OR 0.90) and beat need- or next-step-based tailoring (Rouvere et al., *JMIR Mental Health* 12:e73188, 2025 — no URL in this source set). A "get to know you" questionnaire is not free, and this is the largest randomized evidence in the set on onboarding *flow* design.
- **Gamified onboarding is [contested] in this domain.** A meta-analysis of 79 RCTs of depression/anxiety apps found attrition was **lower** in trials with reminders, human contact, and **no gamification** — gamification was associated with higher attrition (Liu, Torous, Linardon et al., *JAMA Psychiatry*, 2025/2026, 79 trials, 92 app conditions, https://doi.org/10.1001/jamapsychiatry.2025.3439). Against that, an analyst quote puts the heavily gamified self-care pet app Finch at D1/D7 of 54%/37% with ~10M MAU — above Duolingo (51%/35%) **[unverified]** (Deconstructor of Fun citing Sensor Tower; no accessible primary). Present both sides; do not resolve it.
- **Companion products increasingly define success as departure.** OpenAI states it does not measure success by time spent or clicks but by whether users leave having done what they came for, while still tracking daily/weekly/monthly return, and shipped break reminders ("You've been chatting a while — is this a good time for a break?") (OpenAI, 4 August 2025, https://openai.com/index/optimizing-chatgpt). First-party statement, not an audited outcome — but it is the clearest published articulation of a completion-based activation metric for a ritual product.

**Skill implication.** For non-game domains, `retention-strategy-designer` should define activation as **one completed ritual cycle producing a kept artifact, timed to the product's own period**, and should quote the honest baselines (Amplitude 3.8% three-month median; Baumel day-30 3.3%; Kidman ~70% abandonment by day 100) so designers are not benchmarked against game numbers. Add the Rouvere result as a hard guardrail: **onboarding questionnaires must be justified and A/B-tested, because tailoring questions measurably increase drop-off.** `interaction-reward-moments` owns the first completed reading/entry/lesson as a designed moment — the reveal, the interpretation, the artifact kept. `engagement-retention-advisor` carries the gamification **[contested]** finding into its domain-ethics module for journaling and mental-health products.

---

## Skill implications

### What `interaction-reward-moments` should own

- **The first-win moment.** The first taught action must produce a legible, satisfying outcome inside the guided opening. This is scene content, not funnel structure. Add it as a named pattern with the hybrid-casual form (guided 60–90 s → first win → free play) and the Apple HIG constraints (skippable, non-repeating, findable).
- **The stopping point.** Own the wrap-up beat, visible session structure, the completable session goal, the closure screen, and the Pivot Point on return. Ship it with per-item evidence strength (§5.4) — most of it is qualitative.
- **Keep** the existing line that session length is a diagnostic of loop satisfaction and never a target (`SKILL.md:16`); **extend** it explicitly to first-session length, and add the two-sided difficulty failure mode (too hard *and* too easy).
- **Drop** any implication that longer sessions are the goal, and any use of the deltaDNA 9-minute figure as a lever.

### What `retention-strategy-designer` should own

- **The activation funnel.** Tutorial-step drop-off, step ordering, gating, first-session-to-second-session conversion, cohort splits by acquisition source. It owns the funnel; it does not own the feel of any single step.
- **Time-to-value, defined properly.** Replace "measure time-to-first-value in minutes, not sessions" (`references/retention-playbook.md:44`) with the definition gate: action × count × window, one day convention, one return event, one MMP. Note that only ~6% of surveyed teams even time-bound their activation metric, so most published rates are incomparable.
- **Benchmarks with populations.** Replace the current playbook table (which cites Appcues and BusinessOfApps for numbers those sources do not publish) with the GameAnalytics 2026 quantile band, the 2024-data genre table labelled as such, the vendor-convention table, and the non-game baselines. **Do not average across rows.**
- **Add** the Squad Busters rule (beta D7 validates onboarding, not depth) and the second-session mechanisms (§6.2), and correct the D7-vs-D1 phrasing so it is not stated as a survival rate.

### The routing rule for tutorial drop-off

Today "onboarding" is a trigger keyword in `retention-strategy-designer`'s description, so **"players are dropping off in the tutorial" routes to the lifecycle skill by keyword** — which contradicts the plugin's own deliverable-based routing principle (README: route on the deliverable, not on keyword presence). Tutorial drop-off is ambiguous exactly the way "session length" was, and needs the same treatment. Proposed rule, to be mirrored in all three SKILL.md files:

| Ask | Deliverable | Route to |
|---|---|---|
| Which step loses players; step order, gating, pacing | Funnel fix | `retention-strategy-designer` |
| A named tutorial beat feels flat or unclear | Scene fix | `interaction-reward-moments` |
| Should we build a tutorial at all | Build/no-build call | `engagement-retention-advisor` |
| Funnel hole **and** a flat first win | Two deliverables | `engagement-retention-advisor` |

Wording for the skill files: *"Tutorial drop-off" is a funnel symptom, not a deliverable. If the requested output is which step to change, its order, or its gating, it is an activation-funnel problem → `retention-strategy-designer`. If the requested output is making a specific tutorial beat land — the first win, the first reveal, the guided first fight → `interaction-reward-moments`. If the question is whether a tutorial should exist at all, run the complexity test first ("can the core mechanic be discovered by experimentation?"), because the answer determines the skill as well as the design → `engagement-retention-advisor`.*

Whichever skill answers, three statements travel with it: no vendor publishes FTUE completion benchmarks, tutorials can reduce retention, and the effect sizes to expect are single-digit to low-teens relative — so the recommendation ships behind an A/B test with a holdout, not as a certainty.
