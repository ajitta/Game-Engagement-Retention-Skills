# Jurisdictions — Korea

Read for a product that ships in Korea whenever a T1/T2 candidate appears; read `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md` as well for a store or rating claim, another market, or an unstated market. Facts only — the tier procedure is in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md`, the per-mechanic specs in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics/<domain>.md`.

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

**Direction is mixed, not uniformly tightening.** Odds disclosure and liability tighten hard; play-time regulation loosens (curfew repealed, adult spend cap abolished, web-board cap under upward review). Any sentence calling Korean game regulation uniformly tightening is wrong.

### 게임산업진흥에 관한 법률

| Provision | In force | Core duty |
|---|---|---|
| §33(2) + 시행령 §19-2 | 2024-03-22 | Per-item odds, 천장 (pity ceiling), bundle components |
| §33-2 소송 특례 | 2025-08-01 | Reversed burden; ≤3× only on found intent |
| §12-3 과몰입 예방조치 | 2025-10-23 | Hourly on-screen play time + warning |
| §31-2 국내대리인 | 2025-10-23 | Korean agent for large foreign operators |
| 컴플리트 가챠 bill 2212569 | **pending in committee** | Not law |

- **§33(2)** — item type and per-item probability in-game, on the website *and* in advertising: 캡슐형/강화형/합성형, pity and ceiling conditions ("100% after N"), rate-up variants, per-component odds of bundles, non-independent trials, limited-quantity/time items. Exempt below ₩100M 3-year average revenue. Ignoring an MCST corrective order → ≤2 years' imprisonment or ₩20M criminal fine (§45(11)). [Kim & Chang | 2024]
- **§33-2 [corrected]** — promulgated 2025-01-31, in force 2025-08-01, applying **only to violations on or after that date**. Five paragraphs: (1) the operator is liable unless it proves absence of **both** intent and negligence; (2) where damage is established but its amount is very hard to prove, the court may fix a reasonable sum from the record — a damages-estimation rule mirroring 민사소송법 §202-2, **not** a document-production or discovery power; (3) on a violation found **intentional** the court **may** award up to **3× the ¶2 amount** — a discretionary cap on the total, not an add-on; (4) six mandatory factors, including intent, scale of harm, economic benefit and remedial effort; (5) basis for a relief centre. No reported case has cited it: the 3× exposure is **untested**. [화우, 김·장 | 2025]
- **The relief centre, not a court, is what a designer meets.** GRAC's 확률형 아이템 피해구제센터 opened in Busan 2026-02-27; 609 consultations and 11 formal relief filings by 2026-05-22. Mediation-led. [GRAC | 2026]
- **Enforcement volume — three windows, three units, never merged.** 2024-03-22→2024-10-08: 1,255 games monitored, 544 violation cases, 65.4% foreign. Full first year: 3,829 cases monitored, 950 violations, 99.3% corrected **[unverified — the source does not state the year boundary]**. Cumulative to 2025-09-22: 2,181 violations across 338 companies, foreign ~70%. Reading 65.4% against ~70% as a trend compares two denominators. [메트로서울, Dealsite | 2025]
- **Compliance is partial**: of Korea's 100 highest-grossing iPhone games, 90 carried paid loot boxes and only **84.4% of those disclosed probabilities**. [Xiao & Park, *Acta Psychologica* | 2025 | KR top-100 grossing iPhone]
- **§12-3** — show elapsed play time plus "과도한 게임이용은 정상적인 일상생활에 지장을 줄 수 있습니다." **every hour for ≥3 seconds**; verify real name and age; under-18s get guardian consent at signup, 게임시간 선택제 (play-time selection) on request, play-time and payment disclosed to the guardian.
- **§31-2** triggers on **any one** of: prior-year **total worldwide** revenue ≥₩1T (not Korea-only, not games-only); ≥1,000 new installs/day averaged on Korean mobile across all stores; ministerial designation. The **youth PC-online spend cap of ₩70,000/month still stands**; the adult ₩500,000 cap went in 2019.

### 전자상거래법 — six dark-pattern types, unlawful since 2025-02-14

KFTC interpretive 소비자보호지침 effective 2025-10-24. **숨은갱신** §13(6): explicit consent inside the 30 days *before* a free→paid conversion or price rise. **순차공개 가격책정**: total price on the first purchase screen. **사전선택**: no pre-checked upsells. **잘못된 계층구조**: no misleading visual hierarchy between accept and decline. **취소·탈퇴 방해**: cancelling as easy as signing up. **반복간섭**: re-asking a settled decision **two or more times** is unlawful unless the prompt offers "do not ask again for ≥7 days" (시행령 §27-2); KFTC's examples include re-asking after a refusal of 광고성 정보 수신. First fines 2025-10-15 (Coupang, Wavve, NHN Bugs, Spotify; ~₩9.5M total, ₩1–5M per-case cap). Whether an in-game "continue with a booster?" prompt is in scope is **untested — medium confidence, likely in scope for apps selling IAP**.

**Odds cases.** Nexon **₩11.642B** (Jan 2024, the largest fine ever under this Act) for cutting Cube option probabilities — including to 0% from 2011 — and Black Cube tier-up odds 1.8% → 1.0% without notice, 2010–2021; the Seoul High Court reopened arguments 2026-09-02, next hearing **2026-10-28**. **[contested]** — Nexon: an omission predating the 2024 duty is not "deception" under §21, and Cube sales *rose 46%* after voluntary disclosure on 2021-03-05; KFTC: concealed rate changes deceived buyers regardless. Webzen **₩158M** (2025-11-28, not appealed): rare-item odds 0% until 51–150 purchases while 0.25–1.16% was displayed. Two **recommendations** survive either outcome — no statute states either in these words, and both are inferred from the fact pattern the KFTC actually charged: **pre-announce every odds change before it takes effect** (a silent nerf is the fact pattern in every KFTC case) and **disclose 0%-until-N floors as conditions**, never averaged away. Present them as the defensible design, not as a duty under 게임산업법 §33(2), which requires disclosure of the odds in force and says nothing about announcing a change in advance.

### 정보통신망법 §50 and the AI Basic Act

**§50 (영리목적의 광고성 정보 전송 제한) — the whole of what the statute covers.** Four duties, and nothing beyond them:

| Provision | Duty | Reach |
|---|---|---|
| §50(1) | **Prior express consent** before sending 영리목적의 광고성 정보 over 전자적 전송매체 | Opt-in, not opt-out. App push, SMS and 카카오톡 비즈메시지 are all 전자적 전송매체 |
| §50(3) | **A second, separate consent** for sends between **21:00 and 08:00** | 전자우편 is carved out by 시행령; app push, SMS and 카톡 are not |
| §50(4) + 시행령 별표 6 | **"(광고)" at the start of the message**, plus sender name, contact, and an opt-out method | Disguised spellings ("광/고", "ad") do not satisfy it |
| §50(8) + 시행령 §62-3 | **Re-confirm consent every two years** from the date consent was given | — |

과태료 to **₩30M** per violation (§76(1)). [정보통신망법 §50 · §76(1) · 시행령 §62-3, 별표 6 | statutory text as at 2026-09 | Korea, all senders of commercial advertising over electronic transmission media | consent, hour-of-day and in-message disclosure duties]

**§50 sets no cap on how many messages may be sent in a day, a week or a month. No provision of the Act or its 시행령 limits advertising-message frequency at all** — the statute regulates *consent, hour of day and disclosure*, never cadence. So **no daily push cap is Korean law**: a cap such as "one push per day" is at most a recommendation — the cadence guidance itself is a per-segment budget, not a flat daily cap — and §50 or any other 정보통신망법 provision is never attached to it. The same holds for any cadence number — there is **no published statutory or research optimum for push frequency**, and a flat daily cap is **[contested]** on the evidence; the cadence guidance and its counter-evidence sit in `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/liveops-cadence.md`. What §50 *does* bite on is the shape of an additional same-day send, not its existence: land it in the night window and it needs the night consent; make its subject a coupon or an expiry and it is advertising and needs the §50(1) consent. The constraint is consent and timing reached twice, not a counted quota. The one Korean frequency-shaped duty is elsewhere and is narrower than it looks — 전자상거래법 **반복간섭** (above) caps *re-asking a decision the user already settled*, not the number of messages sent.

**KISA 7th-edition anti-spam guide (2026-03-04) — regulator interpretation, not statutory text.** It steers enforcement discretion and is the safest read of §50, but it is not itself binding and a court is not bound by it; label it as guidance when citing. It reads: no vague consent wording such as "혜택 알림"; opting out of app-push ads may not require login or multi-step navigation; notices about unilaterally granted coupons, mileage or points — **including issuance and expiry alerts** — need explicit prior consent. That last clause breaks Western retention playbooks: **expiring-reward nudges are treated as regulated advertising in Korea**, and a midnight send needs the night-window consent too, so it needs both. [KISA 불법스팸 방지 안내서 7판 | 2026-03-04 | Korea | regulator interpretive guidance, not statute]

**AI Basic Act (인공지능 발전과 신뢰 기반 조성 등에 관한 기본법) [corrected]** — in force **2026-01-22**; an amendment (법률 제21311호) takes effect **2026-07-21**, so state which text you mean and give its date — quoting both dates in one breath reads as a contradiction. **§31(1) advance notice** — tell users *before* use that the product runs on generative or high-impact AI — is the duty **directly fineable up to ₩30M** (§43(1), with no domestic representative and ignoring a corrective order). **§31(2)–(3) labelling** draws a corrective order first and is fineable only if that order is ignored: do not write "label your AI output or face a ₩30M fine." Machine-readable watermarking alone is insufficient — add at least one text or audio notice; deepfake-type output needs a human-perceptible label. A **guidance period of ≥1 year from 2026-01-22** limits investigations to serious-harm cases. Korea has **no** companion-chatbot statute like CA SB 243. [Cooley, Kim & Chang, MSIT | 2026]

### 개인정보 보호법 (PIPA)

- **§23 + 시행령 §18 — 민감정보 is an enumerated list, not a vibe.** 사상·신념, union/party membership, political opinion, health, sex life, genetic data from testing, criminal records, biometric data generated to identify an individual, race/ethnicity. Processing needs separate explicit consent or a statutory basis.
- **Birth date, time and place are not per se 민감정보 — inference creates it.** A log recording "asked about a health problem", a relationship/sexual question or a 종교/신앙 framing produces 민감정보 the operator never meant to collect; free-text 고민 inputs routinely do. Schema discipline (category, not content) is the mitigation, and that schema rule is **this plugin's recommendation**, not a provision.
- **Under-14 users require legal-guardian consent.** An app that takes a birth date already knows when this applies.
- **§37-2 자동화된 결정, in force 2024-03-15** — where a fully automated system (explicitly including AI) makes a decision with a **significant effect** on the subject's rights or obligations, the subject may refuse it and demand an explanation, and the controller publishes the criteria and procedure. A daily fortune almost certainly does not clear "significant effect"; an automated churn score that changes someone's price does raise it. **A question to ask counsel, not a duty to assume.**

[개인정보 보호법 §23 · 시행령 §18 · §37-2 | statutory text as at 2026-09 | Korea, all controllers | sensitive-category, under-14 consent and automated-decision duties]

## Do not quote

- **Any daily push-frequency cap attributed to Korean law** — 정보통신망법 §50 and its 시행령 contain **no frequency limit of any kind**, and neither does any other Korean instrument. A "1일 1회" cap is at most a recommendation; presenting it as §50, as "정보통신망법 제50조 … 1일 다회 푸시 금지", or as any statute is the single worst error this file can cause. Label it "recommended".
- **"Prevent Game Addiction Act"** (Korea) — does not exist; the name conflates 2013 bills that lapsed in 2016.
- **셧다운제, the forced midnight–06:00 curfew** — **repealed effective 2022-01-01**. Never advise a Korean product to implement it.
- **"GRB" or KMRB as the Korean game regulator** — it is **GRAC (게임물관리위원회)**.
- **Korea's adult ₩500,000/month PC-online spend cap** — abolished 2019-06-27.
- **The complete-gacha ban, bill 2212569** — **pending in committee**: proposed 2025-09-01 by 김병기의원 등 13인, referred 2025-09-02, tabled 2025-11-17, still at 위원회 심사 as of 2026-09-05. Steering collection-completion mechanics toward deterministic paths now is a **recommendation** hedging a bill that may never pass; never state the ban as law, and never state the hedge as compliance.
- **Korea's minors-AI bills** (우리아이 AI 안심 패키지법, introduced 2026-06-23; the 정보통신망법 default-off bills) — pending, not law, though minors-facing streak and 이용유도 mechanics are their stated target.
- **§33-2 as a discovery or document-production power, or as an automatic 3× penalty** — it is neither.
- **"Korean regulation is tightening"** flat — it is mixed: tightening on odds, deregulatory on play-time.
