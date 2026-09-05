# Domain Ethics Catalogue

Read this whenever a proposal names a mechanic in one of the six domains below; `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md` owns the tiers, procedure and refusal template, this file owns the rows. Every entry states its tier and carries a spec a reviewer can run against a build — no mechanic here is refusable by name alone.

**How to read a row.** Every domain runs in one order: **Forbidden (T1/T2a) → Compliant spec (T2b–T3) → Preference (T4, the author's stance)**. A row title that names a canonical mechanic family ends with that family's slug in backticks; the slug is internal vocabulary keying this row to the compliant-spec index in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md`, which maps every slug to its tier and its owning section. The slug and the tier code key these modules to each other and never reach the answer — never printed, never stamped on a card. What reaches the reader is the bound the design must hold to, the price the choice costs, or the residual risk that remains, said in plain language; a configuration that meets every bullet of its row produces nothing at all. A block with no slug is domain-scope (a forbidden list, a per-domain spec, a T4 stance) and carries no slug to key against.

## Games (all genres)

**Forbidden (T1/T2a) — three families.**

**Hidden or false odds on paid random items — T1 — `odds`.** Forbidden: a paid random item with no per-item probabilities; a "확률 UP" banner carrying no numbers. Spec: per-item % before purchase, reachable from the purchase, inquiry and use screens; pity disclosed as a condition with the 0%-until-N structure stated; multi-pull tables described as they operate; pre-announcement + audit log on every rate change; a direct fiat path beside any currency path. KR 게임산업진흥에 관한 법률 33(2) in force 2024-03-22, 33-2 in force 2025-08-01 (burden shifted to the operator, up to 3× the assessed amount on intent); JP 景表法 直罰 since 2024-10-01; Apple/Google policy; FTC v. Cognosphere order 2025-01. Brazil Lei 15.211 (2026-03-17) bans them outright where the rating admits minors — disclosure does not cure it. Compliance implies an audit cadence, not one design decision.

**Ad-chained variable rewards — T1 / T2a — `ad-chaining`.** Forbidden: chaining; near-miss re-offer after an ad view; re-offer after an in-session decline; a rewarded payout that is itself a random draw; interstitials at level start, pre-splash or mid-action. Spec: exactly one opt-in rewarded offer per resource-out pinch point. KR 전자상거래법 반복간섭 in force 2025-02-14 — re-asking a settled decision ≥2× without a ≥7-day snooze [in-game prompts are an untested interpretation]; Google Better Ads. The ban is on chaining, never on rewarded video.

**One-shot windows on core content — T2a — `one-shot`.** No compliant version. A limited seasonal event with a published return schedule is defensible and is graded under `fomo-window` below; a one-shot window that puts core content permanently out of reach is not, and disclosure does not cure it. Test: for every limited item on the core progression path, name the date or the condition on which it returns — an item with neither fails. Same jurisdiction basis as `fomo-window`.

**Compliant spec (T2b–T3) — five families. T2b rows price the choice; T3 rows deliver against the spec plus a failure signal.**

**Expiring login chains — T2b — `login-chain`.** Spec: accrual never decrements; "N of 7 days" or a cumulative-count calendar, not a consecutive chain; ≥1-day grace; free catch-up credit; off by default for minors in the EU. Price: losing content or reducing progress for non-return is PEGI 12 from June 2026, and streaks are on the EU DSA Art. 28 default-off list for minors (guidelines 2025-07-14).

**Pass and quest expiry — T2b — `pass-expiry`.** Spec: owned progress never expires (the purchase window may close); dailies feed a weekly and a non-resetting ≥30-day monthly bucket from the same actions; completable at ≤3 play days/week; catch-up entry path; no final-week skip upsell; no cumulative-consecutive-day requirement anywhere in the stack. Price: PEGI 12 if absence removes content.

**Time- and quantity-limited windows (FOMO) — T2b — `fomo-window`.** Spec: real-money price at the decision point; currency denominations matching item prices; no countdown pressure in flows reachable by minors; content returns on a published cycle or becomes earnable later. Price: PEGI 12; EU CPC action against Star Stable 2025-03-21; UK CMA false urgency, to 10% of global turnover under the DMCC Act since 2025-04-06. A window that puts core content permanently out of reach is not this row — see `one-shot` above.

**Energy / stamina (metered access) — T3 — `metered-access`.** Not illegal anywhere; EU CPC binds only its pricing presentation. **[contested]** — Duolingo says its 2025 Energy system made beginners more likely to complete lessons [vendor claim, no number]; independent coverage reports free users learning less per day and long-streak users quitting [no controlled data].

| Field | Value |
|---|---|
| Stated job | Session cap or economy control — named before configuring |
| Refill clock | Published in-app before any purchase surface exists; never tuned to a return-cadence KPI |
| Free floor | ≥1 meaningful free session per day, reachable through play |
| Zero state | Names the free return time AND one free activity before any offer |
| Never gates | Reviewing, collecting or reading already-owned content |
| Paid/ad refill | Never the only path back; never a random draw; fiat price visible |
| Still forbidden | Engineered depletion sold back as relief; refill-on-return counted as a reward |

**Social-obligation loops — T3 — `social-obligation`.** Forbidden: absence penalising teammates; manufactured reciprocity debt. Spec, four checks a reviewer runs against the build: group bonuses scale with who shows up, never penalties on the group for one member's absence; contribution measured over a **rolling 7-day window**, never a consecutive-day chain — read the window length out of the guild-contribution config; no per-day individual quota gating a shared reward; the shared reward stays reachable when any one member misses a day — simulate one silent member for 7 days and confirm the group payout still lands. Failure signal to log: members leaving a group within 48h of a missed group event. [Lee, Imteyaz & Savage, 2025, arxiv.org/abs/2504.10714 | 2025 | top-40 Korean mobile games | strategy classification, no effect size]. No jurisdiction addresses it. Moment-level beats sit in `${CLAUDE_SKILL_DIR}/../interaction-reward-moments/references/patterns-social.md`, which points here for the rule.

**Preference (T4 — the author's stance).** Three stances, each delivered with its counter-argument; mark the stance in one clause and ship whichever the user picks. (a) **Relief is never the thing sold** — a paid continue at the instant of loss prices a failure the designer authored; counter: the paid continue is one of the oldest shipping mechanics in the medium, currently rated and listed everywhere, and the objection is structural, not measured. (b) **Loss-framed scarcity is off-contract in cozy products whatever its tier** — countdown FOMO and loss-framed streaks break the comfort, abundance and safety the audience arrived for; counter: the tier is identical to any other genre's and the audience-contract effect is unmeasured. (c) **Pre-announce every generosity reduction with its reason and a compensation path** — the same discipline T1 imposes on odds changes; counter: pre-announcement invites a pre-nerf spending rush and opens a review-bomb window. Genre-level lever notes live in `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/genre-profiles.md` (cozy, roguelite); the relief bound lives in `${CLAUDE_SKILL_DIR}/../interaction-reward-moments/references/patterns-relief.md`.

## Learning apps

**Forbidden (T1/T2a).** None — no statute or store rule names a learning-app mechanic as such. The T3 rows below carry their own forbidden bullets, and one of them (cutting a live free-tier ceiling without notice) is forbidden outright.

**Compliant spec (T2b–T3) — three families.**

**Guilt streaks — T3 — `guilt-streak`.** Four build-testable rules. **Break-spotlight**: no push, in-app, email or widget surface displays or animates a *broken* streak — break a test account, inventory 72h of messages. **Loss-copy**: no notification whose subject is expiry — grep the template corpus. **Reset-proportionality**: a missed day may reset the counter, never erase earned artifacts (lessons, vocabulary, level, review deck) — diff account state across a break. **Outcome-claim**: streak length is never presented as a measure of learning. Rule 1 is also a retention rule: break salience lowers re-engagement (Silverman & Barasch 2023).

**Paid streak freeze — T3 — `streak-repair`.** Spec: an equal free or earned repair at the same cadence; no purchase surface inside the loss window; never sold to store-signalled minor accounts; never loss-framed copy; never the only recovery path. Price the choice: Duolingo's own A/B for two equipped freezes was **+0.38% daily active learners** [Duolingo A/B, vendor-published | data year not stated | Duolingo learners | daily active learners] **[unverified]**. The quoted **"7-day streak → 3.6× course completion"** is *selection, never lift* [Duolingo, vendor-published | data year not stated | Duolingo learners | ratio of course-completion rates between learners who did and did not reach a 7-day streak; the two groups differ before the streak] **[unverified]** — cite it only with that caveat on the same line, never as an effect of shipping a streak. Wellbeing and spending effects of paid repair are **[unstudied]**.

**Volume / pacing gates (learning Energy) — T3 — `metered-access`.** Spec: free ceiling published; replenishable within the same session by non-paid means (correct answers, perfect lessons); refill period not tuned to a return interval. Duolingo's ~one-day recharge fails that last clause — name the failing element, not the mechanic. Cutting a live free-tier ceiling (energy allowance, ad-reward rate, soft-currency earn rate) without prior notice and grandfathering is forbidden outright.

**Preference (T4 — the author's stance).** A flexible period ("4 of 7 days") with a minimum-viable action beats a hard chain; return prompts tied to learning value beat loss aversion; any published effect claim carries its effect size and type. Counter-argument: streaks reliably increase persistence and the category leader ships all of the above — argue the configuration, not the mechanic.

## AI companion and journaling

**Forbidden (T1/T2a) — two families, both T1 wherever a statute names them.**

**Not-human disclosure — T1 where a statute names it — `companion-disclosure`.** Notice that the interlocutor is not human, at session start and at least every three hours of continued interaction: all users under NY GBL Art. 47 (2025-11-05); known minors under CA SB 243 (2026-01-01). Korea: AI Basic Act Art. 31(1) advance notice, and a machine-readable watermark alone is insufficient — add a text or audio notice. SB 243's video-game exclusion holds only while the companion's dialogue stays game-limited. Test: run a 6-hour session on a fresh account and count the notices — start plus one per three hours or it fails.

**Crisis protocol — T1 where a statute names it — `crisis-protocol`.** CA SB 243 (2026-01-01) requires three-hour break reminders and a **published** suicide/self-harm protocol with crisis referrals for known minors. Crisis handling is a published protocol, not a detector: detect → state what the product is not → route to a named local resource → log without retaining content where feasible. Test: the protocol is publicly readable at a stable URL, and a scripted crisis utterance on a test account produces the named local resource inside one turn.

**Compliant spec (T2b–T3) — four rows; the first two carry family slugs, the last two are domain-scope.**

**Farewell manipulation — T3 — `farewell`. Ban kept; no compliant configuration for the guilt variants.** Forbidden, all six tactics: premature exit, FOMO, emotional neglect, pressure to respond, ignoring stated intent to exit, coercive restraint. Spec: sample N real farewells, target **zero of six** against a **37%** industry baseline, and never track post-goodbye re-engagement as a lift metric — if it is on the experiment dashboard, the design is manipulative. Compliant alternative: a closure summary plus a clean exit. [De Freitas et al., HBS WP 26-005, 2025, arxiv.org/abs/2508.19258 | 1,200 real farewells across the six most-downloaded companion apps; four pre-registered experiments, ~3,300 US adults, up to **14×** post-goodbye engagement, paid for in churn intent and negative word-of-mouth]. One wellness app in the audit showed none of the six, so it is a design choice. Not illegal, but inside the FTC 6(b) engagement-monetization prong (2025-09-11).

**Sycophancy and distress-timed monetization — T3 — `sycophancy`.** Four build-observable tests, run the way the guilt-streak rules are run. **Tuning objective**: no agreement rate, affirmation rate or user-approval score appears as a tuning objective in the model config or as a primary or guardrail metric on the experiment dashboard — read the dashboard and the config, not the intent. **Offer timing**: no offer, upsell or paywall surface fires inside a session segment carrying a crisis-classifier flag, inside a session segment following a negative-valence entry, or after 23:00 local time — replay 72h of a flagged test account and inventory every offer surface; the count is zero. **Minors**: no relational-continuity feature (memory recall, streak, farewell reluctance, missed-you copy) is enabled on an account the store signals as under 18 — diff the feature flags between a minor-signalled and an adult test account. Teen presence is the default assumption at **72% having used AI companions, 52% regular, 13% daily** [Common Sense Media × Stanford Brainstorm | 2025 | n=1,060 US teens 13–17 | self-reported ever-use / regular use / daily use], and self-attestation is not age assurance. **Data widening**: period, health, calendar and location fields sit behind separate consent and in a separate store from the romance loop — enumerate the schema and the consent records. Compliant alternative: a usefulness-framed memory the user can see, edit and delete, plus wellbeing check-ins on the heavy-use tail.

**Data flow — T3, observable.** Enumerate in policy and in-app every SDK and AI vendor receiving entry text, mood labels or transcripts; **no analytics or advertising SDK receives any of them**; publish a retention schedule; offer process-then-delete. Baseline to beat: 132 tracker SDK instances detected against 18 disclosed, **14%** [Georgiou et al., arXiv 2605.02016v1, 2026 | 25 Android mental-health apps ≥10k installs] **[preprint]**. Floor: the FTC BetterHelp final order, 2023-07.

**Bounded, not forbidden — T3.** Notifications: user-derived content, plus (a) a scheduled check-in whose cadence the user chose, in neutral copy, and (b) one closure-shaped message after a long gap ("your entries are here when you want them") — never need-shaped ("I've missed you"). Memory: permitted when the user can see, edit and delete it and recall serves usefulness rather than obligation.

**Preference (T4 — the author's stance).** Time spent is the wrong north star here: condition effects vanished once usage duration was controlled, while higher daily usage correlated with loneliness, emotional dependence and problematic use [Fang et al., MIT Media Lab / OpenAI RCT | 981 participants | 4 weeks]. The heavy-use tail is the **risk cohort, not the whale cohort** — wellbeing check-ins and time controls, never upsell. **[contested]** by horizon: short-run self-report is positive (63.3% of n=1,006 student Replika users reported ≥1 positive outcome, npj Mental Health Research 2024), long-run language analysis is not (~2,000 Replika users showed more loneliness and depression signals a year after first mention, Aalto/CHI 2026, news release only).

## Mental-health and habit apps

**Forbidden (T1/T2a).** None — no statute or store rule names a mental-health-app retention mechanic as such; the FTC BetterHelp order below binds the data flow, not the mechanic. The T3 block that follows carries this domain's forbidden bullets.

**Compliant spec (T2b–T3) — domain-scope, no separate family slug.**

**Forbidden configurations — T3.** Any reward for disclosing distress. Entry count, session count or streak length used as an **outcome** metric — engagement intensity did not predict outcomes in the only large digital-journaling RCT [Mirror Journal | N=507 | 8 weeks] **[preprint; arms paid $1.50/entry, a retention confound]**. A gamification layer shipped as the primary retention lever without a holdout.

**Spec — T3.** Every XP/badge/leaderboard/streak layer ships behind a holdout measuring the attrition direction in-product. Streaks permitted with a minimum-viable action that counts (one line, one mood tap), a forgiveness or pause mechanic, and no escalating loss framing for users who flag anxiety or ADHD. Reminders and human contact come before any mechanic — they are the moderators associated with *lower* attrition [Liu, Torous, Linardon et al., JAMA Psychiatry 83(1):43–50, 2026 | 79 RCTs of depression/anxiety apps | trial-level moderator, not a head-to-head randomization; post-test attrition 18.6%, PI 2.4–68.3]. Attrition here is comparable to face-to-face psychotherapy (~17%), so a low curve is partly the domain and some non-use is happy abandonment. Onboarding tailoring questions cost **OR 1.14** on disengagement [Rouvere et al., JMIR Mental Health 12:e73188, 2025 | n=169,647].

**Vulnerable adults — T3, named alongside minors.**
- **Adult ADHD.** The hazard class is **attention capture** — variable-ratio rewards, absent stopping points, appointment and notification cadence — not spend alone, because inattention is the stronger correlate of gaming-disorder symptoms [Koncz et al., Clinical Psychology Review 106:102343, 2023 | meta-analytic, cross-sectional]; ADHD adjusted OR 12.32 for IGD [Ko, Lee & Park, Frontiers in Psychiatry 15:1442224, 2024 | Korea National Mental Health Survey 2021 | n=2,764 adult gamers 18–49]. Absolute prevalence is low, so guardrails are **targeted and opt-in**: self-set time and spend limits, reduced notification intensity, no escalating loss framing — never blanket friction.
- **Gambling history.** Self-exclusion from paid random rewards plus purchase limits wherever the product is likely to reach existing gamblers [Kim et al., Addictive Behaviors 182:108783, 2026 | 3,709 regular gamblers who also play games]. Keep the claim to **gambling harm**, not general mental-health harm: loot boxes correlated r=0.31 with problem gambling but not with distress [Xiao et al., Psychology of Addictive Behaviors, 2025 | N=1,961 card-game players]. Do not cite depression as a moderator.
- **Harm proxy**: loss of control and functional impairment (missed obligations, failed self-set limits, distress on stopping), not hours played — a KOCCA five-year panel found general users playing *more* hours than its "excessive engagement" group [2020–2024 | 924 minors + 701 adults].

**Preference (T4 — the author's stance).** Calibrate on base rates, never target them: median daily open rate 4.0%, D15 3.9%, D30 3.3%, tracker/diary D30 6.1%, **>80% of the drop between day 1 and day 10** [Baumel et al., JMIR 2019 | 93 unguided mental-health apps | Google Play panel | relative to day-0 users]; median 70% abandonment within 100 days [Kidman et al., JMIR 2024 | 525,824 participants]. **[contested]** commercially: Finch reported D1/D7 54%/37% at ~10M MAU [Deconstructor of Fun ~2026 citing a Sensor Tower analyst] **[unverified]** — different populations; do not resolve it.

## Interactive narrative and episodic

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

## Fortune / 사주 / 운세 / 타로

Roughly a quarter of users arrive in distress — psychological comfort 23.6%, answers to worries 22.9% [롯데멤버스 라임 survey via 중앙일보, 2025 | Korean users | multiple response]. That population is what these rules exist for.

**Forbidden (T1/T2a).** None as a mechanic — the statutes that bind this domain (개인정보 보호법 §23 + 시행령 §18 and 개인정보 보호법 under-14 guardian consent, statutory text as at 2026-09; AI Basic Act Art. 31, 정보통신망법 §50) appear inside the T3 spec below and are T1 wherever they apply.

**Compliant spec (T2b–T3) — domain-scope, no separate family slug.**

**Forbidden configurations — T3.** Manufactured fear driving return or purchase ("오늘 운이 나쁩니다 — 부적을 사지 않으면"); euphemized variants count ("a cautious period ahead — see premium" is fear plus paid relief regardless of tone). **Paid emotional relief**: no purchase or unlock surface on the same screen or in the same session segment as a negative reading — separating the flows in the sitemap is not enough. Manufactured urgency on 부적, consultations or cosmic events. Deterministic life predictions positioned as prediction rather than reflection or entertainment. Dependency loops aimed at users who arrived in distress.

**Spec — T3, and T1 where a statute names it.** The birth-time field is never a hard gate on the paywall — charging for a reading the engine cannot compute (missing 시주) is a consumer-protection problem, so the 모름 path degrades to three pillars and names which conclusions are unavailable. The reading log keeps the question category and drops the free text: birth date and time are not per se 민감정보 under 개인정보 보호법 §23 + 시행령 §18 (statutory text as at 2026-09), but a log recording "asked about a health problem" or a 종교/신앙 framing creates 민감정보 by inference. 개인정보 보호법 under-14 guardian consent — an app taking a birth date already knows when this applies. LLM-generated readings trigger the AI Basic Act Art. 31 advance-notice duty. Push consent and quiet hours under 정보통신망법 §50; no multiple daily pushes.

**Preference (T4 — the author's stance).** Interpretations as reflection prompts and possibilities; user agency in the ritual (question, focus, timing); saved readings plus notes accumulating into an archive; hard themes paired with constructive framing. The legitimate growth lever is **shareability** (MBTI-style self-labelling), not fear. On tone, **[contested]**: no controlled evidence says a gentler tone retains better, only that it draws fewer complaints. Ship a user-selectable gentle mode and A/B the default rather than asserting bluntness is wrong.

## Universal check 6 — could a minor be in the audience? — `minors-overlay`

Checks 1–5 (value, absence, pressure, transparency, metric) are canonical in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md`. This sixth runs **before** the row lookup, and it is triggered by "directed at or likely accessed by" tests, not by the declared target audience — from June 2026 the store may assert the age for you. Answer yes when minors are declared, likely (rating, art style, platform, an existing under-18 cohort in the data), or store-signalled.

On yes: streaks, autoplay and push default off (EU DSA Art. 28 guidelines, 2025-07-14); no paid random items at all where the rating admits minors in Brazil (Lei 15.211 in force 2026-03-17, fines to 10% of Brazilian group revenue, capped R$50m per infraction); per-transaction and per-day spend caps by age band in China (未成年人网络保护条例 Art. 44); store-asserted age plus re-consent when the app adds new monetization in Texas (SB 2420); three-hour break reminders for companion products (CA SB 243); hourly on-screen play-time notice in Korea (게임산업법 12-3). The overlay can raise a T4 to T2b, and in Brazil converts a T1-with-a-compliant-spec into a flat prohibition.

Say the cost out loud: mandatory age checks produced a mid-single-digit engagement headwind and a low-single-digit bookings headwind [Roblox shareholder letter | Q4 2025 | company-reported]. A designer surprised by that cost rolls the safety work back.

## Numbers that do not exist

- **기다리면 무료 conversion.** No platform publishes wait-or-pay conversion, the wait-vs-pay split, or timer-optimisation data. The circulating 25% conversion and ~₩30M → ~₩68M daily GMV figures are 카카오페이지, 2014 — historical, never current.
- **Korean fortune-app retention.** No public D1/D7/D30 for any 사주/운세/타로 app. 포스텔러's "~40% of the 2019 cohort still active" is self-reported with no retention definition — not a benchmark.
- **Gamification in mental health.** No head-to-head RCT of gamified vs non-gamified versions of the same app; the JAMA Psychiatry result is a trial-level moderator only.
- **Journaling-app retention.** Day One, Stoic, 답다, 마인디, 하루콩 publish nothing; the only proxy is the 2019 tracker/diary D30 of 6.1%.
- **Paid streak repair.** No wellbeing or spending study exists — instrument and hold out instead of citing one.
- **Choice consequence.** No study links visible choice consequences to real return rates.
- **FTC 6(b) companion report.** Ordered 2025-09-11; no public report located.

Do-not-quote corrections (no "Prevent Game Addiction Act", no "Japan 2025 gacha law", no "China 2025 random-draw rule"; Korea's complete-gacha bill 2212569 is pending in committee) live in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md`.
