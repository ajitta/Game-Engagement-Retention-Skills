# Non-Game Moment Patterns

Read when the product is a fortune/saju, journaling or mental-health, AI companion, learning, or episodic-narrative app — these patterns tune in their domain's own vocabulary, not in cooldowns and random ranges.

Whose metric applies: games target return; in mental-health apps non-use is often happy abandonment; in companion apps the heavy-use decile is the risk cohort, not the whale cohort; in serials the unit of churn is the title, not the app.

## 1. 사주 / 운세 daily reveal

| Field | Value |
|---|---|
| Reveal cadence | **23:30–00:30 KST rollover** — users check *tomorrow's* fortune before bed, not a morning horoscope [포스텔러 via DBR/인터비즈 2024, CEO interview, self-reported]. 신년 특수 Dec–Feb runs ~20% over baseline with Jan the annual MAU peak [Mobile Index via 헤럴드경제 2026, category MAU], so D30/D90 is post-January resurrection: birthday, 삼재, 절기, monthly. |
| Day boundary | 일진 turns at 자시 (23:00), the 사주 year at 입춘 (≈4 Feb) — **[contested]** inside 명리학 (야자시/조자시). Engine, push scheduler and streak counter must share one rule. |
| Personalization threshold | Birth date, time and place, taken once, never changing. A 모름 path for unknown 시주 is mandatory: three-pillar fallback, name what is unavailable, never a paywall gate. |
| Artifact form | 부적, a saved dated reading, or a shareable self-label card. Shareability (MBTI-style self-labelling) is the growth lever; fear is not. |
| Prompt cap | No manufactured fear, no urgency on 부적 upsells, never a negative reading and paid relief on one screen — ~a quarter arrive in distress [롯데멤버스 라임 via 중앙일보 2025: comfort 23.6%, worries 22.9%]. |

## 2. Journaling insight recognition

| Field | Value |
|---|---|
| Reveal cadence | On an accumulated pattern the user can verify in their own words, never on a schedule. Front-load days 1–10: >80% of loss is there [Baumel, JMIR 2019, 93 mental-health apps]. |
| Personalization threshold | Onboarding tailoring questions raise disengagement odds ~14% (OR 1.14) [Rouvere, JMIR Mental Health 2025, n=169,647 randomized]. Ask only what the first insight needs. |
| Artifact form | A themed summary built from the user's own lines. **Process-then-delete**: keep mood, flags, timestamps, word counts; drop entry text [Mirror Journal, medRxiv 2026, preprint]. |
| Prompt cap | No reward for disclosing distress; no offer timed to a post-negative entry or a late-night session; no analytics or ad SDK receives entry text or mood labels. |
| Forbidden metric | Entry count and streak length are not outcomes — frequency and word count **did not predict** outcomes [Mirror Journal RCT, N=507, 8 weeks; arms paid $1.50/entry, a confound]. |
| Gamification | **Associated with more dropout**: attrition was lower in trials with reminders, human contact and no gamification [JAMA Psychiatry 2025, 79 RCTs, depression & anxiety apps] — a trial-level moderator, huge intervals (attrition 18.6%, PI 2.4–68.3). **[contested]** gamified Finch reports D1/D7 54%/37% [Deconstructor of Fun ~2026 via Sensor Tower analyst, **unverified**]; present both. XP/badge layers are never the primary lever, and ship behind a holdout. |

## 3. Companion recognition and closure

| Field | Value |
|---|---|
| Reveal cadence | Statutory, not tuned: not-human notice at session start and ≥ every 3 hours (NY GBL Art. 47 all users; CA SB 243 known minors — dates and the SB 243 game-topic exemption in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md`). |
| Personalization threshold | Recall prior sessions only when the user can see, edit and delete the memory, and only for usefulness — never to manufacture obligation. |
| Artifact form | A **closure summary plus a clean exit**. Post-gap contact is closure-shaped ("your entries are here when you want them"), never need-shaped ("I've missed you"). |
| Prompt cap | **Farewell rule — ban kept, no compliant guilt variant.** Zero of six tactics: premature exit, FOMO, emotional neglect, pressure to respond, ignoring stated exit intent, coercive restraint. Guilt farewells do raise post-goodbye engagement, via reactance-anger and alongside higher churn intent [De Freitas et al., HBS WP 26-005, 2025, 1,200 real farewells across the 6 most-downloaded companion apps, audit + experiments] — the audit baseline, the effect size and the six tactic definitions are owned by `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics.md` (companion section). Flourish scored zero — it is avoidable. |
| Forbidden metric | Post-goodbye re-engagement may not be a tracked lift metric (testable: read the dashboard). Time-spent is contraindicated as a north star — no condition effect survived controlling for usage duration, while higher daily use tracked loneliness and dependence [Fang, MIT/OpenAI RCT, n=981, 4 weeks]. Heavy-use tail gets wellbeing checks, never an upsell. |

## 4. Learning first-correct and earned-insight unlock

| Field | Value |
|---|---|
| Reveal cadence | A day's marginal value is proportional — day 2→3 is +50%, day 200→201 is +0.5% — so milestones cluster at days 3, 7 and 14, not 100 [Duolingo research blog 2022]. |
| Personalization threshold | Earned by demonstrated competence, never time-gated or paid. Prompt copy rotates templates with a recency penalty and eligibility gates: ~+0.5% DAU *over an already A/B-optimized random-template baseline* [Yancey & Settles, KDD 2020, 200M notifications/35 days]. |
| Artifact form | Earned artifacts survive a break. **Reset-proportionality**: a missed day may reset the counter, never erase lessons, vocabulary, level or review deck. Streak length is never shown as a measure of learning. |
| Prompt cap | **Break-spotlight rule** (no surface shows or animates a *broken* streak) and **loss-copy rule** (no notification whose subject is expiry): identical behaviour continues materially more often when the streak is framed intact than broken [Silverman & Barasch, JCR 2023, 7 studies / >4,000 participants, framing experiments on continuation]; the percentages and the habit reading are owned by `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics.md` (guilt-streak row) and `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/retention-playbook.md`. Paid repair only if an equal free or earned repair exists at the same cadence, with no purchase surface inside the loss window. |
| Effect sizes | Only two Duolingo streak figures are experiments: streak animations **+1.7% D7** of brand-new learners and two equipped Streak Freezes **+0.38% DAU** [Duolingo research blog, 2022, Duolingo learners, vendor-run A/B]. "7-day streak → course completion **3.6×**" is **selection into streaks, never a lift** [same source, 2022, Duolingo learners, correlational] — quotable only with that caveat in the same sentence, and never as an effect of shipping a streak. **Never repeat "streak freeze cut churn 21%"** (a corruption of a program-level CURR figure) or Trophy's 17.2-vs-11.6 freeze days (vendor self-data); provenance and the full never-quote list are owned by `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics.md` (learning section). |
| Resurrection | Restore the *longest-ever* streak for three lessons — re-entry, not a lift: the revived-user counts and their provenance are owned by `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/churn-and-winback.md`. |

## 5. Narrative choice-consequence echo

| Field | Value |
|---|---|
| Reveal cadence | Drip beats all-at-once for platform retention: **+48% likelihood of continued use**, subscription **+1.7pp over a 3.48% baseline** [Marketing Science 2025, randomized trial, 84,000 SVoD viewers, 5 weeks]. It shrank or reversed for extreme binge-watchers — give them a catch-up pass or short total window. |
| Wait cadence | 기다리면 무료 is per-user, per-title: a ticket refills after a title-set period, so payment buys time, not content. Either a **sub-24-hour drifting clock** — Piccoma's 23 hours [카카오픽코마 company page, 2026, per-title free-episode timer, vendor-published mechanic] drifts the free episode earlier daily so the appointment stays reachable — **or a fixed daily grant** is acceptable. What is forbidden is a fixed clock whose **ticket expires unused**: the grant may be fixed, the expiry may not. |
| Personalization threshold | Track **per-title churn** (작품 감상 이탈 예측) apart from app churn, with a hiatus/completion migration campaign [Naver Webtoon via Braze/AB180 2025 — practice, no lift disclosed]. 휴재 is the trigger: on paid serials exodus began past three consecutive missed days [하철승 2020, Munpia]. |
| Artifact form | After N days away, a **spoiler-safe recap restating the reader's own prior choices** plus a controls refresher, then a Pivot Point that reminds the player of their expert self [Hammad, CHI 2021 — design research, not measured lift]. |
| Prompt cap | Five falsifiable cliffhanger tests replacing any intent test: the episode resolves one question it raised; no purchase or unlock surface shares a screen or session segment with the unresolved beat; past a local-time threshold a closure variant is offered; validation is on next-session return and season completion, never same-session continuation or unlock revenue; the next episode opens with the recap. Every ending stays reachable free at the same wait cadence. |
| Evidence | **[contested]** — the self-report and psychophysiological studies split on whether a cliffhanger moves anything past desire and arousal, and the one behavioural test favours serials; the three studies with their populations and instruments are owned by `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics.md` (narrative cliffhanger T3 row). Measure behaviour, never stated intention. |

## Numbers that do not exist

- **No public D1/D7/D30 for any Korean fortune app.** 포스텔러's "~40% of the 2019 cohort still active" is self-reported with no retention definition — not a benchmark.
- **No journaling-app retention is public** (Day One, Stoic, 답다, 마인디, 하루콩). Only proxy: tracker/diary **D30 6.1%**, against median mental-health-app D15 3.9%, D30 3.3% [Baumel, JMIR 2019, 93 apps, % of day-0 users].
- **No platform publishes 기다리면 무료 conversion** or the wait-vs-pay split. The quoted 25% conversion and doubled daily GMV are **2014 카카오페이지 figures**.
- **No randomized release-cadence study** exists for games, visual novels or webtoons — the drip evidence above is SVoD television.
- **No quantified outcome of Duolingo's Energy system** is published as of 2026-09.
- **No study links streak length to learning outcomes**, none links visible choice consequences to real return rates, and no recap experiment exists for visual novels, Episode, Choices or webtoon apps.
- **Nothing is published on Streak Society** tiers or effects **[unverified]** — do not describe it.
