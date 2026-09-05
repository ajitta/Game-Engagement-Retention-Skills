# Shared block contracts

Read this only when editing a `SKILL.md` body or when `scripts/check-shared-blocks.sh` fails — it is never read at runtime and carries no design guidance of its own.

Each block below is copied **byte-identically** into all three `SKILL.md` bodies (IRM, RSD, ADV). A skill file loads alone at invocation, so a rule missing from the file that fired does not exist for that run: duplication is unavoidable and is not the defect — divergence is. `scripts/check-shared-blocks.sh` extracts the text between each marker pair from each `SKILL.md`, `cmp`s it against this file, and fails CI on any difference. Copy everything **between and including** the `<!-- NAME -->` and `<!-- /NAME -->` markers — they are part of the copied text and are what the extractor keys on. Nothing inside a block is per-skill, so paste without edits.

````markdown
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
````

````markdown
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
````

````markdown
<!-- LANGUAGE -->
## Output language

Answer in the user's language. Korean input → Korean output, and when the output is Korean the headings are Korean too. Never bilingual headings, and never both sides of an `A / B` label — pick the one that matches the output language.

Line 1 of every answer is the mode line, in the output language: `Mode: cadence — 배틀패스`. An explicit `--mode` in the request always wins.

Template scaffolding must not leak into the answer. Never emit a count instruction as a heading ("3–5 retention proposals" → `## 제안`). Never carry an internal field name into the output ("Input interpretation" → `## 전제`). Never emit a placeholder, a bracketed field name, or an unfilled bullet. No emoji inside spec tables. The output must read as a document written for this product, not as a completed form.
<!-- /LANGUAGE -->
````
