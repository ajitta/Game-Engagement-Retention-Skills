# Retention Playbook

Use this file for framework depth, benchmark context, and experiment design. Keep final answers practical; cite benchmarks only as rough context, never as targets to game.

## Core Model

```text
value delivered at interval T -> user returns near interval T -> value compounds -> habit forms
```

Retention failure is almost always a value-delivery failure, not a notification failure. Diagnose the value gap first; reminders only amplify existing value.

## Return Event Design

The single most important modeling decision. A return event must be:

- **Meaningful**: proves the user got value (completed a lesson, saved a reading, cleared a run) — not just opened the app.
- **Matched to natural cadence**: a weekly-use product measured on daily opens will look broken when it is healthy. Respect episodic, seasonal, and event-driven products.
- **Measurable per cohort**: defined identically across time so cohort curves are comparable.

Anti-pattern: choosing "app open" as the return event because it is easy to log. It inflates with notification spam and hides value decay.

## Lifecycle Segmentation

| Stage | Definition | Primary lever |
|---|---|---|
| New | first 1-7 days | time-to-value, activation, first useful result |
| Current | returning at natural cadence | habit loop depth, content/feature discovery |
| Power | above-cadence, high investment | mastery, identity, community, creation tools |
| Lapsing | missed 1-2 expected cycles | relevance re-proof, friction removal, unfinished-goal pull |
| Dormant | missed many cycles | resurrection: what changed since you left + easy re-entry |
| Resurrected | returned after dormancy | fast re-activation; do NOT treat as new or as current |

Interventions must name the stage. A streak mechanic aimed at dormant users is noise; a "what's new" digest aimed at power users is noise.

## Habit Formation Frames

- **Fogg Behavior Model**: behavior happens when motivation, ability, and prompt converge. Design lever order: raise ability (make it easier) before raising prompt volume. Prompts without ability produce annoyance.
- **Hook Model (Eyal)**: trigger -> action -> variable reward -> investment. Useful map; treat critically — the "variable reward" leg drifts into compulsion design fast. Prefer earned/legible rewards; the "investment" leg (stored value: archives, decks, history, customization) is the most ethical and durable part.
- **Stored value / compounding**: the strongest long-term retention comes from assets the user builds: journals, decks, saves, rank, social graph, mastery. Every proposal should ask "what accumulates?"

## Leak Diagnosis by Window

- **D0/D1**: onboarding friction, unclear first value, aha-moment too deep. Measure time-to-first-value in minutes, not sessions.
- **D2-D7**: no reason for a second session; first session consumed all value; prompt arrives before new value exists.
- **D8-D30**: shallow content pipeline, no personalization deepening, no identity/social investment.
- **D30+**: novelty exhausted, no compounding asset, no community, trust erosion (ads/paywall creep).

## Benchmark Context (sourced 2024-2026; verify before quoting exact decimals)

Use only to calibrate expectations, never as goals:

| Segment | D1 | D7 | D30 | Source (year) |
|---|---|---|---|---|
| Mobile games, top quartile | ~26.5-27.7% | — | — | GameAnalytics benchmarks report 2025 |
| Mobile games, global median | ~22% (declining) | low single-digit | low | GameAnalytics 2025/2026 |
| Consumer apps, cross-industry median | ~25-26% | ~11-13% | ~5-7% | Adjust Mobile App Trends 2026 |
| Consumer apps, platform average | Android 21.1% / iOS 23.9% | — | Android ~2.1% | BusinessOfApps 2026 |
| Education/learning apps | ~14-15% | — | ~2% | Passion.io benchmark roundup 2025 |
| Median app, all verticals | — | — | ~4% | Appcues 2026 |

Notes:
- Confidence tiers: GameAnalytics / Adjust / BusinessOfApps rows trace to primary data vendors (higher confidence). Passion.io and CORE-MBA rows are secondary aggregators — low confidence, use only as order-of-magnitude context and prefer the primary reports before quoting.
- >90% of users abandon the average app before D30. iOS retains above Android; genre and region swing ranges sharply. Benchmarks are survivorship-biased — treat as directional.
- "~7% retention rule": a D30 curve flattening above ~7% is a common product-market-fit signal for consumer apps.
- Learning apps skew low on D30 (motivation decay); winners use recovery-friendly cadence, not streak pressure.
- Strongest primary sources: GameAnalytics (games), Adjust/AppsFlyer (apps). If citing numbers to a user, state vertical, source, and year.

## Experiment Design

- **Cohort-based measurement only**: overall retention averages are polluted by acquisition mix. Compare same-week cohorts.
- **Novelty effect guard**: any engagement mechanic spikes for 1-2 weeks. Minimum 2-4 week observation; prefer holdout groups over pre/post.
- **Primary metric**: return-event rate at the product's natural interval (D7 return-event rate, W4 completion rate) — one metric per experiment.
- **Guardrail metrics (always paired)**: notification opt-out rate, uninstall rate, support complaints, session-quality proxy (completed core action per session), refund rate.
- **Resurrection experiments**: measure re-dormancy at +30d, not just the comeback click. A resurrected user who bounces in one session is a failed resurrection.

## Anti-Dark-Pattern Reference

Dark pattern families relevant to retention (see also `../../engagement-retention-advisor/references/domain-ethics.md`):

- **Temporal**: fake urgency, expiring rewards punishing normal schedules, grind inflation.
- **Emotional**: guilt streaks, shame language, fear-of-loss notifications, manufactured loneliness (companion apps).
- **Economic**: pain-then-relief monetization, hidden odds, sunk-cost amplification.
- **Attention**: notification spam, variable-reward notification timing, infinite-scroll traps.

Regulatory direction (EU Digital Fairness work, FTC dark-pattern enforcement, loot-box disclosure rules in multiple jurisdictions) is tightening: transparent odds, easy cancellation, and non-manipulative defaults are becoming compliance issues, not just ethics.

## Output Discipline

Every proposed intervention must fill all fields: segment, lifecycle stage, trigger, user value, implementation, primary metric, experiment, risk. If a field cannot be filled honestly (e.g., no real user value), the intervention is not ready — redesign or drop it.

## Sources

Frameworks:
- Reforge, activation funnel (setup moment → aha moment → habit moment): https://www.reforge.com/guides/define-customer-activation-moments
- Fogg Behavior Model (B=MAP): https://www.habitweekly.com/models-frameworks/the-fogg-model — critique vs COM-B: https://www.triplewhale.com/blog/fogg-behavior-model
- Hook Model overview: https://amplitude.com/blog/the-hook-model — ethical critique (manipulation matrix): https://www.purplecar.net/2016/08/hooked-eyal-review
- Amplitude Retention Lifecycle Framework (New/Current/Resurrected): https://amplitude.com/blog/retention-lifecycle-framework

Experimentation:
- Novelty/primacy effects in A/B tests, Microsoft (arXiv 2021): https://arxiv.org/pdf/2102.12893
- Kohavi, Tang & Xu, *Trustworthy Online Controlled Experiments* (2020) — primary metric selection.
- Guardrail metrics: https://mixpanel.com/blog/guardrail-metrics , https://www.statsig.com/blog/what-are-guardrail-metrics-in-ab-tests

Benchmarks:
- GameAnalytics mobile gaming benchmarks 2025: https://gamedevreports.substack.com/p/gameanalytics-mobile-gaming-benchmarks
- Adjust Mobile App Trends 2026 (via aggregator): https://www.core-mba.pro/tool-hub/mobile-app-retention
- BusinessOfApps app retention data 2026: https://www.businessofapps.com/data/app-retention-rates
- Appcues retention overview 2026: https://www.appcues.com/blog/app-retention-is-hard-heres-how-to-improve-it

Ethics / regulation:
- Game dark-pattern taxonomy (temporal/monetary/social/psychological), ACM CHI PLAY 2024: https://dl.acm.org/doi/10.1145/3701571.3701604
- Veiga et al., "Dark Patterns in Games: An Empirical Study of Their Harmfulness", ICEIS 2025: https://www.scitepress.org/Papers/2025/133658/133658.pdf
- Internet Policy Review, "Gaming the mind: Unmasking dark patterns in video games" (2024): https://policyreview.info/articles/news/unmasking-dark-patterns-video-games/1739
- FTC, *Bringing Dark Patterns to Light* (2022) staff report; Epic/Fortnite $245M dark-pattern settlement.
- EU Digital Fairness Act direction (dark patterns + addictive design), EPRS 2025: https://www.europarl.europa.eu/RegData/etudes/ATAG/2025/767191/EPRS_ATA(2025)767191_EN.pdf
- Loot box regulation status 2025 (Belgium/Netherlands/Brazil/Australia/EU): https://www.gamesindustry.biz/loot-box-state-of-play-2025-a-ban-in-brazil-non-compliance-in-australia-a-worrying-wait-for-uk-legislation-and-more
