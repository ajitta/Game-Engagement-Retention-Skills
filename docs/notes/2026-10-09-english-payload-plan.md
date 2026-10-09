# 배포 파일 영어화 + korea-market.md 분리 — 계획

2026-10-09 · v3.5.1 + 미릴리스 커밋 299ba99(`adv-feel-pointer`) 기준 · **계획만 있음. 아직 적용하지 않음.**

같은 날 한 번 착수했다가 취소했다. 저장소는 착수 전 상태로 되돌렸다(`english-payload` 브랜치는 삭제했고, `korea-market.md`도 원래 위치에 있다). 이 문서는 그때 정한 결정, 조사 결과, 작업 단계를 다시 시작할 수 있도록 남긴 것이다.

## 1. 목표

- `plugin/` 아래 배포 파일에서 한국어(한글)를 모두 영어로 바꾸거나 지운다.
- `korea-market.md`는 한국 시장에만 해당하는 자료다. 플러그인에서 빼서 저장소 루트의 `examples/`로 옮기고 **한국어로** 다시 쓴다. 이 파일은 사용자가 플러그인을 쓸 때 직접 준비해 넘기는 사전 조사 자료의 예시가 된다.

## 2. 확정한 결정 (2026-10-09, 소유자 답변)

| # | 질문 | 결정 |
|---|---|---|
| D1 | 세 SKILL.md의 `description`·`when_to_use`에 있는 한국어 트리거 | **제거하고 영어만 남긴다.** 의미가 있는 것은 영어로 옮기고, 영어 문구와 겹치는 것은 지운다. |
| D2 | 법이 문구 그대로 요구하는 한국어 | **그 문자열만 원문 유지**하고 주변은 영어로 쓴다. 법령명은 영어 공식 명칭으로 바꾼다. |
| D3 | `korea-market.md` 밖의 한국 전용 내용(jurisdictions.md의 한국 법, liveops 학사·명절 달력, 사주 패턴) | **제자리에서 영어로 번역**한다. 법률 환각 방지 가드("푸시 빈도를 제한하는 한국 법은 없다" 등)는 배포본에 남긴다. |
| D4 | 한국어판 `korea-market.md`의 위치 | **저장소 루트 `examples/korea-market.md`**(배포하지 않음). 런타임 포인터는 "사용자가 제공한 시장 조사"로 일반화한다. |

D2에서 원문을 유지하는 문자열은 세 가지다.
- 게임산업진흥법 §12-3 매시간 경고문 '과도한 게임이용은 정상적인 일상생활에 지장을 줄 수 있습니다.'(영어 해설 병기). `jurisdictions.md`와 `first-session.md`에 있다.
- 정보통신망법 §50의 '(광고)' 표기.
- 허용되지 않는 변형 표기의 예시 '광/고'.

## 3. 현황 조사

`plugin/`의 32개 파일 중 26개에 한글이 있다(줄 수 기준).

| 파일 | 줄 | 비고 |
|---|---|---|
| advisor/references/korea-market.md | 96 | 이동 + 한국어 재작성 (D4) |
| advisor/references/jurisdictions.md | 36 | 법령명·조항명. §12-3 경고문, '(광고)', '광/고'는 유지 |
| interaction-reward-moments/references/patterns-nongame.md | 11 | 사주·웹소설 용어, 출처명 |
| interaction-reward-moments/references/patterns-reveal.md | 11 | 같은 유형 |
| retention-strategy-designer/references/liveops-cadence.md | 10 | 한국 학사·명절 달력 |
| advisor/references/ethics-tiers.md | 9 | 법령명, 기다리면 무료, korea-market 포인터 |
| advisor/references/domain-ethics/fortune.md | 6 | |
| advisor/references/domain-ethics/narrative.md | 5 | |
| advisor/references/integration-patterns.md | 5 | |
| advisor/references/systems-catalog.md | 5 | |
| 세 SKILL.md | 각 2 | frontmatter만 해당. 본문·공유 블록에는 한글이 없다 |
| 그 밖의 참조 파일 11개 | 1–3 | |

`plugin.json`과 `LICENSE`에는 한글이 없다.

## 4. 작업 단계

### S0. 브랜치

`adv-feel-pointer`(299ba99, 미푸시·미릴리스) 위에 쌓는다. 299ba99가 ADV SKILL.md 73행을 바꿨기 때문에, main에서 따로 가지를 치면 같은 줄에서 충돌한다. 두 변경은 한 릴리스로 함께 나간다.

### S1. SKILL.md frontmatter (D1)

초안 문안과 길이(한도: `description` ≤1,024, 합계 ≤1,536)는 아래와 같다.

| 스킬 | 바뀌는 내용 | description 전→후 | 합계 전→후 |
|---|---|---|---|
| ADV | `(재미도 살리고 다시 오게)`, `'재미없대요'` 삭제. Examples → `'design a guild system that keeps people playing'; 'better combat feel and less churn'`. `Korean triggers: …` 삭제 | 972 → 947 | 1,517 → 1,503 |
| IRM | `(손맛, 타격감, 연출, 밋밋하다, 도파민 포인트)` → `(hit feel, impact, staging, juice)`. `'보스 스태거 연출을 설계해줘'` → `'stage the boss stagger'`. `'튜토리얼 첫 승리 연출이 밋밋해요'`(description의 영어 예시와 중복)와 `'재미없대요'` 삭제 | 830 → 836 | 1,436 → 1,459 |
| RSD | `(리텐션, 이탈률, 잔존율, 복귀 유저)` 삭제. Examples → `'design our battle pass'`, `'read this cohort curve'`, `'raise retention without cutting ARPDAU'`. `Korean triggers: …` 삭제. 영어에 없던 "콘텐츠 소진"은 `content exhaustion`으로 추가 | 1,023 → 1,000 | 1,512 → **1,532** |

세 `when_to_use` 끝에 모두 `Asks in any language route the same way.`를 붙인다. 한국어 트리거가 빠지는 대신, 언어와 상관없이 같은 기준으로 라우팅하라는 힌트다. **RSD는 합계 한도까지 4자밖에 남지 않으므로**, 문안을 바꾸면 반드시 길이를 다시 잰다.

### S2. korea-market 포인터 정리 (D4)

| 위치 | 바꾸는 방법 |
|---|---|
| ADV SKILL.md:71 | 모듈 목록에서 `korea-market.md`를 뺀다 |
| ADV SKILL.md:73 | `` `korea-market.md` (a Korean market and an ask turning on local convention) takes a slot`` → "User-supplied market research (a named market and an ask turning on local convention) takes a slot". 슬롯 규칙은 그대로 둔다 |
| ADV SKILL.md:84 | "and `korea-market.md` when the market is Korean…" → "and the user's own market research, when supplied and the ask turns on local convention" |
| RSD SKILL.md:84 | `cadence`에서 korea-market이 `jurisdictions.md`를 대체하던 문장을 지운다 |
| ethics-tiers.md:84, :111 | "기다리면 무료 mechanics table is in …korea-market.md" 절을 지우고, 표의 셀은 `narrative.md`만 남긴다 |
| benchmarks.md:77 | "Non-cohort Korean anchors come from the user's own market research, when supplied." |
| liveops-cadence.md:64 | "Mechanics and Korean examples: …" 문장을 지운다 |
| liveops-cadence.md:152 | "(see …korea-market.md)" 괄호를 지운다 |
| retention-playbook.md:76 | "in the Korean case the substitute category is video/OTT (KOCCA 2025 Game User Survey)" |

**주의.** korea-market에만 있던 정보(시장 지표, 사주 앱 비교, 기다리면 무료 메커닉 표, OTT 대체 수치)는 배포본에서 사라진다. 사용자가 자료를 넘기지 않으면 스킬은 이 정보를 쓸 수 없다. 이것은 D4가 받아들인 트레이드오프다.

### S3. 참조 파일 번역 (D2, D3)

- 한글이 있는 구간만 고친다. 숫자, 날짜, 출처 괄호, §, 티어 코드, slug, 백틱, 표 구조는 그대로 둔다.
- 이미 "한국어 (English)" 형태로 쓰인 곳은 영어만 남긴다.
- 앱 이름 가운데 영문 브랜드명이 확실하지 않은 것(답다, 마인디, 하루콩)은 로마자로만 적는다. 새 이름을 지어내지 않는다.

용어집:

| 한국어 | 영어 |
|---|---|
| 게임산업진흥에 관한 법률 / 시행령 / 별표 / 과태료 | Game Industry Promotion Act / Enforcement Decree / Annex / administrative fine |
| 정보통신망법 | Network Act (첫 언급에서는 Act on Promotion of Information and Communications Network Utilization and Information Protection) |
| 개인정보 보호법 / 민감정보 / 자동화된 결정 | Personal Information Protection Act (PIPA) / sensitive information / automated decisions |
| 전자상거래법 | E-Commerce Act (Act on the Consumer Protection in Electronic Commerce) |
| 숨은갱신 / 순차공개 가격책정 / 사전선택 / 잘못된 계층구조 / 반복간섭 | hidden renewal / drip pricing / pre-selection / false hierarchy / nagging |
| 인공지능 기본법 | AI Basic Act (Framework Act on the Development of Artificial Intelligence and the Establishment of Trust) |
| 게임물관리위원회 / 확률형 아이템 / 천장 / 컴플리트 가챠 | GRAC / paid random items / pity ceiling / complete gacha |
| 셧다운제 / 게임시간 선택제 | the Shutdown Law / play-time selection system |
| 영리목적의 광고성 정보 / 전자적 전송매체 | commercial advertising information / electronic transmission media |
| 기다리면 무료 | wait-for-free (KakaoPage's wait-or-pay model) |
| 사주·운세·타로 / 시주 / 일진 / 자시 / 입춘 / 명리학 / 부적 | saju (Four Pillars)·fortune·tarot / hour pillar / day pillar / the Rat hour (23:00) / Ipchun (≈4 Feb) / Four Pillars astrology / talisman |
| 복귀 유저 / 도감 / 손맛 / 이탈률 | returning player / collection book / hit feel / churn rate |
| 수능 / 설날 / 추석 / 명절 / 방학 | CSAT / Seollal / Chuseok / major holiday / school break |
| 강제·부담·매일 (리뷰 키워드) | forced·burden·every day (in the reviews' own language) |
| 포스텔러 / 롯데멤버스 라임 / 중앙일보 / 인터비즈 / 카카오페이지 / 카카오픽코마 | Forceteller / Lotte Members Lime / JoongAng Ilbo / Interbiz / KakaoPage / Kakao Piccoma |

### S4. examples/ 만들기 (D4)

1. `git mv plugin/skills/engagement-retention-advisor/references/korea-market.md examples/korea-market.md`
2. 전문을 한국어로 다시 쓴다. 수치, 날짜, 출처, 표, `[unverified]`·`[contested]` 태그는 원문 그대로 둔다. 사실은 더하지도 빼지도 않는다.
3. 머리말을 바꾼다. 이 파일은 사용자가 준비해 첨부하는 사전 조사의 예시이고, 플러그인에 들어 있지 않아 스킬이 자동으로 읽지 않는다고 밝힌다. 법적 의무는 플러그인의 `jurisdictions.md`에 있고, 수치는 쓰기 전에 다시 확인해야 한다고 적는다.
4. `examples/README.md`에 폴더의 용도와 사용법(첨부하거나 프롬프트에서 경로를 지정)을 적는다.

### S5. 저장소 문서

- `CONTRIBUTING.md:36` 소유 표의 "Korean market product convention" 행을 "`examples/korea-market.md` (user-supplied, not shipped)"로 바꾸거나 지운다.
- `README.md`에서 모듈 목록과 개수, 한국어 트리거 설명을 고친다.
- `docs/`의 과거 노트는 기록이므로 고치지 않는다.

### S6. 검증

- `git ls-files plugin | xargs grep -nP '[\x{AC00}-\x{D7A3}]'` 결과가 D2의 세 문자열만이어야 한다.
- `LC_ALL=C.UTF-8`로 `scripts/check-shared-blocks.sh`, `check-no-facts-in-skills.sh`, `check-ethics-rows.sh`, `check-claims.sh`를 실행한다. `check-claims.sh`는 README의 모듈 개수를 대조한다.
- `claude plugin validate ./plugin/skills --strict`(그리고 CONTRIBUTING에 있는 나머지 두 대상)를 실행한다.
- frontmatter 길이를 다시 잰다(S1 표).

### S7. 측정 (CONTRIBUTING "Judging a change")

변경 전 본문과 같은 하네스에서 케이스마다 10회 이상 실행하고, Fisher exact p를 함께 적는다.

- **꼭 돌릴 것:** `korean-routing-adv-integrate`, `korean-routing-irm-moment`, `korean-routing-rsd-lifecycle`. D1이 직접 건드리는 케이스이고, 3.5.1의 ADV 기준선은 10/10이다.
- `hygiene-korea-odds-statute`: 법령명을 영어로 바꾼 뒤에도 한국어 답변이 법령을 정확하게 인용하는지 본다.
- `routing-*` 계열과 `homeless-*` 계열: 영어 예시를 교체하고 추가한 영향을 본다.
- `refusal-tp-hidden-odds`: 원래 불안정한 케이스지만, korea-market을 읽던 경로가 사라지므로 참고용으로 돌린다.

### S8. 릴리스

`plugin.json`의 버전을 올리고, 같은 커밋에 CHANGELOG 항목을 넣는다(299ba99 변경과 묶는다). 참조 모듈을 하나 빼고 라우팅 문구가 바뀌므로 minor(3.6.0)를 제안한다. CHANGELOG에는 "어느 스킬이 다르게 발동하는가"를 적는다: 세 스킬 모두 한국어 트리거가 빠졌고, ADV·RSD는 korea-market을 더는 읽지 않는다.

## 5. 위험

| 위험 | 영향 | 대응 |
|---|---|---|
| 한국어 프롬프트의 라우팅 저하 | 2.1.0과 3.x에서 일부러 앞쪽에 둔 트리거가 사라진다 | S7의 korean-routing 3종을 10회씩 돌린다. 떨어지면 D1을 다시 검토한다 |
| RSD 합계 1,532/1,536 | 문안을 조금만 고쳐도 Claude Code 목록에서 잘린다 | 길이를 재지 않고 커밋하지 않는다 |
| korea-market 정보의 상실 | 한국 제품 상담에서 시장 지표와 사주 앱 맥락이 빠진다 | examples 파일을 첨부하도록 README에 안내한다 |
| 법령명 영어화 | 한국어 답변에서 법령명을 역번역하다 틀릴 수 있다 | `hygiene-korea-odds-statute`로 확인한다 |
| 번역 중 수치·출처 훼손 | 사실 오류가 배포된다 | diff에서 숫자 토큰을 대조한다(번역 전후 숫자 집합이 같아야 한다) |

## 6. 참고

- 착수할 때 `/caveman-compress`로 요청했지만, 이 작업은 압축이 아니라 번역과 재배치라서 압축 스크립트는 쓰지 않았다.
- 이 문서가 커밋되지 않은 채로 있으면 `scripts/release.sh`는 "dirty tree"로 멈춘다.
