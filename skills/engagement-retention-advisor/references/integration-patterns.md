# Integration patterns: moment → return

Read in ADV `integrate` and `compare` when the ask spans one session and the days after it — to name the pairing linking a beat to a return event, or to decide which layer to work first.

Each pairing names a beat, the carrier that moves its value into the next session, the return event that creates, and the two collapses: *engagement-only* (good beat, nothing survives the session) and *retention-only* (the ledger grows, no session earns it).

## 1. Stored-value artifact → next-visit hook

**Beat** the session yields a persistent object the player owns — base, deck, logbook, saved reading, published island · **Carrier** it survives without being re-derived · **Return** extending that object, not "opening the app" · **→ engagement-only** if one session can rebuild it · **→ retention-only** if it grows where the player never sees it change.

Three classes, ascending return inertia: power / knowledge / position-and-collection. Knowledge-only designs draw "zero feeling of progression between runs" within days; give mastery a visible artifact — logbook, recipe list, map annotation [02e §4 | qualitative]. Co-op hits without meta-progression run ~3–5.3% D30 against 11.3% for Dead by Daylight [AppMagic via GameDev Reports | 2026 | three named premium PC co-op titles, not a genre median | D30 estimate] — **[contested]**, confounded by title age, licence and years of operation, so order-of-magnitude only; owner: `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/genre-profiles.md`.

## 2. Capacity-growth proof → mastery ladder

**Beat** the moment shows the player is better than they were — first clear, personal best, before/after, a newly unlocked technique — not merely that they succeeded · **Carrier** the proof is recorded and the next rung named · **Return** an attempt at that rung · **→ engagement-only** if the beat targets task performance instead (feels good, proves nothing) · **→ retention-only** if the ladder shows but no session produces a rung.

Build the ladder on the capacity-growth facet, not task performance: the two are maximised under opposite difficulty [Deterding, Guckelsberger, Lintunen & Ady | *Motivation and Emotion* | 2025]. Aim at curiosity about the player's own action success — enjoyment does not predict playtime [Kao et al. | CHI 2024 | n=1,699].

## 3. Social contribution → presence-rewarding loop

**Beat** the player's action visibly helps a named other · **Carrier** the group's state holds the contribution · **Return** a co-play appointment or guild-state check · **→ engagement-only** if co-play has no meta layer (§1) · **→ retention-only, and an ethics failure,** if *absence* costs the group.

Guild-join, not friend-add, is the activation milestone, and invite-driven installs are acquisition, not retention — influenced players "subsequently spend less time playing" [arXiv 2409.14351 | 2024 | 108M users, largest PC game platform | IV study]. If absence costs a guild missed rallies or ranking it is the `social-obligation` family (T3 — bonuses scale with who shows up, contribution measured over a rolling 7 days, never a penalty on the group for one member's absence) needing opt-out or grace [Lee, Imteyaz & Savage | arXiv 2504.10714 | 2025 | top-40 Korean mobile games | **preprint**]; that it retains is unmeasured.

## 4. Guided reveal ritual → saved-reading archive

**Beat** a paced reveal that sets a bounded expectation and holds it before the outcome · **Carrier** the output is stored as a dated personal record the user can revisit and compare · **Return** the next reveal at the rollover the product declares · **→ engagement-only** on instant reveal with nothing stored · **→ retention-only** if entries are generic enough that nobody re-reads them.

The pre-outcome window carries the arousal: skin-conductance slopes were greater during the 2-second anticipatory shake than at baseline, t(39)=−3.88, p≤.001 [Larche et al. | *J. Gambl. Stud.* 2019 | 49 real Overwatch opening videos]. For Korean 사주/운세 the appointment is 23:30–00:30 KST, not morning — 포스텔러 traffic peaks at midnight as users check *tomorrow's* fortune [operator self-report | 2024–25]. A metered reveal maximises appointments and supplies no reason to keep them: Pokémon TCG Pocket average MAU fell 51M → 28M over 2025's four quarters, and DeNA's remedy was the *collection* experience, not the reveal loop [gamebiz on DeNA Q3 FY3/2026 | first-party].

## 5. Catch-up entry → resurrection

**Beat** the 복귀 유저's first session back lands in current content, not at the back of a queue · **Carrier** non-resetting buckets, season entry without prior chapters, restored status · **Return** re-entry, then the +7d/+30d re-dormancy check · **→ engagement-only** if the catch-up is a bribe (reactivation spikes, re-dormancy flat) · **→ retention-only** if the offer arrives with no recap, so a returning player is handled as one who never left.

Two worked forms: a 30-day non-resetting bonus track of 50 missions in a 35-day window, so players who "miss a couple of days… still have the opportunity to earn everything" [Second Dinner | Marvel Snap patch notes, 16 Sep 2025]; and status restoration — one-time revival of the longest-ever streak for three lessons, 15.4M revived, nearly 8M with no active streak [Duolingo Q2 2026 shareholder letter | June 2026 | Duolingo lapsed learners | vendor, no holdout disclosed]. Anchor the flow on the **Pivot Point**, a moment restoring the player as their expert self, since games "do not recognize that the player is returning to rather than continuing" [Hammad et al. | CHI 2021 | small-n].

## 6. Unlock reveal → meta-progression pull

**Beat** the reveal names what was unlocked *and* what it changes · **Carrier** the unlocked thing alters next session's options · **Return** the first session that spends it · **→ engagement-only** if unlocks accumulate faster than the sessions that use them · **→ retention-only** once the track keeps paying after the player stops believing the accumulation goes anywhere.

Counter-case against reflexive meta-progression: Pokémon TCG Pocket carried all three stored-value classes and still lost ~45% of average MAU across 2025's quarterly readings [gamebiz on DeNA Q3 FY3/2026 | 2025 | DeNA-reported average MAU | first-party — the 51M → 28M series is in §4 above]. Keep the reveal informational — what improved, why it was earned — not engagement-contingent.

## 7. Session-end closure → clean return

**Beat** a wrap-up at a structural end-point matching the duration the player planned — what you gained, what changed, what is next, then stop · **Carrier** the named next objective, seeded at the exit where players plan re-engagement · **Return** the next session opening on that objective, not on a tutorial · **→ engagement-only** if the exit chains "one more" and conceals the end-point (rage/regret exits — an autonomy cost, not a retention feature) · **→ retention-only** if closure is total and no next objective is named.

Positive exits come from satisfaction plus closure at a structural end-point, and players sometimes plan re-engagement at the moment they stop [Alexandrovsky et al. | CHI PLAY 2024 | 16 interviews + 111 survey | qualitative]. Closure versus cliffhanger is **[contested]**: cliffhangers raised desire for the next installment with no enjoyment loss [Schibler, Hahn & Green | *Media Psychology* 2023 | N=202, N=273], against raised arousal but no gain in enjoyment or intention to continue [Wirz et al. | 2022 | N=133]; neither measured next-day return in a game, so ship partial closure plus a named next objective and A/B it against pure closure. In Korea 게임산업진흥에 관한 법률 제12조의3 already forces an hourly on-screen play-time notice of at least 3 seconds — align the wrap-up with it rather than fight it.

## The two diagnostic questions

1. **What accumulates?** Classify as power / knowledge / position-and-collection / social position / **nothing**. "Nothing" is a finding, not a gap to paper over: no beat, however good, produces day-N retention without a carrier, so the deliverable becomes the carrier.
2. **Would this moment be worth returning for if nothing were withheld?** Remove the energy meter, the timer, the daily cap, the 기다리면 무료 wait, and ask whether the return event survives. If it does not, the mechanic sells time back instead of creating value. Metered access is legitimate only when it caps session length or rate-limits an economy, and the designer must name which [02d §4].

## Sequencing heuristic for `compare`

Take the first that fires.

1. **Nothing accumulates** → lifecycle-work first. Moment polish converts into session length, a diagnostic and never a target.
2. **Something accumulates but the beat producing it is illegible** — the player cannot tell what they gained or that they improved → moment-work first; the carrier already exists.
3. **Otherwise the curve decides.** D1 below the genre band → first-session and moment work; D1 normal with D7/D28 collapse → lifecycle. Vendor mapping: D1 drop → onboarding and core-loop comprehension, D7 → engagement beyond novelty, D30 → depth and live-ops [GameAnalytics | 2026]. The canonical "FTUE works, depth missing" signature is Arcade: D1 22.33%, best of the 2024 genre table, against a D28 that GameAnalytics does not publish for Arcade — use Multiplayer (D1 12.80%, D28 0.51%) or RPG (15.27% / 0.42%) if a worked pair is needed [GameAnalytics 2025 edition | 2024 calendar data | 11,600 games | UTC calendar, strict, D28]; bands are owned by `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/benchmarks.md`.
4. **Tie** → whichever layer the team can actually ship this quarter; sequencing is only honest against stated capacity.

Never sequence off a beta or soft-launch read: Squad Busters ran beta D7 of 29% then 38% with 140,000+ testers and still missed post-launch retention — a one-month soft launch "only validated D7" [Supercell | 2026 | first-party postmortem].

## Numbers that do not exist

- **Win-back and re-dormancy rates.** No 2024–2026 primary dataset; vendor "10–25% recovered" and "5–10× cheaper than acquisition" carry no methodology. Build the baseline against a randomized holdout of matched lapsed users [02d §7].
- **In-game stopping cues.** No published A/B on wrap-up screens, "you're caught up" signals or session-goal prompts [02c §5.3].
- **Recap systems.** No experiment on recap and returning-player retention or comprehension [02d §7].
- **Visible choice consequence → D7/D30 return.** No study links them; measure replay starts and next-session return per variant instead [02a §8.3].
- **Wait-or-pay conversion.** No platform publishes 기다리면 무료 conversion rates [02d §4].
