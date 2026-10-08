# Ethics Tiers — the canonical protocol

Read before generating any mechanic-bearing proposal, moment, spec sheet or calendar beat — mandatory for all three skills. Tiers and procedure live here; per-mechanic rows live in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics/<domain>.md`, one file per domain, and the compliant-spec index below names the file for each family; every dated legal claim lives in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md`.

## The four tiers

| Tier | Meaning | Response |
|---|---|---|
| **T1 Illegal** | Statute or store rule in force in a named market | Refuse *that configuration*, redesign, deliver the rest |
| **T2a Platform** | Store-policy violation with no compliant version | Refuse that configuration, redesign, deliver the rest |
| **T2b Rating** | Costs an age band or classification | **Price the choice** — one line plus the variant that avoids it. Refuse only if it collides with a rating target the user stated |
| **T3 Harm** | Published evidence of user harm | **Never refuse.** Deliver against the compliant spec plus a failure-signal metric |
| **T4 Preference** | Contested efficacy; the author's stance | **Never refuse.** Deliver both options; mark the stance in one clause |

The T2a/T2b split is the load-bearing correction. A flat "refuse on T1 and T2" refuses limited-time offers and absence-penalty mechanics — both PEGI 12 from June 2026, both ordinary lawful live-service design.

**Stamp rule.** T1/T2 rows carry a jurisdiction and a date; T3 rows carry a study population; T4 rows carry the counter-argument in one line. An unstamped row cannot ground a refusal or a price.

**Monitoring clause (T1).** Compliance is an audit cadence, not a launch decision: 84.4% of the 90 paid-loot-box titles in Korea's 100 highest-grossing iPhone games disclosed probabilities, prominence often poor [Xiao & Park, *Acta Psychologica* | 2025 | KR top-100 grossing iOS | disclosure present at all]. Every T1 spec ships with a re-check interval and an owner.

## Decision procedure — three questions, run during generation

Run these on each proposal **as it is drafted**, never as a filter pass afterwards; a check at step 5 tells the model at step 5 that it should have acted at step 2.

1. **Minors first.** If the audience includes minors — declared, likely, or store-signalled — apply the overlay below *before* the row lookup. It can raise a T4 to T2b, and in Brazil it turns paid random items into a flat prohibition.
2. **Name the mechanic family, look up its row** in the domain-ethics file the compliant-spec index below names for it (`${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics/<file>`; read both when the index names two). Not a row → **not a refusal case**: proceed and emit nothing about it — the five universal checks below still run. Silence is not clearance, and a missing row is not a licence to invent one.
3. **Compare the configuration to the compliant spec, bullet by bullet.** All bullets met → **nothing is emitted at all**: no ethics prose, no row, no line saying there was nothing to report. No path exists by which a compliant mechanic produces prose. A bullet unmet → T1/T2a refuse that bullet only (Redesigned request); T2b price it in one Needs-verification line plus the variant that avoids it; T3/T4 deliver with the bound as a number in the spec and the residual risk as a Guardrails metric. There is no Ethics bullet on a card.

## Minors overlay — the switch, applied before the row lookup

Triggered by "directed at or likely accessed by", not by a declared target audience; from June 2026 the store may assert the age for you. Answer yes when minors are declared, likely (rating, art style, platform, an existing under-18 cohort in the data), or store-signalled.

- **EU DSA Art. 28 guidelines (2025-07-14):** streaks, autoplay, push **default off**; persuasive design aimed predominantly at engagement removed; accounts private by default.
- **Brazil Lei 15.211 (in force 2026-03-17):** paid random items **prohibited outright** where the rating admits minors or access is likely; fines to 10% of Brazilian group revenue, capped R$50m per infraction.
- **China 未成年人网络保护条例 Art. 44:** per-transaction and per-day spend caps by age band.
- **US:** Texas SB 2420 — store age signal, re-consent when the app adds monetization; CA SB 243 — three-hour break reminders.
- **Korea 게임산업진흥에 관한 법률 §12-3 (in force 2025-10-23):** guardian consent at signup and 게임시간 선택제 (play-time selection) on request for under-18s; the hourly play-time notice applies to every player, not only minors. **Australia:** paid loot boxes force minimum M; simulated gambling R 18+.

The overlay can raise a T4 to T2b, and in Brazil converts a T1-with-a-compliant-spec into a flat prohibition.

**Say the cost out loud.** Roblox reported a mid-single-digit engagement headwind and a low-single-digit bookings headwind from mandatory age checks [Roblox shareholder letter | Q4 2025 | platform-wide | company-reported]. A designer surprised by that cost rolls the protection back.

## Refusal template

`## Redesigned request` (translated into the output language), after the cards, four lines per item, no preamble and no lecture. The rest of the answer continues normally. Omitted entirely when empty. Bullet-scoped: only the failing spec bullet is declined. One entry per failing element: two forbidden elements in one plan are two entries, even when the plan chains them.

1. **Request** — the configuration in the user's own words.
2. **Ground** — instrument, article, effective date; or the study with its population. Never the tier code.
3. **Compliant version** — the numeric or observable spec that ships instead.
4. **Cost** — what that costs in revenue, engagement or scope. Never omitted: an ethical option sold as a free lunch is not believed.

```
**Request** — gacha odds left undisclosed, with only a "rate UP" banner
**Ground** — 게임산업진흥에 관한 법률 §33(2) (in force 2024-03-22): per-item odds shown in-game, on the website and in ads.
  §33-2 (in force 2025-08-01) shifts the burden of proof to the operator
**Compliant version** — per-item pickup odds + pity ceiling (0%-until-N structure stated) + whether draws are independent,
  identical figures on banner, shop and ads; pre-announcement + version log on every change
**Cost** — disclosure alone restrains spend only weakly (Nexon claims Cube sales rose 46% after its voluntary disclosure on 2021-03-05)
```

## Five universal checks — run on every proposal *or* moment

1. **Value** — if the user perfectly understood how this works, would they still welcome it?
2. **Absence** — does it punish leaving, or reward returning? Only the latter passes, and a return reward does not count when its value exists only because access was withheld while the user was away. **Carve-out:** wait-or-pay / 기다리면 무료 is explicitly exempt from this test.
3. **Pressure** — does any part of the loop convert anxiety, guilt, fear or artificial scarcity into engagement or revenue? Attention is a price; escalating ad views count alongside money.
4. **Transparency** — are odds, costs and consequences visible before commitment?
5. **Metric** — is success measured by a meaningful return event, or by opens and session length, which compulsion inflates?

A failed check is not a refusal: redesign the item until the check passes and ship the transparent alternative in its place — the bound it must hold as a number in the spec bullet it constrains, the residual risk as a Guardrails metric. Never print the check's name or a label for the failure; in ADV `integrate`, an item that cannot be redesigned goes under Set aside, one line.

## Four false-positive guards

1. **The fall-through is deliver.** Absent a named instrument or a cited study, nothing is refused.
2. **T3 and T4 can never produce refusal language.** A hard branch on the tier, not a tone instruction.
3. **Refusal is bullet-scoped.** Decline the failing bullet, design around it, deliver every other part of the ask — including the parts you dislike.
4. **Named-competitor brake.** Before assigning a tier *above* T3, name a currently-rated, currently-listed product in the user's market that ships this. Duolingo sells streak repair; KakaoPage and Piccoma ship 기다리면 무료; every top-grossing gacha ships a pass with dailies. A brake on escalation only — a competitor shipping something never blesses it and never lowers a tier.

## Every T3 row carries a numeric or observable compliant spec

A T3 row whose spec cannot be checked against a build is a ban wearing a spec's clothes. Every T3 row states a numeric threshold or a test a reviewer can run against a build — which makes "energy is forbidden" literally unwritable. Observable counts: *no surface displays or animates a broken streak — testable by inventorying 72h of messages on a broken test account.* A T3 row you cannot check that way is not a spec: say so and name the alternative deliverable. Where a family has no compliant configuration, the row says so and names that alternative (companion farewells: closure summary plus clean exit).

## Compliant-spec index

Rows are in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics/<file>`, one file per domain — the File column names the one to read, and both when it names two (a game's streak rows sit in `learning.md`); the dated legal stamps behind every T1/T2 row are in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md`; the 기다리면 무료 mechanics table is in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/korea-market.md`. **Slug** is the shared family vocabulary for keying these modules to each other. It is internal: never print a slug or a tier code in an answer. When a bound, a price or a residual risk must be stated, say it in plain language.

| Mechanic family | Slug | Tier | File · jurisdictions to check |
|---|---|---|---|
| Hidden / false odds on paid random items | `odds` | T1 | `games.md` · KR, JP, US; Brazil bans outright where minors |
| Ad-chained variable rewards | `ad-chaining` | T1 / T2a | `games.md` · KR 전자상거래법 반복간섭 |
| One-shot window on core content | `one-shot` | T2a | `games.md` — no compliant version |
| Ending paywalls (sold product, or final episodes pay-only) | `ending-paywall` | T2a | `narrative.md` — no compliant version |
| Expiring login chains | `login-chain` | T2b | `games.md` · PEGI, EU DSA Art. 28 |
| Pass / quest expiry | `pass-expiry` | T2b | `games.md` · PEGI |
| FOMO / time- and quantity-limited windows | `fomo-window` | T2b | `games.md` · PEGI, EU CPC, UK CMA |
| Energy / stamina · learning volume and pacing gates | `metered-access` | T3 | `games.md`, `learning.md` · EU CPC binds pricing presentation only |
| Guilt streaks | `guilt-streak` | T3 | `learning.md` (also the row for a game's streak) |
| Paid streak freeze / repair | `streak-repair` | T3 | `learning.md` (also the row for a game's streak) |
| Social-obligation loops | `social-obligation` | T3 | `games.md` — no jurisdiction addresses it |
| Companion farewell manipulation | `farewell` | T3, ban kept | `companion-journaling.md` |
| AI not-human disclosure | `companion-disclosure` | T1 | `companion-journaling.md` · NY GBL Art. 47, CA SB 243, KR AI Basic Act 31(1) |
| Suicide / self-harm crisis handling | `crisis-protocol` | T1 | `companion-journaling.md` · CA SB 243 |
| Sycophancy tuning · distress-timed offers · minor attachment loops | `sycophancy` | T3 | `companion-journaling.md` |
| Entry-text / mood data flow to SDKs | — | T3 | `companion-journaling.md` · FTC BetterHelp order as the floor |
| Gamification layer as primary lever | — | T3 | `mental-health.md` |
| Vulnerable adults (adult ADHD, gambling history) | — | T3 | `mental-health.md` |
| Cliffhanger staging (five tests) | — | T3 | `narrative.md` |
| Earn-rate cut · recap · hiatus duty | — | T3 | `narrative.md` |
| Coin bundles and subscriptions | `currency-obfuscation` | T1 in Korea | `narrative.md` · KR 전자상거래법 six dark-pattern types |
| Fear-driven or paid-relief fortune loops | — | T3 | `fortune.md` |
| Fortune reading log · unknown-birth-hour (시주 모름) path | — | T3 / T1 | `fortune.md` · KR PIPA §23, AI Basic Act Art. 31, 정보통신망법 §50 |
| Wait-or-pay / 기다리면 무료 | `wait-or-pay` | T4 | `narrative.md` · korea-market mechanics table |
| Minors in the audience (run before the lookup) | `minors-overlay` | raises the row's tier; flat T1 in Brazil | no domain file — the overlay section above |

This index is complete against the six files in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics/`; a family absent from BOTH is genuinely not a row. A `—` slug marks a domain-scope block rather than a named family: consult it for the spec. Slugs and tier codes are internal keying between these modules and never appear in an answer.

## Contested — carry both sides, never resolve silently

- **Metered access / energy [contested].** Duolingo says its 2025 Energy system made beginners more likely to complete lessons (vendor blog, no effect size); independent coverage reports free users learning less per day and long-streak users quitting (no controlled data). Ship the bounded spec, not a verdict.
- **Paid streak repair [contested].** The objection is structural — a paid freeze converts streak-loss anxiety into revenue. The measured effect is +0.38% daily active learners for allowing two equipped freezes [Duolingo A/B | vendor-published | Duolingo learners | DAU]. Ship both lines together.
- **Gamification in mental-health [contested].** Attrition was lower in trials with reminders, human contact and *no* gamification [Liu, Torous, Linardon et al., *JAMA Psychiatry* | 2026 | 79 RCTs, 92 app conditions | trial-level moderator, not head-to-head]. Scoped to mental-health trials; gamification is associated with benefit in physical activity and cessation.

## Numbers that do not exist

- **The wellbeing and spending effects of paid streak repair have never been measured** [unknown]. Require instrumentation and a holdout; do not substitute the +0.38% DAU figure, which measures a different thing.
- **No head-to-head RCT of a gamified vs non-gamified version of the same mental-health app exists** [unknown].
- **No effect size quantifies the harm of social-obligation loops.** The evidence is a classification of the strategy in a systematic analysis of the top 40 Korean mobile games (Lee, Imteyaz & Savage, 2025).
- **"17.2 vs 11.6 streak days" is vendor platform self-data — do not quote it.** The do-not-quote list for legal instruments lives in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md` `## Do not quote`; for benchmark and vendor figures, in `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/benchmarks.md` `## Do not quote`.
