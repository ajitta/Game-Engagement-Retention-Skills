# Jurisdictions

Read whenever a T1/T2 candidate appears, or when the user has not named a target market. Facts only — the tier procedure is in `ethics-tiers.md`, the per-mechanic specs in `domain-ethics.md`.

**last-verified: 2026-09.** Every line here ends in an unwritten clause — *verify with counsel before shipping*. Design-planning input, not legal advice, and the fastest-rotting content in the set: if today is more than ~6 months past that date, say so before citing it.

## Korea

**Direction is mixed, not uniformly tightening.** Odds disclosure and liability tighten hard; play-time regulation loosens (curfew repealed, adult spend cap abolished, web-board cap under upward review). Any sentence calling Korean game regulation uniformly tightening is wrong.

### 게임산업진흥에 관한 법률

| Provision | In force | Core duty |
|---|---|---|
| §33(2) + 시행령 §19-2 | 2024-03-22 | Per-item odds, 천장, bundle components |
| §33-2 소송 특례 | 2025-08-01 | Reversed burden; ≤3× only on found intent |
| §12-3 과몰입 예방조치 | 2025-10-23 | Hourly on-screen play time + warning |
| §31-2 국내대리인 | 2025-10-23 | Korean agent for large foreign operators |
| 컴플리트 가챠 bill 2212569 | **pending in committee** | Not law |

- **§33(2)** — item type and per-item probability in-game, on the website *and* in advertising: 캡슐형/강화형/합성형, pity and ceiling conditions ("100% after N"), rate-up variants, per-component odds of bundles, non-independent trials, limited-quantity/time items. Exempt below ₩100M 3-year average revenue. Ignoring an MCST corrective order → ≤2 years' imprisonment or ₩20M criminal fine (§45(11)). [Kim & Chang | 2024]
- **§33-2 [corrected]** — promulgated 2025-01-31, in force 2025-08-01, applying **only to violations on or after that date**. Five paragraphs: (1) the operator is liable unless it proves absence of **both** intent and negligence; (2) where damage is established but its amount is very hard to prove, the court may fix a reasonable sum from the record — a damages-estimation rule mirroring 민사소송법 §202-2, **not** a document-production or discovery power; (3) on a violation found **intentional** the court **may** award up to **3× the ¶2 amount** — a discretionary cap on the total, not an add-on; (4) six mandatory factors, including intent, scale of harm, economic benefit and remedial effort; (5) basis for a relief centre. No reported case has cited it: the 3× exposure is **untested**. [화우, 김·장 | 2025]
- **The relief centre, not a court, is what a designer meets.** GRAC's 확률형 아이템 피해구제센터 opened in Busan 2026-02-27; 609 consultations and 11 formal relief filings by 2026-05-22. Mediation-led. [GRAC | 2026]
- **Enforcement volume — three windows, three units, never merged.** 2024-03-22→2024-10-08: 1,255 games monitored, 544 violation cases, 65.4% foreign. Full first year: 3,829 cases monitored, 950 violations, 99.3% corrected **[unverified — the source does not state the year boundary]**. Cumulative to 2025-09-22: 2,181 violations across 338 companies, foreign ~70%. Reading 65.4% against ~70% as a trend compares two denominators. [메트로서울, Dealsite | 2025]
- **Compliance is partial**: of Korea's 100 highest-grossing iPhone games, 90 carried paid loot boxes and only **84.4% of those disclosed probabilities**. [Xiao & Park, *Acta Psychologica* | 2025 | KR top-100 grossing iPhone]
- **§12-3** — show elapsed play time plus "과도한 게임이용은 정상적인 일상생활에 지장을 줄 수 있습니다." **every hour for ≥3 seconds**; verify real name and age; under-18s get guardian consent at signup, 게임시간 선택제 on request, play-time and payment disclosed to the guardian.
- **§31-2** triggers on **any one** of: prior-year **total worldwide** revenue ≥₩1T (not Korea-only, not games-only); ≥1,000 new installs/day averaged on Korean mobile across all stores; ministerial designation. The **youth PC-online spend cap of ₩70,000/month still stands**; the adult ₩500,000 cap went in 2019.

### 전자상거래법 — six dark-pattern types, unlawful since 2025-02-14

KFTC interpretive 소비자보호지침 effective 2025-10-24. **숨은갱신** §13(6): explicit consent inside the 30 days *before* a free→paid conversion or price rise. **순차공개 가격책정**: total price on the first purchase screen. **사전선택**: no pre-checked upsells. **잘못된 계층구조**: no misleading visual hierarchy between accept and decline. **취소·탈퇴 방해**: cancelling as easy as signing up. **반복간섭**: re-asking a settled decision **two or more times** is unlawful unless the prompt offers "do not ask again for ≥7 days" (시행령 §27-2); KFTC's examples include re-asking after a refusal of 광고성 정보 수신. First fines 2025-10-15 (Coupang, Wavve, NHN Bugs, Spotify; ~₩9.5M total, ₩1–5M per-case cap). Whether an in-game "continue with a booster?" prompt is in scope is **untested — medium confidence, likely in scope for apps selling IAP**.

**Odds cases.** Nexon **₩11.642B** (Jan 2024, the largest fine ever under this Act) for cutting Cube option probabilities — including to 0% from 2011 — and Black Cube tier-up odds 1.8% → 1.0% without notice, 2010–2021; the Seoul High Court reopened arguments 2026-09-02, next hearing **2026-10-28**. **[contested]** — Nexon: an omission predating the 2024 duty is not "deception" under §21, and Cube sales *rose 46%* after voluntary disclosure on 2021-03-05; KFTC: concealed rate changes deceived buyers regardless. Webzen **₩158M** (2025-11-28, not appealed): rare-item odds 0% until 51–150 purchases while 0.25–1.16% was displayed. Two rules survive either outcome — **pre-announce every odds change before it takes effect** (silent nerfs are the fact pattern in every KFTC case) and **disclose 0%-until-N floors as conditions**, never averaged away.

### 정보통신망법 §50 and the AI Basic Act

**§50** — separate prior consent for **21:00–08:00** sends, a "(광고)" prefix, consent re-confirmed every two years, 과태료 to **₩30M** per violation. KISA 7th-edition anti-spam guide (2026-03-04): no vague consent wording such as "혜택 알림"; opting out of app-push ads may not require login or multi-step navigation; notices about unilaterally granted coupons, mileage or points — **including issuance and expiry alerts** — need explicit prior consent. That last clause breaks Western retention playbooks: **expiring-reward nudges are regulated advertising in Korea**, and a midnight send needs the night-window consent too, so it needs both.

**AI Basic Act (인공지능 발전과 신뢰 기반 조성 등에 관한 기본법) [corrected]** — in force **2026-01-22**; cite the amended Act, [시행 2026. 7. 21.] 법률 제21311호. **§31(1) advance notice** — tell users *before* use that the product runs on generative or high-impact AI — is the duty **directly fineable up to ₩30M** (§43(1), with no domestic representative and ignoring a corrective order). **§31(2)–(3) labelling** draws a corrective order first and is fineable only if that order is ignored: do not write "label your AI output or face a ₩30M fine." Machine-readable watermarking alone is insufficient — add at least one text or audio notice; deepfake-type output needs a human-perceptible label. A **guidance period of ≥1 year from 2026-01-22** limits investigations to serious-harm cases. Korea has **no** companion-chatbot statute like CA SB 243. [Cooley, Kim & Chang, MSIT | 2026]

## Rating and store layer

**PEGI interactive risk categories** — announced 2026-03-12, applying to games **newly submitted from June 2026**; existing titles are not re-rated unless updated content warrants it.

| Feature | Rating floor | Note |
|---|---|---|
| Daily quests rewarding return | PEGI 7 | "Play-by-appointment" |
| Punishing non-return | PEGI 12 | Losing content, reducing progress |
| Time- or quantity-limited offers | PEGI 12 | Purchases of in-game content |
| Paid random items | PEGI 16 | PEGI 18 in some cases |
| NFT/blockchain, unrestricted comms | PEGI 18 | — |

A login chain that resets accrued value on a missed day costs a European age tier; a limited-time bundle costs another. Aligned with Germany's USK criteria since 2023. **[unverified]** — trade press reports an ESRB spokesperson declining a similar scheme, but no ESRB primary statement was located; treat the rating consequence as Europe-plus-Australia.

**Store rules bind everywhere by contract.** Apple Review Guideline 3.1.1 (Dec 2017): loot-box odds disclosed **prior to purchase**. Google Play (May 2019) is stricter in wording — "in advance of, **and in close and timely proximity to**, that purchase." Google Play Better Ads Experiences (2022-09-30) bans unexpected full-screen interstitials at level or content-segment start, before the splash screen, or after the user chose another action.

## European Union

- **DSA Art. 28(1) minors guidelines** (2025-07-14) name mechanics directly: default-off "streaks," ephemeral content, read receipts, autoplay and push notifications; removal of "persuasive design features aimed predominantly at engagement"; no exploitation of children's low commercial literacy, naming virtual currencies and loot boxes. Following them "is voluntary and does not automatically guarantee compliance," yet the Commission uses them to assess Art. 28(1) compliance. Scope: **all online platforms accessible to minors**, not only VLOPs.
- **CPC virtual-currency principles** (2025-03-21, non-binding) — purchases expressed in real-world money; bundle denominations must not force buying unused currency; withdrawal rights respected. The coordinated action against Star Stable alleges direct exhortation to children and time-limited-offer pressure. **[contested]** — Video Games Europe and EGDF call the principles misinterpretations of EU consumer law; no public outcome as of 2026-09-05.
- **TikTok preliminary findings** (2026-02-06) — a regulator's harm model for variable reward, not a rule: constantly "rewarding" users with new content may "lead to compulsive behaviour and reduce users' self-control." **[contested]** — preliminary and non-prejudging; TikTok called them "categorically false."

## Brazil — the strictest instrument in force anywhere

**Lei 15.211/2025 (ECA Digital), in force 2026-03-17, Art. 20** prohibits loot boxes in games directed at children and adolescents **"ou de acesso provável por eles"**, per the classificação indicativa. It reaches any paid feature granting random consumable items or advantages without prior knowledge of content. A **ban, not a disclosure duty**, triggered by rating plus an "access likely" test broader than "targeted at." Sanctions to **10% of the economic group's Brazilian revenue, capped R$50m per infraction**; a Brazilian legal representative is mandatory.

## United States — orders, not statutes, define the standard

- **FTC v. Cognosphere/HoYoverse** (order 2025-01-17, $20M) is the de facto US gacha spec: no loot-box purchase by under-16s without a parent's affirmative express consent; no sale of loot boxes for virtual currency **unless they can also be bought directly with real money**; odds and multi-tier currency exchange rates disclosed; under-13 data deleted. The complaint targeted currency denominations forcing repeated re-exchange, and promotions implying better five-star odds than actual.
- **FTC v. Epic** — $245M total ($72M to 629,344 consumers Dec 2024; $126M to 969,173 June 2025) for "counterintuitive, inconsistent and confusing button configuration," children's charges without parental consent, and lockouts of users who disputed charges. Purchase confirmation is an FTC-tested requirement, not friction to optimise away.
- **FTC 6(b) companion-chatbot inquiry** — orders 2025-09-11 to seven firms on how they "monetize user engagement." **No report published**; cite no findings.
- **California SB 243** (core duties 2026-01-01) — companion-chatbot operators disclose AI status, give break reminders **at least every three hours** to minors in continuing interaction, block sexually explicit content for minors, publish a self-harm protocol; private right of action at the greater of actual damages or **$1,000 per violation**. It **excludes video-game characters whose dialogue is limited to the game and cannot discuss mental health, self-harm or sexual content** — a design boundary, not a general safe harbour.
- **New York GBL Art. 47** (in force 2025-11-05) defines an "AI companion" by three prongs: retaining prior-session information "to personalize the interaction and facilitate ongoing engagement"; "unprompted or unsolicited emotion-based questions"; sustained dialogue on matters personal to the user. Duties: not-human notice at session start and every three hours, self-harm detection and referral. AG penalties to **$15,000/day**.
- **Texas SB 2420 [corrected]** — statutory date 2026-01-01; enjoined 2025-12-23; Fifth Circuit stay pending appeal 2026-06-04; Supreme Court denied vacatur 2026-07-06; merits argued 2026-08-04, no ruling. Apple's go-live for **new** Texas Apple Accounts was 2026-06-04 — Apple's date, not the law's. A "significant change," expressly including **adding new monetization features**, re-triggers parental consent: a new pass or banner is a consent event for minors' Texas accounts, not a silent update. **The only App Store Accountability Act in force, on a stay that could still be reversed** — Alabama 2027-01-01, Utah 2027-05-06 and Louisiana 2027-07-01 are not binding yet.

## Australia, UK, Japan, China

**Australia.** Since **2024-09-22**, in-game purchases linked to chance force a mandatory minimum **M** classification and simulated gambling (social casino) is restricted to **R 18+**. The Social Media Minimum Age scheme (from 2025-12-10) **explicitly excludes online gaming**.

**UK — enforcement, not self-regulation.** Of the 100 highest-grossing iPhone games, **0% sought parental consent** before under-18 loot-box purchases, **8.6%** gave consistent probability disclosures, **23.5%** disclosed loot boxes in marketing. [Xiao et al., *Royal Society Open Science* | 2025 | UK top-100 grossing iPhone] The teeth: CMA direct consumer-enforcement powers from **2025-04-06** under the DMCC Act (fines to 10% of global turnover, **false urgency** named as a target); Ofcom Protection of Children Codes from **2025-07-25** for services likely accessed by UK children, which includes games with chat or UGC.

**Japan — no gacha statute, and no 2025 gacha rule.** Complete gacha is prohibited as カード合わせ under Item 5 of the 懸賞景品制限告示 under 景品表示法 (CAA guidance 2012-05-18, enforced 2012-07-01), and the ban is **value-independent**. Since **2024-10-01** the amended 景表法 carries a direct criminal fine up to **¥1,000,000** for 優良誤認/有利誤認 without a prior order — an **intent crime**, reaching only Art. 5 nos. 1–2, no reported prosecution: available-but-unexercised. **[corrected]** surcharges are 3% of covered sales with no order below a **computed surcharge** of ¥1.5m — roughly ¥50m of relevant sales, not ¥1.5m of sales. JOGA's ランダム型アイテム提供方式 guideline was **revised 2024-06-07, effective 2024-06-27**: satisfy one of — expected spend for any rare item ≤100× the per-pull price, ≤¥50,000, displayed upper/lower rate bounds, or per-item rates — plus value floors, **no "blank" gacha**, no rate change without prior notice. Both enforcement precedents turn on display, not rate: KOF '98 UM Online (措置命令 2018-01-26, 3% displayed vs 0.333% actual) and gumi/Square Enix (措置命令 2021-06-28, a 10-pull sold as ten independent draws while drawn from a restricted pre-set combination table). **The exposure sits in the mismatch between mechanic and display — multi-pull tables, pity weighting, pickup rules.**

**China.** 未成年人网络保护条例 (in force 2024-01-01) is what binds: Art. 42 prohibits offering minors products or services that induce addiction and requires an annual public anti-addiction report; Art. 43 mandates a "minors mode" limiting time slots, duration, functions and content with guardian controls; **Art. 44 requires per-transaction and per-day spending limits by age band**; Arts. 46–47 require real-name verification. The 2021 NPPA playtime limit stands: 1 hour, 20:00–21:00, Fri/Sat/Sun and holidays.

## Do not quote

- **"Prevent Game Addiction Act"** (Korea) — does not exist; the name conflates 2013 bills that lapsed in 2016.
- **셧다운제, the forced midnight–06:00 curfew** — **repealed effective 2022-01-01**. Never advise a Korean product to implement it.
- **"GRB" or KMRB as the Korean game regulator** — it is **GRAC (게임물관리위원회)**.
- **Korea's adult ₩500,000/month PC-online spend cap** — abolished 2019-06-27.
- **The complete-gacha ban, bill 2212569** — **pending in committee**: proposed 2025-09-01 by 김병기의원 등 13인, referred 2025-09-02, tabled 2025-11-17, still at 위원회 심사 as of 2026-09-05. Steer collection-completion mechanics toward deterministic paths now; never state the ban as law.
- **Korea's minors-AI bills** (우리아이 AI 안심 패키지법, introduced 2026-06-23; the 정보통신망법 default-off bills) — pending, not law, though minors-facing streak and 이용유도 mechanics are their stated target.
- **§33-2 as a discovery or document-production power, or as an automatic 3× penalty** — it is neither.
- **"Japan 2025 gacha law" / the CAA finalizing gacha probability rules in mid-2025** — unsupported by the CAA's 2025 press-release index.
- **"China 2025 random-draw rule"** — the NPPA's 2023-12-22 draft, which would have banned random draws for minors and banned daily-login, first-recharge and consecutive-recharge inducement rewards, was **withdrawn 2024-01-23** with no successor. Clearest regulator-intent signal available; not law.
- **The EU Digital Fairness Act as a compliance obligation** — pre-proposal with **no text**; indicative proposal Q4 2026. A watch item.
- **Louisiana at 2026-07-01, or Utah as "enjoined pending appeal"** — both false: Louisiana re-set to 2027-07-01 (Act 185, 2026-05-15); Utah moved to 2027-05-06, challenge voluntarily dismissed 2026-04-21.
- **Australia's under-16 social-media ban as covering games** — it explicitly excludes online gaming.
- **"Korean regulation is tightening"** flat — it is mixed: tightening on odds, deregulatory on play-time.
