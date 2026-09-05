# Cross-layer systems catalog

Read in ADV `system` mode when the deliverable is one named system whose value spans a session *and* a return. Same fields per system: loop (in-session use → what accumulates → return event) · coupling · dominant failure · ethics families · instrumentation.

## The who-sets-the-appointment test

Run it before the ethics row lookup, on any system that creates a return event (02e §6 Q5).

- **Player-set** — the clock started when the player chose to spend it (an energy refill, a queue they queued, a 기다리면 무료 ticket they used). Missing it costs only their own accrual. Forgiving → reviewed as `T3 metered-access`.
- **Server-set** — the clock runs whether or not they engaged (alliance duel, guild war, weekly reset, banner close). Missing it costs standing, and often costs *other people* rewards. Coercive → reviewed as `T3 social-obligation`, and needs a grace window or opt-out.
- The test is on the **clock owner**, not the mechanic's name: a "personal daily quest" gating a shared alliance reward is server-set. Both clocks present → review at the server-set one.

## 1. Guild / clan

- **Loop** — co-play slot, raid/party, contribution to a shared goal → social position (standing, rank, contribution history) a returner cannot re-derive → returns on a guild-scheduled window, not a login. **Couples** to other players *and* usually a server clock: the highest coercion risk of the five.
- **Fails when** absence is penalized (the group loses because one member missed), or invites are counted as retention: friends causally drive *adoption*, but players influenced by key players or old friends "subsequently spend less time playing" [arXiv 2409.14351 | 2024 | 108M users, largest PC platform | IV estimate].
- **Fails when** co-play carries no meta layer: co-op hits without meta-progression run ~3–5.3% D30 against a meta-carrying comparator's 11.3% [AppMagic via GameDev Reports | 2026 | Steam co-op titles | D30 estimate] **[contested — correlational]**. Titles, and why the comparison is not clean: `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/genre-profiles.md`.
- **Evidence for it is thinner than the pitch**: guilds lengthen retention more than friend systems [Hwang & Han, SSRN 4606486 | 1,204 MMORPG users | Cox PH + propensity matching] **[unverified — SSRN 403/429, hazard ratios unread]**.
- **Ethics** — `T3 social-obligation` is always in play, and the distinguishing bullet is that bonuses scale with who shows up rather than penalizing the group for one absence [Lee, Imteyaz & Savage, arXiv 2504.10714 | 2025 | top-40 Korean mobile games | preprint].
- **Instrument** — guild-join (not friend-add) as the social activation milestone; guild/party/raid/trade edges as *time-varying* churn features; time-to-next-session after toxic exposure, which rose to 16.18–60.68h against a 3.66–4.17h baseline [Morrier et al., PLoS One 2025 | CoD MWIII, 4.5M players, Nov–Dec 2023 | 2SLS].

## 2. UGC & creation-sharing

- **Loop** — creating, remixing or playing others' creations → a portfolio and a discovery position (Roblox users engaged **>24 unique experiences per month**) → returns on an algorithm surfacing or a friend's invite, not your push channel [Roblox Q4 2025 shareholder letter | Q4 2025 | 144M DAU | first-party].
- **Couples to the host platform's payout formula, literally.** On Fortnite Creative since 2025-11-01, payout components include **island-specific Island Retention** and returning-player acquisition; only players who ever made a real-money purchase count, and link attribution is unsupported in the EU [Epic dev docs | in force 2025-11-01 | first-party]. Retention design *is* revenue design here.
- **Fails when** standalone-app benchmarks are applied: in-host experience retention scales with session-length band and sits an order of magnitude below the all-mobile median D1 ~22% [GameAnalytics 2026 | 2025 data | 16,262 mobile games, 1,000-MAU floor | median], so that comparison is an error, not a finding. The bands themselves: `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/genre-profiles.md`.
- **Ethics** — the minors overlay is the default, not an edge case: age-checked DAU at 2026-01-31 was 35% under 13, 38% aged 13–17, 27% over 18, and mandatory age checks cost a **mid-single-digit engagement headwind** [Roblox | Q4 2025 | first-party]. Say that safety costs engagement rather than hiding it. `T3 social-obligation` on any co-play quota.
- **Instrument** — retention by session-length band, never a portfolio-wide median; invite and intentional co-play as *distribution* metrics; the cohort the platform actually pays for.

## 3. Meta-progression

- **Loop** — gives a lost or finished run a residue → one of five classes in ascending return inertia (**power**, **knowledge**, **position/collection**, **social position** per §1, **nothing**) → returns on the next run, gated by an unlock the player can name. **Couples** to nothing external — the only system here with no clock owner, so the safest investment and the slowest to validate.
- Position/collection holds hardest because a returner cannot re-derive it, which is why puzzle D28 outlasts genres with far higher D1. Knowledge-only designs have no visible return event: give mastery an **artifact** (logbook, discovered-recipe list, map annotation).
- **Fails when** the accumulation stops looking like it goes somewhere: Pokémon TCG Pocket carried power, knowledge *and* collection and still fell 51M → 39M → 30M → 28M average MAU across 2025 quarters; DeNA named login frequency and existing-user retention, and answered with the collection experience rather than more pack-opening [DeNA Q3 FY3/2026 via gamebiz | 2026 | first-party disclosure].
- **Fails when** validated on the wrong timescale: Squad Busters' beta reached D7 29→38% on 140,000+ testers and launch retention still missed — the one-month soft launch "only validated D7" [Supercell | 2026 | first-party postmortem]. Also when a nerf reads as confiscation; the remedy is expectation-setting, not restraint from balancing.
- **Ethics** — not a row by default; proceed and say so. It becomes one when meta progress **expires** (`T2b pass-expiry`) or when catch-up entry is sold rather than granted.
- **Instrument** — name what is stored between sessions first; then run-to-run continuation, the unlock being pursued at churn, and a holdout running longer than the FTUE test.

## 4. In-game economy

- **Loop** — meters what a session can consume (energy, tickets, lives) and earn → balances, unspent inventory, a store window affordable *next* visit → returns on the refill tick, store/banner rotation or a currency threshold. Highest appointment density of the five, and the weakest reason to keep the appointment.
- **Coupling splits on the clock owner**: server-set when refills and rotations are global; player-set when the meter starts on the player's own spend, as 기다리면 무료 refills one ticket a per-user, per-title period after the player used it (Kakao Page, 2014, carrying over 애니팡's per-heart refill timer). A sub-24h drifting clock (Piccoma's 23h is the reference) and a fixed daily grant are both acceptable: the grant may be fixed, the expiry may not — a ticket that expires unused is the forbidden form.
- **Fails when** the meter maximizes appointments and gives no reason to keep them: Pokémon TCG Pocket's one-pack-per-12-hours loop (two free reveals a day) was unchanged straight through the MAU decline above. Pair any metered reveal with a completion goal.
- **Fails when** a mistake gate becomes a **volume gate**, which changes who is gated: Duolingo's 2025 Energy is spent on every lesson rather than only on errors, and Duolingo says it "helps more learners complete lessons" — **no number given** [Duolingo | 2025 | vendor] **[contested — independent coverage reports free users learning less per day]**.
- **Ethics** — `T3 metered-access` (name the job, session cap or economy control, before configuring anything), `T4 wait-or-pay`, `T2b fomo-window` on limited store windows. The numeric bounds belong to the energy spec in `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/liveops-cadence.md`, not to this file.
- **Instrument** — free-session completion per day, share of players hitting the meter, time-at-zero before return, and whether the refill clock is being tuned against a return-cadence KPI (a `T3` compliance failure if it is).

## 5. Monetization ↔ retention coupling

What the spend loop does *to* the return loop. Pricing, eCPM and pity tuning are out of scope.

- **Loop** — an offer surface placed on a game state (resource-out pinch, pre-boss, streak break, rotation) → spend-derived power and collection, which is also meta-progression, which is why a monetization tune is a retention change → returns on the banner or offer window. **Server-set by construction**, so it fails the appointment test by default and needs a published return schedule (`T2b fomo-window`; a one-shot window on core content is `T2b→T2a one-shot` — no compliant version).
- **Fails when** the pinch point is assumed necessary: easing difficulty for high-churn-risk users raised retention *and* premium spend in a randomized rollout [Ascarza, Netzer & Runge, IJRM 42(4):975–995 | 2025 | ~330,000 users, F2P mobile puzzle | 12-week randomized rollout vs holdout]. Effect sizes, and why the per-round read misleads: `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/experiments.md`.
- **Fails when** a tune reads as betrayal — Infinity Nikki v1.5 (2025-04-29): more pieces per set, less generous pity → review-bomb, apologies, compensation. In a cozy product a tightening is a brand-risk event, not an economy tune.
- **Fails when** retention is treated as the revenue predictor: Last War had the weakest retention among top 4X titles and was still the #1 4X title by 2024 revenue at ~$1.1B [Sensor Tower / Naavik | 2024–25 | US iOS panel estimates].
- **Ethics** — `T1 odds` on any 확률형 아이템 shipping to Korea. A **dynamic or personalized** drop rate is exposed under 게임산업진흥에 관한 법률 §33-2 (burden shift, in force 2025-08-01, no adjudicated case as of 2026-09); fixed disclosed rates plus an audit log are the safe configuration. The statutory detail is `${CLAUDE_SKILL_DIR}/references/jurisdictions.md`'s.
- **Instrument** — payer-count vs ARPPU decomposition, refund rate, top-decile spend concentration, opt-out and uninstall, and 강제 / 부담 / 매일 keyword frequency in store reviews.

## Numbers that do not exist

- **No measurement ties alliance or guild obligation to retention** — analyst assertion only; neither Naavik nor the DoF/Katkoff framing supplies data. Never supply a guild-join → D30 lift figure.
- **No first-party retention curves for roguelites** (Balatro, Hades II, Blue Prince, Peak, Schedule I) — sales and Steam concurrency proxies only, so there is no effect size for a power meta versus a knowledge meta.
- **No platform publishes 기다리면 무료 / wait-or-pay conversion rates.** The circulating "up to 25% purchase conversion" and the 3,000만원 → 6,800만원 daily-GMV doubling are one 2019 write-up of a 2014-era launch [DBR via 인터비즈 | 2019], not a current rate.
- **No UGC-experience benchmark outside the GameAnalytics session-length bands**, and none at all for Fortnite Creative islands.
