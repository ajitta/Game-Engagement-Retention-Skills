# Domain ethics — Games (all genres)

One of six domain files. `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md` owns the tiers, the three questions, the refusal template and the minors overlay (run before any row lookup); its compliant-spec index names the file holding each family's row, and this file owns its rows. A row runs forbidden → compliant spec → the author's preference; a title ending in a backticked slug keys it to that index. Slug and tier code never reach the answer — the reader gets the bound to hold, the price of the choice or the residual risk, in plain language, and a configuration meeting every bullet of its row produces nothing at all.

**Forbidden (T1/T2a) — three families.**

**Hidden or false odds on paid random items — T1 — `odds`.** Forbidden: a paid random item with no per-item probabilities; a "rate UP" banner carrying no numbers. Spec: per-item % before purchase, reachable from the purchase, inquiry and use screens; pity disclosed as a condition with the 0%-until-N structure stated; multi-pull tables described as they operate; pre-announcement + audit log on every rate change; a direct fiat path beside any currency path. KR 게임산업진흥에 관한 법률 33(2) in force 2024-03-22, 33-2 in force 2025-08-01 (burden shifted to the operator, up to 3× the assessed amount on intent); JP 景表法 直罰 since 2024-10-01; Apple/Google policy; FTC v. Cognosphere order 2025-01. Brazil Lei 15.211 (2026-03-17) bans them outright where the rating admits minors — disclosure does not cure it. Compliance implies an audit cadence, not one design decision.

**Ad-chained variable rewards — T1 / T2a — `ad-chaining`.** Forbidden: chaining; near-miss re-offer after an ad view; re-offer after an in-session decline; a rewarded payout that is itself a random draw; interstitials at level start, pre-splash or mid-action. Spec: exactly one opt-in rewarded offer per resource-out pinch point; a declined offer is not re-offered for ≥7 days (the snooze the KR rule below names, applied as the house bound everywhere). Each forbidden item above the user's plan contains is its own declined entry — the near-miss popup and the re-offer after a decline are two, even when the plan chains them. KR 전자상거래법 반복간섭 in force 2025-02-14 — re-asking a settled decision ≥2× without a ≥7-day snooze [in-game prompts are an untested interpretation]; Google Better Ads. The ban is on chaining, never on rewarded video.

**One-shot windows on core content — T2a — `one-shot`.** No compliant version. A limited seasonal event with a published return schedule is defensible and is graded under `fomo-window` below; a one-shot window that puts core content permanently out of reach is not, and disclosure does not cure it. Test: for every limited item on the core progression path, name the date or the condition on which it returns — an item with neither fails. Same jurisdiction basis as `fomo-window`.

**Compliant spec (T2b–T3) — five families. T2b rows price the choice; T3 rows deliver against the spec plus a failure signal.**

**Expiring login chains — T2b — `login-chain`.** Spec: accrual never decrements; "N of 7 days" or a cumulative-count calendar, not a consecutive chain; ≥1-day grace; free catch-up credit; off by default for minors in the EU. Price: losing content or reducing progress for non-return is PEGI 12 from June 2026, and streaks are on the EU DSA Art. 28 default-off list for minors (guidelines 2025-07-14).

**Pass and quest expiry — T2b — `pass-expiry`.** Spec: owned progress never expires (the purchase window may close); dailies feed a weekly and a non-resetting ≥30-day monthly bucket from the same actions; completable at ≤3 play days/week; catch-up entry path; no final-week skip upsell; no cumulative-consecutive-day requirement anywhere in the stack. Price: PEGI 12 if absence removes content.

**Time- and quantity-limited windows (FOMO) — T2b — `fomo-window`.** Spec: real-money price at the decision point; currency denominations matching item prices; no countdown pressure in flows reachable by minors; content returns on a published cycle or becomes earnable later. Price: PEGI 12; EU CPC action against Star Stable 2025-03-21; UK CMA false urgency, to 10% of global turnover under the DMCC Act since 2025-04-06. A window that puts core content permanently out of reach is not this row — see `one-shot` above.

**Energy / stamina (metered access) — T3 — `metered-access`.** Not illegal anywhere; EU CPC binds only its pricing presentation. **[contested]** — both sides are on the contested list in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md`.

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

## Do not quote

Do-not-quote corrections (no "Prevent Game Addiction Act", no "Japan 2025 gacha law", no "China 2025 random-draw rule"; Korea's complete-gacha bill 2212569 is pending in committee) live in `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md`.
