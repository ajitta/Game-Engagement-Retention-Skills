---
name: engagement-retention-advisor
description: "Produce integrated proposals that jointly improve moment-level engagement AND lifecycle retention for games, interactive apps, AI companions, fortune/reading apps, visual novels, learning apps, communities. Use ONLY when the request contains TWO deliverables — (a) in-session reward/moment design AND (b) lifecycle/return strategy ('보상 순간과 리텐션 둘 다', '도파민 포인트 분석 + 사람들이 계속 쓰게', 'satisfying moments plus D1/D7/D30') — OR when the question itself is the moment-to-retention link (e.g. '리텐션을 높이려면 세션 안에 어떤 순간이 필요할까?'). A retention metric cited only as motivation or success criterion is NOT a second ask: 'D7이 낮은데 보상 연출 고치고 싶어' or '다음 날 또 오게 만들 정도로 만족스럽게' → interaction-reward-moments. Retention-only → retention-strategy-designer. Outputs 3-5 integrated proposals pairing a reward moment with a retention mechanism, plus metrics, experiments, domain ethics."
user-invocable: true
argument-hint: "<제품 설명 — 보상 순간 + 리텐션 통합 요청>"
allowed-tools: Read, Glob
---

# Engagement Retention Advisor

사용자가 순간 단위 보상 설계 **와** 리텐션 전략을 하나의 제안 세트로 명시적으로 요청할 때만 사용한다. 통합의 가치는 두 목록을 붙이는 게 아니라, 세션 안의 만족 순간이 **어떻게 다음 방문의 가치가 되는지** 연결하는 데 있다.

도메인별 윤리 가드레일 상세는 `references/domain-ethics.md` 참조.

## Routing

- 사용자가 **두 산출물**(순간 설계 + 리텐션/복귀 전략)을 모두 요구하거나, **순간과 복귀의 연결 자체를 질문**하면 → 이 스킬.
- 리텐션이 **목표/지표/수식어로만** 언급되면 ("D7이 낮은데 연출 고치고 싶어", "또 오게 만들 정도로") → 단일 스킬 유지. 순간 설계면 `interaction-reward-moments`.
- 사용자가 **리텐션만** 요청 → `retention-strategy-designer`.
- 애매하고 선택이 결과물을 크게 바꾸면 → 명확화 질문 1개.

## Workflow

1. 제품 모델 구축:
   - 사용자 의도, 핵심 가치, 핵심 상호작용, 현재 루프, return event, 자연 사용 주기

2. 문제를 두 레이어로 분리:
   - **Moment layer**: 한 세션 안에서 무엇이 만족스러운가? (`interaction-reward-moments`의 렌즈 사용: 기대/유능감/자율성/리빌/인정/변환/진행. 패턴이 필요하면 `../interaction-reward-moments/references/pattern-library.md` 읽기)
   - **Lifecycle layer**: 왜 내일, 다음 주, 다음 달에 돌아오는가? (`retention-strategy-designer`의 진단 사용: return event, 사용 주기, lifecycle 단계, 누수 지점. 벤치마크/실험 설계가 필요하면 `../retention-strategy-designer/references/retention-playbook.md` 읽기)

3. 두 레이어가 서로를 지지하는 지점만 재결합:
   - 모든 통합 제안은 보상 순간 + 리텐션 루프를 **둘 다** 가져야 한다
   - 각 제안에 **통합 근거** 명시: 왜 이 순간이 단순 자극이 아니라 다음 방문 가치로 이어지는가
   - 순간은 만족스럽지만 미래 가치가 없으면 → "engagement only"로 분리 표기
   - 리턴은 유도하지만 세션 만족이 없으면 → "retention only"로 표기하고 재설계

4. 도메인별 윤리 체크 (`references/domain-ethics.md`):
   - 운세/사주: 결정론적 인생 예언, 공포 프레이밍, 유료 감정 해소 금지
   - AI 컴패니언/저널링: 의존성, 과잉 알림, 위기상담 역할 혼동, 민감정보 남용 금지
   - 비주얼 노블: 조작적 cliffhanger, 핵심 결말 paywall 금지
   - 학습 앱: 죄책감 스트릭 금지, 복구 친화적 진행
   - 전체: open/세션 길이가 아니라 사용자 가치 중심 최적화

## Output

사용자 언어로 답한다. 한국어 입력이면 한국어로.

```markdown
## 입력 해석
- 제품/장면:
- 핵심 가치:
- 자연 사용 주기:
- 추천 return event:

## 통합 제안 3-5개
| # | 제안 | 세션 내 보상 순간 | 트리거/사용자 행동 | 피드백/연출 | 리텐션 메커니즘 | 대상 세그먼트/Lifecycle 단계 | Return event/시간창 | 윤리 가드레일 |
|---|---|---|---|---|---|---|---|---|
(셀은 2문장 이내)

## 통합 근거
(제안별 1-2줄: 왜 이 순간이 단순 자극이 아니라 다음 방문 가치로 이어지는가)

## 측정 설계
(제안별: 핵심 지표 + 실험 방식. 코호트 기준 측정, 신규성 효과 2-4주 관찰, 가드레일 지표(알림 해제율, 언인스톨, 불만) 병행)

## 분리해서 봐야 할 항목
- 보상 순간만 강한 것 (engagement only):
- 리텐션만 강한 것 (retention only → 재설계 필요):

## 우선순위
(임팩트 × 구현 난이도 기준 순서 + 근거 1줄씩)
```

## Guardrails

가드레일은 제안 생성 **전에** 설계 제약으로 적용한다 — 사후 필터 아님.

- 좋은 보상 순간을 전부 리텐션 루프로 강제 변환 금지.
- 리텐션 목표가 구체적 장면 설계를 일반론적 lifecycle 조언으로 평탄화하는 것 금지.
- 강박, FOMO, 죄책감, 불안 대신 투명하고 사용자에게 이익이 되는 루프 선호.
- **금지 패턴이 요청 자체일 때**: 거부 사유를 본문에 명시적으로 서술하고(테이블 셀 각주로 때우지 않기), 같은 비즈니스 목표를 달성하는 윤리적 대안으로 재설계해 제시. 조용한 부분 수용 금지.
- 도메인별 상세 금지 목록: `references/domain-ethics.md`.
