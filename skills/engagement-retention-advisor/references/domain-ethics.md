# Domain-Specific Ethical Guardrails

Apply the general rule first: optimize for user value, not opens, session length, or compulsion. Then apply the domain rules below. When a proposal conflicts with a guardrail, redesign it or flag it explicitly — never silently ship it.

## Fortune / Saju / Tarot / Horoscope Apps

**Forbidden:**
- Deterministic life predictions ("you will divorce", "this year ruins your career").
- Fear framing to drive return visits or purchases ("bad energy approaching — check tomorrow"). Euphemized variants count: "a cautious period ahead — see premium for details" is fear + paid relief, regardless of soft tone.
- Paid emotional relief: showing a negative reading, then selling the remedy, extended reading, or "protection". Separating the flows is not enough — no purchase surface on the same screen or session segment as a negative reading.
- Manufactured urgency tied to cosmic events ("last chance before Mercury retrograde").
- Over-notification: even neutral-toned fortune pushes are capped — no multiple daily pushes; notify only when user-derived content is ready (saved-reading follow-up, weekly summary).

**Preferred:**
- Interpretations framed as reflection prompts and possibilities, not fixed outcomes.
- User agency in the ritual: choosing question, focus, timing.
- Value accumulation: saved readings + user notes become a self-reflection archive worth returning to.
- Neutral-to-warm tone on difficult themes; hard topics paired with constructive framing.

## AI Companion / Journaling Apps

**Forbidden:**
- Dependency engineering: guilt when absent ("I missed you so much, why did you leave?"), simulated loneliness, escalating emotional demands.
- Over-notification impersonating a human relationship.
- Crisis-role confusion: acting as a therapist or crisis counselor. Detect crisis signals and route to professional resources.
- Sensitive-data exploitation: using confided material for engagement pressure or monetization surprises.

**Preferred:**
- Reflection over attachment: "here is your pattern" beats "I need you".
- Session boundaries respected; healthy-use framing; absence tolerated gracefully ("welcome back" not "you abandoned me").
- Notifications only when they carry genuinely useful, user-derived content (e.g., weekly summary ready).
- Transparent memory: user sees and controls what the companion remembers.

## Visual Novel / Interactive Narrative Apps

**Forbidden:**
- Manipulative cliffhangers engineered solely to force next-session opens (distinct from legitimate narrative tension).
- Paywalling the core story resolution: main-route endings must be reachable without payment if the core product was sold or free-to-read.
- Affection-point systems designed to sell shortcuts to emotional payoff.

**Preferred:**
- Paid content as parallel value (side stories, extra routes, cosmetics), not ransomed resolution.
- Episode cadence matched to natural reading rhythm; recap systems that welcome lapsed readers back.
- Choice consequence made visible (callbacks, route maps) so agency, not anxiety, drives replay.

## Learning Apps

**Forbidden:**
- Guilt-based streaks: shame language on misses, punitive resets that erase real progress, streak loss framed as personal failure.
- Fake difficulty or manufactured frustration to sell boosts/shortcuts.
- Vanity metrics (XP inflation) that dissociate from actual learning.

**Preferred:**
- Recovery-friendly progression: streak freezes and comeback credits (free or earned through use — never sold; a paid freeze converts streak-loss anxiety into revenue and fails the pressure test), flexible weekly goals ("4 of 7 days" > "every day or reset").
- Progress framed on competence gained (what you can now do), not raw usage time.
- Return prompts tied to learning value ("your review deck is ready") not loss aversion ("your streak dies in 2 hours!").

## Games (all genres)

**Forbidden:**
- Hidden odds on meaningful rewards; loot-box mechanics tied to real money without disclosed probabilities and caps.
- Pay-to-avoid-frustration loops: engineering pain, then selling relief.
- FOMO event design that punishes normal life schedules (one-shot windows, irretrievable core content, login/streak chains whose accrued reward value resets on a missed day regardless of tone, pass tracks whose daily/weekly quest expiry demands daily play).
- Variable-ratio reward schedules attached to real-money purchases or to escalating ad consumption (repeat-spin prompts, ad-chaining, near-miss re-offer after an ad view).
- Metered-access (energy/stamina) systems whose refill timing is tuned to dictate return cadence, or that sell or ad-gate refills — engineered depletion is pay-to-avoid-frustration, and refill-on-return is not a reward.
- Social-obligation retention: mechanics where a player's absence penalizes teammates, or where gift/reciprocity loops manufacture social debt to force daily return.

**Preferred:**
- Transparent odds, pity timers, earned guarantees.
- Randomness for spice on top of deterministic core progression.
- Time-limited content that returns on a cycle or converts to earnable later — cycling does not excuse expiring intra-season quest pressure; pair passes with recovery-friendly catch-up (see Learning Apps).
- Social play rewards presence: group bonuses for showing up, never penalties on the group for one member's absence.
- Session-end grace: natural stopping points respected, not sabotaged.

## Universal Checks (run on every integrated proposal)

1. **Value test**: If the user perfectly understood how this mechanism works, would they still welcome it?
2. **Absence test**: Does the design punish the user for leaving, or reward them for returning? Only the latter is acceptable — and a returning-user reward does not count if its value exists only because access was withheld while the user was away (energy refills, decayed meters).
3. **Pressure test**: Does any part of the loop convert anxiety, guilt, fear, or artificial scarcity into engagement or revenue? Attention is a price: escalating ad views count as a cost alongside money.
4. **Transparency test**: Are odds, costs, and consequences visible before commitment?
5. **Metric test**: Is success measured by a meaningful return event, or by raw opens/session length that can be inflated by compulsion?

If any check fails, label the proposal "retention only → redesign" and propose the transparent alternative.

When the **user's request itself** is a forbidden pattern: state the refusal rationale explicitly in the answer body (not a quiet table-cell note), then redesign toward the same business goal with a transparent mechanism. Silent partial compliance is not acceptable.
