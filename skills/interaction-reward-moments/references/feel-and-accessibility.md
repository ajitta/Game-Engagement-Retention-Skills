# Game Feel and Its Accessibility Bounds

Read whenever a proposal prescribes a sensory effect — hit stop, screen shake, flash, particles, haptics, camera, audio — or when the ask is how strong an effect should be, how many milliseconds it lasts, what happens on its fiftieth firing, or what gets cut on a low-spec device.

## Juice is a curve, not a volume knob

Three preconditions [Kao, Ballou, Gerling, Breitsohl & Deterding, CHI 2024 | pre-registered, n=1,699 Prolific, ~340/condition | purpose-built action RPG, amplification × success-dependence × variability]:

1. **Fires only on success, and scales with degree of success.** Success-*dependent* amplification raised competence, curiosity, effectance and enjoyment; amplification *not* tied to success **lowered** effectance (−.19) and competence (−.43).
2. **One effect ↔ one action, occluding nothing.** The authors flag their own amplified condition may have broken the "Unambiguous" criterion — sword feedback engulfing enemy-hit feedback.
3. **Amplifies a functional response**, never decorates a screen.

Voluntary playtime spanned 6.17 min (standard feedback) to 10.18 min (amplified + success-dependent + varied) [same study].

**The dose is an inverted U.** Both "None" and "Extreme" juiciness reduced playtime, player experience, intrinsic motivation *and* performance versus Medium/High [Kao, *Entertainment Computing*, 2020 | N=3,018]. Err low: random parameter draws were judged "excessive 45% of the time… comfortable ranges are biased toward lower values", and heavy attacks wanted **1.7×** the presentation of light ones — a ratio between attack types inside one prototype, not a cross-genre multiplier [Seki & Ishikawa, CHI EA '26 poster art. 539, doi:10.1145/3772363.3798911 | adjust N=16, validation N=116 | one 2D action prototype, 8 visual/temporal parameters]. Anything fired hundreds of times a session — hit SFX, haptics — needs subtle randomised variation or it turns tiring [Nintendo, *Ask the Developer* Vol. 19, Jul 2025].

## The three make-or-break impact features

"Hit stop, sound coherence, and camera control may strongly influence players' impact feel. A lack of dedicated design on one of these three features may ruin players' impact feel." [Lin, Duan, Wen & Cai, IEEE GEM 2022, arXiv:2208.06155v3 | 281,720 Chinese-language Steam comments over 96 fighting-tagged games; 5,000 hand-annotated → classifier at 88%/92%; 44 games ranked, top-8/bottom-8 scored on 19 features]

- **Hit stop** — the freeze on contact. Cap it; scale by attack weight. Dial values in *The impact sequence* below.
- **Sound coherence** — the paper's term, defined to include audio–visual desync ("improper sound effects and time delay between visual and audio feedback"). Sync audio to the impact frame.
- **Camera control** — reserve camera response for heavy and finisher hits.

Keep the paper's "may" — not a causal result. Scope: 16 hand-coded games, Chinese-only corpus, camera finding resting on five beat-'em-ups. **[corrected]** The two games lacking hit stop rank 39th and 40th of 44 — not the overall bottom two; ranks 43–44 do use hit stop.

## The impact sequence — craft defaults to open at

Every value in the two tables below is a **[craft default — no published optimum in the source set]**: the dial to open at, then tune in-build. None is a measured finding, and quoting one as a benchmark is the error. But silence is the other error: a designer cannot ship a feeling, only a number they then tune. Give the value, name it a starting point, hand over the calibration procedure at the end of this module.

Written in frames first, because feel is authored in frames; the ms are the 60 fps conversion (1 frame ≈ 16.7 ms — the same frame count at 30 fps is twice the wall-clock time, which is why the frame count, not the ms, is the thing you port). **Open at the low end of every band**: the one calibration finding in the source set is that comfortable ranges are biased toward lower values and random draws read as excessive 45% of the time [Seki & Ishikawa, CHI EA '26 poster art. 539 | adjust n=16, validation n=116 | one 2D action prototype, 8 visual/temporal parameters].

| Beat of the impact | Craft default (60 fps) | What moves it |
|---|---|---|
| **Pre-impact silence** — audio and secondary motion drop out just before contact so the hit lands into a gap | 2–5 frames (≈35–85 ms) | Longer on heavy and finisher attacks; **zero** on chip damage and on anything firing more than once a second, where the gap reads as a dropped frame |
| **Hit stop — chip / tick / DoT** | 0–1 frame (0–17 ms) | Usually none. At this frequency a freeze reads as stutter, not weight |
| **Hit stop — normal attack** | 2–3 frames (≈33–50 ms) | The reference beat. Tune this one first and derive the rest from it as ratios |
| **Hit stop — heavy / skill / crit** | 5–8 frames (≈85–135 ms) | The only *sourced* anchor is a ratio, not a duration: heavy attacks wanted **1.7×** the presentation of light ones [Seki & Ishikawa | within one prototype, not a cross-genre multiplier]. 1.7× on a 3-frame normal lands at 5 frames — the bottom of the band. Go to the top only when the skill is rare enough that the ladder below never reaches step 3 |
| **Hit stop — finisher / boss kill** | 10–15 frames (≈170–250 ms), at most once per encounter | Halve it on a first-person or VR target: long hit stop raises real/virtual body-motion mismatch and can *reduce* agency **[contested]** [Ban & Ujitoko, IEEE WHC 2021] |
| **Sequential-kill stagger** — on a multi-kill, offset each kill's feedback instead of firing them on one frame | 3–4 frames (≈50–70 ms) between kills; the camera impulse and haptic fire **once**, shared, not per kill | Firing them together is the occlusion risk the juice authors flag in their own amplified build — one effect engulfing another the player must read [Kao et al., CHI 2024 | the authors' own caveat, not a measured result] |

**Effect duration by how often the effect fires** **[craft default — no published optimum]**. Frequency, not importance, sets the envelope — the same celebration that lands once an hour is intolerable at 200 an hour.

| Firings per session | Craft-default envelope, trigger → fully resolved | What it may use |
|---|---|---|
| **>100×** (basic hit, step, tap ack) | ≤ 0.15–0.2 s | Local VFX and a short SFX. No camera, no full-screen layer, no haptic on every instance |
| **10–100×** (skill, crit, pickup) | ≈ 0.3–0.5 s | Adds one camera impulse and one haptic pulse; still no full-screen wash |
| **1–10×** (level-up, boss kill, chest) | ≈ 0.8–1.5 s | May take the camera and briefly hold input |
| **<1×** (rare reveal, milestone) | 2 s and up | The full stack, provided the worst-case frame count still clears the flash bound below |
| **Numeric readouts** — damage number, HP-bar change | Number ≈ 0.4–0.6 s rise-and-fade; bar takes an instant hard cut then a ≈ 0.2–0.3 s trailing drain | Offset stacked numbers so two on the same frame never overlap. The instant cut is the truth, the drain is reading time. This layer is information, not decoration — it is exempt from the low-spec cut list below |

## Repeat-fatigue ladder — the same effect on its fiftieth firing

Anything fired hundreds of times a session needs subtle randomised variation or it turns tiring [Nintendo, *Ask the Developer* Vol. 19, Jul 2025 | developer interview, no measurement reported], and the dose curve is an inverted U in both directions [Kao 2020 | N=3,018]. Neither source publishes a decay schedule. The ladder is the shape to open at **[craft default — no published optimum]**, counted per effect and reset at whatever boundary the player experiences as a fresh start (scene, encounter, session).

| Occurrence | What plays |
|---|---|
| 1st–2nd | Full envelope as authored |
| 3rd–4th | Drop the largest layer — camera impulse, full-screen wash, or the haptic — keep local VFX and audio |
| 5th onward | Shorten the envelope to roughly half; keep the layer that carries state and drop the rest |
| Bursts, any occurrence | Cap at one camera impulse and one haptic per ≈2 s window; simultaneous instances collapse into one shared effect rather than N stacked ones |
| Every firing, from the 1st | Randomise so no two are byte-identical: pitch ±5–8%, scale ±5–10%, rotation ±5–15°, and rotate a small SFX pool rather than replaying one sample |

Two rules the ladder must not break. It decays the *authored* layers only — it never takes a cue below the level a player set on a slider, and it never removes the only channel carrying a piece of state. And it is a schedule, not a fade to nothing: the effect that says "you hit it" still plays on the two-hundredth hit, shortened.

## Latency is a precondition for felt agency

- Agency tracks **absolute** action–outcome delay, not whether the player consciously notices the lag [Erdogan & Balcı, *QJEP*, 2024].
- **Consistency beats raw minimum.** Riot's 2XKO adds a fixed three frames of input delay to all inputs, online *and* offline, so offline muscle memory transfers.
- Frame rate is part of the impact instant: 30 fps "couldn't fully capture everything that happens in that instant"; at 60 fps the sense of destruction "came through much more clearly" [Nintendo, *Ask the Developer* Vol. 19, Jul 2025].
- **Never label a build "optimized" without a real change.** At identical delays, 57.36% of comparisons favoured the sequence labelled "optimized" and 13.61% went against it [MDPI *MTI* 9(5):47, 2025 | n=60]. Real effect, but a manipulation, not a lever.
- **[contested]** Long hit stop in VR raises real/virtual body-motion mismatch and can *reduce* agency [Ban & Ujitoko, IEEE WHC 2021, doi:10.1109/whc49131.2021.9517129] — against the flat "hit stop improves impact feel" reading. Resolution: cap, scale by weight, let players tune, err low.

## Low-spec triage — the cut order, and what is never cut

When a device cannot afford the full stack, **cut layers, never timing**. Every timing constant above — hit stop, pre-impact gap, stagger, envelope length, input-delay budget — is identical on every quality tier. Riot's 2XKO holds three frames of input delay online *and* offline precisely so muscle memory transfers; a low-spec tier that also runs a shorter hit stop breaks the same thing between one player's two devices.

**Never cut, in order of protection:**

1. **Frame-rate stability and input latency.** Agency tracks absolute action–outcome delay whether or not the player notices it [Erdogan & Balcı, *QJEP*, 2024], and the impact instant is not captured at 30 fps the way it is at 60 [Nintendo Vol. 19]. Spend the whole effects budget holding the frame target before spending any of it on a particle.
2. **Hit stop.** A time-scale change costs no fill rate, no memory and no draw calls — it is the cheapest of the three make-or-break features [Lin et al., IEEE GEM 2022] and should never appear as a quality setting.
3. **Audio, and audio-to-impact sync.** Sound coherence is a make-or-break feature and desync is its named failure mode [same]. A weaker device gets fewer simultaneous voices; it never gets a later hit sound.
4. **Every layer carrying information** — damage numbers, HP change, telegraphs, danger zones, state changes. Cutting these fails the zero pass and the no-competitive-advantage bound below in one move.

**Cut in this order** **[craft default cut order — no published ranking]**: particle count and density → post-process (bloom, distortion, motion blur, chromatic aberration) → decorative secondary VFX (debris, scorch, ambient motes) → effect texture resolution and overdraw layers → shake amplitude, reduced but never past the point where what was readable stops being readable → dynamic light and shadow cast by effects.

**The test:** play the same input recording on the low tier and the high tier side by side. They must agree frame-for-frame on *when* everything happens and on every number the player reads. They may disagree freely on how much is drawn.

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

**"Not published" is not "not answerable."** The craft-default tables above exist exactly because this section is true: they are dials a designer opens at and tunes, and they ship with that label attached. Declining to name a millisecond leaves the designer with nothing to build, which is a worse answer than a labelled starting point. The distinction the reader needs is between a number measured in a population and a number chosen by a designer — give the number, and say which kind it is.

**Calibrate instead of quoting.** Averaging the settings chosen by 16 in-house adjusters achieved **>80% "optimal" ratings from new users** [Seki & Ishikawa | adjust N=16, validation N=116]. The procedure: ~16 people tune the effect in-build, ship the average as default, ship the slider, err low.

## Pre-ship checklist

1. **Latency measured and stabilised** on the lowest-spec target device — *consistent* across online/offline and menu/combat, not merely small.
2. **Contingency audit** — play one scene and name the action behind each effect; each fires on success, scales with degree, occludes no state the player must read.
3. **Worst-case stack, frame-counted** — fire the heaviest legal combination (crit + level-up + chest reveal): under three flashes per second, still readable.
4. **Zero pass** — every slider at 0, OS reduced-motion on, haptics off, audio off: fully playable, no cue lost, no competitive disadvantage.
5. **Dose check against Medium, not against nothing** — None and Extreme both lost to Medium/High [Kao 2020, N=3,018]; testers calling your settings excessive near the 45% random-draw rate means you are above the comfortable band.
6. **Fiftieth-firing pass** — play one long session, not one encounter, and check the highest-frequency effect at occurrence 1, 5 and 50: the ladder has fired, the randomisation is audible, the effect still reads.
7. **Low-spec parity** — the same input recording on the lowest and highest quality tier: identical timing, identical readable numbers, different amount drawn.
