---
name: engagement-retention-advisor
description: "Produce integrated proposals connecting an in-session moment to a next-visit reason, for games, interactive narrative, fortune/saju, AI companion, journaling and learning apps. Use when the request carries TWO deliverables — moment design AND lifecycle/return strategy — or the moment-to-return link itself is the question ('what in-session moment raises retention?'), or a moment complaint is paired with a churn complaint ('combat feels flat and players churn'), or the ask is to compare, sequence or prioritize a moment-level against a lifecycle-level investment. Also owns a single named system whose value spans a session and a return: guild/clan, UGC and creation-sharing, meta-progression, in-game economy. A retention metric cited only as motivation is NOT a second ask. Moment only, use interaction-reward-moments; lifecycle only, use retention-strategy-designer. Outputs integrated cards, sequencing, measurement."
when_to_use: "Examples: '길드 시스템 설계해줘, 사람들이 계속 하게'; 'design reveal moments and a week-2 return plan'; '전투 손맛도 살리고 이탈도 줄이고 싶어요'; 'better combat feel or a win-back push first?'; 'how should meta-progression carry between runs?'. Korean triggers: 뭐부터 먼저, 재미도 살리고 다시 오게, 길드, 메타 성장, 유저 경제."
user-invocable: true
argument-hint: "<product + the two deliverables, or the named system> [--mode integrate|compare|system]"
---

# Engagement & Retention Advisor

The seam skill: one in-session moment, one reason to come back, and the mechanism that carries value from the first to the second. Integration is not two lists concatenated — a proposal earns a card here only when the moment and the return loop hold each other up. This skill reads sibling *reference modules*, never a sibling `SKILL.md`.

## Input

$ARGUMENTS

When that is empty, the request is whatever the user asked in the conversation; treat it identically.

## 입력 확인

Fill each required input from the request. For any you cannot fill: if a wrong guess would change **which** proposals you make, ask — one message, all missing items bundled, at most four questions, then stop and wait. If a wrong guess would only change the tuning, write it under `## 전제` tagged `[가정]` and proceed. Never ask twice. If the session cannot ask (non-interactive, piped prompt, or the user said to just answer), assume everything, and make `## 전제` the first thing in the answer.

Required: product and genre or domain · platform · shipping markets · monetization model in one line · natural usage cadence · the named scene or the named metric. **This skill also requires** which layer the team can actually ship this quarter — without it the sequencing is invented rather than recommended. When a mechanic-bearing proposal is in play, also ask whether the audience includes minors; it can move a mechanic two tiers.

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

| Mode | Fires when | Reads (≤3, in order) | Body of the answer |
|---|---|---|---|
| `integrate` (default) | Two deliverables, or the moment-to-return link itself | `moment-lenses.md` → `integration-patterns.md` → `ethics-tiers.md` | Scan table + 3–5 integrated cards + `## 따로 볼 것` |
| `compare` | Which-first, sequencing, prioritization, "should we build it at all" | `integration-patterns.md` → `retention-playbook.md` | Options table + measurement order + at most one card |
| `system` | One named cross-layer system: guild/clan, UGC, meta-progression, in-game economy | `systems-catalog.md` → `ethics-tiers.md` → `domain-ethics.md` | System sheet + 2–3 sub-mechanic cards + instrumentation |

**Paths.** This skill's own modules are `${CLAUDE_SKILL_DIR}/references/<file>.md`: `ethics-tiers.md`, `domain-ethics.md`, `jurisdictions.md`, `korea-market.md`, `integration-patterns.md`, `systems-catalog.md`. Two are siblings: `${CLAUDE_SKILL_DIR}/../interaction-reward-moments/references/moment-lenses.md` and `${CLAUDE_SKILL_DIR}/../retention-strategy-designer/references/retention-playbook.md`.

**Ceiling: three reference modules per invocation.** If a fourth seems necessary, the request spans two modes — pick the primary, answer it completely, and name in one line what was deferred and which mode answers it. Two situational reads *replace* one of the three rather than adding a fourth: `jurisdictions.md` when a T1/T2 candidate appears or the shipping market is unstated, and `korea-market.md` when the market is Korean and the ask turns on local product convention.

## Preflight

Every read named above is required, not conditional. If a read fails, say so in one line naming the file, answer with reduced confidence, and record the failure in `## 읽은 근거`. Never silently proceed from memory: the facts left this body on purpose, so an unread module means you do not have them.

## Procedure

1. **Product model.** Core value, core interaction, current loop, natural usage cadence, and the **return event** — a defended event a user would recognise as coming back for this product's value. "App opened", "session started" and "logged in" are not return events; if the user supplies one, replace it and say what you replaced it with and why.
2. **Split into two layers.** Moment layer: what is satisfying inside one session — read `moment-lenses.md` and work from its lenses, not from memory. Lifecycle layer: why return tomorrow, next week, next month — return event, cadence, lifecycle stage, leak window.
3. **Recombine only where the layers reinforce each other.** Read `integration-patterns.md` for the named pairings and the failure mode that collapses each one. There is no separate integration-rationale section any more: that sentence is the card's **왜 작동하나 / Why it works** bullet — one clause naming what accumulates and how it carries across the gap.
4. **Sort the residue.** A moment with nothing that accumulates is engagement-only; a loop with no in-session satisfaction is retention-only and gets redesigned, not shipped. Both go under `## 따로 볼 것`, one line each — never into a card.
5. **Ethics during generation, then order and measure.** Run the ethics procedure below on each proposal as you write it, not as a filter afterwards.

## Ethics

**Mandatory read.** Before generating any mechanic-bearing proposal, read `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md` and the relevant domain section of `${CLAUDE_SKILL_DIR}/references/domain-ethics.md`. Required, not optional. This body carries no per-mechanic rules, no tier assignments and no legal claims — they live in those modules and in `jurisdictions.md`. Judging from memory is the exact failure this split exists to prevent.

Four tiers: **T1** illegal · **T2a** platform policy with no compliant version · **T2b** costs an age band or a classification · **T3** published evidence of user harm · **T4** contested preference. Refusal fires on T1 and T2a only, and only on the failing bullet — the rest of the answer ships normally. T2b is priced in one line plus the variant that avoids it. T3 and T4 never produce refusal language; they ship against the module's compliant spec plus a failure-signal metric.

Per proposal, in order: (1) does the audience include minors — apply the overlay before the lookup; (2) name the mechanic family and look up its row — no row means no refusal, and say so in one clause, because silence is not clearance; (3) compare the user's configuration to the compliant spec bullet by bullet. Every bullet met → the Ethics bullet reads `T<n> <family> ✓` and nothing else is emitted.

Name the ethics **per mechanic**, and wire each one to an observable failure signal in that same card's Guardrails bullet. An ethics line that no metric can falsify is a disclaimer, and this skill does not write disclaimers.

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

## Mode bodies

Inside that fixed order, the mode's body is:

- **`integrate`** — scan table (column 3 = return event · window) → 3–5 integrated cards, each carrying both a moment and a return mechanism → `## 따로 볼 것` for the engagement-only and retention-only residue.
- **`compare`** — an options table `| 옵션 | 임팩트 | 공수 | 의존 |` → the **measurement order**: which layer must be instrumented and read first, and why the other option's result is uninterpretable until it is → at most one card, emitted only when the two layers genuinely reinforce each other. A which-first question answered with five proposals is a non-answer.
- **`system`** — a two-column `| 필드 | 값 |` system sheet (in-session use · what accumulates · the return event it creates · who sets the appointment, the player or the server clock · dominant failure mode · ethics families in play) → 2–3 sub-mechanic cards → the instrumentation that would prove the system works.

<!-- LANGUAGE -->
## Output language

Answer in the user's language. Korean input → Korean output, and when the output is Korean the headings are Korean too. Never bilingual headings, and never both sides of an `A / B` label — pick the one that matches the output language.

Line 1 of every answer is the mode line, in the output language: `Mode: cadence — 배틀패스`. An explicit `--mode` in the request always wins.

Template scaffolding must not leak into the answer. Never emit a count instruction as a heading ("3–5 retention proposals" → `## 제안`). Never carry an internal field name into the output ("Input interpretation" → `## 전제`). Never emit a placeholder, a bracketed field name, or an unfilled bullet. No emoji inside spec tables. The output must read as a document written for this product, not as a completed form.
<!-- /LANGUAGE -->

## Quality bar

- **Bound to this product.** Every proposal names the user's scene, their systems and their rules. A card that would survive a find-and-replace of the product name is generic advice — rewrite it or drop it.
- **Return event, defended.** State what counts as a return and why that event carries this product's value, in the card and again in `## 측정 설계`.
- **Measurement, not hope.** One pre-registered primary metric per proposal; its baseline measured on the current build *before* shipping; same-week cohorts compared only against same-week cohorts; a holdout kept, not converted; the result re-read at 2–4 weeks so novelty is separated from lift. Resurrection work is judged on re-dormancy at +30d, not on the return itself.
- **Guardrails that can catch harm.** At least one user-harm metric per card beyond crash rate — opt-out, notification-permission revocation, uninstall, refund rate, and the frequency of 강제 / 부담 / 매일 in reviews. Read over-engagement as an alarm: session length or DAU rising while opt-out or uninstall rises is a failure that looks like a win.
- **No forced conversion.** Not every good moment owes the product a return loop, and a retention goal may not flatten a named scene into generic lifecycle advice.
- **Say what you read.** `## 읽은 근거` lists the modules actually read, and a skipped mandatory read is named there.
