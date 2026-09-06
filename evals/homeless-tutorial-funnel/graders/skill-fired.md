---
type: tool_use
ablation: with-only
---

The answer must come from `game-engagement-retention:retention-strategy-designer`.

PASS when retention-strategy-designer fired alone.
FAIL when interaction-reward-moments fired (the tempting answer — "tutorial" is an interaction-reward-moments trigger word), when the advisor fired, or when no plugin skill fired.

The discriminator this case exists for: a tutorial **funnel** — which step, what order, what gating, the D0-to-D1 leak — is a lifecycle deliverable. A named tutorial **beat** that feels flat is an in-session deliverable and routes to interaction-reward-moments `first-win`; that half of the pair is tested by `mode-irm-first-win-tutorial-beat`. Failing this case in the other direction (routing a named beat to retention-strategy-designer) shows up there.

The rule being tested is the line all three bodies carry: "Tutorial drop-off is a funnel symptom, not a deliverable — route on the artifact asked for."

With-only — fired/not-fired indicator only.
