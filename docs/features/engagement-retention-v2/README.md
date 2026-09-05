---
feature: engagement-retention-v2
phase: design
owner: chosh1179
created: 2026-09-06
updated: 2026-09-06
---

# Engagement & Retention Skills v2

Research, analysis and design for the v2 rewrite of the three-skill plugin.

The trigger was a blind A/B: with-skill answers lost all three matchups against a
plain-model baseline on the plugin's own domains, and every judge named the same
cause — the wide output tables. The research pass then found that several of the
skills' load-bearing citations no longer say what the skills claim they say.

## Documents

| File | Phase | What it holds |
|---|---|---|
| [02-research.md](02-research.md) | research | Index of the research set, executive summary, evidence limits |
| [02a](02a-research-psychology-and-moments.md) | research | Reward-moment psychology, the dopamine-vocabulary problem, SDT after the critiques, game feel |
| [02b](02b-research-metrics-and-benchmarks.md) | research | Metric definitions, verified benchmarks, myths to stop quoting, experiment design |
| [02c](02c-research-onboarding-and-sessions.md) | research | FTUE, first win, session design, positive disengagement |
| [02d](02d-research-liveops-and-lifecycle.md) | research | Passes, quests, login, energy, streaks, notifications, win-back, social |
| [02e](02e-research-genre-lessons.md) | research | Eleven genre retention models, platform split, meta-progression |
| [02f](02f-research-regulation-and-ethics.md) | research | Jurisdictions as of 2026-09, PEGI risk categories, dark-pattern evidence, the four tiers |
| [02g](02g-research-nongame-domains.md) | research | Learning, AI companion, journaling, interactive narrative |
| [02h](02h-research-korea.md) | research | Korean market, 사주 apps, 기다리면 무료, compliance calendar |
| [02i](02i-research-skillcraft.md) | research | Claude Code skill-craft constraints measured on 2.1.261 |
| [03-analysis.md](03-analysis.md) | analysis | What is wrong with v1.1.0, ranked, with what survived verification |
| [04-design.md](04-design.md) | design | The v2 specification: architecture, routing, modes, cards, ethics tiers, evals |

## How it was produced

Four multi-agent workflows: a research sweep (46 agents, 264 dated findings, 250
sources opened, 14 load-bearing claims adversarially verified), a skill analysis
(seven critic lenses, a 30-request routing test, a three-prompt blind A/B, then
adversarial verification of the merged findings), a documentation pass with a
cross-document consistency critic, and a design pass with three independent
architectures scored by three judge panels.
