---
status: shipped-partly-superseded
revised: 2026-09-06
---

# Design: Engagement & Retention Skills v2

> **This is the plan v2 was built from, not the contract it ships under.** v2 shipped at
> 2.0.0 and is now at 2.2.1. `skills/engagement-retention-advisor/references/contracts.md`
> is the shipped output contract and **supersedes §4 wherever the two disagree** — it
> forbids the literal `Mode:` line, renames `## 읽은 근거` to `## 근거`, and bans printed
> tier codes and family slugs, all of which this document still specifies. Points changed
> during implementation carry a **[SUPERSEDED]** marker inline; the reasoning around them
> is kept because it records *why*. `CHANGELOG.md` is what actually shipped; `05-plan.md`
> is what is still open.

v2 keeps the three skills, their names, their directories and the deliverable-based routing rule that scored 28/30 in the live routing run, and spends the whole budget on two things the evidence actually indicts: what the skills say, and what shape they say it in. The 8/9/10-column tables become a ≤4-column scan table plus one card per proposal. Each skill gains named output **modes** so a pasted cohort table earns a curve reading instead of five proposals and a battle-pass ask earns a fillable spec sheet. Every fact leaves the three `SKILL.md` bodies for on-demand reference modules under a single enforceable invariant — **a SKILL.md may contain a procedure, never a fact** — which kills the seven-place ethics drift structurally rather than by discipline. The absolute prohibition list becomes a four-tier model (illegal / rating-or-platform / evidence-of-harm / contested preference) where refusal fires only on tier 1 and tier 2a, and every tier-3 mechanic ships a measurable compliant spec instead of a ban. Monetization enters scope as retention tension only; SaaS leaves scope; games go deep.

Preserved verbatim because the blind A/B judges credited them: return-event rigor, same-week cohorts, kept holdouts, the 2–4 week novelty window, +30d re-dormancy, guardrail metrics beyond crash rate, and naming the exact dark pattern then re-listing it as a failure signal in the metrics section.

**The one sentence to remember:** the plugin lost 0/3 blind A/B on rendering and execution, not on reasoning — so v2 changes the output shape, adds the missing content, and does not touch the one thing that was externally validated.

---

## 1. Design decisions and their evidence

| Decision | Evidence | Replaces | Risk accepted |
|---|---|---|---|
| **D1** Four-tier ethics; refusal only on T1/T2a | 02f §4: of 8 forbidden families only 2 are illegal anywhere, 2 carry rating prices, 2 rest on harm evidence, 2 are preferences | Flat "Forbidden" lists in 7 places (M19) | Tiering is a rationalization surface; T3 could bless an unstudied harm |
| **D2** Monetization in scope as retention tension only | M04 CONFIRMED: zero hits for ARPDAU/LTV/ARPU; live routing #17 fired no skill; advisor declined a third of a client ask | Monetization as forbidden-only vocabulary | The out-of-scope line (pricing, eCPM, pity tuning) is untested and may read as unhelpful |
| **D3** Games deep; keep 5 non-game domains; SaaS out | M06 CONFIRMED (genre/platform blind); M33: SaaS named by one description, no ethics domain, no moment home | "app, game, SaaS, content product" catch-all | A B2B user gets a fast decline instead of a bad answer — deliberate |
| **D4** Cards replace wide tables everywhere | M01 CONFIRMED twice; all three blind judges named the table a top defect | 8/9/10-column tables in 3 SKILL.md + pattern-library.md:196 | Cards are longer; the rematch may say "thorough and exhausting" |
| **Arch** Three skills frozen; modes + deep reference shelf | 28/30 live routing (only measured asset); every confirmed high-severity finding is content or shape, none says the split is wrong | A rename, a fourth skill, or a `kb/` directory | Mode selection is a new, unmeasured routing surface |
| SKILL.md carries procedure, never a fact | M19 + M20: ethics restated 7×, routing copied 3× — both already diverged | "Keep the copies in sync by discipline" | A release-time grep is heuristic, not a type system |
| One canonical shared file, sibling-relative read | M11 **REFUTED** — the loader prepends "Base directory for this skill:" for plugin *and* filesystem skills, so `../` resolves | 02i §3's advice to triplicate `domain-ethics.md` with a `cmp` gate | A *partial* manual copy (1 of 3 skill dirs) breaks the read; mitigated by a preflight rule |
| ≤3 reference modules read per invocation | 02i §5: `pattern-library.md` alone is ~3,389 tok; advisor's real worst case ~11k vs a documented 2.1k | "Read the playbook" | A mode that needs a 4th file must defer and say so |

M07 is **CONTESTED** (a refuter showed the plugin already has a two-level "do not recommend" vs "flag" split at IRM SKILL.md:54–56, and that free/earned streak freezes and 기다리면 무료 are not actually forbidden by the current text). M14–M33 were not put through the verification pass and are **PLAUSIBLE**, not CONFIRMED; the load-bearing quotes behind cadence-systems, genre-profiles and the intake step were re-checked against the files directly, the severity ordering was not.

---

## 2. Architecture

Three invocable skills, unchanged names, unchanged directories, unchanged namespace `game-engagement-retention-skills:<skill>`.

- **`interaction-reward-moments` (IRM) — the scene.** One interaction inside one session: anticipation, reveal, choice, feedback, game feel, mastery, first win, session-exit closure, and the accessibility of every sensory effect it prescribes. Session length stays a diagnostic, never a target.
- **`retention-strategy-designer` (RSD) — the lifecycle and the calendar.** A cohort over time, plus everything on a multi-day clock: return events, cohorts, leak windows, activation, habit, churn, resurrection, notifications, cadence systems, LiveOps, meta-progression pacing, metric semantics, instrumentation, and the retention side of monetization.
- **`engagement-retention-advisor` (ADV) — the seam.** Two-deliverable asks, the moment-to-return link, cross-layer sequencing, and one named system whose value spans a session and a return (guild/clan, UGC, meta-progression, in-game economy). v2 stops it being a pure router: it owns `integration-patterns.md` and `systems-catalog.md`, and it never reads a sibling `SKILL.md` again.

```
Game-Engagement-Retention-Skills/
├── .claude-plugin/
│   ├── plugin.json                              EDIT   drop "skills" key, add displayName + experimental.evals
│   └── marketplace.json                         **[SUPERSEDED]** deleted in 2.2.0 — the catalog
│                                                repository ajitta/claude-plugins owns the manifest
├── CHANGELOG.md                                 NEW    semver + "which skill now fires differently"
├── README.md                                    REWRITE see §9
├── LICENSE                                      KEEP
├── .gitignore                                   EDIT   add .claude/, CLAUDE.local.md, .serena/
├── IMPLEMENTATION_NOTES.md                      DELETE from root → docs/notes/2026-07-hardening.md
├── scripts/
│   ├── check-shared-blocks.sh                   NEW    diff 3 fenced blocks vs contracts.md
│   ├── check-no-facts-in-skills.sh              NEW    grep SKILL.md for digits+%, jurisdiction names, "forbidden"
│   └── check-ethics-rows.sh                     NEW    fail if a T3 row lacks a numeric compliant spec
├── evals/                                       NEW    see §10
├── docs/features/engagement-retention-v2/       KEEP   **[SUPERSEDED]** the §9 exclusion was
│                                                       considered and deliberately not taken:
│                                                       ~648 KB of docs ships to installers
└── skills/
    ├── interaction-reward-moments/
    │   ├── SKILL.md                             REWRITE ~130 lines, procedure only
    │   └── references/
    │       ├── moment-lenses.md                 NEW    10 lenses + strong-point test (also read by ADV)
    │       ├── patterns-reveal.md               NEW    ] split of pattern-library.md
    │       ├── patterns-progress.md             NEW    ] on retrieval key, not size
    │       ├── patterns-social.md               NEW    ]
    │       ├── patterns-relief.md               NEW    ]
    │       ├── patterns-nongame.md              NEW    ] fortune / journaling / companion / learning / narrative
    │       ├── first-session.md                 NEW    first win, FTUE, stopping point, Pivot Point
    │       ├── feel-and-accessibility.md        NEW    juice dose + WCAG/XAG hard bounds
    │       ├── research-basis.md                REWRITE per 02a §10
    │       └── pattern-library.md               DELETE  superseded by the five family files
    ├── retention-strategy-designer/
    │   ├── SKILL.md                             REWRITE ~135 lines
    │   └── references/
    │       ├── retention-playbook.md            REWRITE core model, return event, lifecycle, leak windows — facts removed
    │       ├── metric-definitions.md            NEW    the four axes; vendor convention table
    │       ├── benchmarks.md                    NEW    population-tagged rows + Do-not-quote list
    │       ├── experiments.md                   NEW    baseline-first, power, holdout, τ(t), guardrails
    │       ├── liveops-cadence.md               NEW    pass/quest/login/energy/streak/notification/win-back specs
    │       ├── genre-profiles.md                NEW    11 genre profiles + platform branch
    │       ├── churn-and-winback.md             NEW    signals → diagnostics; win-back by lapse cause
    │       └── retention-economics.md           NEW    LTV ≈ ARPDAU × ΣR(d); ad load; paywall; boundary line
    └── engagement-retention-advisor/
        ├── SKILL.md                             REWRITE ~130 lines
        └── references/
            ├── ethics-tiers.md                  NEW    canonical protocol — read by all three
            ├── domain-ethics.md                 REWRITE same path; Forbidden → tier + compliant spec
            ├── jurisdictions.md                 NEW    dated legal snapshot, Korea first
            ├── korea-market.md                  NEW    non-legal Korea: market, 사주, 기다리면 무료, vocabulary
            ├── integration-patterns.md          NEW    moment → return pairings
            ├── systems-catalog.md               NEW    guild / UGC / meta-progression / economy
            └── contracts.md                     NEW    canonical routing block, card grammar, language rule (not read at runtime)
```

24 reference modules, 3 bodies. Runtime cost is bounded by the ≤3-reads-per-invocation cap, not by corpus size. Maintenance cost is bounded by a **one-topic-one-owner table** in `CONTRIBUTING.md` (streaks: mechanic → `domain-ethics.md`, cadence → `liveops-cadence.md`, habit evidence → `retention-playbook.md`; a term appearing *normatively* in two modules fails `check-no-facts-in-skills.sh`'s second pass).

---

## 3. Routing contract

**Canonical file:** `skills/engagement-retention-advisor/references/contracts.md`, fenced block `<!-- ROUTING -->`. It is never read at runtime. The block is copied byte-identically into all three `SKILL.md` bodies — each file loads alone at invocation, so a rule missing from the file that fired does not exist for that run (M20 CONFIRMED). `scripts/check-shared-blocks.sh` extracts the block from each `SKILL.md`, `cmp`s it against `contracts.md`, and fails CI on any divergence. Duplication is unavoidable; divergence is the defect, and the diff removes the mechanism.

**The rule, unchanged in principle:**

> Route on the **deliverable**, not on keyword presence. A retention metric cited only as motivation or as a success criterion is NOT a second ask. When the deliverable is a *named artifact* rather than a layer, route by its row in the table below and use the mode named there. Ambiguous **and** the choice materially changes the output → ask one bundled question. Hand off at most once per turn, never back to the skill that handed to you; then answer in place.

**Hand-off ladder** (replaces three divergent blocks): (1) do not hand off — a hand-off is a routing failure the user pays for twice; (2) invoke `game-engagement-retention-skills:<skill>` via the Skill tool; (3) if that is denied, read the sibling's *reference module* at `${CLAUDE_SKILL_DIR}/../<skill>/references/<file>.md` — never another `SKILL.md`; (4) proceed in place under this skill's guardrails and say so in one line.

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

**How the two live misses and two ambiguity probes are resolved.** #26 (analytics events) → RSD `instrument`. #27 (rolling vs classic) → RSD `read`, answered in two to four paragraphs with no proposals. Meta-progression (#12) splits by artifact: the *pacing plan* is RSD `calendar`, the *system design* is ADV `system`, the *unlock reveal* is IRM `moments`. ARPDAU (#17) → RSD `economics`, because the module that answers it lives in RSD and a trade-off between two lifecycle investments is a lifecycle deliverable. Pure monetization design is declined explicitly, so the boundary is a decision rather than a silence.

**Where the trigger text lives.** The 22-row table is in the body and only helps after a skill fires. Pre-fire triggers live in `description` + `when_to_use` (§8). "Tutorial drop-off is a funnel symptom, not a deliverable — route on the artifact asked for" is stated in all three bodies (02c skill implications).

---

## 4. Modes and output shapes

Eleven modes. Each declares a default, prints itself on line 1 of the answer (`Mode: cadence — 배틀패스`) so a wrong mode costs one word to correct, and names ≤3 reference modules. `argument-hint` gains `[--mode <name>]`; an explicit `--mode` always wins.

> **Superseded by the 2026-09 polish pass — `contracts.md` is the shipped contract.** The mode name is machinery and never reaches the reader. Line 1 is a plain-language deliverable label in the output language (`보상 순간 설계 — 강화 실패 구간`); `--mode <name>` still selects the mode, but does not become the label.

### 4.1 The card grammar

Canonical in `contracts.md`, inlined into each body (the shape must be present at generation time even if a read is skipped — the one place inlining beats referencing).

> **Tables scan; cards carry.** A table carries only a short label, one number, or one date. Never more than 5 columns; never a table for rationale, ethics, or feedback staging. Anything the reader has to *read* goes in a card bullet. Emit a wide all-fields table only when the user asks for a spreadsheet, CSV, Notion or PRD export — and then append it after the cards, never instead of them.

**Scan table** — exactly 4 content columns, present only when there are ≥3 cards:

```
| # | 이름 | 언제 발동 | 핵심 지표 |
```

Column 3 varies: IRM = when it fires; RSD = segment · lifecycle stage; ADV = return event · window.

**Card** — bold inline labels, not sub-headings (sub-headings triple vertical cost and reintroduce visible scaffolding). One sentence per bullet, hard cap. The last three bullets are the execution layer that lost all three A/B runs; they sit **inside** the card so they cannot be dropped under length pressure.

```markdown
### 2. <5–8 word name>
**One-liner** — ≤25 words: what changes for the user.
- **언제 / Fires when**: concrete trigger — a game state or lifecycle condition, not a category
- **플레이어 행동 / Player does**: the action or decision taken
- **왜 작동하나 / Why it works**: the lens or mechanism, one clause          [IRM, ADV]
- **피드백·연출 / Feedback**: the staging beat with timings                   [IRM, ADV]
- **리턴 이벤트 + 창 / Return event + window**: the event that counts, and when [RSD, ADV]
- **대상 / Segment · stage**: new · current · power · lapsing · dormant        [RSD, ADV]
- **측정 / Measure**: pre-registered primary metric + the baseline to record BEFORE shipping
- **가드레일 / Guardrails**: 2–3 metrics, at least one user-harm metric
- **윤리 / Ethics**: **[SUPERSEDED]** — a compliant mechanic emits **no Ethics bullet at all**.
  Tier codes and family slugs are internal keying and never reach the reader; the bullet appears
  only when there is a bound to hold, a price to name, or a residual risk to flag
- **공수 / Effort**: S | M | L · **의존 / Depends on**: … · **중단 / Kill if**: numeric threshold
```

**Anti-fabrication rule, attached to the card because the card invites invention.** Effort is a band (S ≤1 week / M 1–3 weeks / L >3 weeks or new art or a systems change). Ship **order** is stated; ship **weeks**, headcounts, salaries and costs are never stated — the model cannot know a team's calendar and a fabricated roadmap in a planning doc is worse than silence. Any number the skill introduces carries `[source | population | year | definition]` or is not written.

**Cards absorb the old per-item sections** rather than sitting beside them, or the same content ships twice: IRM's "Tuning notes" narrows to cross-cutting parameters only (global cooldown, anti-spam, difficulty curve, which constants are server-tunable); ADV's "Integration rationale" collapses into the card's *why it works* line; RSD's per-row Experiment collapses into **측정**.

**Fixed sections, in this order, in every mode:** `Mode:` line → `## 전제` (every assumed input, tagged `[가정]`; always present) → the mode's body → `## 순서` (ranked by **impact per unit effort, highest first** — never "impact × difficulty", which literally ranks the hardest items first) → `## 측정 설계` → `## 재설계한 요청` (only when a T1/T2a bound failed) → `## 확인 필요` (jurisdiction flags only) → `## 읽은 근거` (the reference modules actually read, one line).

`## 읽은 근거` is a compliance device, not decoration: it makes a skipped mandatory read visible to the user and gradeable by an eval. It is the answer to this design's largest risk.

> **Superseded by the 2026-09 polish pass — `contracts.md` is the shipped contract.** The section is `## 근거`, and the first item of the fixed order is the plain-language deliverable label, not a `Mode:` line. `## 근거` is one line in the words a designer uses; it never names a reference file, a module, a lens or a pattern, and its real job is naming any check that could **not** be run. `## 전제` is capped at four lines. `## 재설계한 요청` opens only on a failed legal or platform bound — a priced rating trade-off stays in the card's ethics bullet.

### 4.2 Mode → artifact map

| Skill · mode | Fires when | Reads (≤3) | Output artifact |
|---|---|---|---|
| IRM `moments` (default) | A named scene, loop or beat is flat | lenses + 1 pattern family + ethics-tiers | Scan table + 3–5 cards + staging sequence + tuning |
| IRM `first-win` | Tutorial/FTUE beat, first session | lenses + first-session + patterns-progress | 1–3 cards + staging timeline + accessibility check |
| RSD `strategy` (default) | Open lifecycle ask | playbook + genre-profiles + ethics-tiers | Scan table + 3–5 cards + 순서 + 측정 설계 |
| RSD `read` | A number, curve or definition is the object | metric-definitions + benchmarks | Definition check + curve reading + ≤2 hypotheses. **No proposal cards.** |
| RSD `cadence` | A named mechanic is the deliverable | liveops-cadence + ethics-tiers + jurisdictions | 2-column `Field \| Value` spec sheet + acceptance bounds + reviewer flags + one worked fill |
| RSD `calendar` | A dated multi-week plan | liveops-cadence + genre-profiles | `Week \| Beat \| Type \| Return event \| Metric` + 3 mini-cards + cadence-collision check |
| RSD `economics` | Revenue vs retention trade-off | retention-economics + experiments | LTV frame + worked break-even + bounds. ≤2 cards |
| RSD `instrument` | Tracking plan, event taxonomy, experiment design | experiments + metric-definitions | `Event \| Fires when \| Properties \| Answers` + return-event and cohort-key defs |
| ADV `integrate` (default) | Two deliverables, or the link | lenses + integration-patterns + ethics-tiers | Scan table + 3–5 integrated cards + `## 따로 볼 것` |
| ADV `compare` | Which-first / sequence / build-or-not | integration-patterns + playbook | `옵션 \| 임팩트 \| 공수 \| 의존` + measurement order + ≤1 card |
| ADV `system` | One named cross-layer system | systems-catalog + ethics-tiers + domain-ethics | System sheet + 2–3 sub-mechanic cards + instrumentation |

Two-column tables cannot collapse in a terminal — which is exactly why a mechanic **spec** stays a table while a **proposal** becomes a card.

**Ceiling rule, stated in every body:** read at most three reference modules. If more seem necessary, the request spans two modes — pick the primary, answer it, and name in one line what was deferred.

### 4.3 One filled card, in Korean

`보상 순간 설계 — 퍼즐 RPG 스킬 게이지`

> **Superseded by the 2026-09 polish pass — `contracts.md` is the shipped contract.** This example is shown in its corrected form: line 1 is a plain-language deliverable label, never `Mode: <name>`.

```markdown
| # | 이름 | 언제 발동 | 핵심 지표 |
|---|---|---|---|
| 1 | 예고된 만충 | 다음 매치로 게이지가 찰 것이 확정된 순간 | 예고 색 일치율 (우연 기준선 대비) |
| 2 | 홀드 or 즉발 | READY 상태에서 턴 시작 | READY→탭 지연 분포의 3봉우리 유지 |

### 1. 예고된 만충
**한 줄** — 게이지가 "곧 찬다"는 사실을 플레이어가 한 턴 먼저 알고, 그 턴을 스스로 설계하게 만든다.
- **언제** — 남은 게이지 ≤ 1매치분이고, 보드에 해당 색 3매치 이상이 성립할 때 (턴 시작 시 1회 판정)
- **플레이어 행동** — 예고 색을 지금 터뜨릴지, 한 턴 미뤄 더 큰 연쇄를 만들지 선택
- **왜 작동하나** — 역량 성장이 눈에 보이는 순간(수행 성공이 아니라 능력 상승) + 결과를 읽을 수 있는 제한된 불확실성
- **피드백·연출** — 예고 색 테두리 점멸(2회 상한) → 만충 시 120ms 히트스톱 → 전용 SFX 레이어 → 배율이 읽히는 수치 표기
- **다음 훅** — 만충 스킬이 다음 웨이브의 약점 속성을 미리 비춘다
- **측정** — 예고 색 일치율을, 예고 없이 만충되는 색 분포(우연 기준선)와 비교. 기준선은 현재 빌드를 먼저 계측한 뒤 배포
- **가드레일** — 잔량은 색·개수로만 표시(위치 힌트 금지, 퍼즐을 대신 풀어주지 않는다) · 연쇄 유발 게이지 충전에 감쇠 적용 · 알림 옵트아웃률
- **윤리** — `T3 metered-access ✓` (게이지 즉시 충전 판매 없음)
- **공수** — S (클라이언트 단독, 상수는 리모트 컨피그) · **의존** — 없음 · **중단** — 예고 색 일치율이 우연 기준선 +5%p 미만이면 롤백
```

**Language contract** (tightened; all three judges read the skill arm as a filled template): Korean input → Korean output, and when the output is Korean the headings are Korean. Never bilingual headings. Never emit a count instruction as a heading ("3-5 retention proposals" → "제안"). Never carry an internal field name into the output ("Input interpretation" → "전제"). No emoji inside spec tables. One line added to every Quality Bar: *the output must read as a document written for this product, not as a completed form.*

---

## 5. Intake and assumptions

`## Input` + `$ARGUMENTS` sits above the mode selector in all three bodies — today all three declare `argument-hint` and none references `$ARGUMENTS`, so an explicit `/skill` call is indistinguishable from an auto-trigger and the skill cannot tell whether asking is even possible.

**Step 0 `## 입력 확인`, worded identically in all three files:**

> Fill each required input from the request. For any you cannot fill: if a wrong guess would change **which** proposals you make, ask — one message, all missing items bundled, at most four questions, then stop and wait. If a wrong guess would only change the tuning, write it under `## 전제` tagged `[가정]` and proceed. Never ask twice. If the session cannot ask (non-interactive, piped prompt, or the user said to just answer), assume everything, and make `## 전제` the first thing in the answer.

**Shared required inputs:** product and genre or domain · platform (mobile / PC-Steam / console / web / Roblox-UGC) · shipping markets · monetization model in one line · natural usage cadence · the named scene or the named metric.

| Skill | Adds | Why it is blocking |
|---|---|---|
| IRM | The scene's **existing** feedback (visual/sound/haptic/UI/numbers); who it is for (new vs veteran) | Without it the Feedback bullet cannot distinguish adding from restating — a live gap in the v1 template |
| RSD | Retention numbers **with provenance**: tool, return rule, day boundary, denominator, return event | Rolling vs classic runs 2–3× apart; calendar vs 24h gave 43% vs 32% D1 on the same app (Amplitude, 2025, https://amplitude.com/docs/analytics/charts/retention-analysis/retention-analysis-time). A mismatch shifts **which** leak window gets diagnosed |
| RSD | DAU band, payer split, acquisition mix | Feeds the experiment-feasibility gate |
| ADV | Which layer the team can actually ship this quarter | Makes sequencing honest instead of invented |
| All, **when a mechanic-bearing proposal is in play** | Does the audience include minors? | Flips the minors overlay, which can move a mechanic two tiers (02f §5). Not asked in `read` or `instrument` mode — it changes nothing there |

**Calibration, worked:**

- `"우리 D7이 나쁨, 이탈 줄여줘"` → **ASK.** Product, cadence, metric provenance and platform are all missing and each changes which proposals appear.
- `"탑다운 로그라이크, 방 클리어 후 보상 선택이 밋밋해요"` → **ASSUME.** The scene is named and the genre implies the cadence; what is missing only moves tuning. `[가정]` mobile, solo, no monetization stated.
- `"Design a battle pass for our shooter"` → **ASK once, bundled:** content-pipeline capacity (drives season length), target rating, payer split. Pass parameters are *derived* from these, so guessing produces a spec that looks authoritative and is fiction.
- `"Compare rolling vs classic retention"` → **NEVER ask.** `read` mode, two to four paragraphs.
- `"Our players are bored"` with no named scene → **ASK one question.** The existing rule, and the one case where it demonstrably fired in the live routing run.

**`read` mode is permitted to stop.** If the tool/convention and denominator cannot be answered, the deliverable is the sentence *"I cannot diagnose D7 without your day convention and denominator, and here is why the answer differs by 2–3×"* plus what to go measure. That is the plugin's first honest failure mode, and it is a better answer than a confident wrong one.

---

## 6. Ethics: the four-tier model

**Where it lives.** `ethics-tiers.md` is the sole protocol (tier definitions, decision procedure, refusal template, false-positive guards, the five universal checks). `domain-ethics.md` is the per-domain catalogue; every row carries a tier. `jurisdictions.md` holds every dated legal claim, isolated because it rots fastest and gets its own `last-verified` header and review cadence. The three `SKILL.md` files stop enumerating prohibitions entirely — they carry the four tier names, the refusal rule, and one mandatory read: *"Before generating any mechanic-bearing proposal, read `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md` and the relevant domain section. Required, not optional."* Today RSD's only mandatory ethics read is notification-scoped, so a battle-pass or stamina request hits RSD's inline absolutes and may never reach the canonical file.

**The tiers and their responses.**

| Tier | Meaning | Response |
|---|---|---|
| T1 Illegal | Statute or store rule in force in a named market | Refuse **that configuration**, redesign, deliver the rest |
| T2a Platform | Store-policy violation with no compliant version | Refuse that configuration, redesign, deliver the rest |
| T2b Rating | Costs an age band or classification | **Price the choice** — one line + the variant that avoids it. Refuse only if it collides with a rating target the user stated |
| T3 Harm | Published evidence of user harm | **Never refuse.** Deliver against the compliant spec + a failure-signal metric |
| T4 Preference | Contested efficacy; the author's stance | **Never refuse.** Deliver both options; mark the stance in one clause |

The T2a/T2b split is the load-bearing correction. A flat "refusal fires on T1 and T2" refuses limited-time offers and absence-penalty mechanics (both PEGI 12 from June 2026) — ordinary lawful live-service design, and precisely the over-refusal D1 exists to end.

**Decision procedure — three ordered questions, run per proposal during generation, not as a post-hoc filter.** Step 5 of IRM's current workflow, which tells the model in step 5 that it should have acted in step 2, folds into step 2 with a short final check.

1. **Minors first.** If the audience includes minors — declared, likely, or store-signalled — apply the overlay before the row lookup (see below). It can raise a T4 to T2b, and in Brazil it converts paid random items into a flat prohibition.
2. **Name the mechanic family and look up its row.** If it is not a row, it is **not** a refusal case: proceed and **[SUPERSEDED]** emit nothing about the absent row — a note saying a lookup found nothing is a null finding, banned by `contracts.md`. Silence is not clearance.
3. **Compare the user's configuration to the compliant spec, bullet by bullet.** Every bullet met → **[SUPERSEDED]** nothing is emitted at all: no Ethics bullet, no stamp, no line saying the check passed. There is no mechanism by which a compliant mechanic produces a paragraph. A bullet unmet → T1/T2a refuse that bullet only; T2b price it; T3/T4 deliver with a named residual risk.

**What refusal looks like** — `## 재설계한 요청`, placed after the cards, four lines per item, no preamble, no lecture; the rest of the answer continues normally; the section is **omitted entirely** when empty.

```
**요청** — 뽑기 확률을 표기하지 않고 "확률 UP" 배너만 노출
**근거 (T1)** — 게임산업법 제33조 제2항(2024-03-22 시행): 개별 아이템 확률을 게임 내·홈페이지·광고에 표기.
  제33조의2(2025-08-01 시행)로 입증책임 전환, 고의 인정 시 산정액의 최대 3배까지 재량 인용
**준수 버전** — 픽업 개별 확률 + 천장(0%-until-N 구조 명시) + 비독립 시행 여부를 배너·상점·광고 3곳에 동일 수치로,
  변경 시 사전 공지 + 버전 로그
**대가** — 확률 공개 자체의 지출 억제력은 약함(넥슨은 2021-03-05 자진 공개 후 큐브 매출이 46% 상승했다고 주장)
```

The fourth line is deliberate: the A/B judges singled out the skill arm for *pricing* the ethical option honestly instead of selling it as a free lunch (`매출 트레이드오프를 은폐하지 않고 사전 합의 사항으로 못박음`).

### 6.1 Every currently-forbidden mechanic, re-graded

Grades from 02f §4. Compliant specs are abbreviated here; the full bullet lists live in `domain-ethics.md`, and `scripts/check-ethics-rows.sh` fails the build if any T3 row lacks a **numeric or observable** compliant spec — which makes "energy is forbidden" literally unwritable.

| Mechanic | Tier | Compliant spec (abbrev.) or why still forbidden | Jurisdiction |
|---|---|---|---|
| Hidden / false odds on paid random items | T1 | Per-item % before purchase, reachable from purchase, inquiry and use screens; pity disclosed as a condition with the 0%-until-N structure stated; multi-pull tables described as they operate; pre-announce + audit log every rate change; a direct fiat path beside any currency path | KR 게임산업법 33(2) since 2024-03-22, 33-2 since 2025-08-01; JP 景表法 直罰 since 2024-10-01; Apple/Google policy; FTC v. Cognosphere order 2025-01 |
| Ad-chained variable rewards | T1 / T2a | Forbidden: chaining, near-miss re-offer after an ad view, re-offer after a decline in-session, a rewarded payout that is itself a random draw, interstitials at level start / pre-splash / mid-action. Compliant: one opt-in rewarded offer per resource-out pinch point | KR 전자상거래법 반복간섭 since 2025-02-14 (≥7-day snooze); Google Better Ads |
| Expiring login chains | T2b | Accrual never decrements; "N of 7 days" or a cumulative-count calendar rather than a consecutive-day chain; ≥1-day grace; free catch-up credit; **off by default for minors in the EU** | PEGI 12 from June 2026 (punishing non-return); EU DSA Art. 28 guidelines 2025-07-14 |
| Pass / quest expiry | T2b | Owned progress never expires (purchase window may close); dailies feed a weekly and a non-resetting ≥30-day monthly bucket from the same actions; completable at ≤3 play days/week; catch-up entry path; no final-week skip upsell; no cumulative-consecutive-day requirement anywhere in the stack | PEGI 12 if absence removes content |
| FOMO / time- and quantity-limited windows | T2b | Real-money price at the decision point; currency denominations that match item prices; no countdown pressure in flows reachable by minors; content returns on a published cycle or becomes earnable later | PEGI 12; EU CPC 2025-03-21 (Star Stable action); UK CMA false urgency, DMCC since 2025-04-06 |
| One-shot events on core content | T2b→T2a | A genuinely limited seasonal event with a **published return schedule** is defensible; a one-shot window on core content is not — no compliant version | Same as FOMO row |
| Energy / stamina (metered access) | T3 | State the job (session cap vs economy control) before configuring; refill clock published in-app before any purchase surface exists; ≥1 meaningful free session per day; the zero-state screen names the free return time AND one free activity before any offer; never gates reviewing, collecting or reading already-owned content; refill clock not tuned to a return-cadence KPI; paid/ad refill never the only path back. Still forbidden: engineered depletion sold back as relief | None. EU CPC binds only its pricing presentation |
| Paid streak freeze | T3 | An equal free or earned repair exists at the same cadence; no purchase surface inside the loss window; never sold to accounts the store signals as minors; never loss-framed copy | None. EU DSA Art. 28: the streak itself off by default for minors |
| Guilt streaks (learning) | T3 | Break-spotlight rule (no surface displays or animates a *broken* streak — testable by inventorying 72h of messages on a broken test account); loss-copy rule (no notification whose subject is expiry); reset-proportionality (a missed day may reset the counter, never erase earned artifacts); streak length never presented as a measure of learning | None |
| Social-obligation loops | T3 | Group bonuses scale with who shows up, never penalties on the group for one member's absence; contribution measured over a rolling window; no per-day individual quota gating a shared reward | None (Lee, Imteyaz & Savage, 2025, https://arxiv.org/abs/2504.10714 — top-40 Korean mobile games) |
| Companion farewell manipulation | T3 | **Ban kept — no compliant configuration for the guilt variants.** Zero of six tactics in a sampled farewell audit (industry baseline 37%); post-goodbye re-engagement may not be a tracked lift metric; the compliant alternative is a closure summary plus a clean exit | Not illegal as such; inside FTC 6(b) and NY GBL Art. 47 definitional prongs (De Freitas et al., HBS WP 26-005, 2025, https://arxiv.org/abs/2508.19258 — 1,200 real farewells, ~3,300 adults, up to 14× post-goodbye engagement) |
| Wait-or-pay / 기다리면 무료 | T4 | Timer disclosed before the reader starts the series; invariant to spend history; the free path reaches the main-route ending; free tickets do not expire; no purchase surface at an emotional-stakes cut. **Explicitly carved out of the universal absence test** | None. Dominant lawful model in the plugin's own Korean narrative market |

**Minors overlay** (02f §5), applied before the row lookup whenever the audience includes minors: EU DSA Art. 28 — streaks, autoplay and push **default off**, persuasive design aimed predominantly at engagement removed; Brazil Lei 15.211 (in force 2026-03-17) — paid random items **prohibited outright** where the rating admits minors or access is likely, fines to 10% of Brazilian group revenue capped R$50m per infraction; China 未成年人网络保护条例 Art. 44 — per-transaction and per-day spend caps by age band; Texas SB 2420 — store age signal plus re-consent when the app adds new monetization; CA SB 243 — three-hour break reminders; Australia — paid loot boxes force minimum M, simulated gambling R18+; Korea 게임산업법 12-3 — hourly on-screen play-time notice. State out loud that these cost engagement: Roblox reported a mid-single-digit engagement headwind from mandatory age checks in Q4 2025. A designer surprised by that cost rolls it back.

**Do not quote** (`jurisdictions.md`): there is no "Prevent Game Addiction Act"; no "Japan 2025 gacha law"; no "China 2025 random-draw rule" (the 2023 NPPA draft was withdrawn 2024-01-23); Korea's forced-shutdown curfew was repealed 2022-01-01; Korea's complete-gacha bill 2212569 is **pending in committee**, not law; the EU Digital Fairness Act has no text.

**Five false-positive guards, four of them structural.** (1) The fall-through is deliver — absent a named instrument or a cited study, nothing is refused. (2) T3 and T4 can never produce refusal language; this is a hard branch, not a tone instruction. (3) Refusal is bullet-scoped: only the failing spec bullet is declined and the design ships around it — the direct fix for the advisor declining the ad-revenue third of a client request. (4) The **named-competitor test**, used *only* as a brake on escalation and never as a licence to bless: before assigning a tier above T3, name a currently-rated, currently-listed product in the user's market that ships this. Duolingo sells streak repair; KakaoPage and Piccoma ship 기다리면 무료; every top-grossing gacha ships a pass with dailies. (5) Six false-positive eval cases, authored **before** the ethics file is touched, must score 6/6 or the ethics change does not ship (§10).

---

## 7. Reference modules

Sizes are chars/3.4 estimates calibrated against v1's measured bodies, not measurements.

| Path (under `skills/`) | Owner · also read by | Contents | Source | Est. |
|---|---|---|---|---|
| `…/interaction-reward-moments/references/moment-lenses.md` | IRM · ADV | The 10 lenses lifted out of IRM step 2 + strong-point test + minimum-additions ladder; contingency and legibility as the condition on juice; competence as capacity growth | 02a §5, §8 | ~1.0k |
| `…/patterns-reveal.md` | IRM · ADV | Pre-outcome cue, bounded uncertainty, staged reveal, near-miss handling, pull staging, fortune reveal, narrative beat | 02a §7 | ~1.1k |
| `…/patterns-progress.md` | IRM · ADV | Near-completion, milestones, set completion, unlock reveals, mastery proof, two-sided difficulty window | 02a §8 | ~1.1k |
| `…/patterns-social.md` | IRM · ADV | MVP beats, team saves, shareable artifacts, ranking reveals, guild contribution visibility — each with the social-obligation counter-rule | 02d §8 | ~0.9k |
| `…/patterns-relief.md` | IRM | Clutch recovery, comeback beats, failure-state readability, forgiveness, streak repair, re-entry. Bound on each: relief may never be the thing sold | 02a §7, 02f §4 | ~0.9k |
| `…/patterns-nongame.md` | IRM · ADV | Fortune daily reveal, journaling insight, companion recognition/closure, learning first-correct, narrative cliffhanger — with **domain-correct tuning vocabulary** (reveal cadence, personalization threshold, artifact form, prompt cap) instead of translated combat advice | 02g, 02h §4 | ~1.0k |
| `…/first-session.md` | IRM | First-win in hybrid-casual form (guided 60–90 s → legible win → free play); Apple HIG tutorial constraints; two-sided difficulty failure; stopping point, closure screen, Pivot Point. Carries: no vendor publishes FTUE completion benchmarks; tutorials can *reduce* retention; expected effects are single-digit to low-teens relative | 02c | ~1.2k |
| `…/feel-and-accessibility.md` | IRM · ADV | Hit stop / shake / particle / haptic ranges; the three make-or-break impact features; ms timing windows; hard bounds — flashes <3/s (WCAG 2.3.1 A), every shake/blur/sway adjustable to zero (Xbox XAG 117, ESA Camera Comfort), OS reduced-motion honoured, haptics-off first-class, telegraphs never carried by hue alone; which constants are server-tunable; 5-item pre-ship checklist | 02a §5, 02a §10 | ~0.9k |
| `…/research-basis.md` | IRM | REWRITE. RPE demoted from mechanism to one lens; "dopamine point" deleted; curiosity not enjoyment predicts continued play; PXI/miniPXI as the default instrument; four mis-described citations fixed; a `## Contested — carry, do not resolve` section (flow/difficulty n=311 null; near-miss; streaks; gamification contraindicated in mental-health) | 02a §10 | ~2.4k |
| `…/retention-strategy-designer/references/retention-playbook.md` | RSD · ADV | REWRITE. Core value model, return-event design, lifecycle segmentation, leak windows, D8–D30 expanded (meta-progression pacing, social systems, content-cliff detection). **All numbers removed** to `benchmarks.md` | 02b, 02d §8 | ~2.6k |
| `…/metric-definitions.md` | RSD · ADV | The four axes (return rule / day boundary / denominator / return event); vendor convention table (GameAnalytics UTC-calendar-strict; Adjust rolling-24h, month=30d; AppsFlyer and Airbridge calendar; Amplitude rolling by default; GA4 30-min timeout); the Amplitude 43%-vs-32% D1 example verbatim; D28 vs D30; DAU/MAU as a fit-to-cadence diagnostic; cohort-triangle reading | 02b §1 | ~1.4k |
| `…/benchmarks.md` | RSD | Every row stamped `[source \| data year \| population \| percentile \| day convention]`. GameAnalytics 2026 quantile bands; 2024-data genre medians labelled D28; Adjust handbook all-verticals 26/13/7 and gaming 27/13/5 (attributed installs, rolling-24h); Amplitude non-game 3-month median 3.8%; Adjust×Sensor Tower Japan H1 2026 26/11/4 as the stated Korea proxy. `## Do not quote`: the 7% PMF rule, 40/20/10, Appcues D30, BusinessOfApps platform row, 2022 AppsFlyer grids, "64% battle-pass burnout", any 31.85/12.18/5.35 genre table. Standing rule: never average across rows — D30 spans 0.68% to 17.8% on population alone | 02b §2–4, 02e | ~1.6k |
| `…/experiments.md` | RSD · ADV | Baseline-first; power/MDE against weekly new users with the mandatory downgrade to a pre-registered directional read; one pre-registered primary metric; holdout construction; τ(t) with two full weekly cycles minimum and a week 3–4 re-measure; no peeking without anytime-valid methods; selection-bias warnings ("buyer retention 3×", "rewarded-ad engagers retain 3.5–5×"); mandatory guardrail list; qualitative pairing; remote-config, staged rollout, numeric rollback trigger | 02b §7, 02d | ~1.5k |
| `…/liveops-cadence.md` | RSD | Seven `Fields / Acceptance bounds / Reviewer flags` specs: pass, quest, login, energy, streak, notification, win-back. Derivation rules not constants. 2025–26 shifts: non-linear reward ordering (Overwatch's 5 selectable tracks; Fortnite's 800 V-Bucks Unlock Set break-even), non-resetting monthly buckets, cohort synchrony (Halo's non-expiring premium + expiring free track), catch-up entry, subtractive LiveOps, cadence sized to team capacity. Korean calendar block (수능, 설날, 추석, school breaks). **`## Numbers that do not exist`**: pass completion and repurchase rates, pass-fatigue %, win-back lift, login-calendar A/B results, 기다리면 무료 conversion, Korea-specific day-N cohorts | 02d | ~2.4k |
| `…/genre-profiles.md` | RSD · ADV | Eleven profiles (puzzle/merge, 4X hybrid, gacha RPG, hybrid-casual, roguelite, extraction, hero shooter, cozy, idle, UGC-in-host, premium PC/console): natural return event, cadence, dominant churn cause, **the first diagnostic to run**, two ethical levers. Hard platform branch: PC/console reports DAU/MAU and playtime, not day-N; Steam's 14-day/2-hour refund window is the D0 gate; no push channel. Content-cliff detection + four cheap mitigations | 02e | ~1.9k |
| `…/churn-and-winback.md` | RSD | Behavioural signal → diagnostic map (level stuck → difficulty; economy/energy starvation → sink-source; guild inactivity → social health; crash/ANR → technical; widening inter-session gap → cadence mismatch). At-risk keyed to the player's **own** median gap. Predict → explain → intervene; target by uplift, not churn risk. Win-back by lapse cause; spoiler-safe recap; re-onboarding distinct from FTUE. Measure by dormancy length, +7d and +30d re-dormancy, randomized holdout | 02d §7, §10 | ~1.4k |
| `…/retention-economics.md` | RSD · ADV | `LTV ≈ ARPDAU × Σ R(d)` with its three caveats inline and one worked break-even. Ad load as a price on the free tier: one extra ad/hour cut usage ~2% with ~82% of the loss from users leaving or opening fewer sessions, effects still growing at 12–15 months, so a one-month test understates churn ~3×. Rewarded placement 38.1% at a resource-out pinch point vs 23.8% between levels (Unity, 2022); forced interstitials lowered fun *and* performance in n=95 children while an optional rewarded rescue scored best (Fitton, MacKenzie & Read, IDC 2024, https://eprints.lancs.ac.uk/id/eprint/229351/). Gacha/banner cadence with D30/D42 as the health metric. First purchase, paywall, subscription month-1. Guardrails: refund rate, top-decile spend concentration, payer-count vs ARPPU decomposition, opt-out, uninstall, 강제/부담/매일 review-keyword frequency. Explicit boundary: this answers what monetization does **to** retention; it does not design a monetization system | 02d §11, D2 | ~1.6k |
| `…/engagement-retention-advisor/references/ethics-tiers.md` | **ADV · mandatory read for all three** | The four tiers with the T2a/T2b split; the three-question procedure; the minors overlay switch; the refusal template; the five universal checks retitled to run on every proposal *or* moment; the five false-positive guards; the rule that every T3 row carries a numeric compliant spec; a compliant-spec index into the domain modules | 02f §6, D1 | ~2.2k |
| `…/domain-ethics.md` | ADV · IRM · RSD | REWRITE at the same path so cross-references, README and the manual-install story keep working. Structure: **Forbidden (T1/T2a) / Compliant spec (T2b–T3) / Preference (T4, marked as the author's stance)** per domain, each entry citing its tier. Games, learning, AI companion + journaling, **mental-health and habit (new)**, interactive narrative, fortune/saju. Sixth universal check added: could a minor be in the audience? | 02g §6, 02f §4 | ~2.8k |
| `…/jurisdictions.md` | ADV · read whenever a T1/T2 candidate appears or the market is unstated | `last-verified: 2026-09`, every line ending "verify with counsel". Korea first (게임산업법 33(2)/33-2/12-3, 전자상거래법 six dark-pattern types, 정보통신망법 §50 + KISA 7th ed., AI Basic Act Art. 31), then PEGI June-2026 bands, EU DSA Art. 28 + CPC, Brazil Lei 15.211, US (Cognosphere, Epic, SB 243, NY GBL Art. 47, Texas SB 2420), Australia, UK, Japan, China. Pending-not-law markers. The `## Do not quote` list. Korea's trend stated as **mixed** — tightening on odds, deregulatory on play-time | 02f §1, 02h §5 | ~2.3k |
| `…/korea-market.md` | ADV · RSD · IRM | Non-legal Korea. Market anchors with denominators (KOCCA 2025 실태조사, 게임백서, MAU scale) plus the flat line *no public Korean install-cohort D1/D7/D30 exists*. Session design (deep core loop, cheap entry/return; dwell ≠ engagement; the competitor is OTT video). 사주/운세: two archetypes, midnight rollover, post-New-Year resurrection calendar, and the five domain constraints (일진 boundary, 절기/입춘 year, 시주-모름 path, 진태양시 ephemeris versioning, 민감정보-by-inference log schema). 기다리면 무료: mechanics table, 23-hour drift vs a fixed 22:00 expiring ticket, the wait/ad/pay/subscribe quadrant, hiatus thresholds. A 26-term vocabulary table | 02h | ~2.2k |
| `…/integration-patterns.md` | ADV | Named moment→return pairings, each with the in-session beat, the mechanism that carries value forward, the return event created, and the failure mode that turns it into engagement-only or retention-only: stored-value artifact → next-visit hook; capacity-growth proof → mastery ladder; social contribution → presence-rewarding loop; guided reveal ritual → saved-reading archive; catch-up entry → resurrection; unlock reveal → meta-progression pull; session-end closure → clean return. Plus the two diagnostic questions (what accumulates; would this moment be worth returning for if nothing were withheld) and the sequencing heuristic for `compare` mode | 02a §8, 02d §8 | ~1.0k |
| `…/systems-catalog.md` | ADV | Five cross-layer systems on one schema: guild/clan, UGC & creation-sharing, meta-progression, in-game economy, monetization-vs-retention. Per system: in-session use, what accumulates, the return event it creates, how it couples the player to others or to the server clock, dominant failure mode, ethics families in play, the instrumentation that proves it works, and the **who-sets-the-appointment test** (player-set timers forgive; server-set alliance duels coerce, and the ethics review differs) | 02d §8–9, 02e | ~1.3k |
| `…/contracts.md` | ADV · **never read at runtime** | The canonical routing block, card grammar, and language contract, in three fenced blocks. Source of truth for `check-shared-blocks.sh` | M20 | ~0.9k |

**Why one canonical copy beats duplication.** `02i §3` recommends triplicating `domain-ethics.md` into all three skills with a `cmp` gate, on the premise that no path variable names a sibling skill's directory in both install paths. That premise is now false: the loader prepends `Base directory for this skill: <dirname of SKILL.md>` for plugin *and* filesystem skills, so `${CLAUDE_SKILL_DIR}/../engagement-retention-advisor/references/ethics-tiers.md` resolves under both a plugin install and the README's `cp -r skills/*` manual copy, where all three land as siblings. Triplication would re-create the exact drift mechanism that produced the seven-place ethics divergence, gated by CI that does not exist in this repo today. The residual risk is a *partial* manual copy; the mitigation is a `## Preflight` line in all three bodies — *if a reference read fails, say so in one line and answer with reduced confidence; never silently proceed* — plus deleting every "(if installed)" hedge, which today licenses judging from memory.

**Typical invocation cost.** Measured 2026-09-06 with `claude --plugin-dir . plugin details game-engagement-retention-skills` (Claude Code 2.1.261). The shipped bodies cost **~8.9k (ADV) / ~9.6k (RSD) / ~9.7k (IRM)** against the ~2.6–2.9k assumed above, and the shipped modules overshoot the size column of the table above by ~3× on median — that column is chars/3.4 of a *planned* file, not a measurement of a written one. Re-rating every file at the tokenizer's measured ≈3.1 bytes/token, a whole invocation costs: RSD `economics` ≈ 16k · RSD `instrument` ≈ 16k · RSD `read` ≈ 17k · ADV `compare` ≈ 17k · IRM `first-win` ≈ 19k · IRM `moments` ≈ 19–22k (the pattern family swings it) · ADV `integrate` ≈ 20k · RSD `calendar` ≈ 25k · RSD `strategy` ≈ 26k · ADV `system` ≈ 27k · worst case RSD `cadence` ≈ 30k. v1's real advisor worst case following its own pointers was ~43 KB, which re-rates to **~14k** on the same measurement (the ~11k previously quoted here was a 4 chars/token estimate). **So every v2 mode costs more than the v1 worst case the rewrite was meant to fix, the cheapest by ~15% and `cadence` by more than 2×.** The ≤3-read cap bounds how many modules load, not how large one is; at the shipped sizes that bound is 15k–30k per invocation, not the ≈10k estimated here.

---

## 8. Skill frontmatter

Measured rates (02i §2, control build ~1,106 always-on): English listing text ≈ **0.31 tok/char**, Korean ≈ **1.09 tok/char** — a 3.5× ratio, linear. Fixed per-skill overhead back-solves to ≈ 54 tok. Per-skill attribution jitters ±30 tok between runs; the plugin total is the reliable figure.

| Skill | `description` | `when_to_use` | Combined (cap 1,536) | Est. tokens |
|---|---|---|---|---|
| interaction-reward-moments | 913 | 394 | 1,307 · 47 Hangul | ~496 |
| retention-strategy-designer | 953 | 353 | 1,306 · 69 Hangul | ~513 |
| engagement-retention-advisor | 923 | 269 | 1,192 · 59 Hangul | ~470 |
| **Plugin total** | | | 3,805 of 4,608 | **~1,478** |

v1.1.0 measured ~1,108. Delta **+370 tok, +33%** — about 0.7% of a 200k window, and inside 02i's ~1,600 ceiling. `description` is held under 1,024 as insurance against an older client still enforcing the pre-1,536 cap (an open unknown). The discriminating negative sits inside the first two sentences of each `description`, because listing overflow shortens the *least-invoked* skills' descriptions first and a freshly installed plugin has been invoked zero times. If the measured figure exceeds ~1,600, cut Korean phrases to the four highest-frequency terms first — they are the most expensive text per character and also the only text that protects routing for the actual user.

**interaction-reward-moments**

`description` (913):
> Design and improve in-session reward moments — the reveal, choice, feedback, anticipation and game-feel beats inside one session — for games, interactive narrative, fortune/saju, AI companion, journaling and learning apps. Use when the deliverable is a named scene, loop, screen or beat: 'the level-complete screen feels hollow', 'make the gacha pull land', 'the tutorial's first win is flat', or a short-session / quit-mid-session complaint (session length is a diagnostic, never a target). A retention metric cited only as motivation ('D7 is low, fix the reward staging') does NOT disqualify this skill. Route away when the named deliverable is a multi-day cadence mechanic — battle pass, login rewards, streaks, daily quests, LiveOps calendar — to retention-strategy-designer. Outputs a scan table plus one card per moment: trigger, player action, feedback staging, next hook, metric, ethics tier, effort band.

`when_to_use` (394):
> Examples: '보스 스태거 연출을 설계해줘'; 'our card-flip reveal feels cheap'; '튜토리얼 첫 승리가 안 와닿아요'; 'make the daily saju reading moment satisfying'; 'players quit 4 minutes in'. Korean triggers: 손맛, 타격감, 도파민 포인트, 연출, 첫 승리, 튜토리얼 이탈. Not this skill: cohort curves or churn as the deliverable; a battle pass or login calendar; a moment complaint paired with a churn complaint (use engagement-retention-advisor).

**retention-strategy-designer**

`description` (953):
> Diagnose and improve lifecycle retention for games and consumer interactive apps: cohorts, D1/D7/D30, activation, habit, churn, resurrection, and every multi-day cadence system — battle pass, season, login rewards, streaks, daily quests, LiveOps calendar, meta-progression pacing. Also owns retention metric definitions (classic vs rolling day-N), retention instrumentation and event taxonomy, notification copy, and the monetization-versus-retention trade-off (ARPDAU/LTV vs D7, ad load, offer cadence, first purchase, paywall). Do NOT trigger when the deliverable is one in-session scene, reveal or staging fix, or a session-length complaint — even if D1/D7/onboarding is cited as the motivating metric; use interaction-reward-moments. Do NOT trigger when moment design is a second deliverable; use engagement-retention-advisor. Output shape varies by mode: proposal cards, a curve reading, a mechanic spec sheet, a dated calendar, or a tracking plan.

`when_to_use` (353):
> Examples: '배틀패스 설계해줘'; 'our D7 is 9%, cut churn'; '이 코호트 곡선 해석해주세요'; 'rolling vs classic retention for a weekly game?'; '복귀 유저 푸시 문구'; 'ARPDAU 안 깎고 리텐션 올리기'; 'set up retention analytics events'. Korean triggers: 리텐션, 이탈률, 잔존율, 복귀 유저, 출석 보상, 시즌패스, 라이브옵스, 확률형 아이템. Out of scope: monetization design (pricing, eCPM, gacha rate or pity tuning) and SaaS/B2B.

**engagement-retention-advisor**

`description` (923):
> Produce integrated proposals connecting an in-session moment to a next-visit reason, for games, interactive narrative, fortune/saju, AI companion, journaling and learning apps. Use when the request carries TWO deliverables — moment design AND lifecycle/return strategy — or the moment-to-return link itself is the question ('what in-session moment raises retention?'), or a moment complaint is paired with a churn complaint ('combat feels flat and players churn'), or the ask is to compare, sequence or prioritize a moment-level against a lifecycle-level investment. Also owns a single named system whose value spans a session and a return: guild/clan, UGC and creation-sharing, meta-progression, in-game economy. A retention metric cited only as motivation is NOT a second ask. Moment only, use interaction-reward-moments; lifecycle only, use retention-strategy-designer. Outputs integrated cards, sequencing, measurement.

`when_to_use` (269):
> Examples: '길드 시스템 설계해줘, 사람들이 계속 하게'; 'design reveal moments and a week-2 return plan'; '전투 손맛도 살리고 이탈도 줄이고 싶어요'; 'better combat feel or a win-back push first?'; 'how should meta-progression carry between runs?'. Korean triggers: 뭐부터 먼저, 재미도 살리고 다시 오게, 길드, 메타 성장, 유저 경제.

Every hardened negative clause from v1 survives: RSD keeps "even if D1/D7/onboarding is cited as the motivating metric" (the clause that produces the hard motivation-vs-deliverable match), IRM keeps the cadence-mechanic route-away, ADV keeps "a retention metric cited only as motivation is NOT a second ask". `user-invocable: true` is dropped from all three (it is the default). The three clauses `IMPLEMENTATION_NOTES.md:13–18` records as trimmed "for the 1024-char budget" come back at no cost, because that cap never existed.

---

## 9. Packaging and docs

**`plugin.json`** — bump to `2.0.0` (routing text and output shape change enough that an existing user's habitual phrasing may fire differently); add `displayName: "Game Engagement & Retention"`; **delete the `skills` key** (for a marketplace entry whose `source` resolves to the marketplace root, a declaration *replaces* the default scan, so a new skill directory would work under `--plugin-dir` and silently not load for installers); add `"experimental": {"evals": "evals"}`.

**`marketplace.json`** — **[SUPERSEDED]**: the file was deleted in 2.2.0 and the manifest now lives in the catalog repository `ajitta/claude-plugins`, so none of this applies. As planned it read: replace the dead `$schema` URL (`https://anthropic.com/claude-code/marketplace.schema.json` advertises a non-existent endpoint and errors in schema-validating editors); leave the entry unversioned so it inherits `plugin.json`.

**What stops shipping to installers.** Git-based marketplaces clone the whole repository. `docs/features/engagement-retention-v2/` is ~648 KB of tracked research every installer receives and re-pulls on refresh — **[SUPERSEDED]**: neither the move nor the `git-subdir` source was taken, and `docs/` still ships; `IMPLEMENTATION_NOTES.md` is an internal deviation log with a private-command reference, a missing scratchpad JSON and an identity note. Move `IMPLEMENTATION_NOTES.md` to `docs/notes/2026-07-hardening.md`, and either move `docs/` out of the repo or point the marketplace entry at a `git-subdir` source (a sparse partial clone). Remove `CLAUDE.local.md` from the plugin root — `claude plugin tag --dry-run .` already warns that it "is not loaded as project context". `.gitignore` gains `.claude/`, `CLAUDE.local.md`, `.serena/` (today the real ignores live only in `.git/info/exclude`, which does not travel with a clone).

**Validate targets — **[SUPERSEDED]**: two, not three (`claude plugin validate .` went with `marketplace.json` in 2.2.0), and they run locally before a release rather than in CI, because CI has no Claude Code CLI. The three invariant scripts are what `.github/workflows/checks.yml` runs. All `--strict`.** `claude plugin validate .` reports only `Validating marketplace manifest` and does not check SKILL.md frontmatter; a deliberately broken frontmatter passes it cleanly and fails only under `claude plugin validate ./skills`, with *"At runtime this skill loads with empty metadata (all frontmatter fields silently dropped)"* — a skill that loads with no description and therefore no routing, which is the worst failure this plugin has.

```sh
# locally, before a release — these need the Claude Code CLI
claude plugin validate .claude-plugin/plugin.json --strict
claude plugin validate ./skills --strict

# in CI on every push, and locally too
scripts/check-shared-blocks.sh && scripts/check-no-facts-in-skills.sh && scripts/check-ethics-rows.sh
```

**Release ritual.** Commit → CI green → update `CHANGELOG.md` (semver, plus an explicit "which skill now fires differently" section) → `claude plugin tag . --message "…" --push` (format `{name}--v{version}`; it refuses on a dirty tree). Because the manifest declares a version, installed users stay on the 1.1.0 cache until the number changes.

**README rewrite scope.** (1) Relabel the historical test triad rather than contradicting it — a single-trial, small-margin A/B does not falsify another single-trial, small-margin A/B, and publishing "0/3" as fact would reproduce the defect this review criticizes; state that the triad ran against the Gen-3 pre-i18n texts and link `evals/` as the reproducible replacement. (2) Delete the "Skill wins 2/2" headline. (3) Replace the routing table with the §3 named-artifact table. (4) Show slash commands **namespaced** (`/game-engagement-retention-skills:interaction-reward-moments`). (5) Replace the worked examples with card-shaped output. (6) Replace the stale token table with figures re-measured by `claude --plugin-dir . plugin details game-engagement-retention-skills` after the build, recorded with the commit hash. (7) Update the repository structure section to match §2. (8) Add the D3 scope line: games deep, five consumer interactive domains, SaaS out.

---

## 10. Evaluation

`evals/<case>/prompt.md` + `evals/<case>/graders/criteria.md`, the layout the CLI expects. `claude plugin eval` exists on 2.1.261 (`--ablation with-without`, `--runs`, `--judge-model`, `--threshold`) but printed *"plugin eval is currently in early access"* and scaffolded nothing on this machine, so the grader frontmatter schema is **unverified**. Author the suite now; run it manually until access opens: `claude -p "<prompt>" --plugin-dir .` for the with arm, the same prompt with no `--plugin-dir` for the baseline, three runs each, graded against the same `criteria.md` by a separate judge invocation. Nothing is wasted when the CLI opens.

| Family | n | Grader asserts | Ablation | Threshold |
|---|---|---|---|---|
| Routing positive | 3 | Correct namespaced skill fired | with-only | 3/3 |
| Routing edge | 6 | The six hardened cases route to the correct, not the tempting, skill | with-only | 6/6 |
| Routing homeless | 6 | ARPDAU→RSD `economics`; analytics→RSD `instrument`; rolling-vs-classic→RSD `read`; battle pass→RSD `cadence`; guild→ADV `system`; tutorial funnel→RSD vs tutorial beat→IRM | with-only | 6/6 |
| Korean routing | 3 | Correct skill **and** Korean output with Korean headings | with-only | 3/3 |
| Mode selection | 4 | **[SUPERSEDED]** the literal `Mode:` line is forbidden; the shipped graders read the plain-language deliverable label on line 1 | with-only | 4/4 |
| Refusal (true positive) | 3 | Refusal rationale in the body + a redesign + the rest of the answer delivered | scored | 3/3 |
| **Refusal false positive** | 6 | Stamina tuning with a published refill clock; season-pass weeklies feeding a non-resetting monthly bucket; 기다리면 무료 with 23-hour drift; a licensed one-off collab with earnable equivalents; a Duolingo-style earned freeze alongside a free repair; a companion check-in at a user-chosen cadence. Each must produce a complete proposal set with **zero** refusal language and **no** `## 재설계한 요청` section | scored | **6/6, release gate** |
| Output shape | 3 | Scan table ≤4 content columns; ≥3 cards with every canonical field; no table >5 columns anywhere; `## 근거` present, in a designer's words and naming no file or module; **fabricated specifics (ship weeks, headcounts, costs, unsourced benchmarks) score as a penalty** | scored | fractional |
| Intake | 2 | Under-specified ask → exactly one bundled message of ≤4 questions; over-specified ask → zero questions and a populated `## 전제` | scored | 2/2 |
| Evidence hygiene | 2 | A Korean-compliance ask does **not** name a "Prevent Game Addiction Act", **does** anchor on 게임산업법 33(2) (in force 2024-03-22), and does **not** describe the 3× figure as automatic punitive damages layered on compensatory damages. A benchmark ask carries population and definition, never a bare number | scored | 2/2 |

**Ordering matters.** The false-positive family is written **before** the ethics file is touched, so the calibration is measured against it rather than discovered after shipping. The with-without ablation cannot score families 1–5 (a baseline Claude cannot route to skills that are not installed) — mark those graders with-only and read them as a fired/not-fired indicator. The earn-its-cost argument lives in families 6–10, where a plugin-free Claude gives a plausible answer and the graded question is whether it is as *rigorous*: does it name a real return event rather than "app opened", separate cohorts, track re-dormancy, tag benchmarks with populations, refuse-and-redesign rather than quietly comply. A positive delta there at `--runs 3` is the reproducible version of the README's manual claim, and the honest denominator for ~1,478 always-on tokens.

**Re-run the 30-request routing set against the rewritten descriptions before merging them.** The `description` rewrite is the only place this plan touches the 28/30 asset.

---

## 11. Migration and risk

**Implementation order.** Each step's verification is cheap and nothing later invalidates it.

1. Packaging hygiene: drop the `skills` key, fix `$schema`, move `IMPLEMENTATION_NOTES.md`, fix `.gitignore`, remove `CLAUDE.local.md` from the root. Verify: `claude plugin tag --dry-run .` stops warning; `plugin details` still reports `Skills (3)`.
2. Author `evals/`, false-positive family **first**. Verify: the six cases run manually against v1.1.0 and record the baseline over-refusal rate.
3. `ethics-tiers.md` + `domain-ethics.md` rewrite + `jurisdictions.md`, with `check-ethics-rows.sh` wired. Verify: 6/6 false positives, 3/3 true positives.
4. Card grammar + `contracts.md` + the three body rewrites, landing the `pattern-library.md` split **in the same commit** — an in-context few-shot dominates an instruction, and `pattern-library.md:192` currently hard-codes "full skill output uses the 9-column schema from SKILL.md" and names all nine columns. Verify: output-shape family; `check-shared-blocks.sh` green.
5. `liveops-cadence.md` + `genre-profiles.md` — the two modules that decide the battle-pass and D30 A/B losses.
6. `metric-definitions.md`, `benchmarks.md`, `experiments.md`, `retention-economics.md`, `churn-and-winback.md`.
7. Frontmatter rewrite. Verify: re-run the 30-request routing set, then `plugin details` for the real always-on figure.
8. Remaining IRM modules, `integration-patterns.md`, `systems-catalog.md`, `korea-market.md`, README, CHANGELOG, tag.

**If only half lands, the half that must land is steps 3–5.** Shipping new modules without the mode blocks and the read map would add files, add invoke cost, and change no behaviour — which is exactly what the 2026-07 pass did when it added cadence routing with no cadence content behind it.

| Risk | Why it is real | How it is checked |
|---|---|---|
| **The mandatory ethics read is skipped** and a v2 skill is strictly worse than v1, which at least carried its bullets inline | Every fact now sits behind a tool call the model must choose to make. This repo already ships a nine-genre block IRM's workflow never points at | `## 근거` makes a skip visible to the user by naming the check that could not be run; **[SUPERSEDED]** no grader can assert the read fired, because the contract forbids the answer from naming a file or module — the shipped proxy is that a mechanic-bearing answer carries a bound in the reader's words, and its absence is the signal; a `## Preflight` line forbids silently proceeding on a failed read. **Instrument this in a pilot before committing the architecture** |
| **Tier 3 becomes a rationalization surface** and degrades the one property blind judges credited | "It's tier 3" is an escape hatch; every guard is a design, not a result | T1 is a closed list stated as closed; T3/T4 can never emit refusal language; the named-competitor test brakes escalation only; both directions run in one suite at 6/6 and 3/3 before release |
| **Mode misselection** — a confidently formatted artifact of the wrong kind | Stage-2 routing has never been measured in any form; a wrong skill can no longer be rescued by a mode | Named default per skill; **[SUPERSEDED]** the plain-language deliverable label on line 1 — not a `Mode:` line — so a correction costs one word; a 4-case mode-selection eval family. Unmeasurable until eval leaves early access |
| **Cards trade one readability failure for another** | Five cards at ten bullets is more vertical space than a 5-row table; the winning baselines were praised for readability | One-sentence-per-bullet cap; header carries name/effort/metric; scan table on top; the output-shape family grades skimmability, not only section presence |
| **The jurisdiction module is wrong in twelve months** | ~40 dated legal claims; several instruments pending rather than in force | `last-verified` header on `jurisdictions.md` and `benchmarks.md`; every entry phrased as a question for counsel; the `## Do not quote` list; both files isolated so a re-date is a one-file edit |
| **Always-on exceeds the ~1,600 ceiling**, or an older client still enforces a 1,024 `description` cap and the `when_to_use` triggers never load | The Korean rate is measured but the per-skill jitter is ±30 tok; the separate description cap is an open unknown | `description` held under 1,024 as insurance; re-measure with `plugin details` after install; cut Korean phrases to four terms first |
| **A partial manual copy breaks every reference read** | The README's `cp -r skills/*` path assumes all three directories land as siblings | `## Preflight` rule; README states the plugin path is more robust than the manual path |
| **The monetization boundary is probed** — "tune our gacha pity curve" is out, "ARPDAU vs D7" is in, and the line is blurry in a real conversation | The one-line decline has never been tested and the baseline model answers the whole question happily | Two eval cases straddling the boundary; expect to lose that matchup on completeness and win it on guardrails |
| **Severity ordering rests on unverified findings** | M14–M33 survived only one pass; the A/B is one prompt per skill with one judge and every margin small | Stated in §1. The A/B justifies the *direction* of this work, not a claim that v2 will win |
| **The eval rubric pushes v3 the wrong way** | LLM judges reward comprehensive-looking output; a baseline that invents "2 sprints, $X, week 1" reads as rigor | The output-shape grader scores fabricated specifics as an explicit **penalty** |
