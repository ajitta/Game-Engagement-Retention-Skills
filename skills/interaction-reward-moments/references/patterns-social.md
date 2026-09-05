# Social and Recognition Patterns

Read when the named scene involves other people — co-op, PvP, guild/clan, leaderboards, or an outcome the player would show someone.

## The counter-rule, applied to every pattern below

`T3 social-obligation` — deliver, never refuse; ship against this spec. Harm evidence only, no jurisdiction bans it (Lee, Imteyaz & Savage, arXiv 2504.10714, 2025 — **preprint**, top-40 Korean mobile games: guilds "compete for limited rewards", players "feel compelled to keep up", flagged as sunk-cost exploitation).

- The compliant spec is owned by `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics.md` (Games → Social-obligation loops, T3): group bonuses scale with who shows up, contribution measured over a **rolling 7-day window** rather than a consecutive-day chain, no per-day quota gating a shared reward. Read that row before shipping any pattern below.
- **The test** — if a player's absence costs their guild or alliance (missed rally, lost ranking, a red row), it is an obligation loop and needs an opt-out or grace mechanism.
- Failure signal to log: members leaving within 48h of a missed group event.

## Patterns

### S1. Contribution beat (an MVP that is not only damage)
- **Fires** — a match or raid ends and a non-final-hit action changed the outcome (cleanse, peel, revive, setup).
- **Feedback** — a named award for the specific act ("fight-saving cleanse"), beside the damage column rather than under it, with one award reachable by every role in the mode.
- **Measure** — share of awards to non-damage roles against the mode's role distribution; requeue-with-same-party rate.
- **Obligation** — recognition attaches to the act, never to attendance. No "present most days" award.

### S2. Team save
- **Fires** — the group is one action from a loss state and one player can still reverse it with a held cooldown.
- **Feedback** — legible to teammates *in-match* (callout, ping, distinct SFX layer), restated on the end screen naming who was saved.
- **Measure** — clutch-attempt vs conversion rate; session continuation after a save; toxicity reports on losses.
- **Obligation** — the system that names the saver never names the loser. No blame card.

### S3. Shareable artifact
- **Fires** — a run ends in a state that is unusual, personal or comparable: run log, build card, replay clip, discovered-recipe list, day-N reading.
- **Feedback** — readable with the game closed, and it states what the player *did*, not what the game gave them. For knowledge-only roguelites it is what makes invisible mastery visible.
- **Cheap version** — comparability with no share feature: Peak's daily map rotation is identical for every player (10:00 PDT reset) so friends compare runs (Game Developer, 2025 — design description, no measured lift).
- **Measure** — kept and sent counted separately; sender return rate. Invites are acquisition, never a retention win.
- **Obligation** — no sender reward contingent on what the recipient does.

### S4. Ranking reveal
- **Fires** — a period closes: weekly league, season, ladder tier. Show the player's own prior position first, cohort second — the delta, not only the rank, in a bracket readable at a glance.
- **Evidence** — leaderboards raised learning time 17% [Duolingo via Lenny's Newsletter, 2023 | 2018–2022 program data | vendor self-report, no denominator or holdout]. The non-competitive variant is a distinct pattern: learners with ≥1 Friend Streak are 22% more likely to complete their daily lesson [Duolingo blog, 2024-08-05 | vendor observational, design undisclosed].
- **Obligation** — demotion may cost position, never earned artifacts; no per-day quota to hold a tier.

### S5. Guild contribution visibility
- **Fires** — a member's action lands in the shared ledger, read as a rolling-window total.
- **Activation** — instrument **guild-join**, not friend-add, as the social activation milestone; log guild/party/raid/trade edges as time-varying churn features.
- **Evidence** — retained users showed markedly higher party, raid and guild-graph activity, and a dynamic social-graph model over those edges beat static models (accuracy 0.75–0.77, F1 0.65) [Lee & Woo, PLoS One, 2025 | Apr 2016–Feb 2017 logs | 10,000 NCSOFT Blade & Soul users | correlational]. Cox with propensity-score matching reports the guild effect stronger than the friend effect [Hwang & Han, SSRN 4606486 | 1,204 MMORPG users | **[unverified]** — SSRN 403/429; hazard ratios and date unread].
- **Obligation** — the ledger must be structurally unable to display a negative: no "missed rallies", no "days absent", no red row.

## Social design is not unconditionally retention-positive

- **Co-play without a meta layer spikes, then churns.** Friend co-op hits with no meta progression run ~3–5.3% D30 against 11.3% for Dead by Daylight [AppMagic estimates via GameDev Reports | 2026 | three named premium PC co-op titles — Content Warning, Ball x Pit, Phasmophobia — not a genre median | D30] — **[contested]**, confounded by title age, licence and years of operation. Owner, with the full premium PC/console profile: `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/genre-profiles.md`. Require a progression layer before predicting D30 from social design.
- **Acquisition and retention are different products.** IV study of 108 million users on the largest PC game platform: friends causally drive *adoption*, but influenced players "subsequently spend less time playing" (arXiv 2409.14351, 2024).
- **Squad play lowers win rate, and losing raises churn.** Cox on 295,008 League of Legends players: connectedness reduces churn overall, but playing with teammates associates with lower win rates (Kim, Kim, Kim & Li, *Sport, Business and Management*, 2026). Never claim "social raises retention" without this caveat.
- **Toxicity is the best-measured social mechanism and it is negative.** Toxic-chat exposure raised time to next match by 16.18–60.68 hours against a 3.66–4.17 hour baseline [Morrier, Mahmassani & Alvarez, PLoS One, 2025 | Nov–Dec 2023 | 56,464,489 observations, 4,539,599 players, CoD MWIII Team Deathmatch | 2SLS]; worst for opponent toxicity after a loss; same-party toxicity showed no engagement effect but the strongest contagion. Log time-to-next-session after a toxic match, segmented by gender and identity.
- **The positive platform numbers are vendor-run on self-selected games.** Linked players gained a median +25% active game days and +16% sessions; players spent 6× longer in-game with one friend present, 8× with three; voice-channel players play ~66% more days [Discord GDC 2026 | Dec 2025 | 15+ games that chose to integrate the Social SDK]. Directional, never a target.
- **Obligation is not proven to retain either.** Last War: Survival's alliance-obligation design coexists with US iOS D1/D7/D30 of 34/11/4 against Whiteout Survival's 42/17/8 [Sensor Tower via Naavik, 2025 | US iOS]. "Alliance obligation drives retention" is analyst assertion with no measurement behind it.

## Numbers that do not exist

- No published effect size for MVP or commendation systems, team-save recognition, or shareable artifacts on retention. S1–S3 ship with a recorded baseline and a holdout, never with a benchmark.
- No isolated causal estimate of a guild system's retention effect: the guild-specific source is **[unverified]** and the logged source is correlational.
