# Game Engagement Retention Skills

Claude Code plugin bundling **3 routed skills** for games and interactive apps:

| Skill | 역할 |
|-------|------|
| `interaction-reward-moments` | 세션 내 보상 순간("도파민 포인트") 설계·분석 |
| `retention-strategy-designer` | D1/D7/D30, lifecycle, churn 등 리텐션 전략 |
| `engagement-retention-advisor` | 보상 순간 + 리텐션을 함께 요청할 때 쓰는 통합 오케스트레이터 |

세 스킬은 **상호 라우팅 규칙을 공유**한다. 하나의 플러그인으로 함께 설치해야 라우팅이 의도대로 동작한다. `interaction-reward-moments`는 `engagement-retention-advisor/references/domain-ethics.md`를 상대 경로로 참조하므로 세트 설치가 필수.

## 설치 (Claude Code plugin)

로컬/사설 설치다. 공개 마켓플레이스 게시가 아니다 — 자기 repo를 marketplace source로 추가하는 방식.

```
/plugin marketplace add C:\Users\ajitta\Repos\ajitta\Game-Engagement-Retention-Skills
/plugin install game-engagement-retention-skills@game-engagement-retention-skills
```

git 원격에 올렸다면 로컬 경로 대신 repo URL도 가능:

```
/plugin marketplace add <git-repo-url>
/plugin install game-engagement-retention-skills@game-engagement-retention-skills
```

## 설치 확인

새 Claude Code 세션에서:

- `/interaction-reward-moments <게임 장면 설명>` 직접 호출
- "탑다운 로그라이크 전투 장면에서 도파민 포인트 찾아줘" 자동 트리거

## 구조

```
Game-Engagement-Retention-Skills/
├── .claude-plugin/
│   ├── plugin.json         # 플러그인 매니페스트 (스킬 3종)
│   └── marketplace.json    # 로컬 설치 매니페스트
└── skills/
    ├── interaction-reward-moments/     SKILL.md + references/
    ├── retention-strategy-designer/    SKILL.md + references/
    └── engagement-retention-advisor/   SKILL.md + references/
```
