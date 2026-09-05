---
status: draft
revised: 2026-09-06
---

# Korean Market, Products and Compliance

Korea is the plugin author's home market and the one the three skills say nothing about: a case-insensitive grep across all seven skill files returns zero Korean regulatory content, only the three "Korean input → Korean output" language instructions **[corrected]**. That absence is expensive, because Korea is the one large market where several of the skills' *ethical preferences* — disclosed odds, pity transparency, honest cancellation flows, quiet notification hours — are statutory duties with treble-damages or administrative-fine exposure, and where the local product grammar (midnight fortune rollover, 기다리면 무료 tickets, 출석 보상) differs from the Western defaults the skills assume. This document supplies the market numbers with their populations, the genre and product mechanics, the compliance calendar with exact in-force dates, and the Korean vocabulary the skill descriptions need in order to fire at all.

---

## 1. Market state: a contracting category with a lengthening core

### 1.1 The headline survey, with its denominators

The single most important Korean dataset for these skills is 문화체육관광부·한국콘텐츠진흥원's **2025 게임이용자 실태조사** (report published 2025-12-18; press release registered 2025-12-22; nationally-framed sample of n=10,000 aged 10–69 with a player/non-player screen; fieldwork 14 Jul – 29 Aug 2025 **[secondary sources only — the fieldwork dates are not in KOCCA's own press release]**) (KOCCA, 2025, https://www.kocca.kr/kocca/koccanews/reportview.do?menuNo=204767&nttNo=1073).

- **Past-year game usage rate: 50.2%**, down 9.7pp from 59.9% in 2024; series 2022 74.4% → 2023 62.9% → 2024 59.9% → 2025 50.2%; five-year CAGR −6.8%; lowest since the series began in 2015 (74.5%).
- **Platform mix, among game users**: mobile 89.1% (−2.6pp from 91.7%), PC 58.1% (**+4.3pp** from 53.8%), console 28.6% (+1.9pp from 26.7%), arcade 10.4%.
- **[corrected]** Do not repeat the widely-circulated "PC −2.9pp / console +4.5pp" deltas. The GG Vol.28 review computed 2025 against the **2023** base (PC 61.0%, console 24.1%), not 2024 (GG, 2026, https://www.gamegeneration.or.kr/article/045a8130-7f48-467e-8fdf-3d9c7f8aff47). KOCCA's own deltas stand. This is the origin of the platform-delta confusion in earlier notes.
- **Daily play minutes, among users of each platform**: PC 117.9 weekday / 193.4 weekend (a five-year high); mobile 90.9 / 116.4 (down YoY); console 53.4 / 103.8. All-platform 165 weekday (from 171) / 252 weekend (from 253).
- **Why lapsed players left** — base is the 3,828 respondents who used to play and no longer do, multiple response: time shortage 44.0%, reduced interest in games 36.0%, found a substitute leisure 34.9%, lack of motivation 33.1%.
- **The substitute** — base is the 1,331 who named one: video/OTT/TV/film/anime **86.3%**. This is *not* 86.3% of all non-players; quoting it that way is the most common misreading.
- **Spending**: 37.8% bought a new in-game item in the year; annual spend per person PC ₩186k, mobile ₩89k, console ₩323k. The 37.8% figure comes from the GG review rather than the press release **[secondary]**.
- **In-game cyber-violence victimisation 46.4%** (56.2% 2023 → 54.4% 2024 → 46.4% 2025); 57.3% took no action, 28.7% reported to the company. Harassment is falling and is *not* named as a churn cause in the Korean national survey.

Market size for context: Korean game industry revenue **₩23조8,515억 in 2024, +3.9%** — mobile ₩14조710억 (59.0%, +3.4%), PC ₩6조94억 (25.2%), console ₩1조1,836억 (5.0%, +4.8%), arcade ₩2,759억 (−3.2%); exports $8.503B; 7.2% of the world market, 4th (KOCCA 2025 게임백서 via ZDNet Korea, 2026, https://zdnet.co.kr/view?no=20260325142500). Mobile IAP was roughly flat at ~$5.3B in 2025 with Google Play ~75% (Sensor Tower, 2025, https://sensortower.com/ko/blog/state-of-gaming-in-korea-2025-report-KR); H1 2025 downloads fell 245M → 222M and H2 2025 downloads ~210M, −21% YoY **[secondary]** (Sensor Tower, 2025, https://sensortower.com/ko/blog/1H2025-mobile-games-recap-in-Korea). Q3 2025 Korean mobile-game revenue hit a five-year high of ~$1.4B, 14.7% of APAC (Airbridge/Sensor Tower, 2026, https://www.airbridge.io/ko/blog/apac-gaming-app-trend-2026).

### 1.2 The counterintuitive session-length implication

Read naively, "Korean mobile players average 90.9 minutes a day on weekdays" says *design long sessions*. That inference is wrong three times over, and the skills should carry the corrected chain:

1. **The 90.9 minutes is a survivor statistic.** It is measured among people still playing, in a population where participation fell 9.7pp in one year. The number is high partly because the casual half of the market has already left; PC's 117.9-minute weekday high is described in Korean commentary as *core consolidation*, not growth.
2. **The stated reason for leaving is time**, not difficulty, price or content (44.0%), and the thing that took the time is short-form and OTT video (86.3% of those naming a substitute). A product that answers a time-scarcity churn cause with a longer daily obligation is arguing with the data.
3. **Dwell is not engagement in Korea.** Roughly 30% of Korean players use auto-play **[secondary]**, so a large share of those minutes is unattended. Korean AI character-chat apps show the extreme version: ~40 hours per user per month in a single-app category led by 제타, "retention and dwell already at mega-app level" (Mobile Index/IGAWorks, 2026, https://insight-report.mobileindex.com/post/2026-h1-mobileapp-top100).

So the correct Korean posture is a **split target**: keep the deep, long-session core loop that the remaining 50.2% actually want (that is what 마비노기 모바일 and 리니지 classic servers monetised), while making *entry and return* cheap in minutes — resumable sessions, no multi-hour catch-up debt, no punishment for a missed day. The nearest documented precedent is NetEase's 畅玩服 for 몽환서유 PC, which removed the time-based fee and simplified systems and "recalled large numbers of lapsed users," pushing peak concurrency to a record 3.58M (NetEase Q3 2025 via 每日经济新闻, 2025, https://www.nbd.com.cn/articles/2025-11-21/4152168.html). Friction removal, not reward inflation.

### 1.3 The instrumentation gap

**No Korean D1/D7/D30 install-cohort benchmark is published by anyone.** KOCCA measures usage rate and daily minutes; Mobile Index publishes MAU, installs and usage time with 이탈률 gated; Airbridge's own Korea benchmark (H2 2025, 1,000+ brands, 330+ channels) covers UA channels, deeplink opens and seasonality and explicitly contains no D1/D7/D30 or LTV. Korean IR decks disclose paying-user deltas (Krafton: BGMI paying users +17% YoY in Q1 2026) but never DAU/MAU/retention. The honest sentence for the skills is: *Korean cohort retention is not published; use Adjust's Japan/APAC medians as a stated proxy and build an internal baseline.* Japan's measured game medians for Jan–May 2026 are **D1 26% / D7 11% / D30 4%**, up from 24/9/3 a year earlier, on Adjust's top-5,000-app install-cohort basis (Adjust × Sensor Tower, 2026, https://sensortower.com/ja/blog/adjust-sensor-tower-2026). Never mix those with Japanese practitioner rules of thumb (D1 50 / D7 30 / D30 10), which use a registered- or tutorial-complete denominator and are roughly 2× higher for that reason alone (gamemarketinglab, https://gamemarketinglab.com/dau_retention_rate).

Scale calibration for Korean DAU/MAU targets: top Korean mobile games run **2.2–2.6M MAU** (Roblox 2.26M, Block Blast 2.24M, Brawl Stars 1.82M, May 2026), against YouTube 48.1M and KakaoTalk 46.4M app-wide (Mobile Index, 2026, https://bbs.ruliweb.com/amp/news/read/226803). Chinese and US MAU anchors will mislead a Korean team badly.

**Skill implication.** Add a Korea block to the benchmark reference that (a) states the 50.2% contraction with its population and year, (b) carries the corrected platform deltas and the 2023-base trap, (c) states the denominator for every non-player figure, (d) says plainly that no Korean retention triple exists and names Adjust Japan as the proxy, and (e) replaces "longer sessions" advice with the split target: deep core loop, cheap entry and return. Delete any Korean session guidance derived from hyper-casual cadences.

---

## 2. Genre dynamics: what Korean players reward and what they punish

### 2.1 "MMORPG fatigue" is the wrong frame **[contested]**

The fatigue narrative has real support: RPG fell below 50% of Korean mobile revenue in May 2024, and MMORPG's share *of RPG revenue* fell from 78.8% (2020) to 56.2% (2024) while idle RPG rose 1.7% → 16% (Sensor Tower, 2025, https://sensortower.com/ko/blog/state-of-gaming-in-korea-2025-report-KR). KOCCA's FGI participants in their 20s–30s named repetitive paywalls and "can't get stronger without paying" as reasons to stop (KOCCA via 인디게임닷컴, 2025, https://indiegame.com/archives/18842).

The other side is equally documented: 리니지M was Korea's #1 grossing title in 1H2025, MMORPG still held **30% of Korean mobile IAP** in Jan–Sep 2025 (RPG 48%, midcore 79% of revenue), and 디일렉's year-end review concludes the competition-driven 리니지라이크 market "remains intact" and now coexists with content-driven MMOs rather than being replaced.

The accurate framing is a **BM shift, not a genre shift**: from competition-purchase business models to content-consumption ones. 1H2025 put three new Korean titles (세븐나이츠 리버스, 마비노기 모바일, RF 온라인 넥스트) in the top-6 grossing chart within 1.5–3 months of launch, the first time since 2014 (Sensor Tower, 2025, https://sensortower.com/ko/blog/1H2025-mobile-games-recap-in-Korea). Growth subgenres for 2025: turn-based RPG +138%, merge +89%, hybrid-casual +37%, 4X strategy +25% YoY; anime-style mobile revenue ~$1.4B for Oct 2024–Sep 2025, quoted as "+41% vs 2022" by Sensor Tower and "+40% YoY" elsewhere — **quote the base cautiously**.

Two imported 4X titles now sit beside domestic MMORPGs at the top of the Korean chart (July 2025 Mobile Index revenue: 리니지M ₩40.6B, Whiteout Survival ₩31.2B, Last War ₩29.3B, Odin ₩22.1B, 세븐나이츠 리버스 ₩21.6B). Korea is Last War's #2 market at 18–23% of lifetime revenue with the world's highest RPD at $53 — **but** Last War's US iOS retention (D1/D7/D30 34/11/4) is *worse* than Whiteout Survival's (42/17/8) despite an equivalent alliance-obligation loop (Naavik/Sensor Tower, 2025, https://naavik.co/digest/how-last-war-is-winning-the-4x-game). Alliance pressure is an observed *spending* mechanism with an unmeasured retention effect; the skills must not present it as a retention driver.

### 2.2 Pity, disclosure culture, and what players read as a promise

Korean players read published odds and published BM limits as contracts, and they audit them on day one.

- **아이온2 (2025-11-19)**: after the PD publicly promised that combat-power items (영혼석, 전투 강화 주문서) would never be cash-purchasable, a day-one package (트리니엘의 큐나 보급 상자) containing them triggered backlash within hours. NCSOFT ran an emergency livestream the same day, pulled four packages, compensated every player (100 scrolls, 50 soul stones), halved consumable prices and doubled quest rewards (뉴시스, 2025, https://www.newsis.com/view/NISX20251119_0003409273).
- **The counter-signal matters**: the title still reached 1.5M+ DAU, ~₩25B in week one and ₩100B in 46 days on a 월정액 + 시즌패스 core, then drove NCSOFT's highest PC quarter since 2017 (₩168.2B in Q4 2025) before management described traffic as "declining along the expected decay curve" and scheduled a **six-month anniversary event plus Season 4 to bring back 복귀 유저** (NCSOFT Q1 2026 call via FETV, 2026, https://www.fetv.co.kr/news/articleView.html?idxno=302274). So the rule is about trust and retention tail-risk, not a measurable short-term ARPU penalty — say that honestly rather than overclaiming.
- **Acceptable Korean monetisation in 2025–26** clusters in subscription (월정액 revived after seven years), 시즌패스, cosmetics and convenience. A third-party transcription of NCSOFT's May 2026 call puts 아이온2's mix at roughly membership 25% / skins 25% / currency 50% **[unverified — the concall transcript could not be opened]**.
- **Pay-to-avoid-frustration is tolerated; pay-to-be-stronger is policed.** That is the practical line, and it maps onto the legal line in §5: any stat-bearing paid random item drags the whole 확률형 아이템 disclosure and liability regime with it.

**Pity systems are a disclosure object in Korea, not a courtesy.** 천장/ceiling conditions, rate-up variations, per-component odds of bundles, non-independent trials and complete-gacha structures are all mandatory disclosures under 게임산업법 §33(2) and its Enforcement Decree (see §5.1). The design consequence is pleasant: the compliant UI — a visible ceiling counter and an exact rate-up percentage inside the pull screen — is *also* the better anticipation mechanic. Range-only odds ("0.5–1.5%") and "확률 UP" without a number are named violation types in GRAC's 2025-12 violation casebook **[the casebook itself was not located; types are known through 생활법령정보 and IT조선 excerpts]**.

**Skill implication.** In the genre/benchmark reference: replace "MMORPG fatigue" with "BM shift — competition-purchase to content-consumption," and list turn-based RPG, merge, 4X, hybrid-casual and subculture as Korean growth formats while keeping MMORPG at 30% of revenue. In the reward-moment skill: make the Korean gacha reveal spec = visible ceiling counter + exact rate-up number + bundle component odds, framed as anticipation design that happens to be the legal floor. In the ethics module: add the Korean "declared BM limit is a contract" rule with 아이온2 as the case, and state the counter-evidence (revenue was unharmed) so the claim is not oversold. Reframe alliance-obligation loops as spending pressure with unmeasured retention effect (Naavik).

---

## 3. 사주 / 운세 / 타로 apps

### 3.1 The landscape: two monetisation archetypes, one seasonal spike

| App | Model | Feb 2025 MAU | Share |
|---|---|---|---|
| 점신 | Free, ads + 부적 | 950,000 | 46.5% |
| 포스텔러 | Prepaid 포스 credits | 570,000 | 28.0% |
| 운세비결 | — | 160,000 | 7.6% |
| 헬로우봇 | Chat bots + 구독 | 90,000 | 4.6% |

(Mobile Index via 톱스타뉴스, 2025, https://www.topstarnews.net/news/articleView.html?idxno=15623421 — top three exceed 80% of category MAU.)

The two archetypes need different advice throughout:

- **점신** — no signup, zero friction, 17M cumulative downloads, 2023 revenue ~₩5.0B (2024 est. ₩6.0B), monetised by ad impressions plus 부적 (talisman) sales. Its retention question is *daily return frequency*, and its risk surface is ad load and push-consent law.
- **포스텔러 (운칠기삼)** — prepaid wallet, ₩3,000–20,000 per reading, credit packs from 200포스/₩3,300 to 7,200포스/₩97,000, 2023 revenue ~₩9.9B, ~9M cumulative members. Its retention question is *wallet top-up and repurchase*, and its risk surface is the KFTC subscription/dark-pattern rules.

Self-reported 포스텔러 engagement (DBR/인터비즈 interview with CEO 심경진, 2024, https://m.blog.naver.com/businessinsight/223327604618, plus 중앙일보 비크닉, 2025, https://www.joongang.co.kr/article/25329791): ~1.4M MAU on ~7.5M members (Jan 2024) rising to 1.42M MAU (+35% YoY) in Jan 2025; 75% female; 83% aged 10s–30s; **average use ~6 times per week**; ~200,000 paid readings per month; 50–60% of payers repurchase within three months; "~40% of the 2019 signup cohort still active" **[self-reported, no stated retention definition — do not use as a benchmark]**.

**Seasonality is the defining shape.** December–February 신년 특수 runs ~20% above baseline and January is the annual MAU high. January 2026 fell YoY for the first time in three years: 점신 1,130,577 → 875,499, 포스텔러 678,052 → 657,272 (Mobile Index via 헤럴드경제, 2026, https://v.daum.net/v/20260210214150495). **[contested]** The press attributes the drop to ChatGPT "사주 GPTs" (top three at 3M/2M/0.9M cumulative users); against that, January 2025 was itself an anomalous three-year peak coinciding with national anxiety events, so part of the fall is regression to the mean, and no user-level substitution data exists. State both readings.

### 3.2 The daily ritual, and where the reward moment actually is

- **Midnight, not morning.** 포스텔러 reports traffic peaking at midnight as users check *tomorrow's* fortune before bed. The Korean daily-reveal appointment is **23:30–00:30 KST**, not a Western-style morning horoscope. Streaks, push and reveal animations should be built around the rollover.
- **The notification copy is the product.** Co-Star's entire product is one daily push based on the day's chart; its deliberately blunt tone is simultaneously the viral growth engine and its most-cited harm complaint, with recent reviews attacking a ~$8.99/month Pro-Star paywall on previously-free basics (Apple App Store listing, 2026, https://apps.apple.com/us/app/co-star-personalized-astrology/id1264782561). **[contested]** There is no controlled evidence that a gentler tone retains better — only that it generates fewer complaints. Recommend an A/B-tested tone with a user-selectable gentle mode rather than asserting bluntness is wrong.
- **Character-voiced push** is the Korean variant: 헬로우봇 (띵스플로우) claims a 10% push-notification conversion against a 1.5% industry average using friend-like conversational copy from its bots (라마마 tarot, 판밍밍 saju) **[self-reported, ~2020 fundraising deck]** (띵스플로우, 2020, https://cdn-upload.miniintern.com/12426/3ee8b1d8-f269-4533-bd9a-4b2063dac78b/thingsflow%EC%86%8C%EA%B0%9C_%EC%98%A4%ED%94%88%EB%86%80.pdf). Counter-evidence: by Feb 2025 헬로우봇 held only 4.6% of category MAU, so the claimed notification advantage did not become share.

**Why people use these apps** (롯데멤버스 라임 survey via 중앙일보, 2025, https://www.joongang.co.kr/article/25329791, multiple response): fun 30.1%, New-Year curiosity 30.0%, psychological comfort 23.6%, answers to worries 22.9%, predicting the future 21.0%. A separate survey reported by 대전일보/연합 gives curiosity 42.7%, comfort about an uncertain future 22.9%, stress relief 13.2%. Roughly a quarter arrive in distress. Operators describe the core value as "telling my story without being judged," in contrast to SNS comparison stress, and 신한카드 filed 사주/타로 under its 2025 "셀프 디깅" self-analysis trend.

### 3.3 Domain-specific design constraints

These are 명리학 practice conventions, not research findings, and carry no citation — but they are the constraints that break a naively-built Korean fortune product. Verify each with a domain consultant before shipping.

- **일진 day boundary.** The traditional day pillar changes at 자시, i.e. 23:00, not at 00:00. Schools disagree (야자시/조자시 handling), so this is **[contested] within the tradition**. Whatever the product picks, it must be one rule applied consistently across the reading engine, the push scheduler and the streak counter — a product whose "today" starts at midnight but whose engine's day starts at 23:00 will hand a user two different fortunes for the same evening, which reads as a bug and destroys trust in a trust-dependent product.
- **절기, not the calendar year.** The month pillar turns on the 24 solar terms, and the 사주 year turns at **입춘 (≈4 February)** — not 1 January and not 설날. This is directly load-bearing for the 신년운세 cycle: marketing peaks in late December and January, while the engine's year changes in early February. Decide explicitly which boundary the copy means, and never let a "2027년 신년운세" product silently compute against the wrong year pillar for users born in January.
- **Missing 시주.** A large share of Korean users do not know their birth time. The hour pillar is one of the four, so a "모름" path is mandatory, not an edge case: the product must (a) degrade gracefully to three-pillar readings, (b) say which conclusions are unavailable rather than fabricating them, and (c) never make the time field a hard gate on the paywall — charging for a reading the engine cannot compute is a consumer-protection problem as well as a design one.
- **Time-base corrections.** A correct 만세력 needs solar/lunar conversion plus historical Korean time bases: Korea's standard meridian is 135°E while Seoul sits near 127°E (~30 minutes of 진태양시 correction, applied by some schools and not others), Korea ran on UTC+8:30 for part of the 1950s, and observed daylight saving in several years including 1948–1951, 1955–1960 and 1987–1988. Birth-time inputs near a boundary will silently produce the wrong hour pillar without these tables. Treat the ephemeris as a versioned asset, and log which version produced each stored reading.
- **Birth data is a retention asset and a liability.** Birth date, exact time and place are collected on first run and never change, which is why these apps have unusually low re-onboarding cost — and why a breach is unrecoverable. Under 개인정보 보호법 §23 and 시행령 §18, "민감정보" means 사상·신념, union/party membership, political opinion, health, sex life, genetic data, criminal records and biometric identification data (국가법령정보센터, https://www.law.go.kr/lsEfInfoP.do?lsiSeq=195062; 찾기쉬운 생활법령정보, https://www.easylaw.go.kr/CSP/CnpClsMainBtr.laf?popMenu=ov&csmSeq=1257&ccfNo=2&cciNo=3&cnpClsNo=1). Birth date and time are *not* per se 민감정보 — but a reading log that records "asked about a health problem," "asked whether to leave my partner," or a 종교/신앙 framing can create 민감정보 by inference, and free-text worry inputs routinely do. Design the log schema so the sensitive part is not stored: keep the question category, drop the free text, as the Mirror Journal trial did — entries deleted immediately after automated risk classification, retaining only mood, risk flags, timestamps and word counts **[preprint]** (medRxiv, 2026, https://www.medrxiv.org/content/10.64898/2026.04.04.26349881.full).
- **Under-14 users.** PIPA requires legal-guardian consent for processing the personal data of children under 14. A fortune app that takes a birth date already knows when this applies; there is no excuse for not gating it.

### 3.4 The ethics line for this domain

About a quarter of users arrive for anxiety relief. Therefore: no manufactured fear ("오늘 운이 나쁩니다 — 부적을 사지 않으면"), no urgency framing on 부적/consultation upsells, no dependency loop aimed at users in distress, and no positioning of readings as prediction rather than reflection or entertainment. The legitimate growth lever is **shareability** — MBTI-style self-labelling, which a Korean psychologist quoted by 중앙일보 attributes to self-fulfilling-prophecy effects plus positive peer feedback — not fear. If the reading is LLM-generated, the AI Basic Act's advance-notice duty applies (§5.5).

**Skill implication.** Give the advisor skill a fortune/saju domain block that branches on archetype (ad-funded zero-friction vs prepaid-credit), sets the daily reward moment at the 23:30–00:30 KST rollover, plans D30/D90 around **post-January resurrection** (birthday, 삼재, 절기, monthly fortune) because the New-Year cohort is the largest and churns hardest, and hard-codes the five domain constraints above as a pre-ship checklist (day boundary, 절기 year, 모름 path, ephemeris version, log schema). Ethics: fear-free copy, gentle-mode toggle, and no public D1/D7/D30 exists for any Korean fortune app — the skill must refuse to invent one.

---

## 4. 기다리면 무료: the mechanic, the numbers, and the ethics it actually deserves

### 4.1 How it works, precisely

기다리면 무료 was introduced by 카카오페이지 in 2014 by copying 애니팡's heart timer (one heart per 8 minutes, full at 40 minutes) into a reading platform. The mechanism is **per-user, per-title**: when a reader's free tickets run out, one ticket auto-refills after a fixed period set by the title (1 day, 3 days, …), so the wait and the free window are personalised rather than global. The company's own framing is that it **sells the time you don't wait**, not the content (DBR via 인터비즈, 2019, https://m.blog.naver.com/businessinsight/221625936585).

Historical, clearly-dated effect from that case: purchase conversion on some titles reached 25%, daily GMV doubled from ~₩30M to an average ~₩68M in the first month, and 카카오페이지 posted its first monthly operating profit (₩100M) in Dec 2014; ~4,000 titles carried the model by 2019. **Do not present these as current figures.**

| Platform | Grant | Expiry | Notable |
|---|---|---|---|
| Kakao 기다무 | 1 ticket / title timer | per title | Per-user, per-title |
| Kakao 기다무 플러스 | 5 at 00:00, 5 at 12:00 | 12 h | Completed works |
| Naver Series 매열무 | 1 ticket at 22:00 | 24 h | 22:00 push, 3-day read |
| Piccoma 待てば¥0 | 1 per **23 h** | — | Timer drifts earlier |
| Piccoma ゼロ円プラス | up to 11/day | daily | Sits above the timer |

(Naver Series mechanics from a publisher user guide, 2021, https://m.blog.naver.com/breatheco/222206168179 — **the programme was partially revised in May 2023 and Naver's own help page could not be located, so treat the details as dated**. Kakao 기다무 플러스 launched 2021-01-29 with 60 titles, tickets do not accumulate. Piccoma from the first-party company page, 2026, https://career.kakaopiccoma.kr/ko/home.)

Three mechanics inside that table are worth stealing or avoiding deliberately:

1. **The 23-hour refill is the best-designed detail in the category.** A 24-hour timer forces the user to be *later* every day until the appointment falls outside their waking hours and the habit dies. A 23-hour timer drifts the free episode *earlier* each day, so the daily appointment stays reachable. Any energy or ticket system with a daily cadence should use a sub-24-hour period for this reason.
2. **Fixed clock + expiry + same-time push** is the Korean standard, and it is a different animal from a Western "daily pass." A fixed 22:00 or 00:00/12:00 grant creates a shared social moment; expiry adds loss aversion; a day-1 welcome bundle front-loads the hook.
3. **Piccoma proves the model at national scale but not the economics.** It was Japan's #1 non-game app by revenue in 2023 and 2024 and #1 across all apps including games in 2025, 50M+ cumulative downloads, 190K+ titles, first to ¥100B annual GMV in 2023. **But Japan RPD is $18.58 against Korea's $1.69 — an 11× gap.** Piccoma's monetisation numbers do not transplant to Korea or the West.

### 4.2 What changed by 2025–26

The model is now a **wait / watch-an-ad / pay / subscribe quadrant**, not a binary. WEBTOON Premium launched 2025-09-17 ($3.99 = 20 coins + 2 bonus; $9.99 = 100 + 10; $19.99 = 200 + 25; $49.99 = 500 + 75; ad-free on Originals; episode discounts on all but the $3.99 tier; auto-renewing, cancel anytime; unspent subscription coins reclaimed on refund) (WEBTOON, 2025, https://www.webtoons.com/en/notice/detail?noticeNo=3502), and the English Daily Pass was abolished 2025-05-29 in favour of ad-watch 3-day unlocks.

Platform economics have flattened: Kakao's story segment fell 6% to ₩864.0B in 2024 and 5% YoY to ₩191.8B in Q4 2025; Naver Webtoon's 2025 paid-content revenue grew just 0.4% while IP revenue grew 31.8% and ads fell 1.1% on ~170M MAU (이슈인사이트 summarising Kakao/Naver IR, 2026, https://www.issueinsight.co.kr/news/articleView.html?idxno=2660). **[contested]** That decline covers overseas and web novels too, so it is context, not proof that 기다무 stopped working — and neither Kakao nor Naver publishes wait-or-pay conversion, wait-vs-pay split, or timer-optimisation data. On the demand side, KOCCA's webtoon user surveys put paid-payment experience at 45.6% (2023) and 47.2% (2024), with the modal monthly spend band ₩1,000–3,000 (23%).

Two side effects a designer must budget for. First, creators report that heavy 기다무 use depresses per-title paid conversion and author income — the model shifts revenue from per-episode sales to platform-level engagement, which is a creator-economics decision, not just a pricing one. Second, **ending paywalls** (last N episodes pay-only; completed works locked behind multi-year waits) are a documented reader-backlash and churn risk.

### 4.3 The ethics analysis, instead of a blanket energy prohibition

The skills' current instinct — treat timer/energy gating as a dark pattern — is too blunt for this model and wrong for Korea. 기다리면 무료 is legal, culturally normal, and the most consumer-friendly of the available gates in one specific way: **the free path always completes.** Waiting long enough gets you the whole work at zero cost. That is materially different from an energy system that caps total lifetime progress or a paywall that makes the free branch humiliating.

Judge a wait-or-pay system on five tests rather than banning it:

1. **Does the free path reach the end?** If waiting eventually unlocks everything, the timer is a pacing device. If the final episodes are permanently pay-only, it is a paywall wearing a timer's clothes.
2. **Is the period sub-24 hours or clock-fixed?** A drifting 23-hour refill or a fixed 22:00 grant both keep the appointment reachable; a 24-hour refill anchored to last use progressively pushes the user out.
3. **Does expiry compound?** Expiring tickets are loss aversion. One expiring grant per day is an appointment; stacking expiry with nag pop-ups is 반복간섭 (see §5.2) and now illegal in Korea.
4. **Is paying for time, or for advantage?** Paying to skip a wait leaves the artefact identical. Paying for a *better* branch — the Choices model, where diamonds buy superior choices — converts authored meaning into a price tier, and Choices' soft-currency earn-rate cuts (ad rewards 100 → 10/day; Nov 2025 removal of replay gems) are the genre's most visible churn signal, against a 3.6 Google Play rating on 1.29M reviews on a $544M lifetime franchise. **[contested]** — that franchise size shows the paywall is not automatically fatal.
5. **Is the wait honest about hiatus?** Korean serial evidence is that pauses, not price, drive exits: 7+ updates per week associated with the highest 연독률, at least 5/week needed to build a subscriber base, immediate mass exit when a free serial pauses, and exodus on paid serials past three consecutive missed days (하철승, 2020, https://www.kci.go.kr/kciportal/ci/sereArticleSearch/ciSereArtiView.kci?sereArticleSearchBean.artiId=ART002648591 — single male-skewed web-novel platform, correlational). Naver Webtoon operationalises this with a **per-title** 작품 감상 이탈 예측 model alongside app-level churn, and migrates readers to similar works when a series goes on hiatus or ends; ML targeting beat heuristic targeting on CTR, read rate and pay rate, with no numeric lift disclosed (AB180/Braze, 2025, https://blog.ab180.co/posts/braze-cloud_data_ingestion-naverwebtoon).

**Skill implication.** Replace the blanket "energy timers are extractive" line with (a) a precise description of 기다리면 무료 (per-user, per-title refill; payment buys time, not content), (b) the five-test rubric above, (c) the 23-hour drift rule as a positive pattern to copy, and (d) the wait/ad/pay/subscribe quadrant as the 2025–26 default rather than a binary. Add "series-end / hiatus handoff" and **per-title churn** as named mechanics distinct from app churn. State that no current 기다무 conversion rate is public and that the 25%/2× figures are 2014.

---

## 5. Compliance a Korean designer must satisfy

Every date below is an in-force date, not a passage date. The Korean trend is **mixed**, not uniformly tightening: probability disclosure is tightening hard while play-time regulation is loosening (curfew repealed, adult spend caps lifted, web-board cap being raised, a full GIPA rewrite pending). Any skill sentence saying Korean regulation is uniformly tightening is wrong.

### 5.1 게임산업진흥에 관한 법률

| Provision | In force | Core duty |
|---|---|---|
| §33(2) + 시행령 §19-2 | 2024-03-22 | Per-item odds, 천장, bundles |
| §33-2 소송 특례 | 2025-08-01 | Reversed burden, up to 3× |
| §12-3 과몰입 예방조치 | 2025-10-23 | On-screen play time, warning |
| §31-2 국내대리인 | 2025-10-23 | Foreign operator agent |
| 컴플리트 가챠 ban bill | **pending** | Not law — do not cite as law |

- **§33(2) disclosure.** Per-item type and probability must be shown in-game, on the website and in advertising, covering 캡슐형/강화형/합성형, pity and ceiling conditions ("100% after N"), rate-up variations, per-component odds of bundles, non-independent trials, and limited-quantity/time items. Only firms with a 3-year average revenue ≤₩100M are exempt. Ignoring an MCST corrective order carries up to 2 years' imprisonment or a ₩20M criminal fine (§45(11)) (Kim & Chang, 2024, https://www.kimchang.com/en/insights/detail.kc?idx=29487&sch_section=4).
- **Enforcement volume.** GRAC monitored 3,829 cases and found 950 violations in year one — ads missing information 371 (39.1%), no disclosure 332 (34.9%), bundle components 137 (14.4%) — with 99.3% compliance after correction; 2,181 violations across 338 companies by 2025-09-22, foreign publishers ~70% (메트로서울, 2025, https://www.metroseoul.co.kr/article/20250213500590). **[contested]** GRAC-detected violations still rose from 1,022 (2024) to 1,159 (2025), 30.5% of correction requests were uncorrected at 100 days, and only 84.4% of top-grossing iPhone games with paid loot boxes disclosed odds — so "comply" must include monitoring, not just a launch checklist. Penalties for smaller cases were tiny (코그 ₩36M, 2025-03-26, undisclosed 0% odds below a threshold; 그라비티 and 위메이드 ₩2.5M 과태료 each, Apr 2025), which critics read as weak deterrence against foreign publishers.
- **§33-2 (litigation special provision) [corrected].** Promulgated 2025-01-31, in force 2025-08-01, applying **only to violations occurring on or after that date**. Exactly five paragraphs: (1) liability for damage from non-disclosure or false disclosure, with the operator escaping only by proving absence of intent *and* negligence; (2) where damage is established but its amount is very hard to prove, the court may fix a reasonable amount from the whole record — a damages-estimation rule mirroring 민사소송법 §202-2, **not** a document-production or discovery power (earlier notes claiming a 자료제출명령 are wrong and must not be reproduced); (3) for *intentional* violations the court **may** set an award not exceeding 3× the amount recognised under ¶2 — discretionary, and a cap on the total award rather than an add-on; (4) six mandatory factors (degree of intent/awareness of risk; scale of user harm; economic benefit gained; duration and frequency; fines and surcharges already imposed; degree of remedial effort); (5) legal basis for an MCST reporting-and-relief centre (화우, 2025, https://www.hwawoo.com/kor/insights/newsletter/13145; statutory text at LBOX, https://lbox.kr/v2/statute/게임산업진흥에관한법률). No reported case has yet cited the article, so the 3× exposure is untested.
- **The relief centre is live.** GRAC opened the 확률형 아이템 피해구제센터 in Busan on 2026-02-27 under a new 이용자보호본부 (~20 staff at launch, ~40 by June 2026); by 2026-05-22 it had taken 609 consultations and 11 formal relief filings, with a 피해구제분과위원회 first convened 2026-04-28. Designers meet this body long before they meet a court.
- **§12-3 과몰입 예방조치 [corrected].** Online game operators must display **elapsed play time on screen and an excessive-play warning ("과도한 게임이용은 정상적인 일상생활에 지장을 줄 수 있습니다.") every hour for at least 3 seconds**, and verify real name and age. For under-18s: guardian consent at signup, usage-time limits on request of the minor or guardian (게임시간 선택제), and disclosure of play time and payment history to minor and guardian (찾기쉬운 생활법령정보, https://easylaw.go.kr/CSP/CnpClsMainBtr.laf?popMenu=ov&csmSeq=718&ccfNo=2&cciNo=2&cnpClsNo=5). In practice 게임시간 선택제 covers PC online games and its measured uptake is ~0.1%. **The forced midnight–06:00 under-16 curfew (the "셧다운제"/Cinderella law) was repealed effective 2022-01-01 — never advise a Korean product to implement it.** There is no enacted "Prevent Game Addiction Act"; that name conflates 2013 bills that lapsed in 2016. The regulator is **GRAC (게임물관리위원회)**, not "GRB" (its pre-2013 predecessor) and not KMRB (film/video).
- **Spending caps that do exist**: the adult PC-online ₩500,000/month cap was abolished 2019-06-27; the **youth PC-online cap of ₩70,000/month remains**; the web-board cap is on a two-yearly sunset review, with MCST proposing ₩700,000 → ₩1,000,000 on 2025-11-20.
- **§31-2 domestic agent.** A foreign operator with no Korean address must designate a Korean agent if it meets **any one** of: prior-year **total worldwide** revenue ≥₩1T (not Korea-only, not games-only); a game averaging ≥1,000 new installs/day on Korean mobile devices in the prior year (summed across stores); or ministerial designation. Written designation, disclosed in the terms of service, notified to GRAC; the agent carries the §33 display duties. Non-designation draws up to ₩20M, re-assessed annually as of 23 October.
- **컴플리트 가챠 ban: pending, not law [corrected].** Bill 2212569, proposed 2025-09-01 by 김병기의원 등 13인 (Kim plus 12 co-sponsors — "13 co-sponsors" overstates by one), referred to committee 2025-09-02, tabled 2025-11-17, still at 위원회 심사 as of 2026-09-05 with no subcommittee approval, no 법사위 and no plenary vote (국회 의안정보시스템, https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_G2E5E0M4L2L2J1K6I2J3R0R0Q3O4P6; 게임메카, 2025, https://www.gamemeca.com/view.php?gid=1765621). It would add §28(1) 2-3 and 2-4 (banning undisclosed odds manipulation and complete-gacha), give MCST power to demand server logs and inspect premises, and require refund/compensation when paid content is discontinued. The 2025 "widely expected to pass" framing has not materialised. Advise steering collection/completion gacha toward deterministic paths **now**, but never state the ban as law.

### 5.2 KFTC and the E-Commerce Act (전자상거래법)

Six dark-pattern types became unlawful on **2025-02-14**, with the KFTC's interpretive 소비자보호지침 effective **2025-10-24** (공정거래위원회, 2025, https://www.ftc.go.kr/www/selectBbsNttView.do?key=12&bordCd=3&nttSn=46527; policy background at korea.kr, 2025, https://www.korea.kr/news/reporterView.do?newsId=148967630):

1. **숨은갱신** (§13(6)) — an explicit consent step is required within the **30 days before** a free→paid conversion or a price increase (a trial starting 1 May converting 1 June needs consent between 2–31 May), explicit not implied, with cancellation instructions.
2. **순차공개 가격책정** (drip pricing) — total price on the first purchase screen; the six-month grace period ended 2025-08-13.
3. **사전선택** — no pre-checked upsells.
4. **잘못된 계층구조** — no misleading visual hierarchy between accept and decline.
5. **취소·탈퇴 방해** — cancellation as easy as signup, prominent cancel button.
6. **반복간섭** — re-asking a user via pop-up to reverse a decision **two or more times** is unlawful unless the prompt offers a "do not ask again for 7+ days" option (시행령 §27-2). The KFTC's examples include re-asking after a refusal of 광고성 정보 수신 and re-presenting the same option after a rejection.

First fines landed 2025-10-15 on Coupang, Content Wave/Wavve, NHN Bugs and Spotify (~₩9.5M total; the statutory fine cap is ₩1–5M, with business suspension of 3–12 months for repeat offenders, and disgorgement-scale penalties pending in Parliament). Consumer-side pressure: 한국소비자원 logged 151 free-trial→auto-renew complaints from 2022–2025Q1 — 34.0% inadequate conversion notice, 32.1% cancellation blocked during the trial, 21.2% improper billing, 12.7% penalty or refusal — with only 41.7% receiving full refunds.

**Applicability note:** the guideline's examples concern purchase, subscription and marketing-consent prompts. Whether an in-game "remove ads?" or "continue with a booster?" prompt is in scope is an interpretation, **medium confidence — likely in scope for apps selling IAP, not yet tested**.

**KFTC's other front is odds.** Nexon's **₩11.642B** fine (Jan 2024, the largest ever under the E-Commerce Act, for lowering Cube option probabilities including to 0% from 2011 and cutting Black Cube tier-up odds 1.8% → 1.0% without notice) is still unresolved: on 2026-09-02 the Seoul High Court cancelled the scheduled judgment and reopened arguments — the fourth postponement — with a new hearing set for **2026-10-28 16:00** (매일경제, 2026, https://v.daum.net/v/Zrq1oxpXvd). The decisive question is whether non-disclosure *before* the 2024 statutory duty counts as "deception" under §21. Meanwhile 웹젠 was fined ₩158M on 2025-11-28 for an undisclosed floor where rare-item odds were 0% until 51–150 purchases while 0.25–1.16% was displayed, and did not appeal (게임메카, 2025, https://www.gamemeca.com/view.php?gid=1768689).

Two design rules survive regardless of the Nexon outcome: **pre-announce every odds change before it takes effect** (silent nerfs are the fact pattern in every KFTC case), and **disclose 0%-until-N floors as conditions**, never folded into an average rate.

### 5.3 정보통신망법 §50 — advertising consent and quiet hours

Standing rules: separate prior consent for **21:00–08:00** sends, a "(광고)" prefix, re-confirmation of consent every two years, 과태료 up to **₩30M** per violation. KISA's 7th-edition anti-spam guide (posted 2026-03-04) tightens app push specifically (KISA, 2026, https://www.kisa.or.kr/401/form?postSeq=3608):

- Consent requests may **not** use vague wording such as "혜택 알림" or "정보제공."
- Opting out of app-push advertising may **not** require login or multi-step navigation.
- Notices about coupons, mileage or points that were granted unilaterally — including **issuance and expiry alerts** — require explicit prior consent.

The third bullet is the one that breaks Western retention playbooks: **expiring-reward nudges are regulated advertising in Korea.** "Your 3 free tickets expire at midnight," "your 부적 coupon expires tomorrow," "your season pass reward is about to lapse" are 광고성 정보 unless the reward was one the user actively requested. Combine that with the 21:00–08:00 rule and the 23:30–00:30 fortune-app reveal window becomes a compliance question: a midnight fortune push needs the separate night-send consent, and a midnight "expiring credit" push needs both consents.

### 5.4 개인정보 보호법 (PIPA)

- **민감정보 (§23, 시행령 §18)**: 사상·신념, union/party membership, political opinion, health, sex life, genetic data from testing, criminal records, and biometric data generated to identify a specific individual (plus race/ethnicity). Processing requires separate, explicit consent or statutory basis (국가법령정보센터, https://www.law.go.kr/lsEfInfoP.do?lsiSeq=195062).
- Birth date/time is not per se 민감정보, but **inference creates it**: health worries, relationship/sexual content, religious framing, or free-text 고민 inputs in a fortune, journaling or companion app can produce 민감정보 the operator never intended to collect. Schema discipline (category, not content) is the mitigation.
- **Under-14** users require legal-guardian consent.
- **자동화된 결정 (§37-2, in force 2024-03-15)**: where a fully automated system — explicitly including AI — makes a decision with a **significant effect on the data subject's rights or obligations**, the subject may refuse it and demand an explanation, and the controller must publish the criteria and procedure (casenote reproduction of the article, https://casenote.kr/법령/개인정보_보호법/제37조의2). A daily fortune almost certainly does **not** clear the "significant effect" threshold; an automated churn-risk score that changes someone's price does raise the question. Flag it as a question to ask, not a duty to assume.

### 5.5 AI Basic Act (인공지능 발전과 신뢰 기반 조성 등에 관한 기본법) **[corrected]**

In force **2026-01-22** with its Enforcement Decree; cite the **amended** Act as [시행 2026. 7. 21.] 법률 제21311호, since the January version is superseded (the July amendments are promotion-side and leave the §31 transparency text unchanged) (Cooley, 2026, https://www.cooley.com/news/insight/2026/2026-01-27-south-koreas-ai-basic-act-overview-and-key-takeaways).

- **§31(1) advance notice**: users must be told *before* use that a product or service runs on generative or high-impact AI — written in the product, contract, manual or terms; displayed on screen; or conspicuously posted. This is the duty that is **directly fineable up to ₩30M** (§43(1), whose three triggers are missing advance notice, no domestic representative, and ignoring a suspension/corrective order).
- **§31(2)–(3) labelling**: generative outputs must be labelled. **Do not write "label your AI output or face a ₩30M fine"** — a labelling breach draws a corrective order first and becomes fineable only if that order is ignored.
- **Machine-readable watermarking alone is insufficient**: where the machine-readable route is used, the operator must additionally give, at least once, a text or audio notice that the output is AI-generated. Deepfake-type outputs require a clearly human-perceptible label; invisible watermarking does not satisfy that.
- MSIT's transparency guidelines split "flexible labelling" for in-service outputs (UI symbol, chat-window logo, login-time notice for games and metaverse) from "strict labelling" for downloaded or shared outputs (label on the artefact itself).
- A **guidance period of at least one year from 2026-01-22** applies, with investigations only in extreme cases such as loss of life or serious human-rights harm.
- **Not yet law**: Korea has no companion-chatbot statute analogous to California SB 243. The 국회입법조사처 concluded (July 2026) that the AI Basic Act cannot reach chatbot risks because its tests turn on direct impact on body, safety or fundamental rights, leaving "addictive algorithm design" outside its scope, while PIPA's guardian-consent threshold (under-14) does not cover under-19 minors. The **우리아이 AI 안심 패키지법** (조인철, introduced 2026-06-23) would add age/identity verification, guardian consent for minors, usage time/method limits on request, guardian visibility into conversation timestamps and content, and mandatory self-harm/exploitation detection; separate 정보통신망법 bills (2026-03) would default-off personalised recommendation and "이용유도" features on minors' accounts with fines to ₩10M. **Pending, not law — but streak and usage-inducing mechanics aimed at minors are their explicit target, so design for them now.**

**Skill implication.** Split every ethics item in the skills into **legal floor (jurisdiction-tagged)** and **design preference**, and add a Korea column. Specifically: transparent odds, pity disclosure, honest cancellation, quiet hours and AI disclosure move from "preference" to "law" for Korean deployments. Add the corrected §33-2 text (five paragraphs, no document-production power, discretionary 3× cap). Never cite the repealed 셧다운제, the non-existent "Prevent Game Addiction Act", or "GRB" as the regulator. Mark the complete-gacha ban and the minors AI bills as pending. Add the mixed-trend sentence: Korea is tightening on odds and loosening on play-time.

---

## 6. Korean interaction vocabulary the skills must recognise

The three skills currently carry only "Answer in the user's language (Korean input → Korean output)." That handles output, not **routing**: a Korean designer typing 잔존율 곡선이 D3에서 꺾여요 will not match any English trigger in the skill descriptions. These are the terms Korean designers actually use, with the routing each should imply.

| Korean term | Means | Routes to |
|---|---|---|
| 도파민 | "dopamine hit", reward feel | reward-moments |
| 손맛 | tactile satisfaction of an action | reward-moments |
| 타격감 | impact feel, hit feedback | reward-moments |
| 연출 | staging of a reveal/cutscene | reward-moments |
| 이탈률 | churn / drop-off rate | retention |
| 잔존율 (리텐션) | retention rate | retention |
| 복귀 유저 | returning/lapsed-returned user | retention |
| 신규 유저 / 고인물 | new user / entrenched veteran | retention |
| 출석 보상 | daily attendance reward | both |
| 시즌패스 / 배틀패스 | season pass | both |
| 확률형 아이템 / 뽑기 | loot box / gacha | ethics + reward |
| 천장 | pity ceiling | ethics + reward |
| 과금 / 무과금 / 린저씨 | spending / F2P / whale archetype | ethics |
| 운영 / 라이브 서비스 | live-ops | retention |
| 연독률 / 휴재 | continuation-read rate / hiatus | narrative |
| 기다리면 무료 (기다무) | wait-or-pay | narrative + ethics |
| 신년운세 / 일진 / 사주 | New-Year fortune / day fortune / four pillars | fortune domain |

Notes on usage that matter for interpretation:

- **손맛 and 타격감 are not synonyms.** 타격감 is specifically the feedback of a hit landing (hit-stop, screen shake, audio coherence); 손맛 is the broader felt quality of an input-to-outcome loop, and is used for fishing, gacha pulls and even UI. A skill that maps both to "juice" will give the wrong advice for 손맛 complaints.
- **잔존율 vs 리텐션.** Korean teams use both; 잔존율 is more common in publisher and IR contexts, 리텐션 in UA/analytics contexts. Carry both.
- **출석 보상 is culturally load-bearing.** Daily attendance rewards are the default Korean retention primitive and are read as generous rather than manipulative — *unless* they punish absence (streak resets that destroy accumulated value). The distinction the skills should teach is reward-for-presence vs penalty-for-absence, which is also where PEGI's new interactive-risk criteria draw the line for games submitted from June 2026 (return rewards → PEGI 7; **punishing absence → PEGI 12**) (PEGI, 2025, http://www.pegi.info/index.php/news/pegi-expands-age-rating-criteria-interactive-risk-categories).
- **고인물** (a veteran so entrenched newcomers cannot catch up) names a retention pathology the English skills have no word for: the endgame population is healthy while new-player conversion is dead. When a Korean designer says 고인물화, they are describing a matchmaking/progression-compression problem, not a churn problem.
- **린저씨** carries a spending-archetype connotation; treat it as a signal that the conversation is about whale economics and handle it with the ethics module rather than repeating the slang.

**Skill implication.** Put these terms into the `description` field of all three SKILL.md files so the skills actually fire on Korean input, not only respond in Korean. Add the 손맛/타격감 distinction and the 고인물 pathology to the reward and retention references respectively. Keep the existing language instruction, and add: when the output language is Korean, include the Korea regulatory block by default.

---

## Skill implications

**What belongs in a Korea reference module** (one file, e.g. `references/korea.md`, loaded by all three skills):

1. **Market block** — KOCCA 2025 실태조사 with populations, denominators and the corrected platform deltas; 게임백서 2024 revenue split; Sensor Tower 2025 IAP and subgenre growth; Korean MAU scale anchors (top games 2.2–2.6M). One explicit line: *no Korean install-cohort D1/D7/D30 exists; use Adjust Japan (D1 26 / D7 11 / D30 4, Jan–May 2026) as a stated proxy.*
2. **Session-design block** — the split target: deep core loop, cheap entry and return; dwell ≠ engagement (auto-play ~30%, AI-chat ~40 h/month); the competitor is OTT video; friction removal beats reward inflation (NetEase 畅玩服).
3. **Genre block** — BM shift not genre shift; 4X imports beside MMORPGs; pay-to-avoid-frustration acceptable, pay-to-power policed; 아이온2 as the case with its counter-evidence.
4. **Fortune/saju block** — two archetypes, midnight rollover, post-January resurrection calendar, motive distribution, and the five domain constraints (일진 boundary, 절기/입춘 year, 시주 모름 path, 진태양시/ephemeris versioning, log schema for 민감정보 by inference).
5. **Episodic block** — the 기다무 mechanics table, the 23-hour drift rule, the wait/ad/pay/subscribe quadrant, hiatus thresholds, per-title churn.
6. **Compliance block** — the five tables of §5 with in-force dates, the corrected §33-2 text, the pending-not-law markers, and the "mixed trend" sentence.
7. **Vocabulary block** — §6's table.

**Guardrails that change for Korea:**

- Energy/timer prohibition → the five-test wait-or-pay rubric. 기다리면 무료 is not a dark pattern per se; permanently pay-only endings are.
- "Transparent odds is good practice" → **legal duty with reversed burden of proof and up to 3× damages** for Korean users; pre-announce and version-log every odds change; disclose 0%-until-N floors as conditions.
- Push-notification best practice → **hard rules**: 21:00–08:00 needs separate consent, "(광고)" prefix, biennial re-consent, one-tap opt-out without login, and **expiring-reward nudges count as advertising**.
- Subscription/paywall advice → the KFTC six types, especially 숨은갱신 (explicit consent inside the 30-day window) and 반복간섭 (a second re-ask needs a ≥7-day snooze). This supersedes the skills' current reliance on FTC-US 2022 and EU sources for Korean deployments.
- Stopping cues → in Korea the hourly on-screen elapsed-play-time and over-play warning are **mandatory**; align wrap-up beats with that notice rather than fighting it. Never recommend the repealed curfew.
- AI-generated content (fortune readings, companion dialogue, generated event copy) → advance notice is the fineable duty; labelling is corrective-order-first; machine-readable watermarking alone is insufficient.
- Streaks and usage-inducing features aimed at minors → design now for the pending 우리아이 AI 안심 패키지법 and the 정보통신망법 minors bills.

**Korean trigger phrases for the skill descriptions:** 이탈률, 잔존율, 리텐션, 복귀 유저, 신규 유저, 고인물, 출석 보상, 시즌패스, 배틀패스, 도파민, 손맛, 타격감, 연출, 확률형 아이템, 뽑기, 천장, 과금, 라이브 서비스, 운영, 기다리면 무료, 연독률, 휴재, 신년운세, 사주, 일진, 타로.
