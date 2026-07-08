# Pattern Library

Use these patterns as building blocks. Always adapt them to the user's specific scene, rule set, and user action. Game patterns (1-8) apply to games; app patterns (9-13) apply to non-game interactive products. Many patterns cross over.

## Point Types

### 1. Perfect Execution Window

Use when the game has timing, aim, dodge, parry, rhythm, or precision input.

- Trigger: enemy windup, projectile near miss, beat marker, reload timing.
- Player action: execute within a narrow but readable window.
- Feedback: slow motion, crisp sound, hit stop, color flash, unique animation.
- Reward: counterattack, resource refund, combo multiplier, stagger, style rank.
- Validation: attempts per encounter, success rate, failure clarity, replay desire.
- Guardrail: do not hide the timing rule; make failures teach the window.

Example: In a boss fight, a perfect dodge during a red-glow attack opens a 1.2-second weak point. The player lands a charged strike, fills a stagger meter, and hears a distinct counter sound.

### 2. Near-Completion Pull

Use when the game has bars, sets, quests, collections, timers, crafting, map completion, or unlocks.

- Trigger: progress reaches 70-95%.
- Player action: choose whether to continue, risk, reroute, or spend scarce resource.
- Feedback: meter pulse, checklist tick, map marker, final-piece preview.
- Reward: unlock, set bonus, shortcut, new tool, story reveal.
- Validation: continuation rate after near-completion cue, completion satisfaction, fatigue reports.
- Guardrail: avoid endless moving targets or artificial grind inflation.

Example: A roguelite shows "2/3 storm runes". Taking the dangerous shrine path can complete the storm set and unlock chain lightning for the current run.

### 3. Bounded Surprise Reveal

Use when the game has chests, crafting rolls, procedural rooms, loot drops, cards, modifiers, or random events.

- Trigger: player earns a reveal through play.
- Player action: choose risk tier, route, sacrifice, or reveal timing.
- Feedback: anticipation sound, tier color, card flip, reveal animation.
- Reward: one guaranteed baseline plus a chance of higher-tier bonus.
- Validation: perceived fairness, reward comprehension, repeat opt-in rate.
- Guardrail: disclose odds when stakes are meaningful; do not attach to real-money pressure.

Example: After clearing an elite room, the player chooses one of three sealed relics. Each shows a category icon before reveal, so the surprise is guided rather than blind.

### 4. Build Synergy Snap

Use when the game has skills, cards, weapons, elements, perks, artifacts, party members, or deck construction.

- Trigger: player acquires a piece that completes a visible or discoverable synergy.
- Player action: select, craft, equip, combine, or route toward the synergy.
- Feedback: UI links light up, skill icon changes, attack effect mutates.
- Reward: new behavior, not just bigger numbers.
- Validation: build diversity, selection regret, moment recall in interviews.
- Guardrail: avoid one dominant combo that invalidates all alternatives.

Example: Fireball applies burn. A later perk makes burn explode at five stacks. A relic then spreads burn after explosions. The player sees the whole screen reaction and understands their build has changed.

### 5. Clutch Recovery

Use when the game has health, stamina, shields, lives, team saves, comeback mechanics, or last-chance states.

- Trigger: player is near failure but still has agency.
- Player action: make a hard choice or execute under pressure.
- Feedback: heartbeat audio, narrowed UI, recovery burst, teammate callout.
- Reward: survival, temporary buff, comeback score, social recognition.
- Validation: comeback frequency, frustration after failure, perceived fairness.
- Guardrail: do not make low-health play objectively optimal all the time unless that is the intended fantasy.

Example: At 1 HP, a perfect parry restores one shield pip and marks the enemy. The next hit deals bonus damage, turning panic into earned recovery.

### 6. Chain Reaction

Use when systems can interact: physics, elements, terrain, enemy states, economy, match combos, or AoE.

- Trigger: player sets up multiple conditions.
- Player action: trigger the final link.
- Feedback: sequential pops, escalating pitch, combo counter, camera framing.
- Reward: area clear, score burst, resource shower, shortcut, objective progress.
- Validation: player understanding, setup frequency, accidental vs intentional ratio.
- Guardrail: keep the cause readable; chain reactions should feel authored by the player.

Example: Freeze puddle -> lure enemies -> lightning arrow -> shatter explosion -> exposed hidden ore -> craft upgrade.

### 7. Meaningful Reward Choice

Use when the game can offer upgrades, routes, cards, boons, quests, factions, loadout changes, or companions.

- Trigger: player completes a challenge or reaches a node.
- Player action: choose between distinct futures.
- Feedback: clear comparison, synergy hints, preview on current build.
- Reward: agency and identity, not only power.
- Validation: choice distribution, regret, build ownership language.
- Guardrail: avoid fake choices where one option is always correct.

Example: After a stealth encounter, the player picks "silent dash", "decoy echo", or "bonus reward for no takedowns". Each supports a different play style.

### 8. Social Proof Moment

Use when the game has co-op, PvP, leaderboards, spectators, guilds, raids, or shared worlds.

- Trigger: player contributes at a decisive moment.
- Player action: save, assist, carry, coordinate, outplay, support.
- Feedback: feed entry, teammate ping, MVP card, replay highlight.
- Reward: visible contribution, status, trust, team gratitude.
- Validation: commendations, requeue with same party, social shares, toxicity reports.
- Guardrail: recognize support and setup actions, not only final hits.

Example: A healer cleanses the raid-wide debuff within 0.5 seconds. The end screen marks "fight-saving cleanse" alongside damage stats.

### 9. Guided Reveal Ritual (fortune, reading, tarot, horoscope apps)

Use when the product delivers interpreted or personalized hidden information.

- Trigger: user asks a question, draws a card, or requests today's reading.
- User action: frame the question, choose a focus area, or select reveal timing.
- Feedback: staged reveal — anticipation animation, partial hint, then full interpretation.
- Reward: personally meaningful interpretation the user can act on or reflect with.
- Validation: question submission rate, reading save rate, reflective follow-up rate.
- Guardrail: interpretations framed as reflection prompts, never deterministic predictions; no fear framing; no paid relief from a negative reading.

Example: A saju app lets the user pick one of three question lenses (work, relationship, self). The reading reveals in two stages: pattern first, then a reflective question back to the user. The user can save it with a one-line note.

### 10. Recognition Reflection (journaling, companion, habit apps)

Use when the product accumulates user input over time.

- Trigger: the app detects a pattern across entries (recurring theme, mood shift, progress).
- User action: user wrote the entries; user chooses whether to explore the pattern.
- Feedback: "I noticed..." card citing the user's own words or data.
- Reward: feeling seen; self-understanding artifact worth saving.
- Validation: pattern-card open rate, save/share rate, follow-up entry rate.
- Guardrail: no clinical claims; no manufactured intimacy to drive dependency; sensitive data used only visibly and consensually.

Example: After five entries mentioning sleep, the companion says "You've mentioned sleep in 5 of your last 7 entries — want to see the pattern?" and shows a simple timeline built from the user's own lines.

### 11. Transformation Artifact (creation, learning, productivity, AI apps)

Use when raw user input becomes a polished, reusable output.

- Trigger: user completes an input session (entries, answers, drafts, recordings).
- User action: provide the raw material; choose the output form.
- Feedback: visible transformation — draft becomes summary, answers become skill map, week becomes review.
- Reward: an artifact the user owns, saves, shares, or reuses.
- Validation: artifact save/export rate, revisit rate, artifact-triggered return visits.
- Guardrail: artifact quality must reflect real user input, not generic filler pretending personalization.

Example: A language app turns the week's mistakes into a personal "trap list" deck. The user names it, and next week's review starts from it.

### 12. Earned Insight Unlock (learning, skill, analytics apps)

Use when understanding deepens with use.

- Trigger: user reaches a competence threshold or completes a struggle.
- User action: practice, attempt, or apply — the unlock is earned, not time-gated.
- Feedback: "you can now see why" moment — a rule, pattern, or comparison unlocks.
- Reward: comprehension jump; ability to do something previously opaque.
- Validation: post-unlock usage of the new ability, self-reported "click" moments.
- Guardrail: never gate core learning behind payment framed as insight; no fake difficulty to sell shortcuts.

Example: After 10 sentences using past tense, the app unlocks a side-by-side view of the user's early vs current sentences, making progress visible and explaining the one rule that fixes their remaining mistakes.

### 13. Choice Consequence Echo (visual novels, narrative, decision apps)

Use when user choices should feel like they matter beyond the immediate scene.

- Trigger: a past choice visibly alters a later scene, line, or option.
- User action: the earlier choice; recognition happens now.
- Feedback: callback line, changed scene detail, "because you chose X" marker (subtle or explicit per tone).
- Reward: agency confirmed; the story is *theirs*.
- Validation: replay rate on branch points, choice distribution, recall in reviews.
- Guardrail: no manipulative cliffhanger engineered solely to force next-session opens; core resolution never paywalled.

Example: In chapter 4, a character returns the exact phrase the player chose in chapter 1, with a UI glint marking the callback. A route map afterward shows which unseen branches exist without spoiling them.

## Genre Shortcuts

- Action combat: perfect dodge/parry, stagger breaks, weak-point reveals, clutch recovery, build synergy.
- Roguelike/lite: route risk, relic synergy, elite reward choice, cursed power, build completion.
- Puzzle: insight reveal, chain clear, one-move-away cue, elegant shortcut, optional challenge clear.
- RPG: class identity unlock, set bonus, boss counterplay, companion approval, story consequence.
- Survival/crafting: scarce resource discovery, base upgrade unlock, risk expedition, weather escape, tool tier jump.
- Strategy: prediction payoff, fog-of-war reveal, economy timing, counter-tech, comeback defense.
- Racing/sports: perfect corner, draft timing, last-second overtake, combo line, skill replay.
- Idle/incremental: visible rate jump, automation unlock, prestige choice, milestone cascade, offline return summary.
- Social/PvP: clutch, outplay, team save, rank threshold, cosmetic status, rematch hook.

## Mini Output Example

Input: "탑다운 로그라이크. 플레이어는 검과 번개 마법을 쓰고, 방을 클리어하면 3개 보상 중 하나를 고른다."

Output shape (abbreviated — full skill output uses the 9-column schema from SKILL.md: # | 순간 | 장면 트리거 | 사용자 행동 | 작동 원리 | 피드백/연출 | 다음 행동 | 검증 지표 | 리스크/가드레일):

| # | 순간 | 장면 트리거 | 사용자 행동 | 작동 원리 | 피드백/연출 | 다음 행동 | 검증 지표 | 리스크/가드레일 |
|---|---|---|---|---|---|---|---|---|
| 1 | 완벽 회피 반격 | 보스의 붉은 베기 직전 | 0.25초 창 안에 회피 입력 | 위험-완화-반격으로 competence 강화 | 0.8초 슬로우 + 전용 사운드, 다음 검격 치명타 | 반격 기회를 노린 재교전 | 회피 재시도율, 성공 후 공격 입력률 | 창 표시를 명확히, 실패 원인 표시 |
| 2 | 번개 세트 완성 | 번개 보상 3개째 선택 | 세트 완성 보상을 직접 선택 | 빌드 시너지 snap | UI에서 번개 아이콘 3개 연결, 공격이 연쇄 번개로 변함 | 새 빌드 시험 욕구 | 해당 선택률, "강해졌다" 응답 | 한 속성만 정답이 되지 않게 대체 세트 제공 |
| 3 | 엘리트 방 위험 선택 | 다음 방 선택 화면 | 엘리트/상점/일반 중 위험 감수 선택 | autonomy + bounded surprise | 엘리트는 위험도와 확정 보상 사전 표시 | 위험 선택의 소유감으로 긴장 상승 | 엘리트 선택률, 사망 후 불공정 코멘트 | 보상 확정과 위험을 사전에 공개 |

## Common Failure Modes

- Passive reward: player receives something without action, choice, or readable cause.
- No next hook: the point feels good once but does not create a follow-up goal.
- Cosmetic overload: effects obscure state or hide why success happened.
- Randomness without trust: outcomes vary but the player cannot understand odds, agency, or floor.
- Infinite escalation: every reward must be louder, making the game exhausting.
- Dark pattern drift: engagement is driven by anxiety, spending pressure, or fear of missing out.
