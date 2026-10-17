# Jurisdictions

Read whenever a T1/T2 candidate appears, or when the user has not named a target market. Korean statutes are in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions-korea.md`: read that file for a product that ships in Korea, this one for a store, rating or other-market claim, and both when the market is unstated or Korea is one of several. Facts only — the tier procedure is in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md`, the per-mechanic specs in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics/<domain>.md`.

**last-verified: 2026-09.** Every line here ends in an unwritten clause — *verify with counsel before shipping*. Design-planning input, not legal advice, and the fastest-rotting content in the set: if today is more than ~6 months past that date, say so before citing it.

<!-- RULE-ZERO -->
## Rule zero — what counts as a legal claim

**`jurisdictions.md` and `jurisdictions-korea.md` are the only source of law in the plugin. Every line in them names its instrument, its provision and its date. A duty not written there with a named instrument and a date is not a legal claim — it is a recommendation, and must be labelled one in the answer.**

Three consequences, in order:

1. **Never attach an instrument's name to a rule these files do not state.** Not "under 정보통신망법…", not "the DSA requires…", not "regulators require…". Cite the provision as these files write it, or label it "recommended" and name no instrument at all.
2. **Never widen a provision past the mechanism it names.** A rule about *consent, hour of day and disclosure* is not a rule about *frequency or cadence*. A disclosure duty is not a ban. A rating floor is not illegality. An enforcement order against one company is not a statute binding another. If the thing you are about to constrain is not the thing the provision names, what you are writing is a recommendation.
3. **Sort every constraint you state into one of three buckets and say which one.** **Law** — a named instrument here, in force, with its date. **Contract or rating** — store guidelines, PEGI/USK: binding by agreement, enforced by rejection, removal or an age tier, never by a court. **Recommendation** — this plugin's design judgement, which includes *every* tier, threshold and house rule in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md` and `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics/<domain>.md`. The tiers are not law and never were.

The failure this rule exists to prevent, from a real answer: the plugin's own once-a-day push guidance was delivered to a client as 정보통신망법 §50. **No Korean statute caps daily message frequency** — see the §50 entry in `jurisdictions-korea.md`. A designer carries that to counsel and is wrong, and every other legal line in the answer loses its credit alongside it.
<!-- /RULE-ZERO -->

## Korea

Korean statutes — 게임산업진흥에 관한 법률, 전자상거래법, 정보통신망법 §50, the AI Basic Act and 개인정보 보호법 — are in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions-korea.md`.

## Rating and store layer

**This whole layer is contract and rating, not law.** PEGI is industry self-regulation (statutory only where a national body adopts it, as USK does in Germany); store guidelines bind by the developer agreement. A breach here costs an age tier, a review rejection or a removal — never a fine, never a court. Say "this raises your PEGI floor" or "this risks review rejection", never "this is not allowed".

**PEGI interactive risk categories** — announced 2026-03-12, applying to games **newly submitted from June 2026**; existing titles are not re-rated unless updated content warrants it.

| Feature | Rating floor | Note |
|---|---|---|
| Daily quests rewarding return | PEGI 7 | "Play-by-appointment" |
| Punishing non-return | PEGI 12 | Losing content, reducing progress |
| Time- or quantity-limited offers | PEGI 12 | Purchases of in-game content |
| Paid random items | PEGI 16 | PEGI 18 in some cases |
| NFT/blockchain, unrestricted comms | PEGI 18 | — |

A login chain that resets accrued value on a missed day costs a European age tier; a limited-time bundle costs another. Aligned with Germany's USK criteria since 2023. **[unverified]** — trade press reports an ESRB spokesperson declining a similar scheme, but no ESRB primary statement was located; treat the rating consequence as Europe-plus-Australia.

**Store rules bind everywhere by contract — enforced by rejection or removal, not by a regulator, and not appealable to one.** Apple Review Guideline 3.1.1 (Dec 2017): loot-box odds disclosed **prior to purchase**. Google Play (May 2019) is stricter in wording — "in advance of, **and in close and timely proximity to**, that purchase." Google Play Better Ads Experiences (2022-09-30) bans unexpected full-screen interstitials at level or content-segment start, before the splash screen, or after the user chose another action, and requires every full-screen interstitial to be closeable after 15 seconds; opt-in interstitials, interstitials that do not interrupt (after a score screen) and opted-in rewarded ads are exempt from the 15-second rule. Google Play Families policy, for ads shown to children or users of unknown age: any ad that interferes with normal use or play, rewarded and opt-in ads included, must be closeable after 5 seconds. [Google Play Developer Program Policy — Ads, https://support.google.com/googleplay/android-developer/answer/9857753; Families, https://support.google.com/googleplay/android-developer/answer/9893335 | checked 2026-10 | apps on Google Play | placement and closeability duties]

## European Union

- **DSA Art. 28(1) minors guidelines** (2025-07-14) name mechanics directly: default-off "streaks," ephemeral content, read receipts, autoplay and push notifications; removal of "persuasive design features aimed predominantly at engagement"; no exploitation of children's low commercial literacy, naming virtual currencies and loot boxes. Following them "is voluntary and does not automatically guarantee compliance," yet the Commission uses them to assess Art. 28(1) compliance. Scope: **all online platforms accessible to minors**, not only VLOPs.
- **CPC virtual-currency principles** (2025-03-21, non-binding) — purchases expressed in real-world money; bundle denominations must not force buying unused currency; withdrawal rights respected. The coordinated action against Star Stable alleges direct exhortation to children and time-limited-offer pressure. **[contested]** — Video Games Europe and EGDF call the principles misinterpretations of EU consumer law; no public outcome as of 2026-09-05.
- **TikTok preliminary findings** (2026-02-06) — a regulator's harm model for variable reward, not a rule: constantly "rewarding" users with new content may "lead to compulsive behaviour and reduce users' self-control." **[contested]** — preliminary and non-prejudging; TikTok called them "categorically false."

## Brazil — the strictest instrument in force anywhere

**Lei 15.211/2025 (ECA Digital), in force 2026-03-17, Art. 20** prohibits loot boxes in games directed at children and adolescents **"ou de acesso provável por eles"**, per the classificação indicativa. It reaches any paid feature granting random consumable items or advantages without prior knowledge of content. A **ban, not a disclosure duty**, triggered by rating plus an "access likely" test broader than "targeted at." Sanctions to **10% of the economic group's Brazilian revenue, capped R$50m per infraction**; a Brazilian legal representative is mandatory.

## United States — enforcement orders, not statutes

**An FTC consent order binds its defendant and no one else.** There is no federal loot-box or engagement statute. What follows is the FTC's own account of what §5 already requires and the best available predictor of what it sues over — so it is the reference spec **by recommendation**, and a design that departs from it is an enforcement risk, not an illegality. Never write "US law requires" over any of it. The state statutes further down (SB 243, GBL Art. 47) *are* law and are marked as such.

- **FTC v. Cognosphere/HoYoverse** (order 2025-01-17, $20M) is the reference US gacha spec: no loot-box purchase by under-16s without a parent's affirmative express consent; no sale of loot boxes for virtual currency **unless they can also be bought directly with real money**; odds and multi-tier currency exchange rates disclosed; under-13 data deleted. The complaint targeted currency denominations forcing repeated re-exchange, and promotions implying better five-star odds than actual.
- **FTC v. Epic** — $245M total ($72M to 629,344 consumers Dec 2024; $126M to 969,173 June 2025) for "counterintuitive, inconsistent and confusing button configuration," children's charges without parental consent, and lockouts of users who disputed charges. Purchase confirmation is the design the FTC extracted in settlement and will look for again — a strong recommendation carrying enforcement risk if dropped, not a statutory duty, and not friction to optimise away.
- **FTC 6(b) companion-chatbot inquiry** — orders 2025-09-11 to seven firms on how they "monetize user engagement." **No report published**; cite no findings.
- **FTC BetterHelp final order (2023-07)** — bans disclosing health data for advertising, $7.8M in refunds, affirmative express consent before third-party disclosure, deletion instructions to third parties, published retention schedule. Binds its defendant only; cited here as the data-flow **recommendation floor** for journaling, companion and mental-health products, never as "US law requires".
- **California SB 243** (core duties 2026-01-01) — companion-chatbot operators disclose AI status, give break reminders **at least every three hours** to minors in continuing interaction, block sexually explicit content for minors, publish a self-harm protocol; private right of action at the greater of actual damages or **$1,000 per violation**. It **excludes video-game characters whose dialogue is limited to the game and cannot discuss mental health, self-harm or sexual content** — a design boundary, not a general safe harbour.
- **New York GBL Art. 47** (in force 2025-11-05) defines an "AI companion" by three prongs: retaining prior-session information "to personalize the interaction and facilitate ongoing engagement"; "unprompted or unsolicited emotion-based questions"; sustained dialogue on matters personal to the user. Duties: not-human notice at session start and every three hours, self-harm detection and referral. AG penalties to **$15,000/day**.
- **Texas SB 2420 [corrected]** — statutory date 2026-01-01; enjoined 2025-12-23; Fifth Circuit stay pending appeal 2026-06-04; Supreme Court denied vacatur 2026-07-06; merits argued 2026-08-04, no ruling. Apple's go-live for **new** Texas Apple Accounts was 2026-06-04 — Apple's date, not the law's. A "significant change," expressly including **adding new monetization features**, re-triggers parental consent: a new pass or banner is a consent event for minors' Texas accounts, not a silent update. **The only App Store Accountability Act in force, on a stay that could still be reversed** — Alabama 2027-01-01, Utah 2027-05-06 and Louisiana 2027-07-01 are not binding yet.

## Australia, UK, Japan, China

**Australia.** Since **2024-09-22**, in-game purchases linked to chance force a mandatory minimum **M** classification and simulated gambling (social casino) is restricted to **R 18+**. The Social Media Minimum Age scheme (from 2025-12-10) **explicitly excludes online gaming**.

**UK — enforcement, not self-regulation.** Of the 100 highest-grossing iPhone games, **0% sought parental consent** before under-18 loot-box purchases, **8.6%** gave consistent probability disclosures, **23.5%** disclosed loot boxes in marketing. [Xiao et al., *Royal Society Open Science* | 2025 | UK top-100 grossing iPhone] The teeth: CMA direct consumer-enforcement powers from **2025-04-06** under the DMCC Act (fines to 10% of global turnover, **false urgency** named as a target); Ofcom Protection of Children Codes from **2025-07-25** for services likely accessed by UK children, which includes games with chat or UGC.

**Japan — no gacha statute, and no 2025 gacha rule.** Complete gacha is prohibited as カード合わせ under Item 5 of the 懸賞景品制限告示 under 景品表示法 (CAA guidance 2012-05-18, enforced 2012-07-01), and the ban is **value-independent**. Since **2024-10-01** the amended 景表法 carries a direct criminal fine up to **¥1,000,000** for 優良誤認/有利誤認 without a prior order — an **intent crime**, reaching only Art. 5 nos. 1–2, no reported prosecution: available-but-unexercised. **[corrected]** surcharges are 3% of covered sales with no order below a **computed surcharge** of ¥1.5m — roughly ¥50m of relevant sales, not ¥1.5m of sales. JOGA's ランダム型アイテム提供方式 guideline — **trade-association self-regulation, binding on members by association rule and on no one else; not law, and no regulator enforces it** — was **revised 2024-06-07, effective 2024-06-27**: satisfy one of — expected spend for any rare item ≤100× the per-pull price, ≤¥50,000, displayed upper/lower rate bounds, or per-item rates — plus value floors, **no "blank" gacha**, no rate change without prior notice. Both enforcement precedents turn on display, not rate: KOF '98 UM Online (措置命令 2018-01-26, 3% displayed vs 0.333% actual) and gumi/Square Enix (措置命令 2021-06-28, a 10-pull sold as ten independent draws while drawn from a restricted pre-set combination table). **The exposure sits in the mismatch between mechanic and display — multi-pull tables, pity weighting, pickup rules.**

**China.** 未成年人网络保护条例 (in force 2024-01-01) is what binds: Art. 42 prohibits offering minors products or services that induce addiction and requires an annual public anti-addiction report; Art. 43 mandates a "minors mode" limiting time slots, duration, functions and content with guardian controls; **Art. 44 requires per-transaction and per-day spending limits by age band**; Arts. 46–47 require real-name verification. The 2021 NPPA playtime limit stands: 1 hour, 20:00–21:00, Fri/Sat/Sun and holidays.

## Do not quote

- **A tier as a legal category** — `T1`–`T4` are the plugin's, not any regulator's. "This is T1" is never a compliance statement, and no client-facing sentence should carry a tier label at all.
- **"Japan 2025 gacha law" / the CAA finalizing gacha probability rules in mid-2025** — unsupported by the CAA's 2025 press-release index.
- **"China 2025 random-draw rule"** — the NPPA's 2023-12-22 draft, which would have banned random draws for minors and banned daily-login, first-recharge and consecutive-recharge inducement rewards, was **withdrawn 2024-01-23** with no successor. Clearest regulator-intent signal available; not law.
- **The EU Digital Fairness Act as a compliance obligation** — pre-proposal with **no text**; indicative proposal Q4 2026. A watch item.
- **Louisiana at 2026-07-01, or Utah as "enjoined pending appeal"** — both false: Louisiana re-set to 2027-07-01 (Act 185, 2026-05-15); Utah moved to 2027-05-06, challenge voluntarily dismissed 2026-04-21.
- **Australia's under-16 social-media ban as covering games** — it explicitly excludes online gaming.

Korean entries are in the same section of `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions-korea.md`.
