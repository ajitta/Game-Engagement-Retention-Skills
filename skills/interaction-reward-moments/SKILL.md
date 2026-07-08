---
name: interaction-reward-moments
description: "Analyze and design high-engagement reward moments ('dopamine points') for games and interactive apps. Use when the input describes a game scene, combat loop, puzzle loop, progression system, interactive narrative, fortune-telling app, AI companion, learning app, or any product where reveal, choice, feedback, anticipation, or satisfying micro-moments matter — and the user asks to find, create, improve, or validate reward moments, engagement hooks, game feel, or player motivation. Retention words used as goal or success criterion ('D7이 낮아서', '또 오게 할 만큼') do NOT disqualify this skill — route away only when lifecycle strategy is itself a requested deliverable (then retention-strategy-designer or engagement-retention-advisor). For a bare '재미없다/질려한다' complaint with no named scene or loop, ask one clarifying question first. Outputs 3-5 concrete moments with triggers, actions, feedback, validation metrics, and ethical guardrails."
user-invocable: true
argument-hint: "<게임 장면 또는 앱 상호작용 설명>"
allowed-tools: Read, Glob
---

# Interaction Reward Moments

"보상 순간(reward moment)" / "도파민 포인트"는 제품 설계 용어다. 신경화학 측정 주장이 아니다. 기대, 주체성(agency), 불확실성, 피드백, 의미가 결합해 만족스러운 경험 피크를 만드는 짧은 상호작용을 뜻한다. 구체적 설계 언어를 우선한다: 기대, 선택, 불확실성, 숙련, 안도, 놀라움, 피드백, 진행, 사회적 인정.

리서치 근거가 필요하면 `references/research-basis.md`, 패턴 선택/예시는 `references/pattern-library.md` 참조.

## Routing

- 사용자가 **순간 단위** 만족감, 피드백, 리빌, 선택, 장면 루프, 보상 포인트, 도파민 포인트만 요청 → 이 스킬. 리텐션 지표가 **동기/성공 기준으로만** 언급돼도 이 스킬 유지 (지표는 검증 타깃으로 흡수).
- 사용자가 **리텐션만** 요청 (churn, D1/D7/D30, lifecycle, 습관, 복귀, 코호트) → `retention-strategy-designer`.
- 사용자가 **두 산출물**(순간 설계 + 리텐션 전략)을 모두 요구하거나 순간과 복귀의 연결 자체를 질문 → `engagement-retention-advisor`.
- 애매하고 선택이 결과물을 크게 바꾸면 → 명확화 질문 1개.

## Workflow

1. 입력을 컴팩트 모델로 파싱:
   - 도메인: 게임 / 내러티브 / 운세·리딩 / 학습 / 컴패니언 / 유틸리티 / 하이브리드
   - 사용자 의도: 플레이, 자기이해, 스토리 진행, 숙련, 안심, 과시, 창작, 의사결정
   - 핵심 동사: 사용자가 반복하는 행동
   - 상호작용 루프: 입력 → 기대 → 반응/리빌 → 해석/행동 → 다음 훅
   - 장면 상태: 순간 전/중/후, 기존 피드백 (시각/사운드/햅틱/UI/애니메이션/숫자)
   - 진행 구조: 레벨, 빌드, 언락, 컬렉션, 랭크, 스토리, 사회적 지위

2. 후보 피크 탐색 렌즈:
   - 기대와 놀라움: 큐, 불확실성, 리빌, 긍정적 서프라이즈
   - 유능감: 타이밍, 조준, 계획, 패턴 읽기, 숙련 증명
   - 자율성: 의미 있는 선택, 빌드 방향, 경로, 트레이드오프
   - 위험과 안도: 위기, 아슬아슬함, 클러치 회복, 역전
   - 진행과 근접 완성: 거의 찬 바, 세트 보너스, 언락, 마일스톤
   - 인정: 앱이 사용자의 정체성/노력/패턴을 반영
   - 변환: 원시 입력이 유용한 결과물(리딩, 요약, 계획, 아티팩트)로 변함
   - 시스템 시너지: 콤보, 연쇄 반응, 창발적 상호작용, 빌드 완성
   - 감각적 게임필: 히트스톱, 셰이크, 사운드, 파티클, 햅틱
   - 사회/지위: MVP, 랭킹, 팀 세이브, 공유 가능한 결과

3. 가장 강한 3-5개만 선별. 강한 포인트의 조건:
   - 정확한 장면 트리거
   - 수동 수집이 아닌 사용자 행동/결정
   - 순간 안에서의 즉각적 피드백
   - 결과 후 계속하고 싶은 이유
   - 텔레메트리, 플레이테스트, 자기보고로 검증 가능

4. 입력 장면에 강한 포인트가 없으면 최소 추가로 생성:
   - 결과 전 큐 추가 → 큐 구간에 사용자 주체성 추가 → 공정성 범위 내 불확실성 추가 → 결과를 읽을 수 있게 만드는 피드백 추가 → 다음 스텝 훅 추가

5. 윤리 필터 실행 (2단계에서 후보 탐색할 때부터 제약으로 적용 — 사후 필터 아님):
   - 숨긴 확률, 기만적 희소성, 지출 압박, 좌절-해소 유료화, 현금 결제 연동 변동 보상 → 추천 금지
   - 강박, FOMO, 매몰비용, 확률 은폐, 그라인드 인플레이션 의존 루프 → 플래그
   - 위험 설계는 투명한/스킬 연동/옵트인/코스메틱 대안으로 변환
   - 사용자가 조작적 설계를 직접 요구하면: 거부 사유를 본문에 명시하고 같은 목표의 윤리적 대안으로 재설계 제시. 조용한 부분 수용 금지

## Output

사용자 언어로 답한다. 한국어 입력이면 한국어로.

```markdown
## 입력 해석
- 도메인/장면:
- 사용자 의도:
- 핵심 동사 / 상호작용 루프:
- 진행 구조: (해당 시)
- 가정: (불확실한 입력은 가정으로 명시하고 진행. 답이 크게 갈릴 때만 질문 1개)

## 보상 순간 3-5개
| # | 순간 | 장면 트리거 | 사용자 행동 | 작동 원리 | 피드백/연출 | 다음 행동 | 검증 지표 | 리스크/가드레일 |
|---|---|---|---|---|---|---|---|---|

## 튜닝 노트
(포인트별 1줄: 빈도, 쿨다운, 난이도, 랜덤 범위, 안티스팸)

## 가장 강한 순간의 연출 시퀀스
1. ...

## 검증 방법
- 플레이테스트/관찰:
- 텔레메트리:
- 실패 신호:
```

6요소와 테이블 매핑: **Trigger**=장면 트리거, **Action**=사용자 행동, **Feedback+Reward**=피드백/연출 (보상 내용 포함: 스탯, 선택, 언락, 정보, 지위, 안도, 시너지), **Next hook**=다음 행동, **Tuning**=튜닝 노트 섹션. 테이블 셀은 2문장 이내 — 긴 상세는 튜닝 노트나 시퀀스로.

"가장 강한 순간" 선정 기준: 장면 고유 요소를 가장 많이 통합하고 검증 가능한 포인트. 시퀀스는 타이밍 포함 4-6단계로 작성.

## Quality Bar

"보상을 준다", "업적 추가", "이펙트 화려하게" 같은 일반론 금지. 모든 포인트는 제공된 장면과 규칙에 결속.

스킬로 얻는 보상 > 수동 보상. 읽을 수 있는 불확실성 > 순수 랜덤. 의미 있는 선택 > 자동 스탯 증가. 소수의 기억에 남는 피크 > 상시 노이즈 피드백.

리서치 인용 시 보수적으로: "이 레버는 reward prediction error / 자기결정이론 / 플로우 연구와 일치한다"로 표현. 설계가 도파민을 직접 만든다고 주장하지 않는다.

## Guardrails

- 운세/건강/금융/관계/인생 결정 맥락에서 추측성 예측을 확실성처럼 제시 금지.
- 의존성보다 성찰, 해석, 사용자 주체성 우선.
- 죄책감 스트릭, 공포 알림, FOMO, 가짜 희소성, 유료 감정 해소 금지.
- 도메인별 상세 가드레일: `../engagement-retention-advisor/references/domain-ethics.md` (설치된 경우). 없으면 위 Guardrails + Workflow 5단계 윤리 필터만으로 판단.
