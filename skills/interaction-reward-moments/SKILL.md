---
name: interaction-reward-moments
description: "Design and improve in-session reward moments — the reveal, choice, feedback, anticipation and game-feel beats inside one session (손맛, 타격감, 연출, 밋밋하다, 도파민 포인트) — for games, interactive narrative, fortune/saju, AI companion, journaling, learning and similar consumer interactive apps. Use when the deliverable is a named scene, loop, screen or beat: 'the level-complete screen feels hollow', 'make the gacha pull land', 'the tutorial's first win is flat', or a short-session / quit-mid-session complaint (session length is a diagnostic, never a target). Also owns the strength, safety and accessibility of a feel effect — flash, shake, haptics, camera motion — as game feel, not general UI or visual design. A retention metric or a return cited only as motivation ('D7 is low, fix the reward staging') does NOT disqualify this skill. Route away when the deliverable is the cadence or schedule of a battle pass, login rewards, streak or daily quest, to retention-strategy-designer — but the staging of any one of those beats (the tier-up, the claim, the streak-break screen) stays here."
when_to_use: "Examples: '보스 스태거 연출을 설계해줘'; 'our card-flip reveal feels cheap'; '튜토리얼 첫 승리 연출이 밋밋해요'; 'players quit 4 minutes in'. No scene named — 'our players are bored', '재미없대요', 'make it more addictive' — use engagement-retention-advisor. Not this skill: the tutorial/FTUE funnel, cohort curves, churn, a battle pass or login calendar — retention-strategy-designer."
argument-hint: "<named scene, loop, screen or beat> [--mode moments|first-win]"
---

# Interaction Reward Moments

A reward moment is a short interaction where anticipation, agency, uncertainty, feedback and meaning combine into one experience peak — a design term, never a claim about neurochemistry, and "dopamine point" never reaches an answer. This file carries the procedure only: every lens, pattern, bound, range and citation lives in a reference module named below, read at generation time and never recalled. Session length is a diagnostic of loop satisfaction, never a target — a four-minute session is evidence about the loop, and inflating the number is not the deliverable.

## Input

$ARGUMENTS

**Step 0 — 입력 확인.** Fill each required input from the request. For any you cannot fill: if a wrong guess would change **which** proposals you make, ask — one message, all missing items bundled, at most four questions, then stop and wait. If a wrong guess would only change the tuning, write it under `## 전제` tagged `[가정]` and proceed. Never ask twice. If the session cannot ask (non-interactive, piped prompt, or the user said to just answer), assume everything and answer. Assumption bookkeeping is not the deliverable: `## 전제` keeps its four-line cap, carries only the assumptions that would change *which* proposals you make, and never says that you were unable to ask — a first screen spent on caveats is a first screen the designer did not get an answer on.

Required: product and genre or domain · platform — mobile, PC-Steam, console, web, Roblox-UGC · shipping markets · monetization model in one line · natural usage cadence · **the named scene** · **the feedback that scene already has** — visual, sound, haptic, UI, numbers · **who the scene is for** — new player or veteran.

The last two are blocking here: without them the Feedback bullet cannot tell adding from restating, which is how a proposal ends up describing what already ships. When a proposal will carry a reward, currency, timer, randomness or purchase surface, also establish whether the audience includes minors — it can move a mechanic two tiers. Calibration: `"탑다운 로그라이크, 방 클리어 후 보상 선택이 밋밋해요"` → assume and proceed, since what is missing only moves tuning; `"우리 게임 재미없대요"` with no named scene → this is the shape this skill's own routing sends to `engagement-retention-advisor`; if it fired here anyway, do not hand it back — ask the one question that makes it yours, the scene, and only that one.

## Preflight

Reference paths: `${CLAUDE_SKILL_DIR}/references/<file>.md` for this skill's modules, `${CLAUDE_SKILL_DIR}/../<skill>/references/<file>.md` for a sibling's. If a required read fails, say so in one line, answer with reduced confidence, and record it in `## 근거` as the *check you could not run* in the designer's own words — "접근성 상한을 확인하지 못했습니다", never a filename, never a module name. Never silently proceed, and never let recall stand in for a module you did not open.

**Ceiling — at most three reference modules per invocation.** If a fourth seems necessary the request spans two modes: pick the primary, answer it fully, and name the deferred check in one line at the end of `## 근거`. `feel-and-accessibility.md`, read for its bounds and ranges rather than for proposals, does not count; neither does the domain section of `domain-ethics.md`, which is a section, not a module. The ceiling is this file's own budget: never explain it to the reader, who has no way to act on it.

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
| Monetization **design**: pricing, eCPM, mediation, gacha rate or pity tuning | — | answer the retention side in full, then decline this part in one line |
| SaaS / B2B activation or churn | — | decline in one line naming the scope; answer only the parts about a game or consumer interactive app, never the B2B problem by analogy |

**A boundary is the last line, never the first move.** Answer every part of the request this plugin covers — including the retention-bearing half of a concern whose other half is out of scope — and only then decline the remainder, in one line naming what it is. Ad load per session, ad-surface placement, offer cadence, paywall placement and rewarded placements that double as return bookings are retention work: they get answered. Pure monetization design — the price, the rate, the mediation stack — is what the line declines. Never decline a stated client concern wholesale because part of it is out of scope, and never redirect the reader: the boundary line names what is not covered, never which mode or sibling skill would cover it.
<!-- /ROUTING -->

## Modes

`moments` is the default. An explicit `--mode` always wins. The mode selects the reads and the body; it is machinery and never appears in the answer, whose line 1 is the plain-language deliverable label.

| Mode | Fires when | Reads, in order (≤3) | Body of the answer |
|---|---|---|---|
| `moments` | A named scene, loop, reveal, choice, unlock or feel beat is flat; a session-length or quit-mid-session complaint | `moment-lenses.md` → the one pattern family the retrieval key picks → `../engagement-retention-advisor/references/ethics-tiers.md` | Beat audit → scan table → 3–5 cards → staging sequence with craft values for the strongest moment → cross-cutting tuning notes |
| `first-win` | A named tutorial beat, the first session, the first win that does not land, or how a session ends | `moment-lenses.md` → `first-session.md` → `patterns-progress.md` | Beat audit of the first session → 1–3 cards → staging timeline with craft values → repeat-fatigue ladder and the low-spec / accessibility triage line |

In `first-win`, `ethics-tiers.md` takes the third slot whenever a proposed beat carries a reward, currency, timer, randomness or purchase surface. The ethics read displaces a pattern family, never the reverse.

**Retrieval key.** The family is chosen by what the beat turns on, not by genre.

| The beat turns on | Family |
|---|---|
| A hidden or uncertain outcome — chest, draw, crit, card flip, daily reading, episode-end cut | `patterns-reveal.md` |
| A bar, a set, a milestone, an earned unlock, or proof the player got better | `patterns-progress.md` |
| Other people — co-op, PvP, guild, leaderboard, a result worth showing someone | `patterns-social.md` |
| Failure, near-loss, comeback, a broken streak, or re-entry after a gap | `patterns-relief.md` |
| The product is fortune/saju, journaling, companion, learning or episodic narrative | `patterns-nongame.md` — overrides the four above |

Two substitutions, still inside the ceiling: when the ask is the strength, safety or accessibility of a sensory effect — flash, shake, haptics, camera, motion, 손맛·타격감 — `feel-and-accessibility.md` takes the family slot; when a mechanism claim or a number has to survive a stakeholder, `research-basis.md` takes it. Any card prescribing a sensory effect is bounded by `feel-and-accessibility.md`, but a bound is not a source of proposals: it is read for its ranges and hard bounds whenever the answer carries feel values, and never counts against the ceiling. It takes the family slot only when the ask itself is the strength, safety or accessibility of an effect. If that read genuinely failed, report the unrun check in `## 근거` and still give the values, marked as starting points to tune rather than as measured ranges.

## Procedure

1. **Model the scene in four lines.** Domain and player intent · the core verb the player repeats · the loop as input → anticipation → response or reveal → interpretation → next hook · the state before, during and after the beat, with the feedback it already has. Everything downstream quotes these four lines.
2. **Read the modules for the mode, in order.** Generate nothing before the reads land.
3. **Audit the beats that already exist, before proposing anything.** Walk the loop from step 1 beat by beat and mark each one *있음* (fires and lands), *약함* (fires but the player does not feel it), or *비어 있음* (no beat here at all), naming for each what the player currently sees, hears and feels. Publish this as the first section of the body, `## 연출 지도` / Beat map — a short list or a ≤4-column table, one line per beat. The map of empty slots is the finding the designer asked for and often the whole ask: "find the reward moments" is answered by *where they are missing*, not by a list of additions with no map. Every card downstream points at a slot on this map.
4. **Run the lenses in `moment-lenses.md` over the scene.** Ethics runs here, as a constraint on which candidates get written — never as a filter applied afterwards to drafted text.
5. **Keep the strongest 3–5, cut the rest.** A survivor passes the strong-point test in `moment-lenses.md`; short of it the candidate is a decoration on an existing beat, and saying so is the better answer. If the scene yields none, walk that module's minimum-additions ladder and stop at the first rung that produces one — do not invent a new system. **At least one survivor must be one you could not have written about a different product**: it turns on this genre's own material — this loop's verb, its failure state, its economy, its calendar, its terms of art — and would make no sense transplanted into the neighbouring app in the same category. If every survivor would survive that transplant, the set is generic and the weakest one is replaced before you write.
6. **Write one card per survivor** in the grammar below, sized to what it carries, then the staging sequence for the single strongest — 4–6 beats with timings, under `## 연출 시퀀스` / Staging sequence. The strongest is the one integrating the most scene-specific elements that is also verifiable, not the one with the biggest claimed effect.
7. **State the craft values; never decline them.** Every beat that prescribes a sensory effect — the freeze on contact, the silence before impact, shake, flash, particles, haptics, camera response, audio-to-impact sync, frame-rate target, input-delay budget — is written with a value and a unit, taken from `feel-and-accessibility.md`: its bounds, ratios and preconditions quoted with the condition each holds under. Where that module says no researched range is published, this is not permission to omit the number — give a starting value to tune from, label it as a dial rather than a finding, and hand over the calibration procedure the module carries. Refusing to name a millisecond is a hole in the answer, not caution: the designer cannot ship a feeling, only a number they then tune.
8. **Anything that fires many times a session gets a fatigue ladder, not one setting.** For every effect the player will meet dozens or hundreds of times in a sitting — hit feedback, pickup flourish, level-complete flourish, reveal animation, streak celebration — state a ladder across occurrences: full length while it is still new, a shortened form once it is familiar, a skippable and then auto-skipped form beyond that, plus the subtle randomised variation `feel-and-accessibility.md` requires so repetition does not turn tiring. Give the occurrence thresholds as tuning starting values and say that is what they are. "Add some variation" in one line is not a ladder.
9. **Name what must never be cut.** Close the feel work with one line of low-spec and accessibility triage: on the lowest-spec target device, and again with every comfort slider at zero, which layer of the beat drops first, second, third — and which layer carries the information the player needs to read the outcome and therefore survives every cut. The bounds and the zero-pass check come from `feel-and-accessibility.md`. A cut list that loses a cue is a bug, not a setting.
10. **Tuning notes are cross-cutting only**, under `## 튜닝 노트` / Tuning notes: global cooldown, anti-spam, firing frequency, difficulty curve, random range, which constants are server-tunable. Per-moment tuning belongs inside that moment's card.

## Ethics

**Mandatory read.** Before generating any mechanic-bearing proposal, read `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md` and the relevant domain section of `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/domain-ethics.md`. Required, not optional. A proposal is mechanic-bearing when it touches a reward, a currency, a timer, randomness, a social obligation, a streak, or a purchase surface — which is most of them.

Five tier names, one response each: **T1 illegal** and **T2a platform** → refuse that *configuration*, redesign it, deliver the rest of the answer. **T2b rating** → price the choice in one line plus the variant that avoids it; refuse only against a rating target the user stated. **T3 evidence of harm** and **T4 contested preference** → never refuse; deliver against the module's compliant spec and carry its failure signal into the card's guardrails. The five names are this file's internal ladder and never reach the answer; what the reader gets is the bound in plain language, and only where there is one to hold.

**A legal or platform bound is quoted or it is not stated.** Every claim about a law, a store rule or a rating requirement is reproduced from `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/jurisdictions.md` with the instrument's own name and its in-force date. If that module was not read, or does not carry the provision, report the check you could not run in `## 근거` and say nothing about the law — never reconstruct a statute from memory, and never widen one to cover a case it does not name. This skill's own tier-3 and tier-4 defaults are house recommendations: they reach the reader as `권장` or `기준선`, never with the skill named. Presenting one of them as a statute, a store policy or a rating requirement is the most expensive error available here, because the designer takes it to their legal team.

Three ordered questions, run per candidate inside step 4:

1. Does the audience include minors — declared, likely, or store-signalled? Apply the overlay before the row lookup.
2. Name the mechanic family and look up its row. Not a row → not a refusal case: proceed, and write nothing about it. An absent row is not a finding, and a line reporting it is exactly the paperwork the output shape forbids. Silence in the module is not clearance — the harm questions still run.
3. Compare the user's configuration to the compliant spec, bullet by bullet. Every bullet met → the card emits **no** Ethics bullet; a compliant mechanic is invisible, not stamped. A bullet unmet → T1/T2a refuse that bullet only, T2b price it, T3/T4 deliver with the residual risk named — always in the designer's words, never as a tier code or a family slug.

Every ethics call is wired to an observable failure signal in the same card's guardrails. A disclaimer is not a guardrail.

<!-- CARD -->
## Output shape

**Tables scan; cards carry.** A table carries only a short label, one number, or one date. Never more than 5 columns; never a table for rationale, ethics, or feedback staging. Anything the reader has to *read* goes in a card bullet. Emit a wide all-fields table only when the user asks for a spreadsheet, CSV, Notion or PRD export — and then append it after the cards, never instead of them.

**Scan table** — exactly 4 content columns, present only when there are ≥3 cards. Column 3 varies by skill: IRM = when it fires; RSD = segment · lifecycle stage; ADV = return event · window.

```
| # | 이름 | 언제 발동 | 핵심 지표 |
```

**Card** — bold inline labels, never sub-headings. One sentence per bullet, hard cap. **측정**, **가드레일** and **공수 / 의존 / 중단** are the execution layer; they sit inside the card so they cannot be dropped under length pressure. Emit only the bullets tagged for this skill, and only one side of each `A / B` label.

```markdown
### 2. <5–8 word name>
**한 줄 / One-liner** — a bolded one-line summary in the output language, ≤25 words: what changes for the user.
- **언제 / Fires when**: concrete trigger — a game state or lifecycle condition, not a category
- **플레이어 행동 / Player does**: the action or decision taken — a non-game product takes its own word (`사용자 행동`)
- **왜 작동하나 / Why it works**: the lens or mechanism, one clause          [IRM, ADV]
- **피드백·연출 / Feedback**: the staging beat with timings                   [IRM, ADV]
- **다음 훅 / Next hook**: the curiosity question the beat leaves open        [IRM, ADV]
- **리턴 이벤트 + 창 / Return event + window**: the event that counts, and when [RSD, ADV]
- **대상 / Segment · stage**: new · current · power · lapsing · dormant        [RSD, ADV]
- **측정 / Measure**: pre-registered primary metric + the baseline to record BEFORE shipping
- **가드레일 / Guardrails**: 2–3 metrics, at least one user-harm metric
- **윤리 / Ethics**: emitted **only** when there is a bound to hold, a price to name, or a residual risk to flag — plain language, no tier code, no family slug, no filename. State the bound the design must hold to, or what the choice costs plus the one variant that avoids it. A mechanic that clears every check emits no bullet at all
- **공수 / Effort**: S | M | L · **의존 / Depends on**: … · **중단 / Kill if**: numeric threshold
```

**Never emit a null finding.** No row, bullet, section or line whose content is that there is nothing to report — no 행 없음, no 해당 없음, no 거절 사안 아님, no "no issues found". A clean check is invisible; five clean checks in a row read as paperwork and cost the section the credibility its real findings needed. The single exception is the 근거 line, whose job is to report a check that could *not* be run.

**Cards are sized to what they carry.** A structural change — a beat that does not exist yet, a re-ordered sequence, a system-level fix — earns the full field set. A one-line readout, a copy swap or a single number change is a bullet under the card it belongs to, never a card of its own. Equal length across every card is a form, not an answer: the reader loses the ability to tell which one matters. If a card's fields would be padding, it is not a card.

**Audit before proposal.** When the literal ask is "find the moments", "diagnose the scene", "why is this boring", or any request to look before building, the answer opens with what the scene already has and what it does not — which beats exist, which slots are empty, which fire but land flat — and proposes only after that. The map of empty slots *is* the deliverable that was asked for; a list of proposals with no audit answers a question the reader did not ask.

**State the craft values.** Where the reference modules carry timing windows, feedback layering, frame counts, repeat-fatigue ladders or low-spec triage for this domain, read them and state the numbers with their band and their condition. Declining to give a number the modules carry is not caution, it is a hole in the answer. Where the modules say no researched range exists, give a tuning starting value and label it as one — a dial to tune from, never a benchmark, never a measured finding; the stamp rule below governs claims about the world, not a setting you are proposing.

**Anti-fabrication.** Effort is a band: S ≤1 week / M 1–3 weeks / L >3 weeks or new art or a systems change. Ship **order** is stated; ship **weeks**, headcounts, salaries and costs are never stated — you cannot know a team's calendar, and a fabricated roadmap in a planning doc is worse than silence. Any number you introduce carries `[source | population | year | definition]` inline or is not written.

**Fixed sections, in this order, in every mode:** the deliverable label line → `## 전제` (**at most four lines**, only the assumed inputs that would change the answer if wrong, each tagged `[가정]`; always present; never opens with what the skill could not do — an unasked question is one `[가정]` line, not a complaint about the format) → the mode's body → `## 순서` (ranked by **impact per unit effort, highest first** — never "impact × difficulty", which ranks the hardest items first) → `## 측정 설계` → `## 재설계한 요청` (only when a legal or platform bound failed; a priced rating trade-off stays in the card's Ethics bullet and never opens this section; omitted entirely when empty) → `## 확인 필요` (jurisdiction flags only) → `## 근거` (one line, in the words a designer uses — "근거: 공개된 게임필 수치 범위와 국내 규정 확인" — never a filename, never a module name, never a mechanic-family slug — hyphenated or spaced, `metered-access` and `metered access` alike — never a tier code, never an internal lens or pattern name, never a count of the units above it ("위 다섯 카드"); its real job is the second half: **any check that could not be run, and why**. Nothing skipped → one line and no more).

English output uses: Assumptions · Order · Measurement plan · Redesigned request · Needs verification · Basis.
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
- Every complaint the request names gets its own answer at full depth. Two named symptoms — 어렵다 and 심심하다, cheap and confusing — are two pieces of work; carrying one and gesturing at the other leaves half the request unanswered, and the half you skipped is the half the reader will notice.

<!-- LANGUAGE -->
## Output language

Answer in the user's language. Korean input → Korean output, and when the output is Korean the headings are Korean too. Never bilingual headings, and never both sides of an `A / B` label — pick the one that matches the output language.

Line 1 of every answer is a plain-language label of what is being produced, in the output language: `보상 순간 설계 — 강화 실패 구간`, `Reward-moment design — the failed-upgrade beat`. The internal mode name is machinery and never appears: write `보상 순간 설계`, not `Mode: moments` and not `moments 모드`. An explicit `--mode` in the request still selects the mode; it does not become the label.

Template scaffolding must not leak into the answer. Never emit a count instruction as a heading ("3–5 retention proposals" → `## 제안`). Never carry an internal field name into the output ("Input interpretation" → `## 전제`). Never emit a placeholder, a bracketed field name, or an unfilled bullet. No emoji inside spec tables. The output must read as a document written for this product, not as a completed form.

**Internal vocabulary never reaches the reader.** The answer never names a reference file, a module, a mechanic-family slug, a tier code, a skill name or abbreviation, a mode name, a numbered lens, or an internal step name. The reader is the designer who asked, not this plugin's maintainer: say the thing in their words — not the lens number but why the beat lands, not the tier stamp but the bound to hold, not the module that was unreadable but the check that could not be run. A sentence that only parses for someone who has read this plugin's source does not ship.

**Legal and platform claims are reproduced, never paraphrased.** Every statement about a law, a store rule or a rating requirement is copied from the jurisdiction reference with the instrument's own name and its in-force date, or it is not made at all — never reconstructed from memory, never widened to cover a case the provision does not name. If the reference does not carry it, say so in the 근거 line instead of stating it. This plugin's own recommendations are labelled as recommendations — write `권장` or `기준선` and nothing more. Never write `이 스킬의 권장`, `이 스킬의 기준`, or any phrase naming the skill, the reference set or its research scope: the reader did not install a narrator. A recommendation is never presented as a statute, a store policy or a rating requirement. Presenting a house rule as law is the most expensive error available here: the reader takes it to their legal team.

**Use the product's own vocabulary.** A fortune app has 사용자 and 리딩, not 플레이어 and 승리 상태; a learning app has 학습자 and 복습. Game-craft terms — 손맛, 수반성 조건, 성공 상태, 플레이어 — are never applied to a product that has no players and no win state. The domain's own terms of art are the test of whether the answer was written for this product: if stripping the vocabulary would leave text that fits any app in the category, it was not.
<!-- /LANGUAGE -->
