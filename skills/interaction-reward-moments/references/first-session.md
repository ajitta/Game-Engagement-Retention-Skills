# First Session and Session Exit

Read when the deliverable is the first-win beat, a named tutorial beat, or the way a session ends and the next one is booked.

## Three statements that travel with every FTUE answer

- **No vendor publishes FTUE or tutorial-completion benchmarks.** GameAnalytics 2025/2026, Liftoff and Sensor Tower publish none — the GameAnalytics report holds no tutorial data of any kind; Apple, Google and Roblox publish no numeric first-session threshold. Any FTUE target is the team's own, measured on its own build.
- **Tutorials can reduce retention** in some implementations [Andersen et al., CHI 2012 | 2012 | 8 tutorial designs × 3 games, 45,000+ players, online multivariate A/B].
- **Expect single-digit to low-teens relative effects.** A mobile-game feature RCT cut the hazard of session-ending 11% and of app abandonment 14% [Gu, Bapna, Chan & Gupta, *Management Science* 68(2) | 2022]. Ship behind an A/B with a holdout.

## Is a tutorial worth building at all

Ask first: **can the core mechanic be discovered by experimentation?** If yes — contextual hints, no scripted tutorial.

| Complexity | Form | Evidence |
|---|---|---|
| Discoverable by experiment | Contextual hints only | Andersen 2012: no engagement effect in the two simpler games |
| One system, timing-based | Guided 60–90 s, then free play | Supersonic 2025 (vendor BI, no methodology) |
| Layered meta + currencies | One mini-tutorial per system unlock | Supersonic 2025 |
| High rule density | Full tutorial, in-context | Andersen 2012: +29% play time in the most complex game only; context-sensitive delivery +16% play time / +40% progress in Foldit only |

**[contested] — simple games.** Andersen (45,000 players, behavioural) found no effect; a lab study found a tutorial raised non-experts' perceived flow and continuous-use intention, neutral for experts [MDPI *MTI* 4(3):41 | 2020 | n=40, self-report, simple mobile RPG]. Reconciling read: a tutorial can change how a novice *feels* without changing what they *do*, so a flow-justified tutorial still ships behind a behavioural A/B.

**Free constraints** [Apple HIG — Onboarding, updated 2024-06-10]: skippable, never re-shown, findable in settings/help; prefer interactive onboarding; let people play before any rating or purchase prompt. Add: no monetization surface inside the tutorial, and no over-assistance — AI action-suggestions cut cognitive load, but cutting it too far impaired learning [Choong et al., CHI 2025 | n=20 within-subjects].

## The hybrid-casual first-win shape

| Field | Value |
|---|---|
| Guided opening | Linear, 60–90 s, one system taught |
| First win | Legible: the taught action's outcome readable without a UI explainer |
| Then | Free play — easy-win runway of roughly the first 20 short levels |
| Difficulty turn | Level 20–25 (Color Block Jam: 20–30 min first session) |
| Meta layers | Introduced within the first few sessions |
| Monetization / ads | Deferred past the runway |
| Primary instrument | Tutorial-step drop-off — right precisely because no benchmark exists |

Segment source: AppMagic, "Top 10 Hybridcasual Games in Q1 2025" — **teardown inference, not telemetry**. Documented failure: Trash Tycoon, **60% of players churned during the tutorial** when mechanics arrived too fast [Supersonic, 2025-03-03 | vendor BI, no disclosed methodology]. The first session is deliberately *longer* than steady state — a shape decision, never a minutes target.

## The two-sided difficulty failure

Naming only "too hard" misdiagnoses half the D0/D1 cases.

- **Too easy is a real cause.** Higher early skill signals — fewer moves, more stars — were *inversely* related to retention [Drachen et al., AIIDE 2016 | mobile puzzle telemetry].
- **Harder is not more monetizable.** Making the game easier raised engagement (+1.25 rounds and +0.746 levels on day 1; ~1 extra play-day and 10 more rounds over 30 days), raised D7/D14, and **increased total spending** despite lowering per-round purchase propensity [Ascarza, Netzer & Runge, *IJRM* 42(4):975–995 | 2025 | randomized field experiment, F2P mobile puzzle | applied to existing users, so not literally FTUE].

## First-session length: diagnostic, never a target

Games whose median first session exceeded 9 minutes averaged **31% D1 vs 20%** below it [deltaDNA / Mark Robinson | Oct 2015–Feb 2016 | 275 comparable games — the unit is the *game*, not the player]. The author's own caveat: games "probably do not have short sessions by design, but rather because of high churn rates." No replication at that scale; no RCT ties first-session length to D1.

Anti-patterns to name out loud: padding with unskippable cutscenes or forced tutorial length to hit a minutes number; "median first session ≥ 9 min" as an OKR; quoting 31-vs-20 as an expected lift. The only defensible instrumentation is the **distribution** of session length by cohort, plus exit type where it can be surveyed.

## The stopping point and the closure screen

Positive exits come from satisfaction plus **closure at a structural end-point that matches the player's planned duration**; obscured structure and chained "just one more" hooks produce rage/regret exits, and save options change *when* players stop [Alexandrovsky et al., *PACM HCI* 8, CHI PLAY art. 301 | 2024 | 16 interviews + 111-respondent survey — the only game-specific study of exits]. Players plan sessions before play and sometimes plan re-engagement as they stop: **the exit is where the next session is booked.**

| Beat | Evidence strength |
|---|---|
| Visible session structure — show the unit's length before it starts | Moderate, qualitative |
| Completable session goal at entry ("3 runs", "one chapter"), marked done at exit | Moderate, adjacent domain |
| Closure beat: what you gained, what changed, what is next — then stop | Weak, qualitative |
| Save-anywhere and progress retention | Moderate, qualitative |
| No chained hook that conceals the end point | Moderate; also an ethics item |
| Korea: hourly play-time notice | Legal requirement |

The session-goal row rests on goal achievement, competing activities and push being the most prevalent stopping cues [Ernst & Schnauber-Stockmann, *Communication Research* | 2026 | 118 participants, 1,893 TikTok/Instagram sessions]. Same study, push-timing consequence: **an incoming notification ends the session of the app currently in use.**

**Korea, mandatory.** 게임산업진흥에 관한 법률 제12조의3 and 시행령 제8조의3 require displaying elapsed play time on screen and posting the warning '과도한 게임이용은 정상적인 일상생활에 지장을 줄 수 있습니다.' **every hour for at least 3 seconds** (시행 2025-10-23; verify with counsel). The 강제적 셧다운제 curfew was abolished 2022-01-01 — never cite it. Design move: align the wrap-up beat *with* the hourly notice rather than fight it.

## Return: the Pivot Point

Games "do not recognize that the player is returning to rather than continuing gameplay uninterrupted"; returning players lose tutorials and mid-narrative context, and the anchor for a return flow is a **Pivot Point — a moment that reminds the player of their expert self** [Hammad et al., "Homecoming," CHI 2021 | autobiographical design, small-n qualitative — the only study of the problem].

- Save the exact interaction state, not the level index.
- Open session 2 with the Pivot Point, not a re-shown tutorial.
- Recap narrative or run state on return — practitioner testimony only; label it so.
- Make missed days catchable: Marvel Snap's 2025-09-16 patch added a **30-day, non-resetting Bonus Challenge** (50 missions fed by the same daily missions) inside a 35-day window so players who miss days "still have the opportunity to earn everything" [Second Dinner patch notes].

**[contested] — cliffhanger vs closure.** Cliffhangers increased desire for the next installment with no enjoyment loss [Schibler, Hahn & Green, *Media Psychology* | 2023 | N=202, N=273]; cliffhangers raised arousal but **not** enjoyment or intention to continue [Wirz, Ort, Rasch & Fahr, *Psychology of Popular Media* | 2022 | N=133, electrodermal + cortisol]. Neither tested a game or measured next-day return, and the games-side exit study points toward closure. Offer the synthesis as an experiment, never a recommendation: **partial closure plus a named, visible next objective**, A/B'd against pure closure on next-session return.

## Numbers that do not exist

- FTUE or tutorial-completion benchmarks, from any vendor, at any percentile.
- Any numeric first-session threshold from Apple, Google or Roblox.
- Any published A/B on in-game stopping cues — wrap-up screens, "you're caught up" signals, session-goal prompts. The field review found 27 publications covering 90 media cues and called the area fragmented [Gilbert et al., CHIGREECE 2025]; evidence is qualitative or from social media.
- **Do not quote** (blog restatement, no dataset): "core gameplay within 60 seconds"; "aha within 90 seconds"; "onboarding lifts retention up to 50%"; "personalized onboarding +52% D30"; "GameAnalytics 2025 shows strong FTUE completion gives 2× D1".
