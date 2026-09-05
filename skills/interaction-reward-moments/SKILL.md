---
name: interaction-reward-moments
description: "Design and improve in-session reward moments — the reveal, choice, feedback, anticipation and game-feel beats inside one session — for games, interactive narrative, fortune/saju, AI companion, journaling and learning apps. Use when the deliverable is a named scene, loop, screen or beat: 'the level-complete screen feels hollow', 'make the gacha pull land', 'the tutorial's first win is flat', or a short-session / quit-mid-session complaint (session length is a diagnostic, never a target). A retention metric cited only as motivation ('D7 is low, fix the reward staging') does NOT disqualify this skill. Route away when the named deliverable is a multi-day cadence mechanic — battle pass, login rewards, streaks, daily quests, LiveOps calendar — to retention-strategy-designer. Outputs a scan table plus one card per moment: trigger, player action, feedback staging, next hook, metric, ethics tier, effort band."
when_to_use: "Examples: '보스 스태거 연출을 설계해줘'; 'our card-flip reveal feels cheap'; '튜토리얼 첫 승리가 안 와닿아요'; 'make the daily saju reading moment satisfying'; 'players quit 4 minutes in'. Korean triggers: 손맛, 타격감, 도파민 포인트, 연출, 첫 승리, 튜토리얼 이탈. Not this skill: cohort curves or churn as the deliverable; a battle pass or login calendar; a moment complaint paired with a churn complaint (use engagement-retention-advisor)."
user-invocable: true
argument-hint: "<named scene, loop, screen or beat> [--mode moments|first-win]"
---

# Interaction Reward Moments

A reward moment is a short interaction where anticipation, agency, uncertainty, feedback and meaning combine into one experience peak — a design term, never a claim about neurochemistry, and "dopamine point" never reaches an answer. This file carries the procedure only: every lens, pattern, bound, range and citation lives in a reference module named below, read at generation time and never recalled. Session length is a diagnostic of loop satisfaction, never a target — a four-minute session is evidence about the loop, and inflating the number is not the deliverable.

## Input

$ARGUMENTS

**Step 0 — 입력 확인.** Fill each required input from the request. For any you cannot fill: if a wrong guess would change **which** proposals you make, ask — one message, all missing items bundled, at most four questions, then stop and wait. If a wrong guess would only change the tuning, write it under `## 전제` tagged `[가정]` and proceed. Never ask twice. If the session cannot ask (non-interactive, piped prompt, or the user said to just answer), assume everything, and make `## 전제` the first thing in the answer.

Required: product and genre or domain · platform — mobile, PC-Steam, console, web, Roblox-UGC · shipping markets · monetization model in one line · natural usage cadence · **the named scene** · **the feedback that scene already has** — visual, sound, haptic, UI, numbers · **who the scene is for** — new player or veteran.

The last two are blocking here: without them the Feedback bullet cannot tell adding from restating, which is how a proposal ends up describing what already ships. When a proposal will carry a reward, currency, timer, randomness or purchase surface, also establish whether the audience includes minors — it can move a mechanic two tiers. Calibration: `"탑다운 로그라이크, 방 클리어 후 보상 선택이 밋밋해요"` → assume and proceed, since what is missing only moves tuning; `"우리 게임 재미없대요"` with no named scene → ask one question, and only one.

## Preflight

Reference paths: `${CLAUDE_SKILL_DIR}/references/<file>.md` for this skill's modules, `${CLAUDE_SKILL_DIR}/../<skill>/references/<file>.md` for a sibling's. If a required read fails, say so in one line, answer with reduced confidence, and name the missing module in `## 읽은 근거`. Never silently proceed, and never let recall stand in for a module you did not open.

**Ceiling — at most three reference modules per invocation.** If a fourth seems necessary the request spans two modes: pick the primary, answer it fully, and name the deferred read in one line at the end of `## 읽은 근거`.

<!-- ROUTING -->
## Routing

Route on the **deliverable**, not on keyword presence. A retention metric cited only as motivation or as a success criterion is NOT a second ask. When the deliverable is a *named artifact* rather than a layer, route by its row in the table below and use the mode named there. Ambiguous **and** the choice materially changes the output → ask one bundled question. Hand off at most once per turn, never back to the skill that handed to you; then answer in place.

Tutorial drop-off is a funnel symptom, not a deliverable — route on the artifact asked for.

**Hand-off ladder.** (1) Do not hand off — a hand-off is a routing failure the user pays for twice. (2) If you must, invoke `game-engagement-retention-skills:<skill>` via the Skill tool. (3) If that is denied, read the sibling's *reference module* at `${CLAUDE_SKILL_DIR}/../<skill>/references/<file>.md` — never another `SKILL.md`. (4) Proceed in place under this skill's guardrails and say so in one line.

| Named deliverable | Skill | Mode |
|---|---|---|
| In-session scene, feel, reveal, choice, staging, "not fun" | IRM | `moments` |
| Session-length / quit-mid-session complaint | IRM | `moments` |
| A named tutorial beat feels flat; the first win does not land | IRM | `first-win` |
| Unlock **reveal** beat itself | IRM | `moments` |
| Accessibility of a feel effect (flash, shake, haptics, motion) | IRM | `moments` |
| Churn, D1/D7/D30, cohorts, activation, resurrection | RSD | `strategy` |
| Tutorial/FTUE **funnel**: which step, order, gating, D0→D1 leak | RSD | `strategy` |
| Pasted curve or cohort table with no change requested | RSD | `read` |
| Retention metric definition; rolling vs classic; D28 vs D30 | RSD | `read` |
| Battle pass, season, daily/weekly quests, login calendar, streak, energy | RSD | `cadence` |
| Notification / push copy | RSD | `cadence` (mechanic = notification) |
| LiveOps / event calendar, season roadmap, 90-day plan | RSD | `calendar` |
| Meta-progression **pacing** between runs | RSD | `calendar` |
| ARPDAU/LTV vs retention, ad load, offer cadence, first purchase, paywall | RSD | `economics` |
| Analytics event taxonomy, tracking plan, experiment design | RSD | `instrument` |
| Two deliverables, or the moment-to-return link itself | ADV | `integrate` |
| Moment complaint **paired** with a churn complaint | ADV | `integrate` |
| Compare / sequence / prioritize moment-level vs lifecycle-level | ADV | `compare` |
| "Should we build a tutorial at all" | ADV | `compare` |
| Guild/clan, UGC & creation-sharing, in-game economy, meta-progression **system** | ADV | `system` |
| Monetization **design**: pricing, eCPM, mediation, gacha rate or pity tuning | — | decline in one line, name the boundary |
| SaaS / B2B activation or churn | — | decline in one line, name the scope |
<!-- /ROUTING -->

## Modes

`moments` is the default. An explicit `--mode` always wins. Line 1 of the answer prints the mode.

| Mode | Fires when | Reads, in order (≤3) | Body of the answer |
|---|---|---|---|
| `moments` | A named scene, loop, reveal, choice, unlock or feel beat is flat; a session-length or quit-mid-session complaint | `moment-lenses.md` → the one pattern family the retrieval key picks → `../engagement-retention-advisor/references/ethics-tiers.md` | Scan table → 3–5 cards → staging sequence for the strongest moment → cross-cutting tuning notes |
| `first-win` | A named tutorial beat, the first session, the first win that does not land, or how a session ends | `moment-lenses.md` → `first-session.md` → `patterns-progress.md` | 1–3 cards → staging timeline with timings → accessibility check |

In `first-win`, `ethics-tiers.md` takes the third slot whenever a proposed beat carries a reward, currency, timer, randomness or purchase surface. The ethics read displaces a pattern family, never the reverse.

**Retrieval key.** The family is chosen by what the beat turns on, not by genre.

| The beat turns on | Family |
|---|---|
| A hidden or uncertain outcome — chest, draw, crit, card flip, daily reading, episode-end cut | `patterns-reveal.md` |
| A bar, a set, a milestone, an earned unlock, or proof the player got better | `patterns-progress.md` |
| Other people — co-op, PvP, guild, leaderboard, a result worth showing someone | `patterns-social.md` |
| Failure, near-loss, comeback, a broken streak, or re-entry after a gap | `patterns-relief.md` |
| The product is fortune/saju, journaling, companion, learning or episodic narrative | `patterns-nongame.md` — overrides the four above |

Two substitutions, still inside the ceiling: when the ask is the strength, safety or accessibility of a sensory effect — flash, shake, haptics, camera, motion, 손맛·타격감 — `feel-and-accessibility.md` takes the family slot; when a mechanism claim or a number has to survive a stakeholder, `research-basis.md` takes it. Any card prescribing a sensory effect is bounded by `feel-and-accessibility.md`; if it was not read, say so rather than inventing a range.

## Procedure

1. **Model the scene in four lines.** Domain and player intent · the core verb the player repeats · the loop as input → anticipation → response or reveal → interpretation → next hook · the state before, during and after the beat, with the feedback it already has. Everything downstream quotes these four lines.
2. **Read the modules for the mode, in order.** Generate nothing before the reads land.
3. **Run the lenses in `moment-lenses.md` over the scene.** Ethics runs here, as a constraint on which candidates get written — never as a filter applied afterwards to drafted text.
4. **Keep the strongest 3–5, cut the rest.** A survivor passes the strong-point test in `moment-lenses.md`; short of it the candidate is a decoration on an existing beat, and saying so is the better answer. If the scene yields none, walk that module's minimum-additions ladder and stop at the first rung that produces one — do not invent a new system.
5. **Write one card per survivor** in the grammar below, then the staging sequence for the single strongest — 4–6 beats with timings, under `## 연출 시퀀스` / Staging sequence. The strongest is the one integrating the most scene-specific elements that is also verifiable, not the one with the biggest claimed effect.
6. **Tuning notes are cross-cutting only**, under `## 튜닝 노트` / Tuning notes: global cooldown, anti-spam, firing frequency, difficulty curve, random range, which constants are server-tunable. Per-moment tuning belongs inside that moment's card.

## Ethics

**Mandatory read.** Before generating any mechanic-bearing proposal, read `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md` and the relevant domain section of `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics.md`. Required, not optional. A proposal is mechanic-bearing when it touches a reward, a currency, a timer, randomness, a social obligation, a streak, or a purchase surface — which is most of them.

Five tier names, one response each: **T1 illegal** and **T2a platform** → refuse that *configuration*, redesign it, deliver the rest of the answer. **T2b rating** → price the choice in one line plus the variant that avoids it; refuse only against a rating target the user stated. **T3 evidence of harm** and **T4 contested preference** → never refuse; deliver against the module's compliant spec and carry its failure signal into the card's guardrails.

Three ordered questions, run per candidate inside step 3:

1. Does the audience include minors — declared, likely, or store-signalled? Apply the overlay before the row lookup.
2. Name the mechanic family and look up its row. Not a row → not a refusal case: proceed and say so in one clause. Silence is not clearance.
3. Compare the user's configuration to the compliant spec, bullet by bullet. Every bullet met → the Ethics bullet reads `T<n> <family> ✓` and nothing else; a compliant mechanic never produces a paragraph. A bullet unmet → T1/T2a refuse that bullet only, T2b price it, T3/T4 deliver with the residual risk named.

Every ethics call is wired to an observable failure signal in the same card's guardrails. A disclaimer is not a guardrail.

<!-- CARD -->
## Output shape

**Tables scan; cards carry.** A table carries only a short label, one number, or one date. Never more than 5 columns; never a table for rationale, ethics, or feedback staging. Anything the reader has to *read* goes in a card bullet. Emit a wide all-fields table only when the user asks for a spreadsheet, CSV, Notion or PRD export — and then append it after the cards, never instead of them.

**Scan table** — exactly 4 content columns, present only when there are ≥3 cards. Column 3 varies by skill: IRM = when it fires; RSD = segment · lifecycle stage; ADV = return event · window.

```
| # | 이름 | 언제 발동 | 핵심 지표 |
```

**Card** — bold inline labels, never sub-headings. One sentence per bullet, hard cap. The last three bullets are the execution layer; they sit inside the card so they cannot be dropped under length pressure. Emit only the bullets tagged for this skill, and only one side of each `A / B` label.

```markdown
### 2. <5–8 word name>
**One-liner** — ≤25 words: what changes for the user.
- **언제 / Fires when**: concrete trigger — a game state or lifecycle condition, not a category
- **플레이어 행동 / Player does**: the action or decision taken
- **왜 작동하나 / Why it works**: the lens or mechanism, one clause          [IRM, ADV]
- **피드백·연출 / Feedback**: the staging beat with timings                   [IRM, ADV]
- **다음 훅 / Next hook**: the curiosity question the beat leaves open        [IRM, ADV]
- **리턴 이벤트 + 창 / Return event + window**: the event that counts, and when [RSD, ADV]
- **대상 / Segment · stage**: new · current · power · lapsing · dormant        [RSD, ADV]
- **측정 / Measure**: pre-registered primary metric + the baseline to record BEFORE shipping
- **가드레일 / Guardrails**: 2–3 metrics, at least one user-harm metric
- **윤리 / Ethics**: `T<n> <family> ✓` when compliant — nothing else. Non-compliant T2b: `T2b <family> — <the age band or classification it costs>` plus one clause naming the variant that avoids it
- **공수 / Effort**: S | M | L · **의존 / Depends on**: … · **중단 / Kill if**: numeric threshold
```

**Anti-fabrication.** Effort is a band: S ≤1 week / M 1–3 weeks / L >3 weeks or new art or a systems change. Ship **order** is stated; ship **weeks**, headcounts, salaries and costs are never stated — you cannot know a team's calendar, and a fabricated roadmap in a planning doc is worse than silence. Any number you introduce carries `[source | population | year | definition]` inline or is not written.

**Fixed sections, in this order, in every mode:** `Mode:` line → `## 전제` (every assumed input, tagged `[가정]`; always present) → the mode's body → `## 순서` (ranked by **impact per unit effort, highest first** — never "impact × difficulty", which ranks the hardest items first) → `## 측정 설계` → `## 재설계한 요청` (only when a T1/T2a bound failed; a priced T2b stays in the card's Ethics bullet and never opens this section; omitted entirely when empty) → `## 확인 필요` (jurisdiction flags only) → `## 읽은 근거` (the reference modules actually read, one line — a skipped mandatory read must be visible here).

English output uses: Assumptions · Order · Measurement plan · Redesigned request · Needs verification · Sources read.
<!-- /CARD -->

## Measurement plan

`## 측정 설계` is one block for the whole answer, not the cards repeated.

- **One pre-registered primary metric**, named before the change ships, with its baseline measured on the current build first. A metric picked after the data is a story.
- **Playtest and telemetry as a pair** — what to watch a player do, and the event that records it. A feel change only telemetry can see is not a feel change.
- **Same-week cohorts and a kept holdout** when the beat ships to a live build, re-measured at week 3–4: a new beat's first read is inflated by novelty for roughly the first two to four weeks, so the week-1 number is a ceiling, not a result. A before/after line across a patch is not evidence.
- **Guardrails, at least one a user-harm metric**: opt-out rate, notification-permission revocation, uninstall, refund rate, and the frequency of 강제 · 부담 · 매일 in store reviews. Crash rate alone is not a guardrail set.
- **Over-engagement is an alarm, not a win.** A jump in session length or firing frequency in the heaviest decile reads as a harm signal until a wellbeing measure says otherwise. Each failure signal carries the number at which the beat is rolled back.

## Quality bar

- "Add a reward", "add an achievement", "make the effect flashier", "more juice" are not proposals. Every point binds to the named scene, this product's own rules, and the feedback the scene already has. A card that would read the same for a different game is cut.
- Skill-earned over passive. Readable uncertainty over pure randomness. Meaningful choice over an automatic stat increase. A few memorable peaks over constant feedback noise.
- Name the lens or mechanism in one clause, in the vocabulary `research-basis.md` licenses. Never assert that a design produces dopamine, and never label an uncertain reward as a variable-ratio schedule.
- Session length stays a diagnostic. If the user asked to raise it, answer the loop question underneath it and say in one line that you did.

<!-- LANGUAGE -->
## Output language

Answer in the user's language. Korean input → Korean output, and when the output is Korean the headings are Korean too. Never bilingual headings, and never both sides of an `A / B` label — pick the one that matches the output language.

Line 1 of every answer is the mode line, in the output language: `Mode: cadence — 배틀패스`. An explicit `--mode` in the request always wins.

Template scaffolding must not leak into the answer. Never emit a count instruction as a heading ("3–5 retention proposals" → `## 제안`). Never carry an internal field name into the output ("Input interpretation" → `## 전제`). Never emit a placeholder, a bracketed field name, or an unfilled bullet. No emoji inside spec tables. The output must read as a document written for this product, not as a completed form.
<!-- /LANGUAGE -->
