# Churn Diagnosis and Win-Back

Read this when the deliverable is a churn diagnosis, an at-risk definition, a win-back or resurrection programme, or the measurement design for one.

## Signal → diagnosis map

Run as a rule-out ladder, cheapest falsification first. Technical before design, always.

| Behavioural signal | Diagnosis | First check |
|---|---|---|
| Crash / ANR / load-time spike aligned to a build or device tier | Technical, not design | Crash-free sessions and cold-start by build × device; freeze design work until clean |
| Attempts on one level/stage spike, then sessions stop | Difficulty wall | Attempt-to-clear and churn by level — check both tails |
| Session ends within seconds of a currency or energy zero-state | Sink–source imbalance | Per-stage earn-vs-spend ledger; is the zero-state a pause or a wall |
| Guild/party/raid edges go quiet before the account does | Social health | Log edges as time-varying features, not a membership flag |
| Inter-session gap widens over 3+ consecutive sessions | Cadence mismatch | Gap distribution vs the content-refresh clock and the return event's interval |

No study in this evidence base sizes the technical row; it is first because it is the cheapest hypothesis to kill, not the most common cause. The social row rests on NCSOFT Blade & Soul logs where retained users showed markedly higher party/raid/guild-graph activity and a dynamic edge model beat static ones, accuracy 0.75–0.77, F1 0.65 [Lee & Woo, PLoS One, 2025, https://pmc.ncbi.nlm.nih.gov/articles/PMC12148118 | 10,000 users, Apr 2016–Feb 2017 | correlational, guild effect not isolated]. A sixth leading indicator for competitive titles: time-to-next-match rose 16.18–60.68 h against a 3.66–4.17 h baseline after toxic-chat exposure, largest for opponent toxicity after a loss [Morrier, Mahmassani & Alvarez, PLoS One, 2025, https://pmc.ncbi.nlm.nih.gov/articles/PMC12157061 | 56,464,489 observations, 4,539,599 players, CoD: MWIII Team Deathmatch, Nov–Dec 2023 | 2SLS leave-one-out].

Two shapes that are **not** churn and need no intervention: expected post-launch decay, and finite or binge-style products. Diagnose those before proposing anything.

## At-risk is defined against the player's own gap

A global "no session in 7 days" rule flags a healthy weekend player and misses a daily player who went quiet 48 hours ago.

- Compute each player's **median inter-session gap** over their last N sessions (N ≥ 5; below that, fall back to the cohort median for their genre and platform).
- **At-risk** = current gap > k × that player's own median. k is a capacity dial — set it so the flagged volume matches what the intervention can actually serve — not a discovered constant.
- **Dormant** = current gap > the longest gap this player has ever returned from. Anything shorter may just be a slow returner.
- Re-fit after every content or cadence change; a season launch moves everyone's gap.
- Do not carry a day-N threshold onto PC/console, which report DAU/MAU and playtime instead (`${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/genre-profiles.md`).

No published value for k or for the median window exists. Both are product-local and must be fitted, then stated as fitted.

## Predict → explain → intervene

A churn score alone does not deploy: publishers "are usually unable to apply high-accuracy prediction methods in practice… due to the lack of the specific decision support (e.g., why they leave and what to do next)" [Xiong et al., NetEase Fuxi, KDD 2023]. Require all three stages before proposing a model.

- **Difficulty relief is the best-evidenced intervention lever.** Easing puzzles for high-churn-risk users raised Retention-1 by **+2.70pp** (control 29.5%), Retention-7 by **+2.46pp** (64.3%), Retention-14 by **+2.0pp** (74.3%), rounds played +1.247, net revenue **+$0.07/user**, all p<0.0001 [Ascarza, Netzer & Runge, *IJRM* 42(4):975–995, 2025, https://evaascarza.com/papers/Ascarza_Netzer_Runge_IJRM25.pdf | ~330,000 users, 12-week randomized rollout against a holdout, F2P mobile puzzle | intent-to-treat]. **[contested]** cost side: purchases fall in the eased round itself, so the per-round read is misleading; against that, engagement and retention both rise so net spend rises short- and long-run. Heterogeneous — skilled players who find early levels too easy have been found to churn more.
- Independently replicated in-game: a difficulty-aware D-Cox-Time model plus a DDA intervention, A/B tested live, cut next-day churn **10.9%** and week churn **~20%** with **+10%** time in game [Li et al., KDD 2021, Tsinghua + Beijing Microfun, https://jiayuli-997.github.io/files/KDD2021-LiJY-Churn_Prediction.pdf | live puzzle game].
- **Survival models, not binary classifiers** — churn is censored data.
- **Tenure checkpoints for competitive products:** churn probability rises ~8% after 60 days and ~20% after 90 days of tenure; champion/play variety lowers churn [Kim, Kim, Kim & Li, *Sport, Business and Management*, 2026, https://www.emerald.com/sbm/article/16/4/453/1333130 | Cox analysis, 295,008 League of Legends players]. Same study: social connectedness lowers churn overall, but squad play lowers win rate, which raises it — do not assert social features always retain.

## Target by uplift, not by churn risk

Ranking by churn probability sends the heaviest pressure to the people most likely to opt out. Target **persuadables** by estimated uplift and model **delayed** response — multi-treatment multi-task uplift networks are deployed for gaming bonuses with "whether to play" as the outcome [Wei et al., 2024, https://arxiv.org/abs/2408.12803], and push-frequency uplift must model delay because "inappropriate push frequencies often trigger users to close notification switches, directly harming long-term user retention" [Zheng et al., AAAI 2026 | validated on a 14-day A/B test, >1 billion users].

Hard gate: any **personalized or dynamic drop rate** in a Korean-market event is exposed under 게임산업진흥에 관한 법률 제33조의2 — see `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md` before proposing one. Personalize difficulty and content, not odds or price.

## Split the churn before choosing a tactic

Category-exit and competitor-switch need different responses; a win-back offer aimed at category-exiters is wasted. Churn-destination analysis of Coupang found 2.36M churned users of whom **90.3% left the shopping category entirely** and only 9.7% moved to a competitor [Mobile Index, Mar 2026, https://insight-report.mobileindex.com/post/2026-h1-mobileapp-top100 | Korean app panel]. In Korea the named category-exit destination is video/OTT with time scarcity as the cause: non-use attributed mainly to lack of time **44.0%**, OTT the substitute **86.3%** [KOCCA 2025 게임이용자 실태조사, published 2025-12-18 | n=10,000]. That argues for a *lower-commitment* return, not a bigger reward.

## Win-back by lapse cause

| Lapse cause | First move | Evidence strength |
|---|---|---|
| Time scarcity / left the category | Remove friction: a lower-commitment mode, server or fee tier | One case, no counterfactual |
| Lost status (streak, rank, season standing) | One-time restoration for a small, bounded effort | One large disclosed case |
| Content exhausted / expected decay | Publish a dated checkpoint (anniversary, season) against the decay curve | Operator statement only |
| Social graph gone | Friend recall/gift where both sides earn | Vendor-reported |
| Switched to a named competitor | The changed-since-you-left case, not a bribe | No evidence found |
| Undiagnosed | Do not send. Diagnose first | — |

- **Friction removal.** NetEase revived a 22-year-old MMO with 畅玩服 for Fantasy Westward Journey PC — time-based fees removed, systems simplified — 「召回大量流失用户」, peak concurrency reaching a record **3.58M** [NetEase Q3 2025 coverage, https://www.nbd.com.cn/articles/2025-11-21/4152168.html | uncontrolled].
- **Status restoration.** Duolingo's one-time June 2026 "Streak Revival" restored longest-ever streaks for three lessons: **15.4M** revived, **nearly 8M** with no active streak, and the revived cohort retained better than a typical re-engaged cohort [Duolingo Q2 2026 shareholder letter, https://investors.duolingo.com/static-files/3c8277ee-bc94-4f5d-9b77-0db3e46f88b8 | no holdout disclosed].
- **Published schedule.** NCSOFT said Aion2 traffic "declined along the expected decay curve" and pre-planned a 6-month anniversary event plus a Season 4 update to pull lapsed users back [FETV concall coverage, 2026, https://www.fetv.co.kr/news/articleView.html?idxno=302274]. A 6-month checkpoint is the Korean MMO default.
- **Non-push channels reach people push cannot.** In Marvel Rivals' gifting rollout, 41% of purchases were gifts and 25% of gift buyers had never played or had lapsed [Discord, 2026, https://discord.com/blog/building-on-the-social-layer-of-games-whats-new-from-gdc-2026 | **vendor with a commercial interest**]. Friend "recall" events rewarding both inviter and returner are a documented pattern [GameRefinery, PUBG Mobile — **no URL in the source set, [unverified]**].
- **Channel ranking by plausibility, not by measured lift:** status restoration and friend gift/recall > in-app return calendar > push > email. Email is the weakest: win-back emails at ~16% open and under 2% click-through [Jagex, GDC "Returners and Retention" — **no retrievable URL, [unverified]**].
- Per-content-unit churn beats per-app churn where content is the product: Naver Webtoon runs a per-title 작품 감상 이탈 예측 model alongside platform-abandonment, reactivation and payment models; ML targeting beat heuristic targeting on CTR, read rate and pay rate [AB180/Braze, 2025, https://blog.ab180.co/posts/braze-cloud_data_ingestion-naverwebtoon | **no numeric lifts disclosed**].

## The return flow: re-onboarding is not FTUE

Games generally do not recognise that a player is *returning* rather than continuing. FTUE teaches a stranger; re-onboarding must restore an expert. Required beats:

1. **Detect the gap** and branch on its length — a 3-day and a 6-month return are different products.
2. **Spoiler-safe recap**: restate the player's *own* prior choices and run state; never reveal story or content ahead of where they stopped, and never recap in a way that spoils an unopened beat.
3. **Refresh controls and changed systems** in-context, not as a re-run tutorial.
4. **Stage an early Pivot Point** — a moment that reminds the player of their expert self — before any new content [Hammad et al., CHI 2021; full treatment in `../../interaction-reward-moments/references/first-session.md`].
5. **Make missed time catchable, not lost.** Marvel Snap's Sept 2025 patch added a 30-day non-resetting Bonus Challenge (50 missions fed by the same daily missions) inside a 35-day window explicitly so players who "miss a couple of days… still have the opportunity to earn everything" [Second Dinner, https://marvelsnap.com/patch-notes-september-16-2025/].
6. Save the exact interaction state, not the level index.

Ethics: a returning-player offer is a mechanic-bearing proposal. Read `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md`. Absence-penalty framing and loss-copy in win-back messaging are T2b/T3 families, and push frequency to lapsed users carries an opt-out guardrail.

## Measurement

- **Define dormancy per player** (above), and record the dormancy length at reactivation — a 5-day and a 90-day returner belong in different cells.
- **Randomized holdout of equally lapsed users, matched on dormancy length and lapse cause.** Not pre/post: a smile in the curve is the arithmetic of resurrection plus survivorship and is produced by anything that brings lapsed users back, including a marketing burst.
- **Primary metric = re-dormancy**, i.e. the share of reactivated users still active at **+7d and +30d after return**, against the holdout — not the comeback click, because reactivation rate is trivially inflatable by a large enough bribe. **A resurrected user who bounces in one session is a failed resurrection.**
<!-- Maintainer note: the +7d/+30d horizon is deliberate and is the one horizon every module states. The research base (02d-research-liveops-and-lifecycle.md §7) says D14/D30; the design doc tightened the near check to +7d so the one-session bounce above is testable. liveops-cadence.md, experiments.md, integration-patterns.md and both SKILL.md bodies restate +7d/+30d on purpose — do not "correct" them back to D14. -->
- Guardrails: notification opt-out rate, uninstall, support complaints, refund rate, and re-lapse *speed* (median gap after return vs before).
- Report the resurrected cohort separately in every curve. Never merge them into new or current.
- Novelty guard: observe at least two full weekly cycles and re-measure at week 3–4 (`${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/experiments.md`).

## Numbers that do not exist

The public evidence on win-back effectiveness is the thinnest in this whole reference shelf. Say so to the user rather than filling the gap.

- **No 2024–2026 primary dataset on win-back campaign effectiveness** was found. Vendor claims of "10–25% of lapsed users recovered" and "5–10× cheaper than acquisition" carry no methodology and **must not be quoted**. AppsFlyer's remarketing uplift figure for gaming predates 2024.
- **No published re-dormancy benchmark** at +7d or +30d exists, for any genre or market. Each product builds its own baseline.
- **No experiment on recap systems** and returning-player retention or comprehension exists — the return-flow beats above are practitioner testimony plus one CHI paper, and must be labelled as such.
- **No benchmark for k** (the at-risk multiplier) or for the median-gap window.
- One vendor case reports a "likely to churn" journey lifting retention 7% and conversions 10%, plus a 30% weekly revenue drop when LiveOps events were switched off [Dive, 2023, https://www.dive.games/2023/07/23/25-uplift-in-arpdau-with-segmentation-and-liveops-tools | **vendor, uncontrolled**]. Cite only with that label attached, never as a target.
