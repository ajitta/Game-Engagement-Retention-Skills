# Korea: market, products and vocabulary

Read when the product ships in Korea, the team is Korean, or the user writes Korean. Every dated legal duty lives in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md`; this file carries none.

## Market anchors

All rows: [KOCCA 2025 게임이용자 실태조사 | 2025 fieldwork | n=10,000 nationally framed, aged 10–69, player/non-player screen | past-year self-report].

- **Past-year game usage 50.2%**, −9.7pp YoY. Series 2022 74.4 → 2023 62.9 → 2024 59.9 → 2025 50.2; lowest since the series opened in 2015 (74.5).
- **Platform mix, base = game users**: mobile 89.1% (−2.6pp), PC 58.1% (**+4.3pp**), console 28.6% (+1.9pp), arcade 10.4%. Do **not** quote "PC −2.9pp / console +4.5pp" — GG Vol.28 computed those against the 2023 base (PC 61.0, console 24.1).
- **Daily minutes, base = users of that platform**: PC 117.9 weekday / 193.4 weekend (five-year high); mobile 90.9 / 116.4 (down YoY); console 53.4 / 103.8.
- **Why lapsed players left**, base = the 3,828 ex-players, multiple response: time shortage 44.0%, reduced interest 36.0%, substitute leisure 34.9%, no motivation 33.1%.
- **The substitute**, base = the 1,331 who named one: video/OTT/TV/film/anime **86.3%**. Not 86.3% of non-players — that is the standard misquote.
- Spending: 37.8% bought an in-game item in the year [via GG review — secondary]; annual spend per person PC ₩186k / mobile ₩89k / console ₩323k.

Industry ₩23조8,515억, +3.9%; mobile 59.0%, PC 25.2%, console 5.0%; exports $8.503B [KOCCA 2025 게임백서 | 2024 data]. Mobile IAP roughly flat at ~$5.3B, Google Play ~75% [Sensor Tower | 2025].

**MAU scale** [Mobile Index | May 2026]: top Korean mobile games run **2.2–2.6M MAU** (Roblox 2.26M, Block Blast 2.24M, Brawl Stars 1.82M) against YouTube 48.1M and KakaoTalk 46.4M app-wide. US and Chinese MAU anchors mislead a Korean team badly.

## Numbers that do not exist

- **No Korean install-cohort D1/D7/D30 is published by anyone.** KOCCA measures usage rate and daily minutes; Mobile Index gates 이탈률; Airbridge's Korea benchmark [H2 2025 | 1,000+ brands] carries no day-N and no LTV; Korean IR decks disclose paying-user deltas, never retention. Stated proxy: Japan games **D1 26% / D7 11% / D30 4%** [Adjust × Sensor Tower | Jan–May 2026 | top-5,000 apps, install cohort]. Never mix it with the Japanese practitioner rule of thumb 50/30/10, which runs on a registered- or tutorial-complete denominator and is ~2× higher for that reason alone.
- No D1/D7/D30 for any Korean fortune app. No current 기다무 conversion rate, wait-versus-pay split or timer-optimisation result from Kakao or Naver. No Korea-specific pass-completion or login-calendar A/B numbers.
- No fortune app publishes the December–February share of its annual revenue, a 신년운세 attach rate, or 궁합 / 택일 conversion. Every 신년 특수 figure in this file is **traffic**, never revenue — size the January dependency from the client's own funnel.

## Session design

- **Dwell is not engagement.** Mobile's 90.9 minutes is a survivor statistic, measured among people still playing in a population that shed 9.7pp of participation in one year; PC's 117.9-minute high reads locally as core consolidation, not growth. ~30% of Korean players use auto-play **[unverified]** [secondary trade citation, no primary survey retrievable | data year unstated | population unstated | "auto-play use" undefined], so much of that time is unattended. Extreme case: Korean AI character-chat apps run ~40 h per user per month, led by 제타 [Mobile Index/IGAWorks | 2026].
- **The competitor is OTT video**, not another game: the churn cause is time (44.0%) and the named substitute is video (86.3% of those naming one). Answering a time-scarcity churn cause with a longer daily obligation argues with the data.
- **Split target.** Keep the deep core loop the remaining 50.2% want (what 마비노기 모바일 and 리니지 classic servers monetised); make *entry and return* cheap in minutes — resumable sessions, no multi-hour catch-up debt, no penalty for a missed day.
- **Friction removal beats reward inflation.** NetEase's 畅玩服 for 몽환서유 PC dropped the time-based fee and simplified systems, "recalled large numbers of lapsed users," peak concurrency a record 3.58M [NetEase Q3 2025]. Never derive Korean session guidance from hyper-casual cadences.

## 사주 / 운세 products

Category MAU [Mobile Index | Feb 2025 | top three >80% of category]: 점신 950,000 (46.5%), 포스텔러 570,000 (28.0%), 운세비결 160,000 (7.6%), 헬로우봇 90,000 (4.6%).

| Field | 점신 — ad-funded | 포스텔러 — prepaid credit |
|---|---|---|
| Model | Free; ads + 부적 sales | 포스 wallet, ₩3,000–20,000 per reading |
| Entry | No signup, zero friction | Account + top-up (packs ₩3,300–97,000) |
| Scale | 17M downloads; 2023 rev ~₩5.0B **[unverified]** | ~9M members; 2023 rev ~₩9.9B **[unverified]** |
| Retention question | Daily return frequency | Top-up and repurchase |
| Risk surface | Ad load, push consent | Subscription and cancellation flows |

**The Scale row is [unverified]** [no source in the v2 research file | revenue stated as 2023, filing basis unstated | cumulative lifetime downloads and registered members, not actives | revenue = operator annual revenue]. The Feb 2025 category-MAU line above is the only sourced scale figure here; quote that one.

포스텔러's own numbers — 1.42M MAU Jan 2025, ~6 uses/week, 50–60% of payers repurchase within three months — are **[self-reported, no stated retention definition]** and are not a benchmark. Motives [롯데멤버스 라임 via 중앙일보 | 2025 | multiple response]: fun 30.1%, New-Year curiosity 30.0%, comfort 23.6%, worries 22.9%, prediction 21.0% — roughly a quarter arrive in distress.

**Midnight rollover, not a morning horoscope.** 포스텔러 reports traffic peaking at midnight as users check *tomorrow's* fortune before bed. The daily appointment is **23:30–00:30 KST**; build the streak, the push and the reveal around the rollover.

**Post-New-Year resurrection calendar.** December–February 신년 특수 runs ~20% above baseline and January is the annual MAU high, so the January cohort is both the largest and the hardest-churning. Plan D30/D90 return events on dates the domain already owns: the user's birthday, 삼재, 절기 turns, the monthly fortune. January 2026 fell YoY for the first time in three years — 점신 1,130,577 → 875,499, 포스텔러 678,052 → 657,272 [Mobile Index via 헤럴드경제 | 2026]. **[contested]** Press attributes it to ChatGPT "사주 GPTs" (top three at 3M/2M/0.9M cumulative users); against that, Jan 2025 was itself an anomalous three-year peak and no user-level substitution data exists.

### The product's own vocabulary

A 사주 app has **사용자** and **리딩**. It has no 플레이어, no win state, no difficulty curve, no 손맛 and no 타격감 — importing them is the tell that the advice was written for a game and relabelled. Terms below are 명리학 practice, not research; no citation exists.

| Term | What it names | What it forces on the product |
|---|---|---|
| 원국 · 명식 | The natal chart — eight characters from the year/month/day/hour pillars | Computed once, never changes: it *is* the account, not a preference |
| 일간 | The day-stem, the chart's "self" — one of ten | The primary key every interpretation branches on |
| 만세력 | The ephemeris converting birth data into pillars | A versioned asset (constraint 4); the most expensive thing to get wrong |
| 십신 · 오행 · 용신 | Relational roles, five elements, the favourable element | The language a reading is written in — a line with no 십신/오행 condition is not a reading |
| 풀이 · 해석 | The written interpretation | The unit of delivery. "리딩", never "콘텐츠" |
| 상담 | A session with a human practitioner | An upsell that is a booking, not a text purchase: scheduling, no-shows, capacity |
| 역술인 · 명리학자 | The practitioner | The domain's authority voice; product copy speaks *for* one |
| 개운 | A luck-improving action — colour, direction, hour, number | The domain's native call-to-action: free, specific, doable today |
| 신수 | The whole-year fortune | An annual product, bought once |
| 부적 | Talisman | The highest-risk revenue surface — fear-priced by default (`${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics.md`, T3) |
| 띠 | Zodiac animal | The one key every Korean user already knows — the zero-friction entry |

**뽑기 has no referent here.** A reading that changes when neither the chart nor the date changed is a broken engine, and two users comparing phones will find it.

### Four clocks, not one

명리 practice; no citation exists. The domain hands the product a cadence ladder it did not have to invent, and every rung has a date the engine can compute years ahead.

| Layer | Period | Turns at | Product use | Trap |
|---|---|---|---|---|
| 일진 | 1 day | 자시, 23:00 — constraint 1 | Daily return, the rollover appointment, push | Two clocks in one build = two fortunes in one evening |
| 월운 | ~1 month | a 절 (12 of the 24 절기), not the 1st | Monthly re-engagement on a date the calendar app does not know | Users expect the 1st; print the actual date in-app |
| 세운 | 1 year | 입춘, ≈4 Feb — constraint 2 | 신년운세, the year's revenue | Three competing new years, below |
| 대운 | 10 years | a per-user age fixed at birth (대운수) | A once-a-decade *personal* event the engine knows years ahead — the strongest honest return trigger in the domain | It fires for a thin slice of users each month: a moment, never a campaign |

**Three new years live in one app.** 1 Jan (marketing, store banner), 설날 / 음력 정월 (토정비결's year), 입춘 (the 사주 year, 세운). They sit weeks apart, and a product that never declares which one it means ships two different answers to "2027년 운세" on the same screen. Whether 토정비결 turns at 설날 or 입춘 is **[contested]** inside the tradition — pick one, print it, and use the same rule in the push copy.

### The readings that are not the daily one

Practice conventions, no citation. Each has its own trigger, cadence and payer; treating the category as "a daily horoscope plus a paywall" throws all of them away.

| Reading | Trigger | Cadence | Retention use | Risk |
|---|---|---|---|---|
| 신년운세 · 토정비결 | The calendar | Once a year, Dec–Feb | 토정비결 resolves the lunar birth date to a 상·중·하 괘 index (8 × 6 × 3 = 144 verse sets), each carrying **twelve monthly sections** — one January purchase that legitimately contains twelve return dates. Release them monthly at the 절; never dump all twelve on the buy screen | The whole year's demand lands in one window; a bad January is unrecoverable |
| 궁합 | A relationship | Episodic | The only reading needing a *second* person's birth data — a native invite. Send a link and let the other person enter their own data; never have the user type it for them (third-party data — constraint 5, and `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md` for the duty) | Verdict framing on a real relationship |
| 택일 | An event: 이사, 개업, 결혼, 계약 | One-off, high intent | The user hands you a future date. That is a booked, honest return trigger months out — and the reason to ask for it | 손없는 날 (음력 dates ending in 9 or 0) concentrates demand onto a handful of days: the problem is capacity, not persuasion |
| 삼재 | The 띠 cycle — three years in every nine | Known years ahead | A scheduled, personal re-entry with the date already in the chart | The domain's biggest fear-monetisation trap: a 부적 upsell against a 삼재 warning is the forbidden T3 configuration in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics.md` |
| 작명 · 개명 | A birth, or a name change | Once in a lifetime | Not a retention surface — a high-price one-off that pays for the engine | Wrong 한자 stroke tables ship a permanent error |

The daily reading is the habit; the event readings are where money and genuine re-entry live. A plan that only tunes the daily loop has answered a quarter of the product.

**How big the January spike actually is.** 점신 ran 1,130,577 MAU in January 2025 against the 950,000 category figure for February 2025 — roughly a fifth higher [Mobile Index | Jan–Feb 2025 | 점신 MAU | arithmetic across two published figures from one source; the February figure is the rounded category-table value]. Consistent with the ~20% 신년 특수 above, and it is a **traffic** number. No fortune app publishes what share of annual revenue the December–February window carries, no 신년운세 attach rate, and no 궁합 or 택일 conversion. Size the January dependency from the client's own funnel before planning against it.

### The ritual, beat by beat

A daily reading is a ritual, not a session: six beats, **30–90 s end to end [craft default — no published optimum]**, running at the 23:30–00:30 rollover.

1. **의도** — the user picks today's focus (하루 전체 · 재물 · 애정 · 건강 · 일). This is free personalisation the domain gives away, and it produces the question *category* that is the only thing the log keeps (constraint 5).
2. **명식** — show the chart and today's 일진 *before* the text. This is the receipt. Acceptance is insensitive to a merely *claimed* source [Rogers & Soule | 2009 | J. Cross-Cultural Psychology; stage-2 n=258, 130 Western / 128 Chinese | one Barnum profile labelled as Western- vs Chinese-astrology derived, self-rated accuracy], so "우리는 진짜 만세력을 씁니다" in copy buys nothing. Showing the chart and naming which element fired is the only version of that claim a user can check.
3. **풀이** — the reading, keyed to the chart (next section).
4. **개운** — exactly one action, doable today, costing nothing **[craft default]**. This is what makes tomorrow's check mean something.
5. **기록** — save it with the date and the ephemeris version. The archive is this domain's honest compounding asset and the only thing that survives a lapsed month.
6. **확인** — tomorrow's opening asks once, skippable and unscored, whether yesterday's 개운 landed **[craft default]**. A return reason built from the user's own record instead of a streak the app can take away.

Reveal staging of roughly **0.6–1.5 s [craft default]** is legitimate 연출; a bar reading "분석 중" over a cached reading is a false claim, not staging.

### The category's content problem: Barnum text

This is where 사주 apps actually fail, and the failure is invisible to the metric teams reach for first.

- A single generic sketch handed to everyone is rated near-perfectly accurate about oneself: mean **4.26 of 5** [Forer | 1949 | 39 introductory-psychology students | one identical sketch, assembled from a newsstand astrology book and presented as individually derived; self-rated accuracy 0–5].
- Acceptance rises with the **specificity of the input the user believes was used**, the interpretation held identical — told it was general, vs derived from birth year+month, vs birth year+month+day [Snyder | 1974 | J. Clinical Psychology; three groups, one identical horoscope interpretation | self-rated acceptance; n not retrieved]. A 사주 app collects the most specific input in the category — date, time and place of birth — so it earns the *highest* acceptance for the *weakest* text.
- Acceptance also tracks how favourable the profile is [Dickson & Kelly | 1985 | Psychological Reports 57:367–382 | review of the Barnum literature; acceptance of generalised personality feedback].

**Consequence for measurement.** A "정확하다" rating cannot separate a chart-derived reading from a newspaper horoscope, and a satisfaction survey scores Barnum text at the top. Accuracy ratings are not a content-quality metric here.

**The resolution floor.** An engine keyed only on 일간 × today's 일진 has 10 × 60 = 600 states in total and exactly **ten distinct readings across the entire user base on any given day**, one per 일간. That is arithmetic on the structure, not a benchmark. If two users with different 월지, different 대운 and different 용신 read the same paragraph today, the product is a horoscope column with a 만세력 bolted to the login screen.

**Four checks that do work:**

1. **Swap test.** Sample K of today's readings. Show each user their own plus one drawn from a user with a different 일간 and a different 대운 — blind, order-randomised — and take an accuracy rating on each. Own must beat swapped. Pre-register the margin before running; no published optimum for the gap exists **[craft default]**. This is the one test the Forer result does not defeat.
2. **Traceability count.** Every template line declares the chart condition that fires it. Count the lines whose condition is unconditionally true; the target in the paid layer is zero. This is read off the template table, not the output.
3. **Fire rate.** For each line, the share of a day's readings containing it. A line present in most of today's readings is a horoscope. Bound it before launch **[craft default — no published optimum]**; the 600-state floor is the arithmetic to argue the bound with.
4. **Determinism.** Re-run a stored reading against its stored ephemeris version — any diff is a bug. For LLM-written interpretations this is the test that the text renders the *chart* and not the prompt: hold the chart facts in a structured layer and let the model only phrase them.

**Valence.** Because acceptance rises with favourability, an engine that can never emit an unfavourable reading will score well and mean nothing. Keep the unfavourable readings — and keep them off any screen or session segment carrying a purchase surface (the T3 configuration in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics.md`).

### Five domain constraints — pre-ship checklist

명리학 practice conventions, not research findings; no citation exists. Verify each with a domain consultant.

1. **일진 day boundary.** The day pillar turns at 자시 — 23:00, not 00:00 — and schools disagree on 야자시/조자시, so it is **[contested]** inside the tradition. Whichever rule the product picks must be the same rule in the reading engine, the push scheduler and the streak counter; otherwise the same evening returns two different fortunes.
2. **절기 / 입춘 year boundary.** The month pillar turns on the 24 solar terms and the 사주 year turns at **입춘, ≈4 February** — not 1 January, not 설날. Marketing peaks in December–January while the engine's year turns in February. State which boundary "2027년 신년운세" means, or January-born users compute against the wrong year pillar.
3. **시주-모름 path.** Many users do not know their birth time and the hour pillar is one of four, so "모름" is mandatory, not an edge case: degrade to a three-pillar reading, name which conclusions are unavailable instead of fabricating them, and never gate the paywall on the time field.
4. **진태양시 and ephemeris versioning.** A correct 만세력 needs solar/lunar conversion plus Korea's historical time bases: standard meridian 135°E against Seoul's ~127°E (~30 min correction, applied by some schools and not others), UTC+8:30 for part of the 1950s, DST in 1948–1951, 1955–1960, 1987–1988. Births near a boundary silently produce the wrong hour pillar. Treat the ephemeris as a **versioned asset**; log which version produced each stored reading.
5. **Sensitive-data-by-inference log schema.** Birth date, time and place are not per se 민감정보 (the enumerated 민감정보 categories, with the instrument and its date, are in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md` → 개인정보 보호법; quote them from there or not at all). But a log recording "asked about a health problem" or a 종교 framing creates 민감정보 by inference, and free-text worry inputs routinely do. Keep the question category, drop the free text — the Mirror Journal trial deleted entries immediately after automated risk classification, retaining only mood, risk flags, timestamps and word counts [medRxiv | 2026 | **preprint**]. Birth data never changes: re-onboarding is cheap here, a breach is unrecoverable.

## 기다리면 무료

Introduced by 카카오페이지 in 2014 by porting 애니팡's heart timer into a reading platform. **Per-user, per-title**: when free tickets run out, one refills after a period the title sets, so the wait and the free window are personal, not global. The platform's own framing is that it **sells the time you don't wait, not the content** [DBR·인터비즈 | 2019].

| Platform | Grant | Expiry | Note |
|---|---|---|---|
| Kakao 기다무 | 1 ticket per title timer | per title | Per-user, per-title |
| Kakao 기다무 플러스 | 5 at 00:00, 5 at 12:00 | 12 h | Completed works; no accumulation |
| Naver Series 매열무 | 1 ticket at 22:00 | 24 h | 22:00 push, 3-day read [dated — revised May 2023] |
| Piccoma 待てば¥0 | 1 per **23 h** | — | Timer drifts earlier each day |
| Piccoma ゼロ円プラス | up to 11/day | daily | Sits above the timer |

**2014 figures — never present as current** [카카오페이지 via DBR | 2014 | some titles]: conversion reached 25%, daily GMV ~₩30M → ~₩68M in month one, first monthly operating profit ₩100M Dec 2014; ~4,000 titles by 2019.

**23-hour drift versus a fixed expiring ticket.** A 24-hour refill anchored to last use makes the user later every day until the appointment leaves their waking hours and the habit dies. A **23-hour** refill drifts the free episode *earlier* each day, so the appointment stays reachable — any ticket or energy system on a daily cadence should use a sub-24-hour period. A **fixed clock grant** (22:00, or 00:00/12:00) plus expiry plus same-time push buys the opposite properties: a shared social moment and loss aversion, at the cost of anyone whose day does not contain that hour. They are different mechanics; pick one deliberately.

**Wait / ad / pay / subscribe is the 2025–26 default, not a binary.** WEBTOON Premium (2025-09-17) sells coin packs $3.99–$49.99 with bonus coins, ad-free Originals and episode discounts above the entry tier, auto-renewing; the English Daily Pass was abolished 2025-05-29 in favour of ad-watch 3-day unlocks. Scale does not carry economics: Piccoma was Japan's #1 app by revenue across all categories in 2025, but **Japan RPD $18.58 against Korea's $1.69 — an 11× gap** **[unverified]** [no source retrievable | data year unstated | which app population the two markets cover is unstated | RPD = revenue per download]. Two side effects to budget: heavy 기다무 use is reported to depress per-title paid conversion and author income, and **ending paywalls** (last N episodes pay-only, completed works behind multi-year waits) are a documented backlash and churn risk.

**Hiatus thresholds** [하철승 | 2020 | KCI; single male-skewed web-novel platform, correlational]: 7+ updates per week associated with the highest 연독률; ≥5/week needed to build a subscriber base; immediate mass exit when a free serial pauses; exodus on paid serials past **three consecutive missed days**. Naver Webtoon runs a per-title 작품 감상 이탈 예측 model beside app-level churn and migrates readers to similar works on hiatus or completion [AB180/Braze | 2025 | ML beat heuristic targeting on CTR, read rate, pay rate; no lift disclosed]. **Per-title churn is a distinct object from app churn.**

## Vocabulary

| Korean term | English concept |
|---|---|
| 이탈률 | Churn / drop-off rate |
| 잔존율 | Retention rate (publisher, IR usage) |
| 리텐션 | Retention rate (UA, analytics usage) |
| 복귀 유저 | Returning lapsed user; resurrection segment |
| 신규 유저 | New user |
| 고인물 | Entrenched veteran a newcomer cannot catch |
| 출석 보상 | Daily attendance reward, login calendar |
| 시즌패스 | Season pass |
| 배틀패스 | Battle pass |
| 도파민 | "Dopamine hit" — reward feel, used loosely |
| 손맛 | Felt quality of a whole input-to-outcome loop |
| 타격감 | Impact feedback of a hit landing |
| 연출 | Staging of a reveal or cutscene |
| 확률형 아이템 | Paid random item / loot box (regulated term) |
| 뽑기 | Gacha pull |
| 천장 | Pity ceiling |
| 과금 | Spending, monetised purchase |
| 라이브 서비스 | Live service |
| 운영 | LiveOps, day-to-day operation |
| 기다리면 무료 (기다무) | Wait-or-pay episode unlock |
| 연독률 | Continuation-read rate across episodes |
| 휴재 | Serial hiatus |
| 신년운세 | New-Year fortune reading |
| 사주 | Four pillars; birth-chart reading |
| 일진 | Day fortune, day pillar |
| 타로 | Tarot |

- **손맛 ≠ 타격감.** 타격감 is a hit landing — hit-stop, shake, audio coherence. 손맛 is the broader felt quality of input-to-outcome, used for fishing, gacha pulls, even UI. Mapping both to "juice" answers a 손맛 complaint wrongly.
- **고인물화** names a pathology English lacks a word for: endgame population healthy, new-player conversion dead — a matchmaking and progression-compression problem, not a churn problem.
- **출석 보상** is read as generous, not manipulative, unless absence destroys accumulated value. The line is reward-for-presence versus penalty-for-absence.
- **Fortune-product terms live in the 사주 / 운세 section above** — 원국·명식, 일간, 만세력, 십신·오행·용신, 풀이, 상담, 역술인, 개운, 신수, 부적, 대운·세운·월운, 궁합, 택일, 토정비결, 삼재, 작명 — each with what it forces on the product. That product has 사용자 and 리딩; 플레이어, 손맛, 타격감 and 뽑기 have no referent in it.
- **무과금** is F2P; **린저씨** is a 리니지-derived whale archetype — a signal the conversation is about whale economics; do not repeat the slang back.
