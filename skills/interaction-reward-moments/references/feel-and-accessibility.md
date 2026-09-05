# Game Feel and Its Accessibility Bounds

Read whenever a proposal prescribes a sensory effect — hit stop, screen shake, flash, particles, haptics, camera, audio — or when the ask is how strong an effect should be.

## Juice is a curve, not a volume knob

Three preconditions [Kao, Ballou, Gerling, Breitsohl & Deterding, CHI 2024 | pre-registered, n=1,699 Prolific, ~340/condition | purpose-built action RPG, amplification × success-dependence × variability]:

1. **Fires only on success, and scales with degree of success.** Success-*dependent* amplification raised competence, curiosity, effectance and enjoyment; amplification *not* tied to success **lowered** effectance (−.19) and competence (−.43).
2. **One effect ↔ one action, occluding nothing.** The authors flag their own amplified condition may have broken the "Unambiguous" criterion — sword feedback engulfing enemy-hit feedback.
3. **Amplifies a functional response**, never decorates a screen.

Voluntary playtime spanned 6.17 min (standard feedback) to 10.18 min (amplified + success-dependent + varied) [same study].

**The dose is an inverted U.** Both "None" and "Extreme" juiciness reduced playtime, player experience, intrinsic motivation *and* performance versus Medium/High [Kao, *Entertainment Computing*, 2020 | N=3,018]. Err low: random parameter draws were judged "excessive 45% of the time… comfortable ranges are biased toward lower values", and heavy attacks wanted **1.7×** the presentation of light ones — a ratio between attack types inside one prototype, not a cross-genre multiplier [Seki & Ishikawa, CHI EA '26 poster art. 539, doi:10.1145/3772363.3798911 | adjust N=16, validation N=116 | one 2D action prototype, 8 visual/temporal parameters]. Anything fired hundreds of times a session — hit SFX, haptics — needs subtle randomised variation or it turns tiring [Nintendo, *Ask the Developer* Vol. 19, Jul 2025].

## The three make-or-break impact features

"Hit stop, sound coherence, and camera control may strongly influence players' impact feel. A lack of dedicated design on one of these three features may ruin players' impact feel." [Lin, Duan, Wen & Cai, IEEE GEM 2022, arXiv:2208.06155v3 | 281,720 Chinese-language Steam comments over 96 fighting-tagged games; 5,000 hand-annotated → classifier at 88%/92%; 44 games ranked, top-8/bottom-8 scored on 19 features]

- **Hit stop** — the freeze on contact. Cap it; scale by attack weight.
- **Sound coherence** — the paper's term, defined to include audio–visual desync ("improper sound effects and time delay between visual and audio feedback"). Sync audio to the impact frame.
- **Camera control** — reserve camera response for heavy and finisher hits.

Keep the paper's "may" — not a causal result. Scope: 16 hand-coded games, Chinese-only corpus, camera finding resting on five beat-'em-ups. **[corrected]** The two games lacking hit stop rank 39th and 40th of 44 — not the overall bottom two; ranks 43–44 do use hit stop.

## Latency is a precondition for felt agency

- Agency tracks **absolute** action–outcome delay, not whether the player consciously notices the lag [Erdogan & Balcı, *QJEP*, 2024].
- **Consistency beats raw minimum.** Riot's 2XKO adds a fixed three frames of input delay to all inputs, online *and* offline, so offline muscle memory transfers.
- Frame rate is part of the impact instant: 30 fps "couldn't fully capture everything that happens in that instant"; at 60 fps the sense of destruction "came through much more clearly" [Nintendo, *Ask the Developer* Vol. 19, Jul 2025].
- **Never label a build "optimized" without a real change.** At identical delays, 57.36% of comparisons favoured the sequence labelled "optimized" and 13.61% went against it [MDPI *MTI* 9(5):47, 2025 | n=60]. Real effect, but a manipulation, not a lever.
- **[contested]** Long hit stop in VR raises real/virtual body-motion mismatch and can *reduce* agency [Ban & Ujitoko, IEEE WHC 2021, doi:10.1109/whc49131.2021.9517129] — against the flat "hit stop improves impact feel" reading. Resolution: cap, scale by weight, let players tune, err low.

## Hard bounds — constraints, not suggestions

| Bound | Authority | The check |
|---|---|---|
| No more than **three flashes in any one-second period**, or below the general and red flash thresholds | WCAG SC 2.3.1, **Level A** | Frame-count the worst-case stack, not the isolated effect |
| Every camera **shake, bob, motion blur, mouse blur, sway** adjustable **to zero** | Xbox Accessibility Guideline 117 (upd. 3 Mar 2026) — turn-off option required, Halo Infinite's 0–100% sliders the cited exemplar; ESA Accessible Games Initiative **"Camera Comfort"** storefront tag (Mar 2025) requires such effects absent or switchable with sliders reaching zero | Slider at 0 → effect *absent*, not merely small |
| **OS reduced-motion is the default state**, read at boot and on change | iOS Reduce Motion, Android remove-animations, Windows/macOS reduce motion, web `prefers-reduced-motion` **[not in source research — platform docs]** | Flip it at OS level; effects drop with no in-game menu visit |
| **Haptics-off is first class** — real off switch plus intensity; every haptic-only cue duplicated visually or audibly | Preference spans **6-fold ranges across three distinct preference types** [Seki & Ishikawa] | Play the scene with haptics off; no information lost |
| **No telegraph carried by hue alone** — wind-ups, danger zones, state changes also differ in shape, motion, position, icon, sound or timing | WCAG SC 1.4.1 Use of Color, Level A. **[unverified]** no games-specific study in the source set | Greyscale the scene and try to read the tell |
| **No competitive advantage from disabling an effect**; conservative default | Kao 2024 contingency rule + XAG 117 | A player at shake 0 must not see through smoke or read a tell earlier |

## Which constants are server-tunable

| Constant | Where it lives |
|---|---|
| Hit-stop duration, shake amplitude and decay, particle counts, camera impulse, flash intensity, effect cooldowns, anti-spam caps | **Remote config** — what you retune after launch, and what a rollback must reach in hours |
| Frame-rate target, input-delay budget, audio-to-impact sync | **Build** — runtime changes shift feel between sessions and break the consistency rule |
| Accessibility toggles and intensity sliders, reduced-motion, haptics-off, flash reduction | **Player-owned, local, durable offline** — never remote-tunable, never an experiment arm, never reset by an update. Varying a player's accessibility setting is not an experiment |

## Numbers that do not exist

No transferable range is published in the source research for hit-stop duration in ms, shake amplitude or decay, particle count, haptic pulse duration or intensity, or camera-impulse magnitude. Seki & Ishikawa parameterised eight visual and temporal properties but report no usable values. Do not emit a ms range as if it were a benchmark.

**Calibrate instead of quoting.** Averaging the settings chosen by 16 in-house adjusters achieved **>80% "optimal" ratings from new users** [Seki & Ishikawa | adjust N=16, validation N=116]. The procedure: ~16 people tune the effect in-build, ship the average as default, ship the slider, err low.

## Pre-ship checklist

1. **Latency measured and stabilised** on the lowest-spec target device — *consistent* across online/offline and menu/combat, not merely small.
2. **Contingency audit** — play one scene and name the action behind each effect; each fires on success, scales with degree, occludes no state the player must read.
3. **Worst-case stack, frame-counted** — fire the heaviest legal combination (crit + level-up + chest reveal): under three flashes per second, still readable.
4. **Zero pass** — every slider at 0, OS reduced-motion on, haptics off, audio off: fully playable, no cue lost, no competitive disadvantage.
5. **Dose check against Medium, not against nothing** — None and Extreme both lost to Medium/High [Kao 2020, N=3,018]; testers calling your settings excessive near the 45% random-draw rate means you are above the comfortable band.
