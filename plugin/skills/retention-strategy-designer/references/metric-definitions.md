# Metric Definitions

Read before quoting, comparing, targeting or diagnosing any retention number — RSD `read` and `instrument` modes, and any time a user pastes a figure.

## The four orthogonal axes

A retention figure measures a product *under a definition, a population and a day convention*. Each axis moves it more than most product work does; a number missing any tag is not comparable to anything.

| Axis | Options | Direction |
|---|---|---|
| Return rule | N-day strict / unbounded / bracket | unbounded ≫ strict |
| Day boundary | calendar date / rolling 24h from install | calendar ≫ 24h at D1 |
| Denominator | installs / first-open / tutorial-complete / registered | later gate ⇒ higher rate |
| Return event | any session / critical event | critical event ≪ any session |

**Return rule.** Amplitude names three: "Return On" (came back on exactly day N), "Return On or After" (that day *or any later day*), and custom brackets, each measured on its own rather than as a running total, so a later bracket can exceed an earlier one; Day 0 is always 100% and incomplete days are asterisked [Amplitude Docs | 2025 | vendor definition]. The gap is large: a control group's "Retention 7", defined as *plays at least once in the subsequent 7 days*, is 64.3% [Ascarza, Netzer & Runge | 2025 | ~330,000 users, one F2P puzzle game | unbounded-within-window], against an all-mobile-games strict D7 median just under 4% [GameAnalytics | 2026 ed., 2025 data | 16,262 live games ≥1k MAU | UTC calendar, strict]. Both correct, ~16× apart. A paper's "Retention 7" is not a benchmarkable D7.

**Denominator.** If 60% of installs finish the tutorial and essentially all D1 returners are tutorial-completers, a 22% install-denominated D1 is a ~37% tutorial-denominated D1 with no change to the game. Neither is wrong; publishing them interchangeably is.

**Return event.** Amplitude argues retention should be defined on a critical event rather than any activity, and reports finance-app users who added recurring expenses during onboarding "were 5.7 times more likely to be using the app three months later" [Amplitude | 2025 | one app, Dave]. Prefer critical-event wherever opening the app is not evidence of value — journaling, learning, AI companion, 사주/운세. It breaks comparability with every vendor benchmark; that is the correct trade, said out loud.

## The Amplitude worked example — quote verbatim

> "Day 1 retention by calendar dates is 43 percent, while Day 1 retention by 24-hour window is only 32 percent. As we move further, the difference becomes less significant… the two lines almost merge"

[Amplitude | 2025 | one app, the vendor's own published side-by-side | D1, calendar date vs rolling 24h | amplitude.com/docs/analytics/charts/retention-analysis/retention-analysis-time]

1. An 11-point D1 swing from a settings toggle is larger than almost any onboarding A/B result in this evidence base.
2. D1 is the convention-sensitive metric; D7 and D30 converge. Cross-vendor D7/D30 comparison is defensible with a caveat; cross-vendor D1 comparison is not.
3. Calendar-day is not "wrong". Amplitude recommends calendar when a decision cannot wait a full day (UA spend), 24-hour when it can. Pick one, write it down, never switch mid-analysis.

## Vendor conventions, verified against docs

| Vendor | Day convention | Session rule |
|---|---|---|
| GameAnalytics | UTC calendar, strict N-day | foreground interval; ends on background |
| Adjust | rolling 24h from install; month = 30 days | ≥30-min gap |
| AppsFlyer | calendar day / week / month | 10-min minimum gap, from the 6th session |
| Amplitude | rolling 24h default (hour-rounded) | configurable |
| Airbridge (KR) | calendar date | same-device same-date installs collapsed |

[GameAnalytics Docs 2025 · Adjust Help 2025 · AppsFlyer Help 2025 · Airbridge Help 2024]

Adjust: "ONLY users who have completed the entire 24 hours of day 2 are included in the calculation". Airbridge's worked case: install 20:00 on 2024-01-01, open 08:00 on 2024-01-02 counts as a Day 1 return, 12 hours later. GA4/Firebase adds a 30-minute inactivity timeout (max 7h55m); an "engaged session" needs >10 s, a key event, or 2+ screen views [Google | 2025] — so a game that backgrounds often reports 2–3× more sessions in GameAnalytics than in GA4 for identical behaviour, and any session-count or session-length figure without its session rule is unfalsifiable.

**Korea.** Airbridge, the dominant Korean MMP, is calendar-based, so its numbers compare to AppsFlyer and **not** to Adjust or to a default Amplitude chart. GameAnalytics anchors on UTC: a player at UTC+9 installing at 08:30 KST is still on UTC "yesterday" until 09:00 KST, so a KST-calendar in-house D1 and a GameAnalytics benchmark are offset systematically, not randomly.

## D28 vs D30

GameAnalytics' 2025 edition reported D28, its 2026 edition reports D30; Adjust recommends days 1, 3, 7, 14, 28 and 30. D7, D14 and D28 land on the **same weekday as install**; D30 lands two weekdays later, so a weekend-heavy game reads systematically lower at D30 for reasons unrelated to retention. A D28 benchmark row against an in-house D30 is a category error — different metrics.

## DAU/MAU is a fit-to-cadence diagnostic, not a quality score

Gaming stickiness "leveled off at 32%" in both APAC and North America [Mixpanel | 2026 | 517.6B events, 808.2M devices]. PC median DAU/MAU is 4–5%, P75 ~7%, P90 13–15% [GameAnalytics | 2026 | 3,582 PC games ≥100 MAU, ≥4 months live]. Both correct: stickiness measures only whether the intended cadence is daily. Tencent says the same of WeChat mini-games' 500M MAU — 「5亿月活里仍有大量用户尚未养成高频习惯」 — while WeChat itself has almost no DAU/MAU gap [WeChat Mini-Game Developer Conference | 2026]. Low stickiness on a weekly or episodic product is a match, not a defect; raising it is a decision to change the product's cadence, and should be argued as one.

## Reading a cohort triangle

- **Layout.** One row per install cohort (usually a week), one column per day-since-install. Read **across a row** for one cohort's curve, **down a column** for the same day-N across cohorts (did the product change?). A calendar-dated event — launch, server or region opening, season, collab, marketing burst, store feature, ad-load or price change — lands on a **diagonal**, hitting each cohort at a different day-N. Never read a triangle without that event calendar beside it. Bottom-right cells are unfinished cohorts, not low retention.
- **Minimum shape.** D0→D30 for ≥3 consecutive install weeks; a single D7 cannot distinguish flattening from declining.
- **Three shapes** [Sequoia | undated, image timestamped 2018]: *flattening* — "the higher the level at which the curve flattens, the higher the long-term retention"; *declining* — no product-market fit, growth is a leaky bucket; *smiling* — churned users return. Keep the taxonomy, drop its numbers (its "leading casual 20%+ D30" now sits beyond P99). D30/D1 is a usable flattening proxy; window mapping is D1 → onboarding and comprehension, D7 → a reason to return beyond novelty, D30 → depth and live-ops [GameAnalytics].
- **A smile proves nothing alone** — it is resurrection plus survivorship, and any event returning lapsed users produces it. Duolingo's one-time June 2026 "Streak Revival" revived 15.4 million learners, nearly 8 million with no active streak [Duolingo | Q2 2026 shareholder letter]. Attribute a smile to a named event before calling it improvement.
- **Decay is not automatically a verdict.** DeNA disclosed Pokémon TCG Pocket average MAU 51M (Jan–Mar 2025) → 39M → 30M → 28M (Oct–Dec 2025), diagnosing 「ログイン頻度やユーザーの継続率の向上に課題がある」 [gamebiz | 2026]. **[contested]** the same coverage reads its remedies as having had "a certain effect" — that is inference from a slowing decline, and a decay curve flattens on its own. Expected post-launch decay, and finite or binge-style products, are not churn diagnoses.

## Intake: what must be answered before a number means anything

Items 1–3 are **blocking** — their documented gaps (≈16× on return rule, 11 points on day boundary, ~15 points on denominator) exceed almost any product difference.

1. **Tool and convention** — GameAnalytics, Adjust, AppsFlyer, Airbridge, Amplitude, Mixpanel or GA4? Calendar or rolling 24h? Strict, unbounded or bracket? Which timezone?
2. **Denominator** — installs, first-open, tutorial-complete or registered? Reinstalls and multi-account users deduplicated how?
3. **Return event** — any session, or a defined critical event? What is the session rule?
4. **Cadence intent** — daily, weekly or episodic? Decides whether D1/D7, W1/W4 or DAU/MAU is even the right metric.

Assumable, tuning-level: cohort size per install week · channel mix, platform and region split · the D0→D30 curve for ≥3 install weeks rather than a point · lifecycle events overlaying the window · available segment splits · churn destination, category-exit vs competitor-switch · experiment capacity · constraints: markets, minors in the audience, monetisation model, and disclosure duties — for Korea, 확률형 아이템 disclosure under 게임산업진흥에 관한 법률.

A user-supplied benchmark needs source, edition or data year, population with its floor, definition tag and percentile before it enters a diagnosis. Missing any one, it is context, not a benchmark, and must not become a target.

## Numbers that do not exist

- **No public Korean install-cohort D1/D7/D30.** KOCCA measures usage rate and daily minutes, not install cohorts; Mobile Index publishes MAU, installs and usage time with 이탈률 gated; Airbridge's Korea benchmark covers UA channels only and explicitly carries no D1/D7/D30 or LTV. Use Adjust × Sensor Tower Japan as a **stated** proxy; never synthesise a Korean triple.
- **No quantified reroll share.** Rerolling inflates the install denominator and depresses D1 in gacha and account-bound products, but no dataset here measures how much **[unverified]**. Do not apply a correction factor — compute a second D1 on a post-tutorial or post-first-gacha denominator and compare. Airbridge absorbs same-device rerolls by collapsing duplicates; multi-account and multi-device rerolls survive.
- **No published universal DAU/MAU target.** Readable only against the product's own intended cadence.
