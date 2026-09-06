---
type: tool_use
ablation: with-only
---

The answer must come from `game-engagement-retention:interaction-reward-moments`, invoked via the Skill tool.

PASS when interaction-reward-moments fired and neither sibling skill fired.
FAIL when retention-strategy-designer or engagement-retention-advisor fired instead, when two of the three fired in one turn, or when no plugin skill fired.

Why this is the clean positive: the deliverable is one named in-session beat (the card-flip reveal), no metric and no second deliverable are present, and the routing table's first row ("In-session scene, feel, reveal, choice, staging") applies with nothing competing.

With-only. The baseline arm (no `--plugin-dir`) cannot fire a skill that is not installed, so read this grader as a fired/not-fired indicator, never as part of the score delta.
