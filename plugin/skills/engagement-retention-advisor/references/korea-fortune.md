# Korea: 사주 / 운세 products

Read in place of `korea-market.md` when the product is a Korean 사주, 운세 or 타로 product and the ask turns on local convention, or a fortune mechanic is named. Korean-language input alone is not a trigger. Every dated legal duty lives in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions-korea.md`; this file carries none.

## 사주 / 운세 products

Category MAU [Mobile Index | Feb 2025 | top three >80% of category]: 점신 950,000 (46.5%), 포스텔러 570,000 (28.0%), 운세비결 160,000 (7.6%), 헬로우봇 90,000 (4.6%).

| Field | 점신 — ad-funded | 포스텔러 — prepaid credit |
|---|---|---|
| Model | Free; ads + 부적 sales | 포스 wallet, ₩3,000–20,000 per reading |
| Entry | No signup, zero friction | Account + top-up (packs ₩3,300–97,000) |
| Scale | 17M downloads; 2023 rev ~₩5.0B **[unverified]** | ~9M members; 2023 rev ~₩9.9B **[unverified]** |
| Retention question | Daily return frequency | Top-up and repurchase |
| Risk surface | Ad load, push consent | Subscription and cancellation flows |

**The Scale row is [unverified]** [no retrievable source | revenue stated as 2023, filing basis unstated | cumulative lifetime downloads and registered members, not actives | revenue = operator annual revenue]. For scale, quote the sourced Mobile Index MAU figures in this section instead.

포스텔러's own numbers — 1.42M MAU Jan 2025, ~6 uses/week, 50–60% of payers repurchase within three months — are **[self-reported, no stated retention definition]** and are not a benchmark; Mobile Index puts 포스텔러 at 678,052 MAU for January 2025 [Mobile Index via 헤럴드경제 | 2026 | app MAU | Jan 2025 monthly actives] — quote that figure for scale. Motives [롯데멤버스 라임 via 중앙일보 | 2025 | multiple response]: fun 30.1%, New-Year curiosity 30.0%, comfort 23.6%, worries 22.9%, prediction 21.0% — roughly a quarter arrive in distress.

**Midnight rollover, not a morning horoscope.** 포스텔러 reports traffic peaking at midnight as users check *tomorrow's* fortune before bed. The daily appointment is **23:30–00:30 KST**; build the streak, the push and the reveal around the rollover.

**Post-New-Year resurrection calendar.** December–February 신년 특수 runs ~20% above baseline and January is the annual MAU high, so the January cohort is both the largest and the hardest-churning. Plan D30/D90 return events on dates the domain already owns: the user's birthday, 삼재, 절기 turns, the monthly fortune. January 2026 fell YoY for the first time in three years — 점신 1,130,577 → 875,499, 포스텔러 678,052 → 657,272 [Mobile Index via 헤럴드경제 | 2026]. **[contested]** Press attributes it to ChatGPT "사주 GPTs" (top three at 3M/2M/0.9M cumulative users); against that, Jan 2025 was itself an anomalous three-year peak and no user-level substitution data exists.

### The product's own vocabulary

A 사주 app has **users (사용자)** and **readings (리딩)**. It has no players (플레이어), no win state, no difficulty curve, no game feel (손맛) and no hit impact (타격감) — importing them is the tell that the advice was written for a game and relabelled. Terms below are 명리학 practice, not research; no citation exists.

| Term | What it names | What it forces on the product |
|---|---|---|
| 원국 · 명식 | The natal chart — eight characters from the year/month/day/hour pillars | Computed once, never changes: it *is* the account, not a preference |
| 일간 | The day-stem, the chart's "self" — one of ten | The primary key every interpretation branches on |
| 만세력 | The ephemeris converting birth data into pillars | A versioned asset (constraint 4); the most expensive thing to get wrong |
| 십신 · 오행 · 용신 | Relational roles, five elements, the favourable element | The language a reading is written in — a line with no 십신/오행 condition is not a reading |
| 풀이 · 해석 | The written interpretation | The unit of delivery: a reading (리딩), never "content" (콘텐츠) |
| 상담 | A session with a human practitioner | An upsell that is a booking, not a text purchase: scheduling, no-shows, capacity |
| 역술인 · 명리학자 | The practitioner | The domain's authority voice; product copy speaks *for* one |
| 개운 | A luck-improving action — colour, direction, hour, number | The domain's native call-to-action: free, specific, doable today |
| 신수 | The whole-year fortune | An annual product, bought once |
| 부적 | Talisman | The highest-risk revenue surface — fear-priced by default (`${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics/fortune.md`, T3) |
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
| 궁합 | A relationship | Episodic | The only reading needing a *second* person's birth data — a native invite. Send a link and let the other person enter their own data; never have the user type it for them (third-party data — constraint 5, and `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions-korea.md` for the duty) | Verdict framing on a real relationship |
| 택일 | An event: 이사, 개업, 결혼, 계약 | One-off, high intent | The user hands you a future date. That is a booked, honest return trigger months out — and the reason to ask for it | 손없는 날 (음력 dates ending in 9 or 0) concentrates demand onto a handful of days: the problem is capacity, not persuasion |
| 삼재 | Three consecutive years in every twelve of the 띠 (zodiac) cycle, then nine clear | Known years ahead | A scheduled, personal re-entry with the date already in the chart | The domain's biggest fear-monetisation trap: a 부적 upsell against a 삼재 warning is the forbidden T3 configuration in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics/fortune.md` |
| 작명 · 개명 | A birth, or a name change | Once in a lifetime | Not a retention surface — a high-price one-off that pays for the engine | Wrong 한자 stroke tables ship a permanent error |

The daily reading is the habit; the event readings are where money and genuine re-entry live. A plan that only tunes the daily loop has answered a quarter of the product.

**How big the January spike actually is.** 점신 ran 1,130,577 MAU in January 2025 against the 950,000 category figure for February 2025 — roughly a fifth higher [Mobile Index | Jan–Feb 2025 | 점신 MAU | arithmetic across two published figures from one source; the February figure is the rounded category-table value]. Consistent with the ~20% 신년 특수 above, and it is a **traffic** number. No fortune app publishes what share of annual revenue the December–February window carries, no 신년운세 attach rate, and no 궁합 or 택일 conversion. Size the January dependency from the client's own funnel before planning against it.

### The ritual, beat by beat

A daily reading is a ritual, not a session: six beats, **30–90 s end to end [craft default — no published optimum]**, running at the 23:30–00:30 rollover.

1. **Focus (의도)** — the user picks today's focus (whole day · wealth · love · health · work). This is free personalisation the domain gives away, and it produces the question *category* that is the only thing the log keeps (constraint 5).
2. **Chart (명식)** — show the chart and today's 일진 *before* the text. This is the receipt. Acceptance is insensitive to a merely *claimed* source [Rogers & Soule | 2009 | J. Cross-Cultural Psychology; stage-2 n=258, 130 Western / 128 Chinese | one Barnum profile labelled as Western- vs Chinese-astrology derived, self-rated accuracy], so "we use a real ephemeris" in copy buys nothing. Showing the chart and naming which element fired is the only version of that claim a user can check.
3. **Reading (풀이)** — the reading, keyed to the chart (next section).
4. **Luck action (개운)** — exactly one action, doable today, costing nothing **[craft default]**. This is what makes tomorrow's check mean something.
5. **Save (기록)** — save it with the date and the ephemeris version. The archive is this domain's honest compounding asset and the only thing that survives a lapsed month.
6. **Check-back (확인)** — tomorrow's opening asks once, skippable and unscored, whether yesterday's 개운 landed **[craft default]**. A return reason built from the user's own record instead of a streak the app can take away.

Reveal staging of roughly **0.6–1.5 s [craft default]** is legitimate 연출; a bar reading "analysing…" over a cached reading is a false claim, not staging.

### The category's content problem: Barnum text

This is where 사주 apps actually fail, and the failure is invisible to the metric teams reach for first.

- A single generic sketch handed to everyone is rated near-perfectly accurate about oneself: mean **4.26 of 5** [Forer | 1949 | 39 introductory-psychology students | one identical sketch, assembled from a newsstand astrology book and presented as individually derived; self-rated accuracy 0–5].
- Acceptance rises with the **specificity of the input the user believes was used**, the interpretation held identical — told it was general, vs derived from birth year+month, vs birth year+month+day [Snyder | 1974 | J. Clinical Psychology; three groups, one identical horoscope interpretation | self-rated acceptance; n not retrieved]. A 사주 app collects the most specific input in the category — date, time and place of birth — so it earns the *highest* acceptance for the *weakest* text.
- Acceptance also tracks how favourable the profile is [Dickson & Kelly | 1985 | Psychological Reports 57:367–382 | review of the Barnum literature; acceptance of generalised personality feedback].

**Consequence for measurement.** An "it's accurate" rating cannot separate a chart-derived reading from a newspaper horoscope, and a satisfaction survey scores Barnum text at the top. Accuracy ratings are not a content-quality metric here.

**The resolution floor.** An engine keyed only on 일간 × today's 일진 has 10 × 60 = 600 states in total and exactly **ten distinct readings across the entire user base on any given day**, one per 일간. That is arithmetic on the structure, not a benchmark. If two users with different 월지, different 대운 and different 용신 read the same paragraph today, the product is a horoscope column with a 만세력 bolted to the login screen.

**Four checks that do work:**

1. **Swap test.** Sample K of today's readings. Show each user their own plus one drawn from a user with a different 일간 and a different 대운 — blind, order-randomised — and take an accuracy rating on each. Own must beat swapped. Pre-register the margin before running; no published optimum for the gap exists **[craft default]**. This is the one test the Forer result does not defeat.
2. **Traceability count.** Every template line declares the chart condition that fires it. Count the lines whose condition is unconditionally true; the target in the paid layer is zero. This is read off the template table, not the output.
3. **Fire rate.** For each line, the share of a day's readings containing it. A line present in most of today's readings is a horoscope. Bound it before launch **[craft default — no published optimum]**; the 600-state floor is the arithmetic to argue the bound with.
4. **Determinism.** Re-run a stored reading against its stored ephemeris version — any diff is a bug. For LLM-written interpretations this is the test that the text renders the *chart* and not the prompt: hold the chart facts in a structured layer and let the model only phrase them.

**Valence.** Because acceptance rises with favourability, an engine that can never emit an unfavourable reading will score well and mean nothing. Keep the unfavourable readings — and keep them off any screen or session segment carrying a purchase surface (the T3 configuration in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics/fortune.md`).

### Five domain constraints — pre-ship checklist

명리학 practice conventions, not research findings; no citation exists. Verify each with a domain consultant.

1. **일진 day boundary.** The day pillar turns at 자시 — 23:00, not 00:00 — and schools disagree on 야자시/조자시, so it is **[contested]** inside the tradition. Whichever rule the product picks must be the same rule in the reading engine, the push scheduler and the streak counter; otherwise the same evening returns two different fortunes.
2. **절기 / 입춘 year boundary.** The month pillar turns on the 24 solar terms and the 사주 year turns at **입춘, ≈4 February** — not 1 January, not 설날. Marketing peaks in December–January while the engine's year turns in February. State which boundary "2027년 신년운세" means, or January-born users compute against the wrong year pillar.
3. **Unknown-birth-hour (시주 모름) path.** Many users do not know their birth time and the hour pillar is one of four, so the unknown path is mandatory, not an edge case: degrade to a three-pillar reading, name which conclusions are unavailable instead of fabricating them, and never gate the paywall on the time field.
4. **진태양시 and ephemeris versioning.** A correct 만세력 needs solar/lunar conversion plus Korea's historical time bases: standard meridian 135°E against Seoul's ~127°E (~30 min correction, applied by some schools and not others), UTC+8:30 for part of the 1950s, DST in 1948–1951, 1955–1960, 1987–1988. Births near a boundary silently produce the wrong hour pillar. Treat the ephemeris as a **versioned asset**; log which version produced each stored reading.
5. **Sensitive-data-by-inference log schema.** Birth date, time and place are not per se 민감정보 (the enumerated 민감정보 categories, with the instrument and its date, are in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions-korea.md` → 개인정보 보호법; quote them from there or not at all). But a log recording "asked about a health problem" or a 종교 framing creates 민감정보 by inference, and free-text worry inputs routinely do. Keep the question category, drop the free text — the Mirror Journal trial deleted entries immediately after automated risk classification, retaining only mood, risk flags, timestamps and word counts [medRxiv | 2026 | **preprint**]. Birth data never changes: re-onboarding is cheap here, a breach is unrecoverable.

## Numbers that do not exist

- No D1/D7/D30 for any Korean fortune app.
- No fortune app publishes the December–February share of its annual revenue, a 신년운세 attach rate, or 궁합 / 택일 conversion. Every 신년 특수 figure in this file is **traffic**, never revenue — size the January dependency from the client's own funnel.
