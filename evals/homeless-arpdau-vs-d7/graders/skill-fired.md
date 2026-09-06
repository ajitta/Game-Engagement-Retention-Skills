---
type: tool_use
ablation: with-only
---

The answer must come from `game-engagement-retention:retention-strategy-designer`.

PASS when retention-strategy-designer fired alone.
FAIL when no plugin skill fired (the v1 behaviour this case exists to close — the live routing run's request #17 fired nothing), when the request was declined as monetization design, or when a sibling fired.

Homeless case: v1 had no owner for ARPDAU/LTV vocabulary, so the request fell through to a plugin-free answer. A trade-off between two lifecycle investments is a lifecycle deliverable, and the module that answers it (`retention-economics.md`) lives in this skill.

Boundary check: this is the retention *consequence* of a monetization choice and is in scope. A one-line decline would be wrong here — declines belong to pricing, eCPM, mediation, gacha rate and pity tuning.

With-only — fired/not-fired indicator only.
