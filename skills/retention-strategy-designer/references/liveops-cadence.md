# LiveOps Cadence Specs

Read when the deliverable is a named cadence mechanic (battle pass, quest stack, login calendar, energy meter, streak, push plan, win-back campaign) or a dated multi-week calendar — for the field list, the acceptance bounds a reviewer can check, and the sizing rules that replace copied constants.

Every spec below is tagged with its canonical **ethics family slug**, and each Reviewer-flags block ends with the slug a failed flag lands on. The slug is a row title in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics.md` and an entry in the compliant-spec index of `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md`; the slug is internal keying and never reaches the answer — when a bound, a price or a residual risk must be stated, say it in the reader's own words. Read the row before signing off — this file owns the cadence bounds, not the tier.

## Sizing before specifying

**Cadence is a content-supply decision constrained by team capacity, never the fix for a decaying D7.** Three reference cadences, with what each buys:

| Cadence | Shape | Buys |
|---|---|---|
| 42-day version | two 21-day banner phases (HoYoverse; Genshin v7.0 ran 2026-08-12→09-22) | update-day spend spike |
| ~2-month season | Marvel Rivals cut ~3mo→2mo, monthly new hero (announced 2025-04-02, live 2025-07-11) | roster novelty |
| 4–6 week operation | Halo Infinite S5, Oct 2023 | cohort synchrony |

**Capacity rule (derivation, not a constant).** Period length ≥ the observed build-to-shippable time of the team's last three beats. Compressing the period without removing scope converts a content plan into a crunch plan; if compressing, name what is deleted from each beat.

**Compression does not reverse decay.** Marvel Rivals ran a player-friendly pass plus monthly heroes through: 306,066 (Jan 2025) → 63,716 (Oct 2025) → 84,281 (Jul 2026) [Steam Charts app 2767030 | monthly average concurrents, Steam only, console excluded]. A ~75% fall from peak, then a stable band near 25–30% of peak held 12+ months. Cadence compression is a long-tail stabiliser; causation in either direction is **[unverified]**.

**Subtractive LiveOps is a first-class option.** Supercell frames Clash Royale's 2021–2025 turnaround on finding the player/game overlap, *simplifying to make room for a bigger audience*, and holding a multi-year strategy over long iterations [GDC 2026 session abstract — talk contents not retrieved, **[unverified]**]. Arc Raiders moved from frequent small updates to fewer larger ones after early patches "felt underwhelming" **[contested]** — same year, same market, opposite conclusion to the compression case above. Removing a system is a legitimate answer to "what is our next beat".

---

## 1. Battle pass · `T2b pass-expiry`

**Fields** — season length; tier count; free/premium split; price; earnable-currency return; owned-progress expiry; purchase-window expiry; re-release policy (delay + markup); track structure (linear / pickable); catch-up entry.

**Sizing.** Tier count is solved, not copied: pick the median engaged player's play-days per week (from your own data), multiply by season weeks and per-play-day XP, divide by XP per tier, then cut until the track finishes at **≤3 play days/week with one week of slack**. Second constraint: unique reward assets ≤ what the art team actually shipped last comparable season. When track structure changes, tier count holds — Blizzard replaced Overwatch's linear pass with five selectable 8–10 tier tracks plus one skin swap and stated "the number of tiers… isn't changing and you won't have to work harder to complete your Battle Pass" [Blizzard, 2026, overwatch.blizzard.com/en-us/news/24296053]. Fortnite made the same move at Chapter 7 (Dec 2025): after Level 1, six extra skins become selectable via an "Unlock Set".

**Acceptance bounds**
- Owned progress never expires. The **purchase window** may close, and re-release states its delay and markup up front — Marvel Rivals re-released Season 0 (2025-05-15→29) at 590 Lattice vs the original 490 (+20%), with no free rewards in the return pass, under a standing rule that returns "span at least two seasons" at "a minimum of 20% higher" [NetEase, 2025, marvelrivals.com/devdiaries/20250513/40954_1233900.html].
- **Earnable return is stated as a ratio of price. Break-even is now normal, not a bug**: Fortnite Ch.7 S4 costs 800 V-Bucks and returns "up to 800 V-Bucks… enough to get the next one at no extra cost" [Epic, 2026, fortnite.com/battle-pass], down from an earlier 1,000 cost / up to 1,500 earnable. Do not pitch "pays for itself with change left over".
- **Cohort synchrony**: pair non-expiring paid progress with a short time-boxed free track. Halo Infinite S5 kept premium passes non-expiring but let free-track content lapse after 2023-11-14, explicitly "to move the bulk of Halo Infinite's players forward together, experiencing the same new content at the same time" [343 Industries, 2023, halowaypoint.com/news/battle-pass-operations-season-5]. Fully non-expiring content dilutes the shared "everyone is doing X this week" moment.
- **Catch-up entry**: mid-season joiners get an accelerated early track; past passes may unvault permanently once owned, cosmetics only, minus premium currency and prestige items (Overwatch "Unvaulted Passes", announced S4, delayed to S5 for QA).
- No absence penalty anywhere. No final-week skip upsell.

**Reviewer flags** — any pass-completion, repurchase or "pass fatigue" figure quoted as an industry number (none exist, see last section); a re-earned seasonal currency described as "never expires" without saying it must be re-earned; a "never expires" headline with three scarcity levers underneath left unstated. Failed flags land on `pass-expiry`; a re-release window with countdown pressure lands on `fomo-window`.

---

## 2. Quests: daily → weekly → monthly · `T2b pass-expiry`

**Fields** — daily set size and reset time; weekly bucket; monthly non-resetting bucket; whether one action advances all three layers; per-layer expiry.

**The citable 2025 pattern.** Marvel Snap's 2025-09-16 patch added a 30-day "Bonus Challenge" of 50 missions advancing from the *same* daily missions as the weekly challenge: it "does not reset weekly", sits inside a 35-day calendar window, and exists so players who "miss a couple of days… still have the opportunity to earn everything" [Second Dinner, 2025, marvelsnap.com/patch-notes-september-16-2025/].

**Acceptance bounds** — dailies feed the weekly and monthly buckets from the same actions (one play session, three layers of credit); the longest bucket spans ≥30 days inside a ≥35-day window and does not reset weekly; a player who misses 2 consecutive days can still complete the monthly bucket; the whole stack is completable at ≤3 play days/week; **no cumulative-consecutive-day requirement anywhere in the stack.**

**Reviewer flags** — a weekly bucket that requires daily presence to fill; a monthly bucket fed by different actions than the dailies (that is a second job, not a catch-up). Failed flags land on `pass-expiry`; a consecutive-day requirement anywhere in the stack lands on `login-chain`.

---

## 3. Login reward · `T2b login-chain`

**Fields** — reward curve; reset rule; grace window; catch-up credit; minor-mode default.

**Acceptance bounds** — cumulative-count calendar (day 1..N counted **by visits, not by dates**) or "N of 7 days", never a consecutive-day chain; accrual never decrements and a missed day costs zero previously-earned value; grace window ≥1 day before any progress pause; free catch-up credit; **off by default for minors in the EU**.

**Ratings consequence, stated to the designer verbatim**: mechanisms that *reward* returning (e.g. daily quests) draw **PEGI 7**; if they *punish* non-return by losing content or reducing progress they become **PEGI 12**, for games submitted from June 2026 [PEGI, 2026, pegi.info — existing titles not re-rated unless updated content warrants it]. ESRB has reportedly said it will not follow **[unverified — trade press only]**. The Ethical Games initiative independently advises against cumulative-day dailies "because it punishes players for not connecting on a specific day".

**Fixed-clock variant.** Two acceptable periods: a **sub-24h drifting clock** (Piccoma's 23h is the reference — the appointment moves earlier each day and stays inside waking hours) or a **fixed daily grant** at a set hour, which buys a shared appointment instead. What is forbidden is a fixed clock whose **ticket expires unused**: the grant may be fixed, the expiry may not. Never combine either with re-prompting pop-ups. Mechanics and Korean examples: `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/korea-market.md`.

**Reviewer flags** — "consecutive" appearing in any login copy; a welcome-back calendar quoted with a D7 lift (no such A/B exists). Failed flags land on `login-chain`; a minor-facing default left on lands on `minors-overlay`.

---

## 4. Energy / stamina · `T3 metered-access`

**Fields** — what consumes it; what refills it and how fast; free sessions per day at full refill; what it gates and what it never gates; paid/ad bypass; unlimited tier.

**Two axes, declared before configuring.** Job: session cap (an intentional stopping cue) vs economy control (rate-limit a currency or a reveal). Gate type: **mistake gate vs volume gate**. Duolingo's 2025 Hearts→Energy switch is the clean case of the second: energy is spent on *every* lesson, refills from consecutive correct answers, perfect lessons, friend invites and chests, recharges in about a day, and is unlimited on Super/Max [Duolingo, 2025, blog.duolingo.com/duolingo-energy]. Duolingo says beginners were 2× as likely to run out of hearts mid-lesson and that Energy "helps more learners complete lessons" — **no number given**; independent coverage reports free users getting less learning per day **[contested — vendor claim and user reports point opposite ways]**. Converting a mistake penalty into a volume meter changes *who* is gated (perfect players too) and makes the meter a monetisation lever.

**Sizing.** Free sessions/day is the input; refill interval is the output: `refill interval = 24h ÷ (target free sessions/day × units per session)`. Pokémon TCG Pocket refills one pack per 12h = two free packs a day [Sensor Tower, 2026, sensortower.com/blog/pokemon-tcg-pocket-100-million-downloads; timer specifics from guide sites, **[unverified against a first-party source]**].

**A meter maximises appointments; it does not supply a reason to keep one.** DeNA disclosed Pokémon TCG Pocket average MAU 51M (Jan–Mar 2025) → 39M → 30M → 28M (Oct–Dec 2025) and named 「ログイン頻度やユーザーの継続率の向上に課題がある」, with the remedy being collection-experience and event updates, not more pack-opening [gamebiz on DeNA Q3 FY3/2026, 2026, gamebiz.jp/news/420505]. Pair any metered reveal with a completion goal.

**Acceptance bounds** — state the job first; refill clock predictable and published in-app **before any purchase surface exists**; ≥1 meaningful free session per day; never gates saving, reviewing, collecting or reading already-owned content; the zero-state screen names the free return time **and** one free activity before any offer; refill clock not tuned to a return-cadence KPI; paid/ad refill never the only path back; at most **one opt-in rewarded offer per resource-out pinch point**, never chained, never re-offered after a decline in-session. Volume gates get said out loud in patch notes; expect backlash. Engineered depletion sold back as relief has no compliant version.

**Reviewer flags** — a refill constant chosen from a competitor rather than from target free sessions/day; a refill clock that appears in the retention-KPI tuning sheet. Failed flags land on `metered-access`; a chained or re-offered rewarded refill lands on `ad-chaining`.

---

## 5. Streak · `T3 streak-repair` + `T3 guilt-streak`

**Fields** — unit definition (consecutive days vs N-of-7); minimum qualifying action; repair mechanism and price; break-notification copy; milestone schedule; minor default.

**Evidence, stated at its real strength.** Across 7 studies with >4,000 participants including language-app field data, highlighting an *intact* streak raised re-engagement while highlighting a *broken* one lowered it — 66.23% vs 57.86% continued the same exercise despite identical underlying behaviour; the drop is amplified when the user feels responsible and reduced when repair is offered [Silverman & Barasch, J. Consumer Research 49(6), 2023]. Escalating streak incentives beat a flat higher per-task payment across six preregistered experiments, n=4,493 — the effect came from the consecutive-completion requirement raising goal commitment, not from the amounts, and the payout gap must stay small [Mehr et al., OBHDP 187:104391, 2025 | short-task lab paradigm, not months-long field habit data]. Only two Duolingo figures are A/B effects: Streak Freeze **+0.38%** daily active learners, new streak animations **+1.7%** 7-day retention of brand-new learners.

**Milestone derivation.** Streak value is proportional, so early milestones carry the motivation: day 2→3 is +50%, day 200→201 is +0.5%. Place milestones at day 3 / 7 / 14, then thin out.

**Acceptance bounds** — rolling window ("4 of 7 days") preferred outside genuinely daily-cadence games; the minimum qualifying action is small enough to survive a bad day (one line, one mood tap); free or earnable repair at least once per period; **paid-only repair is monetised loss aversion** — if repair is sold, an equal free or earned repair exists at the same cadence, no purchase surface sits inside the loss window, it is never sold to accounts the store signals as minors, and the copy is never loss-framed. Break-spotlight rule: no surface displays or animates a *broken* streak (test by inventorying 72h of messages on a broken test account). A missed day may reset the counter, never erase earned artifacts. Streak length is never presented as a measure of learning. Default **off for minors in the EU**.

**Reviewer flags** — "63% higher abandonment after one missed day" (a circulating figure traced to no journal, treat as fabricated); a gamification vendor's "freeze users average 17.2 vs 11.6 streak days (+48%)" (that vendor's own platform data, not an effect). Backfire evidence is real but thin and **[contested]** — qualitative, small-n, exercise domain: run-streakers breaking 100–5,000+ day streaks report sadness, anger and willingness to run through injury, while the same authors still rate streaking as unusually effective [Dombrowski group, medRxiv preprint, Dec 2024]. Carry it as an ethical cost, not as proof streaks fail. Failed repair-pricing flags land on `streak-repair`, failed break-spotlight or loss-copy flags on `guilt-streak`, a minor-facing default left on `minors-overlay`.

---

## 6. Notification · `T1/T2a ad-chaining` bound applies to any offer payload

**Fields** — payload type (value-ready / social / achievement / content-drop / reminder); trigger; segment (new / active / at-risk / lapsed); delivery window; per-segment weekly budget; template pool + rotation rule; in-app payoff; opt-out path.

**Reach is no longer assumable.** Android push opt-in fell 2023→2024 at every percentile (high/median/low 88.0/71.3/42.1% → 79.7/59.5/37.1%) while iOS held (73.9/49.1/27.3% → 74.1/49.4/27.1%); median direct open rates ~3.4% Android, ~3.1% iOS [Airship 2025 Push Notification Benchmarks | Jan–Dec 2024 data | apps on the Airship platform | direct open]. The 2026 edition [681B pushes, 3B users, published 2026-03-31] reports Android 13+ runtime permissions closing the gap to near parity and Android median/low-tier apps cutting send volume 15% YoY. The circulating "Android 97% / iOS 54%" appears nowhere in Airship's text.

**The OS now filters promotional push.** Android 16 QPR2's Notification Organizer (rolling out Dec 2025, Pixel 9/10, English-only, select regions — **Korea not included as of Dec 2025**) bundles "Promotions" and "News" into a Silent section by default; iOS 18 Apple Intelligence adds priority notifications and summaries. Behaviour-triggered messages beat standard sends by **4–9× CTR**, and 63% of teams using automated journeys "report better results with fewer messages" [OneSignal 2026 State of Customer Engagement | 200,000+ apps, 500+ marketers]. Whether Organizer expands to Samsung One UI or Korean-language regions is **unknown** and directly affects Korean planning.

**Frequency kills through opt-out, not annoyance.** "Inappropriate push frequencies often trigger users to close notification switches, directly harming long-term user retention" [Zheng et al., AAAI 2026 | A/B, >1B users, 14 days]. The corollary: target **uplift (persuadables), not churn probability** — pushing the highest-risk users hardest is measurably counter-productive.

**Rotation rule.** Duolingo's sleeping/recovering bandit over reminder templates (eligibility as sleeping arms, a decaying recency penalty as recovering arms, conversion = a lesson within two hours) produced **+0.5% DAU and +2% new-user retention over an already A/B-optimised random-template baseline** [Yancey & Settles, KDD 2020 — still the only published notification study of its kind].

**Acceptance bounds** — every push names its concrete in-app destination and payoff; behaviour-triggered, not broadcast; templates rotate with a recency penalty; **budget set per segment with an opt-out guardrail, not a global ≤1/day** (the flat cap is **[contested]**: high frequency does not always cause churn when the payload is high-value and content-gated). Korea: night-window sends separately consented, "(광고)" prefix, one-tap opt-out that does not require login, expiring-reward alerts treated as advertising, ≥7-day snooze on any re-prompt — dated statute text in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md`. EU minors: push off by default.

**Reviewer flags** — opt-out rate absent from the guardrail list; a notification whose subject is an expiry; tone chosen on assertion (there is no controlled evidence a gentler tone retains better, only that it draws fewer complaints **[contested]**); vendor push-conversion self-reports used as targets. An offer payload that chains or re-offers after a decline lands on `ad-chaining`; a push whose subject is an expiry lands on `fomo-window` (and on `guilt-streak` if the expiring thing is a streak); push left on for minors lands on `minors-overlay`.

---

## 7. Win-back campaign · `T2b fomo-window` on the return offer

**Fields** — dormancy definition; segment; channel; offer; return flow; holdout; success metric.

**Acceptance bounds** — a **randomized holdout of matched lapsed users is mandatory**; the primary metric is **re-dormancy (share still active at +7d and +30d after return)**, not reactivation rate, which any large bribe inflates; target by uplift; model delayed response.

**Channel ranking by plausibility** (evidence is the thinnest in this whole module): status restoration and friend gift/recall > in-app return calendar > push > email.
- Status restoration: Duolingo's one-time June 2026 "Streak Revival" let lapsed learners restore their longest-ever streak for three lessons — 15.4M revived, nearly 8M with no active streak, and the revived cohort retained better than a typical re-engaged cohort.
- Friction removal over bribes: NetEase revived a 22-year-old MMO with 畅玩服 for Fantasy Westward Journey PC — removing time-based fees, simplifying systems — reaching a record 3.58M peak concurrency. This matches the stated Korean churn cause: lack of time 44.0%, with video/OTT the substitute at 86.3% [KOCCA 2025 게임이용자 실태조사 | n=10,000 | published 2025-12-18].
- Non-push reach: in Marvel Rivals' gifting rollout, 41% of purchases were gifts and 25% of gift buyers had never played or had lapsed [Discord, 2026 — **vendor with a commercial interest**].
- Email is weak: ~16% open, under 2% click-through on win-back mail [Jagex GDC "Returners and Retention" — **[unverified]**, no retrievable URL].
- Publish the schedule against the expected decay curve rather than reacting: NCSOFT said Aion2 traffic "declined along the expected decay curve" and pre-planned a 6-month anniversary event plus a Season 4 update.

**Return flow is the deliverable, not the offer** — detect the gap; give a spoiler-safe recap that restates the player's *own* prior choices; refresh controls; stage an early expert-self moment before any new content. No experiment on recap systems and returning-player retention or comprehension exists.

**Offer bounds** — real-money price at the decision point; currency denominations that match item prices; no countdown pressure in flows reachable by minors; returning content sits on a published cycle or becomes earnable later.

**Reviewer flags** — any reactivation-rate benchmark; "5–10× cheaper than acquisition"; a campaign shipped without a holdout. Countdown pressure or an unrepeatable return window lands on `fomo-window`; a minor-reachable offer flow lands on `minors-overlay`.

---

## Korean calendar block

Windows that move a Korean product's baseline and its intervention timing. **These are scheduling facts, not measured effects — the research set contains no published Korean effect size for any of them; treat every one as a hypothesis to measure against your own cohorts.**

| Window | When | Cadence consequence |
|---|---|---|
| 겨울방학 | late Dec – early Feb, plus a short 봄방학 | longest teen availability block of the year |
| 설날 | lunar 1/1, 3-day national holiday (moves each solar year) | travel + family time; both a spike and a dead zone by segment |
| 여름방학 | mid/late July – August | second availability block |
| 추석 | lunar 8/15, 3-day national holiday | as 설날 |
| 수능 | one Thursday in mid-November | teen segment offline for weeks before; a release cliff and a large post-수능 return window |
| 중간·기말고사 | roughly April, June–July, October, December | recurring teen dips |

Practical rules: never open a season, pass or limited window whose completion clock runs across 수능 or a 명절 for a teen-heavy title; treat post-수능 and the first week of each 방학 as the strongest scheduled resurrection windows; if the product is 사주/운세, note that the December–February 신년 특수 dominates the year and the reading-engine year turns at 입춘 (≈4 Feb), not 1 Jan (see `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/korea-market.md`). Day-boundary and cohort-key definitions belong to `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/metric-definitions.md`; do not redefine them here.

## Numbers that do not exist

Refuse to supply these; say the number does not exist and name the measurement the team must build instead.

- **Battle-pass completion rate, season-over-season repurchase rate, and any quantified pass-fatigue metric** — no vendor, first-party or academic source published one for 2024–2026. "64% of players report battle-pass burnout" is a misattribution: Bain's Gaming Report 2025 [5,243 respondents, six countries, 2025-08-12] says 64% report that **ads** interrupt their gaming experience and contains no battle-pass statistic. Also unmeasured: whether Marvel Rivals' non-expiring pass changed attach rate or D30 at all — NetEase reports only "resounding approval".
- **Win-back lift and reactivation rate** — no 2024–2026 primary dataset. "10–25% of lapsed users recovered" and "5–10× cheaper than acquisition" carry no methodology. Build a re-dormancy baseline against a matched holdout.
- **Login-calendar, welcome-back-calendar and catch-up-mechanic A/B results** — only pattern descriptions exist. Any "welcome-back calendar lifts D7 by X%" is unsourced.
- **기다리면 무료 / wait-or-pay conversion rates** — no platform publishes one. The only citable figures are dated and single-case: up to 25% purchase conversion on some titles and daily GMV roughly 3,000만원 → 6,800만원 in the first month [DBR case via 인터비즈, 2019]. Do not present them as a current rate.
- **Korea-specific D1/D7/D30 install-cohort benchmarks** — none published by anyone. Use the stated proxy in `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/benchmarks.md` and build an internal baseline.
- **Post-streak-break abandonment rate in apps** — no quantitative estimate exists; the backfire evidence is qualitative and small-n.
- **Optimal push frequency as a single number** — the ≤1/day cap is **[contested]**; derive a per-segment budget with an opt-out guardrail instead.
