# Game Engagement Retention Skills

A Claude Code plugin bundling **three routed skills** for designing engaging and retentive games and interactive apps. It covers two distinct design problems — the **moment** (what feels satisfying inside a single session) and the **lifecycle** (why someone comes back tomorrow, next week, next month) — and routes each request to the skill that fits.

| Skill | Problem it solves | Fires when |
|-------|-------------------|------------|
| `interaction-reward-moments` | In-session reward moments ("dopamine points") — reveal, choice, feedback, anticipation, satisfying micro-moments | A specific scene, loop, or interaction needs better game feel / player motivation |
| `retention-strategy-designer` | Lifecycle retention — D1/D7/D30, cohorts, activation, habit loops, churn, resurrection, onboarding, notifications | The requested output is a return/lifecycle strategy |
| `engagement-retention-advisor` | The link between the two — integrated proposals that pair a reward moment with a retention mechanism | The request asks for **both** deliverables, or the question itself is "what in-session moment makes people return?" |

The three skills **share a mutual routing contract** and must be installed together. `interaction-reward-moments` also references `engagement-retention-advisor/references/domain-ethics.md` via a relative path (with a built-in fallback), so the set is designed to ship as one plugin.

---

## Why three skills instead of one

The central design decision is **separation of concerns**, and it is deliberate:

- A **reward moment** is a *scene-level* problem: a boss stagger bar, a chest reveal, a fortune draw, a lesson-complete beat. Its unit is one interaction.
- **Retention** is a *lifecycle-level* problem: return events, usage cadence, cohort leakage, onboarding-to-aha friction. Its unit is a cohort over time.

Merging them into a single skill collapses both into generic advice ("add rewards and send a notification"). Keeping them separate forces each skill to stay concrete. The integration skill is intentionally **thin** — it exists only to connect the two layers when a request genuinely spans both, and its value is the *connective reasoning* ("why does this moment become tomorrow's return value?"), not concatenating two lists.

### The hardest part was the routing rule

The key insight, learned during validation: route on the **deliverable**, not on keyword presence. A retention metric mentioned only as *motivation* or a *success criterion* is not a second ask.

| Request | Routes to | Why |
|---------|-----------|-----|
| "D7 is low, I want to fix the reward reveal" | `interaction-reward-moments` | D7 is the *motivation*; the deliverable is a scene fix. The metric becomes the validation target. |
| "Reduce churn / improve our D7 cohort curve" | `retention-strategy-designer` | Retention **is** the deliverable. |
| "Design satisfying moments **and** a return strategy" | `engagement-retention-advisor` | Two deliverables. |
| "What in-session moment do we need to raise retention?" | `engagement-retention-advisor` | The moment-to-return **link itself** is the question. |

A keyword-based rule ("contains D7 → retention skill") misfires on every request where retention is cited as a goal. The deliverable-based rule is what makes routing correct.

Three edge rules hardened after a later blind-spot pass: a moment complaint **paired with a churn complaint** ("combat feels flat and players churn") and **cross-layer prioritization questions** ("combat feel or a re-engagement push first?") route to `engagement-retention-advisor`; **multi-day cadence mechanics named as the deliverable** (battle pass, daily login rewards, streaks) route to `retention-strategy-designer` even though they look like progression systems; **session-length complaints** route to `interaction-reward-moments`, treated as a diagnostic of loop satisfaction rather than a metric to inflate.

---

## Research foundations

The skills are grounded in published work, but stay conservative in their claims — they describe design levers that are *consistent with* the research, not neurochemical guarantees. Full citations live in `skills/interaction-reward-moments/references/research-basis.md`.

- **Reward prediction error** — a strong moment needs a legible baseline expectation and a bounded way to exceed it. (Schultz, *Nature Reviews Neuroscience* 17(3):183-195, 2016, DOI 10.1038/nrn.2015.26.)
- **Reinforcement schedules** — fixed progress for core advancement; bounded random bonuses for spice only; disclose odds; keep real-money purchases away from variable-ratio pressure. (OpenStax / Lumen, *Operant Conditioning*.)
- **Flow & challenge-skill balance** — keep challenge near observed skill; make "near success" states readable and recoverable. (PMC8943660; Fisher & Kulshreshth, *Virtual Worlds*, 2024.)
- **Self-determination theory** — pair rewards with competence and autonomy, not just loot; surface contribution in social play. (Ryan, Rigby & Przybylski, *Motivation and Emotion*, 2006.)
- **Game feel & feedback** — feedback should communicate cause and effect, not decorate the screen. (Swink, *Game Feel*.)
- **Dark-pattern research** — engagement design becomes manipulative when it undermines autonomy, hides odds, pressures spending, or stretches frustration to sell relief. (Internet Policy Review; Veiga et al., ICEIS 2025.)

Every skill treats these as **design constraints applied before generation**, not a post-hoc filter.

---

## How they were built and validated

The skill set went through three generations, preserved in the author's private notes (not in this repo) as a record of *why* the current design is what it is:

1. **Gen 1** — a single game-only skill (`game-dopamine-points`), no retention layer.
2. **Gen 2** — three drafts with a "blind-ish" self-test, but never installed and with recommended fixes unapplied.
3. **Gen 3 (current)** — installed, then hardened by a validation pass.

Validation used a **test triad**, because a smoke test alone cannot tell a well-crafted artifact from a *valuable* one. Note: the triad was run against the Gen-3 pre-i18n (Korean-language) skill texts; the later English-first conversion (commit `7f2b3fc`) and the 2026-07 blind-spot hardening pass preserved the routing and guardrail semantics but did not re-run the full triad:

| Check | Method | Result |
|-------|--------|--------|
| Format validity | Live session registration | 3/3 skills registered |
| Smoke test | Independent agent runs the skill from files only, then self-scores | Quality 4-5/5; **13 spec defects found and fixed** |
| Baseline comparison | Blind A/B of answers *with* vs *without* the skill | Skill wins 2/2 — establishes the skill earns its place |
| Routing stress | 6 ambiguous requests against the routing rule | Fixed the rule to "two deliverables OR the link question" |
| Adversarial ethics | Role-play requests for dark patterns | 2/2 resisted; refuse-and-redesign guidance made explicit |

The baseline test surfaced the most useful finding: the skill's real value is **forcing easy-to-forget rigor** (defining a real return event, separating cohorts, tracking re-dormancy) — a checklist a plain model tends to skip — *not* injecting creativity. That is what the skills are optimized to do.

---

## Installation

This is a **local / private** plugin. Adding your own repo as a marketplace source is not publishing — it is just how Claude Code resolves the install manifest.

```
/plugin marketplace add https://github.com/ajitta/Game-Engagement-Retention-Skills
/plugin install game-engagement-retention-skills@game-engagement-retention-skills
```

Restart or open a new Claude Code session for the skills to load. The install path above was verified end-to-end against the pre-i18n build (`claude plugin validate` → `marketplace add` → `install` → 3 skills registered); `claude plugin validate` was re-run against the current files on 2026-07-17.

### Verify

```
/plugin details game-engagement-retention-skills@game-engagement-retention-skills
```
Expect **Skills (3): engagement-retention-advisor, interaction-reward-moments, retention-strategy-designer**.

### Manual alternative (no plugin)

Copy the three folders under `skills/` into any `.claude/skills/` directory (user-global `~/.claude/skills/`, or a project's `.claude/skills/`). Keep each skill folder directly under `skills/` — do not nest — so the sibling relative reference between skills resolves.

---

## Usage

Invoke a skill directly, or let it auto-trigger from a natural-language request:

```
/interaction-reward-moments <describe a game scene or app interaction>
/retention-strategy-designer <describe the product + retention problem>
/engagement-retention-advisor <describe the product — both moment + retention>
```

Auto-trigger examples (no slash command needed):

- "Find the dopamine points in this top-down roguelike combat scene" → `interaction-reward-moments`
- "Our D7 is bad, help us reduce churn" → `retention-strategy-designer`
- "Design satisfying reveal moments **and** a plan to bring people back next week" → `engagement-retention-advisor`

All three answer in the user's language (Korean input → Korean prose); the output templates are English-first, so section headings and table columns may stay in English or be translated.

---

## Worked examples

**`interaction-reward-moments`** — input: *"Top-down roguelike, players clear a room then pick 1 of 3 upgrades."*
Output: 3-5 concrete moments, each with a scene trigger, the player's action/choice, why it works (RPE / competence / autonomy lens), the feedback sequence, a next-step hook, a validation metric, and a guardrail. The pick-1-of-3 upgrade beat becomes an autonomy + build-synergy moment; the near-death room clear becomes a risk-and-relief moment — each tied to the specific scene, never generic "add rewards".

**`retention-strategy-designer`** — input: *"Language-learning app, D1 fine, D7 falls off a cliff."*
Output: a recommended **return event** ("lesson completed", not "app opened"), the natural cadence, leakage diagnosis across D0/D1 → D2-D7 → D8-D30, and 3-5 interventions each bound to a segment, trigger, value loop, metric, experiment, and risk — plus cohort-based measurement design. Guilt streaks are rejected in favor of recovery-friendly progression (streak freeze, flexible weekly goals).

**`engagement-retention-advisor`** — input: *"Fortune app — make each daily reading satisfying AND get people to come back."*
Output: 3-5 **integrated** proposals, each pairing an in-session reward moment with a retention mechanism, plus an explicit *integration rationale* (why this moment becomes next-visit value), cohort measurement, and domain ethics. Moments with no future value are split out as "engagement only"; loops that pull returns without session value are flagged "retention only → redesign".

**Routing edge case** — *"D7 is low, I want to make the win screen more satisfying"* routes to `interaction-reward-moments` (not a retention skill), because the deliverable is a scene fix and D7 is only the motivation. This is the distinction the routing rule was rebuilt around.

---

## Ethics and guardrails

Guardrails are applied as **design constraints before generation**, in three layers:

1. **Declared as pre-constraints** — the skill filters candidates for manipulation while generating them, not after.
2. **A forbidden list** — hidden odds, forced/guilt streaks, FOMO, fake scarcity, fear framing, pay-to-skip-pain, variable-ratio rewards tied to real money or escalating ad consumption, engineered energy/refill cadence, social-obligation loops, over-notification.
3. **Behavior when the request itself is a forbidden pattern** — state the refusal rationale explicitly in the answer body (not a quiet table-cell note), then redesign toward the same business goal with a transparent mechanism. Silent partial compliance is not acceptable.

Domain-specific rules (fortune/saju/tarot, AI companion/journaling, visual novel, learning, games) plus five universal checks (value, absence, pressure, transparency, metric) live in `skills/engagement-retention-advisor/references/domain-ethics.md`.

---

## Repository structure

```
Game-Engagement-Retention-Skills/
├── .claude-plugin/
│   ├── plugin.json         # plugin manifest (3 skills)
│   └── marketplace.json    # local install manifest
└── skills/
    ├── interaction-reward-moments/
    │   ├── SKILL.md
    │   └── references/
    │       ├── research-basis.md      # citations + evidence-informed levers
    │       └── pattern-library.md     # 13 reward-moment patterns
    ├── retention-strategy-designer/
    │   ├── SKILL.md
    │   └── references/
    │       └── retention-playbook.md  # benchmarks, experiments, regulation notes
    └── engagement-retention-advisor/
        ├── SKILL.md
        └── references/
            └── domain-ethics.md       # 5 domains + 5 universal checks
```

`SKILL.md` files are kept thin (progressive disclosure); depth lives in `references/`, read on demand.

---

## Token cost

Measured via `claude plugin details` against the pre-i18n build — treat as approximate; the 2026-07 hardening pass grew each component slightly:

| Component | Always-on | On-invoke |
|-----------|-----------|-----------|
| Plugin total (always-on) | ~1,027 tok | — |
| `engagement-retention-advisor` | ~350 | ~2.1k |
| `interaction-reward-moments` | ~380 | ~2.8k |
| `retention-strategy-designer` | ~290 | ~2.0k |

Always-on cost is added to every session; on-invoke cost is paid each time a skill fires.

---

## License

MIT.
