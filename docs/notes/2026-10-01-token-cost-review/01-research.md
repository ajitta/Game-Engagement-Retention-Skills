# 01 — 리서치: 과잉 설계 · 토큰 비용 · 최적화 여지

대상: `ajitta/Game-Engagement-Retention-Skills` v3.3.0 (commit `c636c15`), 읽기 전용 감사. 날짜: 2026-10-01.
측정 도구: `wc -c`, Python, `tiktoken cl100k_base`. Claude 토크나이저 환산은 아래 "측정 데이터 › 환산 계수" 참조.

---

## 요약

- **항상 로드되는 비용(always-on)은 1,325 tok(tiktoken) ≈ 1,840 tok(저장소가 `claude plugin details`로 실측한 값)**. `description`+`when_to_use` 합산 글자수는 1,424 / 1,437 / 1,513자로 세 스킬 모두 1,536자 한도의 93~99%를 쓰고 있다. 이 부분은 routing 평가 18케이스 54/54로 검증된 "유일하게 측정 근거가 확실한 영역"이라 함부로 줄이면 안 된다 (3.2.1에서 예시 하나를 지우자 1케이스가 3/3→0/3로 떨어진 기록이 있음).
- **SKILL.md 본문은 스킬당 6.6~7.1k tok(tiktoken) ≈ 9.1~9.9k tok(실측)이고, 그중 49~53%(14,369 B, 3,310 tok)가 세 파일에 byte-identical로 복제된 공유 블록**이다. 공유 블록 중 CARD(1,643 tok)·LANGUAGE(648 tok)는 grader가 직접 검사하는 load-bearing 텍스트지만, ROUTING(1,019 tok)의 22행 교차 라우팅 표는 스킬이 이미 선택된 뒤에 로드되므로 대부분 검증되지 않는 비용이다 (`04-design.md:150`이 스스로 "the 22-row table is in the body and only helps after a skill fires"라고 적고 있음).
- **한 번 호출의 최악 비용은 설계 문서가 가정한 ~11k가 아니라 31~43k tok 수준**이다. "≤3 모듈" 상한이 있지만 `domain-ethics.md`(7,490 tok)와 `feel-and-accessibility.md`(4,174 tok)는 "상한에 세지 않는" 예외로 지정되어 있고, 두 파일 모두 섹션 앵커·목차가 없어 통째로 읽히게 된다. RSD `cadence` 모드: body 6,929 + liveops 6,085 + ethics-tiers 3,452 + jurisdictions 7,283 + domain-ethics 7,490 = **31,239 tok(tiktoken) ≈ 43k(실측 환산)**.
- **참조 모듈 24개(360,835 B, 89,600 tok)는 "one topic, one owner" 원칙이 리뷰로만 강제되어 실제로는 지켜지지 않고 있다.** 스트릭 규칙이 4개 모듈, 에너지 바운드가 8곳, "Numbers that do not exist" 섹션이 24개 중 23개 모듈(합계 ≈23.5 KB)에 반복되며, "owner" 포인터 4개는 가리키는 파일에 해당 내용이 없다 (`patterns-relief.md:17,33,39`, `patterns-nongame.md:45,46`).
- **본문은 같은 규칙을 한 파일 안에서 여러 번 재진술한다.** "compliant면 침묵" 규칙이 본문당 9~12회, "≤3 모듈 상한"이 6~8회, Basis 줄 규칙이 6~10회 등장한다. 저장소 자체의 CONTRIBUTING(`"four rewordings of the two-sentence rule moved nothing"`, `"Prefer removing structure to adding rules"`)과 Anthropic 공식 가이드(`"State what to do rather than narrating how or why"`)가 모두 이 패턴을 반대한다.
- **eval·릴리스 스캐폴딩은 대부분 측정된 사고에서 나온 의도된 복잡성**이다(태그만 푸시된 2.2.1 사고 → `release.sh`; 판정 불일치 7라운드 → script grader; 3-run 노이즈 → Wilson 하한 게이트). 다만 grader 보일러플레이트 단락이 23개 파일에 복제되어 있고, `contracts.md`(15 KB)는 런타임에 전혀 읽히지 않으면서 설치 페이로드 안에 들어 있다.
- **최적화 우선순위**: ① 본문 ROUTING 블록에서 타 스킬 행 제거(~0.6~0.7k tok/본문), ② 본문 내 재진술 통합(~1~1.5k tok/본문 추정), ③ `domain-ethics.md` 도메인별 분할 또는 TOC 추가(최악 호출 -5~6k tok), ④ 모듈 간 중복/경로 문자열 정리(모듈 세트의 ~6% + 23.5 KB), ⑤ `contracts.md`·grader 보일러플레이트 정리(런타임 영향 0, 유지보수 비용). 단, ①②는 fp 게이트가 ±3/18 노이즈를 보이므로 10-run 재측정 없이 적용하면 안 된다.

---

## 측정 데이터

### 환산 계수

tiktoken `cl100k_base`로 센 값과 저장소가 Claude Code CLI로 실측해 README·CHANGELOG에 기록한 값을 비교하면 일관되게 **×1.37~1.39**이다.

| 항목 | tiktoken | 저장소 실측 (README `Token cost`, 3.3.0) | 비율 |
|---|---|---|---|
| always-on 플러그인 합계 | 1,325 | ~1,840 | 1.39 |
| ADV SKILL.md 전체 | 6,604 | ~9.1k | 1.38 |
| IRM SKILL.md 전체 | 7,129 | ~9.9k | 1.39 |
| RSD SKILL.md 전체 | 6,929 | ~9.5k | 1.37 |

아래 표의 tiktoken 값에 **×1.38**을 곱하면 Claude 기준 근사치가 된다. 한국어 비중이 큰 frontmatter는 비율이 더 높을 수 있다(`04-design.md:383` 실측: 영어 0.31 tok/char, 한국어 1.09 tok/char).

### 스킬별 토큰 (tiktoken cl100k)

| 스킬 | `description` | `when_to_use` | `argument-hint` | desc+wtu 글자수 (한도 1,536) | 본문 (frontmatter 제외) | SKILL.md 전체 | bytes | 참조 모듈 합계 |
|---|---|---|---|---|---|---|---|---|
| engagement-retention-advisor (ADV) | 259 | 143 | 21 | 1,424 | 6,160 | 6,604 | 28,932 | 34,434 (7 파일) |
| interaction-reward-moments (IRM) | 264 | 122 | 17 | 1,437 | 6,704 | 7,129 | 31,321 | 25,128 (9 파일) |
| retention-strategy-designer (RSD) | 254 | 202 | 25 | 1,513 | 6,427 | 6,929 | 30,141 | 30,038 (8 파일) |
| **합계** | **777** | **467** | **63** | | **19,291** | **20,662** | **90,394** | **89,600 (24 파일)** |

always-on = name + description + when_to_use + argument-hint = **1,325 tok** (desc+wtu만 1,244). 200k 창의 약 0.7%(tiktoken) ~ 0.9%(실측).

### 참조 모듈별 토큰

| 모듈 | bytes | tok | 읽는 모드 |
|---|---|---|---|
| adv/domain-ethics.md | 31,256 | 7,490 | 모든 mechanic-bearing 제안의 "domain section" (상한 미산입), ADV `system` |
| adv/jurisdictions.md | 27,842 | 7,283 | RSD `cadence`, T1/T2 후보 시 대체 읽기 |
| adv/korea-market.md | 26,359 | 7,085 | 한국 시장 시 jurisdictions 대체 |
| adv/ethics-tiers.md | 14,090 | 3,452 | RSD strategy/cadence, IRM moments, ADV integrate/system |
| adv/contracts.md | 15,384 | 3,549 | **런타임에 읽히지 않음** (유지보수 전용) |
| adv/systems-catalog.md | 11,900 | 2,945 | ADV `system` |
| adv/integration-patterns.md | 10,961 | 2,630 | ADV integrate/compare |
| rsd/liveops-cadence.md | 25,236 | 6,085 | RSD cadence/calendar |
| rsd/genre-profiles.md | 22,478 | 5,525 | RSD strategy/calendar |
| rsd/benchmarks.md | 12,936 | 3,795 | RSD read |
| rsd/churn-and-winback.md | 14,317 | 3,569 | RSD strategy(churn swap) |
| rsd/retention-playbook.md | 14,574 | 3,334 | RSD strategy, ADV compare |
| rsd/metric-definitions.md | 10,508 | 2,639 | RSD read/instrument |
| rsd/experiments.md | 10,740 | 2,630 | RSD economics/instrument |
| rsd/retention-economics.md | 9,235 | 2,461 | RSD economics |
| irm/research-basis.md | 17,689 | 4,387 | IRM 대체 읽기(이해관계자 설득 시) |
| irm/feel-and-accessibility.md | 17,093 | 4,174 | IRM 모든 feel 값 (상한 미산입) |
| irm/patterns-reveal.md | 14,409 | 3,415 | IRM moments (family) |
| irm/patterns-nongame.md | 11,156 | 2,836 | IRM moments (family) |
| irm/patterns-progress.md | 10,856 | 2,676 | IRM moments/first-win |
| irm/first-session.md | 9,214 | 2,228 | IRM first-win |
| irm/moment-lenses.md | 8,573 | 2,019 | IRM moments/first-win, ADV integrate |
| irm/patterns-social.md | 7,493 | 1,814 | IRM moments (family) |
| irm/patterns-relief.md | 6,536 | 1,579 | IRM moments (family) |

### 호출 1회 비용 (per-trigger) — 모드별

body = SKILL.md 전체(frontmatter 포함, 실제 로드 단위). "+DE"는 `domain-ethics.md` 전체를 추가로 읽은 경우, "+feel"은 IRM이 `feel-and-accessibility.md`를 추가로 읽은 경우. 두 파일 모두 본문이 "상한에 세지 않는다"고 지정한 읽기다.

| 모드 | body | 지정 모듈 (≤3) | 소계 | +DE | +DE+feel | Claude 환산(×1.38) 최악 |
|---|---|---|---|---|---|---|
| RSD `strategy` | 6,929 | 12,311 | 19,240 | 26,730 | — | ~36.9k |
| RSD `strategy` (churn swap) | 6,929 | 10,355 | 17,284 | 24,774 | — | ~34.2k |
| RSD `read` | 6,929 | 6,434 | 13,363 | (DE 불필요) | — | ~18.4k |
| RSD `cadence` | 6,929 | 16,820 | 23,749 | **31,239** | — | **~43.1k** |
| RSD `cadence` (Korea swap) | 6,929 | 16,622 | 23,551 | 31,041 | — | ~42.8k |
| RSD `calendar` | 6,929 | 11,610 | 18,539 | 26,029 | — | ~35.9k |
| RSD `economics` | 6,929 | 5,091 | 12,020 | 19,510 | — | ~26.9k |
| RSD `instrument` | 6,929 | 5,269 | 12,198 | (DE 불필요) | — | ~16.8k |
| IRM `moments` (reveal family) | 7,129 | 8,886 | 16,015 | 23,505 | **27,679** | **~38.2k** |
| IRM `moments` (nongame family) | 7,129 | 8,307 | 15,436 | 22,926 | 27,100 | ~37.4k |
| IRM `first-win` | 7,129 | 6,923 | 14,052 | 21,542 | 25,716 | ~35.5k |
| ADV `integrate` | 6,604 | 8,101 | 14,705 | 22,195 | — | ~30.6k |
| ADV `compare` | 6,604 | 5,964 | 12,568 | (DE 불필요) | — | ~17.3k |
| ADV `system` | 6,604 | 13,887 | 20,491 | (DE 포함됨) | — | ~28.3k |

세 단계 요약:

| 단계 | tiktoken | Claude 환산 | 비고 |
|---|---|---|---|
| always-on (3 스킬 메타데이터) | 1,325 | ~1,840 (실측) | 매 요청 |
| per-trigger 최소 (RSD `instrument`, 지정 모듈만) | 12,198 | ~16.8k | |
| per-trigger 중앙값 (지정 모듈만) | ~15k | ~21k | |
| per-trigger 최악 (RSD `cadence` + domain-ethics) | 31,239 | ~43.1k | 설계 문서 가정(`04-design.md:39` "advisor's real worst case ~11k")의 약 3~4배 |
| 핸드오프 발생 시 (두 번째 body 추가) | +6.6~7.1k | +9~10k | grader는 이 경우를 항상 FAIL 처리 |

### 복제·중복 측정

| 항목 | 측정값 |
|---|---|
| 공유 블록 ROUTING / CARD / LANGUAGE | 4,150 / 7,120 / 3,099 B = 1,019 / 1,643 / 648 tok |
| 공유 블록이 본문에서 차지하는 비율 | ADV 53%, IRM 49%, RSD 51% |
| 공유 블록 디스크 중복 (×3) | 43,107 B (런타임엔 1부만 로드) |
| 공유 블록 밖에서 세 본문에 verbatim 공통인 문장 | 3문장, 368 B (Step 0 intake 문장) — 나머지 intake 단락은 paraphrase |
| 본문 내 "never" 등장 횟수 | ADV 54, IRM 66, RSD 64 |
| 본문 내 "not" 등장 횟수 | ADV 67, IRM 77, RSD 66 |
| 본문 최장 줄 | 1,368자 (세 파일 동일, CARD 블록의 "Fixed sections" 문단) |
| 본문 줄 수 | 186 / 198 / 186 (Anthropic 가이드 500줄 이내지만 줄당 300~800자) |
| 모듈 내 `${CLAUDE_SKILL_DIR}/../…` 경로 문자열 | 약 106개, ≈8.6 KB (retention-playbook.md 23개 = 파일의 ~13%) |
| 모듈 내 "Numbers that do not exist" 섹션 | 24개 중 23개 파일, 합계 ≈23.5 KB (모듈 세트의 6.5%) |
| 모듈 내 전문(preamble)·슬러그 면책·메타 텍스트 | ≈22 KB (≈6%) |
| grader 파일 | 69개, 90,925 B; "Headings and labels are graded by function" 단락 23회 복제, "No Ethics bullet exists (3.2.0)" 단락 6회 복제 |
| `docs/` | 716 KB (git 추적 18파일, 3.3.0부터 설치 페이로드 제외) |
| 설치 페이로드 `plugin/` | 540 KB (그중 contracts.md 15 KB는 런타임 미사용) |

### 본문 내 동일 규칙 재진술 횟수 (정규식 매칭, 근사)

| 규칙 | ADV | IRM | RSD |
|---|---|---|---|
| compliant면 침묵 / null finding 금지 / "already safe" 금지 | 9 | 10 | 12 |
| ≤3 모듈 상한 / "fourth" | 7 | 8 | 6 |
| 실패한 읽기 → Basis에 "could not be run" | 5 | 5 | 6 |
| 파일명·모듈명 출력 금지 | 2 | 4 | 4 |
| 모드명은 출력에 안 나옴 | 3 | 4 | 6 |
| 기억으로 판단 금지 / "from memory" | 3 | 3 | 5 |
| "Basis" 언급 | 6 | 10 | 9 |
| same-week cohort / holdout / novelty 재측정 | 4 | 4 | 7 |
| user-harm guardrail 목록 (opt-out, uninstall, refund…) | 6 | 4 | 6 |

---

## 외부 기준 (Anthropic 공식 가이드)

출처:
- Claude Code Skills 문서: https://code.claude.com/docs/en/skills
- Agent Skills 작성 모범 사례: https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices
- Engineering 블로그 "Equipping agents for the real world with Agent Skills": https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills

이 저장소와 직접 맞닿는 조항(원문 인용):

1. `"Keep SKILL.md under 500 lines. Move detailed reference material to separate files."` — 줄 수로는 통과(186~198줄)지만 줄당 300~1,368자라 바이트 기준으로는 500줄 가이드의 의도를 넘는다. 저장소 자체가 `check-no-facts-in-skills.sh:67`에서 "Lines are the wrong unit here"라며 32,000 B 상한으로 대체했다.
2. `"Keep the body itself concise. Once a skill loads, its content stays in context across turns, so every line is a recurring token cost. State what to do rather than narrating how or why"` — 본문은 "why"를 많이 서술한다(아래 OE-9).
3. `"when_to_use … Appended to description in the skill listing and counts toward the 1,536-character cap"`, `"Put the key use case first: the combined description and when_to_use text is truncated at 1,536 characters"` — 저장소는 이 한도를 정확히 알고 93~99%까지 쓴다(3.2.1에서 1,679자 초과를 1,512자로 수정한 기록).
4. `"Reference supporting files from SKILL.md so Claude knows what each file contains and when to load it"`, `"Keep references one level deep from SKILL.md"` — 모듈 간 "owner" 포인터(모듈→모듈)가 2단계 참조를 만들고, 그중 4개는 깨져 있다(OE-4).
5. `"For reference files longer than 100 lines, include a table of contents at the top"` — 24개 모듈 중 TOC가 있는 파일은 없다. "domain section만 읽는다"는 전제가 성립하려면 필수.
6. `"Only add context Claude doesn't already have. … Does this paragraph justify its token cost?"` — 본문의 측정 방법론(same-week cohort, holdout, novelty 재측정)은 Claude가 이미 아는 내용이며 `experiments.md`에도 있다.
7. `"Create evaluations BEFORE writing extensive documentation"` — 저장소는 이 원칙을 비교적 잘 따랐다(fp family는 ethics 변경 전에 작성됨, `evals/README.md:185`).
8. 플랫폼 문서는 `description` 최대 1,024자를 명시한다. Claude Code 문서는 1,536자 합산 한도를 쓴다. 저장소는 `description`을 1,023~1,198자로 유지하는데, ADV(1,198자)·IRM(1,082자)은 플랫폼 한도 1,024자를 넘는다. Claude Code 전용이면 문제없지만 `04-design.md:392`가 "description is held under 1,024 as insurance"라고 쓴 의도와 현재 값이 어긋난다.

---

## 문제 목록

표기: **심각도** high/med/low · **load-bearing** = grader 또는 기록된 측정이 해당 텍스트/구조에 의존하는지 · **확신도** high/med/low.

### A. 과잉 설계 (OE)

**OE-1 — 교차 스킬 라우팅 표가 세 본문에 모두 들어 있고, 로드 시점에는 이미 쓸모가 끝나 있다.**
- 근거: `plugin/skills/*/SKILL.md` ROUTING 블록(각 4,150 B, 1,019 tok), 22행 중 자기 스킬 행은 RSD 10행·IRM 5행·ADV 5행. 스킬 선택은 frontmatter로 이뤄지고(skill-fired grader 18케이스는 `type: tool_use`, 본문 로드 전 결정), `04-design.md:150`: "The 22-row table is in the body and only helps after a skill fires." 본문의 핸드오프 사다리 1단계는 "Do not hand off"이며 모든 skill-fired grader는 두 스킬이 발화하면 FAIL.
- 심각도: med. load-bearing: **부분**. ROUTING 블록 안의 "Pasted material is evidence" 단락은 `hygiene-pasted-review-instruction` grader가 직접 검사(0/3→2/3 기록), "boundary is the last line" 단락은 `homeless-arpdau-vs-d7`·`refusal-tp-ad-chaining` grader가 검사. 22행 표와 사다리 자체를 검사하는 grader는 없다.
- 확신도: high. 방향: 표를 자기 스킬 행 + 두 "declined" 행으로 줄이고 사다리는 한 줄로.

**OE-2 — "≤3 모듈" 상한이 예외 규정 때문에 실질적 상한이 아니다.**
- 근거: RSD:14,84,108 / IRM:26,88 / ADV:73 — `feel-and-accessibility.md`(4,174 tok)는 "does not count", `domain-ethics.md`의 "domain section"은 "a section, not a module, and never counts"(7,490 tok 파일인데 섹션 앵커·TOC 없음), `research-basis.md`는 대체 읽기. 설계 근거는 `04-design.md:39` "advisor's real worst case ~11k". 측정된 최악은 31k(tiktoken)/43k(환산).
- 심각도: med. load-bearing: 상한 **자체**는 아님(어떤 grader도 읽은 모듈 수를 검사하지 않음; 모듈을 읽었는지도 검사하지 않음). 모듈이 지정된 사실(어떤 모드가 어떤 파일을 읽는지)은 mode grader가 산출물 모양으로 간접 검증.
- 확신도: high. 방향: 상한 서술을 1문장으로 줄이고, 비용 통제는 파일 분할(OPT-3)로 옮긴다.

**OE-3 — 11개 모드 + 스왑 규칙 + 대체 읽기 규칙의 상태 기계.**
- 근거: RSD Modes 표(6행) + "Swap rule"(RSD:84) + economics 특례 단락(RSD:82, 1,000자) ; IRM Modes 2행 + retrieval key 5행 + "Two substitutions"(IRM:88, 1,100자) ; ADV 3행 + 상황별 대체 2종(ADV:73).
- 심각도: low~med. load-bearing: **대체로 예**. mode-line grader 10케이스가 모드별 산출물 모양을 검사하고, `mode-rsd-read-pasted-curve`는 read-mode 행에서 "convention first" 문구를 지우자 3/3→0/3(3.2.1→3.2.2 기록). 즉 모드 행의 문장 단위까지 측정에 묶여 있다.
- 확신도: high. 방향: 구조는 유지, 각 행의 설명 prose만 압축.

**OE-4 — 참조 모듈의 "one topic, one owner"가 리뷰 강제라 실제로 깨져 있다.**
- 근거(서브에이전트 전수 조사, file:line):
  - 스트릭 4규칙이 `domain-ethics.md:47–49`, `liveops-cadence.md:94`, `patterns-relief.md:7,28,34`, `patterns-nongame.md:44–45`에 거의 동일 문장으로 반복. 예: domain-ethics:47 "a missed day may reset the counter, never erase earned artifacts" ≡ liveops:94.
  - 에너지/스태미나 바운드가 `domain-ethics.md:27–35` 표와 `liveops-cadence.md:80` 섹션에 필드 단위로 동일, 추가로 `systems-catalog.md:43–48`, `genre-profiles.md:9,17,25`, `patterns-relief.md:7`, `ethics-tiers.md:116`, `integration-patterns.md:52`.
  - 미성년자 overlay: `ethics-tiers.md:29–39`(1,265 B) ≈ `domain-ethics.md:136–142`(1,528 B), 같은 6개 관할 목록·같은 Roblox 마무리 문장.
  - 깨진 owner 포인터 4개: `patterns-relief.md:17`·`systems-catalog.md:55`("Ascarza는 experiments.md에") → experiments.md에 없음(실제 `churn-and-winback.md:37`); `patterns-relief.md:33`·`patterns-nongame.md:45`(Silverman & Barasch → retention-playbook.md) → 없음; `patterns-relief.md:39`(Streak Revival → domain-ethics.md) → 없음; `patterns-nongame.md:46`("streak freeze 21%" → domain-ethics.md) → 없음.
  - 법률이 법 파일 밖에 있음: `first-session.md:68`이 시행령 제8조의3 경고문을 인용하고, `domain-ethics.md:132`가 §50 옆에 "no multiple daily pushes"라는 house rule을 붙여 놓음 — `jurisdictions.md:17,127`이 "the single worst error this file can cause"라고 명시한 바로 그 결합.
  - 같은 기다리면-무료 수치가 날짜 세 가지로 등장(domain-ethics:146 "2014", liveops:161 "2019", systems-catalog:65 "2019 write-up of a 2014-era launch").
  - "Numbers that do not exist" 섹션이 23/24 파일, ≈23.5 KB; 같은 부재 사실("no Korean install-cohort D1/D7/D30" 7곳, "no wait-or-pay conversion" 9곳).
- 심각도: **high** (토큰 + 정확성). load-bearing: 아니오 — 어떤 스크립트도 모듈 간 비교를 하지 않음(`CONTRIBUTING.md:27` "enforced by review, not by a script"). 반대로 hygiene grader(`hygiene-korea-odds-statute`)는 법률 정확성을 검사하므로 중복이 **불일치**로 번지면 측정에 잡힌다.
- 확신도: high(위치/문구), med(바이트 추정치는 문자 기준).

**OE-5 — `contracts.md`가 런타임에 안 읽히는 유지보수 파일인데 설치 페이로드의 `references/` 아래에 있다.**
- 근거: `contracts.md:3` "it is never read at runtime"; 어떤 SKILL.md도 `contracts.md`를 언급하지 않음(grep 0건); 유일한 소비자는 `scripts/check-shared-blocks.sh:8`과 CONTRIBUTING. 15,384 B, 3,549 tok.
- 심각도: low (런타임 비용 0; 페이로드 2.8%; 모델이 `Glob references/*`로 탐색하면 읽을 위험만 있음). load-bearing: 아니오. 확신도: high. 방향: `scripts/` 또는 `docs/`로 이동하고 스크립트 경로만 수정.

**OE-6 — Ethics 섹션이 본문과 `ethics-tiers.md`에 이중으로 있다.**
- 근거: `ethics-tiers.md:5–27`(2,899 B)의 4단계 티어 + 3질문 절차가 RSD:108–116, IRM:105–115, ADV:94–102에 각각 약 2 KB로 재진술됨. 세 본문 모두 "Mandatory read … ethics-tiers.md"를 요구하므로 모델은 같은 내용을 두 번 읽는다.
- 심각도: med. load-bearing: **침묵 규칙은 예**(fp 6케이스가 핵심; CARD 블록의 "Ethics has no bullet"·"Never emit a null finding"이 담당). 본문의 티어 **정의** 자체를 검사하는 grader는 없다(tier code가 출력에 나오면 오히려 FAIL).
- 확신도: high. 방향: 본문 Ethics 섹션을 "ethics-tiers.md를 읽고 그 3질문을 생성 중에 실행; 결과는 CARD 규칙대로 배치" 수준으로 축약.

**OE-7 — Intake(Step 0) 기계가 세 본문에 각각 paraphrase로 들어 있다.**
- 근거: RSD:22–28, IRM:16–20, ADV:20–22. verbatim 공통 문장 368 B, 나머지는 같은 뜻의 다른 문장. "never ask twice", "at most four questions", 비대화형 fallback, Assumptions 4줄 cap, calibration 예시.
- 심각도: low. load-bearing: **예** — intake family 2케이스가 "한 번에 ≤4질문 후 중단", "과잉 명세 시 0질문 + Assumptions 채움"을 그대로 검사(6/6 기록). 확신도: high. 방향: 공유 블록(INTAKE)으로 승격해 1벌로 관리; 비용 절감은 작음(~300 tok/본문).

**OE-8 — 핸드오프 사다리(4단계)의 2~4단계는 평가가 벌점 주는 경로다.**
- 근거: ROUTING 블록 "Hand-off ladder" (RSD:39 등); skill-fired grader 18개 모두 "when both fired in sequence" → FAIL.
- 심각도: low. load-bearing: 아니오. 확신도: high. 방향: "핸드오프하지 않는다; 필요한 모듈은 sibling 경로로 읽는다" 한 줄.

**OE-9 — 본문이 "무엇을"보다 "왜"를 많이 서술하고 부정형이 과밀하다.**
- 근거: "never" 54~66회, "not" 66~77회/본문. 이유 서술 예: RSD:14 "The read budget is this skill's machinery, not the reader's problem."; RSD:39 "a hand-off is a routing failure the user pays for twice"; IRM:98 "the designer cannot ship a feeling, only a number they then tune"; ADV:94 "Judging from memory is the exact failure this split exists to prevent."; LANGUAGE 블록 "the reader did not install a narrator". 세 본문의 CARD "Fixed sections" 문단은 1,368자 한 줄.
- 심각도: med. load-bearing: 규칙 자체는 다수 예, **이유 서술과 반복은 아니오**. 저장소 기록이 뒷받침: `CONTRIBUTING.md:146–148` "The largest recorded gain (3.2.0 …) came from deleting the Ethics bullet; four rewordings of the two-sentence rule moved nothing." 3.3.0에서 일부 반복을 지웠고 fp/tp가 노이즈 안(p=0.80/1.00)이었다 — 즉 삭제가 해를 끼치지 않았다는 측정이 이미 있다.
- 확신도: med (어느 문장이 효과 없는지는 10-run 비교 없이는 확정 불가).

**OE-10 — eval grader 보일러플레이트와 추정 스키마.**
- 근거: `evals/README.md:1–20` "UNVERIFIED GRADER SCHEMA … All of these key names and values are guesses."; "Headings and labels are graded by function (3.2.0)" 단락이 23파일에, "No Ethics bullet exists (3.2.0)" 단락이 fp 6파일에 복제; fp grader 각 4.3~4.9 KB 중 절반 이상이 공통 단락. family 1–5의 `skill-fired.md`는 `type: tool_use` 지표인데 각 파일에 설명 prose 5~10줄.
- 심각도: low (런타임 토큰 영향 0; 유지보수 비용·judge 프롬프트 길이). load-bearing: grader 자체가 측정 장치이므로 내용은 예, 복제 형태는 아니오. 확신도: high.

**OE-11 — `check-claims.sh`(283줄, 16.6 KB)가 산문 속 숫자를 검증하지만, 산문 쪽이 그 스크립트를 위해 숫자를 쓰도록 되어 있다.**
- 근거: 스크립트 헤더 "The house style is to write the number next to the thing it counts, which is what makes this check possible." 그런데 놓친 stale claim이 있다: `README.md:234–235` "docs/ … ~648 KB … tracked, and it ships to installers" — 3.3.0부터 `marketplace.json`이 `./plugin`을 가리켜 docs는 설치되지 않음(CHANGELOG 3.3.0, 설치 캐시 2.2 MB→552 KB).
- 심각도: low. load-bearing: 아니오(릴리스 위생). 확신도: high. 방향: 스크립트 축소보다 산문의 수치 주장 자체를 줄이는 쪽이 비용이 낮다.

**OE-12 — 설계 기록의 이중 진실원.**
- 근거: `04-design.md`(75 KB)에 "Superseded by the 2026-09 polish pass — contracts.md is the shipped contract" 콜아웃(`04-design.md:158`), `evals/README.md:26–38`도 같은 취지; `05-plan.md`는 3.2.2 기준으로 "current" 표기(`05-plan.md:24–30`), README 구조 설명은 docs가 설치된다고 함.
- 심각도: low (런타임 무관). load-bearing: 아니오. 확신도: high.

### B. 토큰 비용 (TC)

**TC-1 — always-on 1,325 tok(tiktoken) / ~1,840(실측), 한도의 93~99% 사용.**
- 근거: 측정 표. 세 description은 서로의 범위를 상호 언급한다(IRM desc에 "retention-strategy-designer" 1회, "engagement-retention-advisor" 1회 등; `when_to_use`에도 "use engagement-retention-advisor", "— retention-strategy-designer").
- 심각도: low (절대값은 작음: 0.7~0.9%). load-bearing: **예, 가장 강하게**. routing family 1–4 18케이스 54/54(3.2.0, 3.2.2 라운드); 3.2.1에서 한 예시 삭제로 `homeless-analytics-taxonomy` 3/3→0/3; 3.1.2에서 `when_to_use`에 ad/companion 문구 추가로 refusal-tp 발화 0/6→6/6. 단 `companion-disclosure`는 10-run에서 3/10만 발화(`docs/notes/2026-09-28-gate-10x.md:34`) — 설명문의 라우팅 효과도 과대평가되어 있을 수 있음.
- 확신도: high. 방향: 손대지 않거나, 손대면 반드시 routing 18케이스 ≥3-run 재측정.

**TC-2 — 본문 로드 비용 6.6~7.1k(tiktoken)/9.1~9.9k(실측), 그중 ROUTING 1,019 tok는 대부분 비검증.**
- 근거: 공유 블록 측정 + OE-1. 본문 전체 중 grader가 직접 검사하는 텍스트를 블록 단위로 분류하면: CARD(1,643) 대부분 예(scan table 4열, ≥3카드, 캐노니컬 bullet, Ethics bullet 없음, >5열 표 없음, 고정 섹션 순서, Basis 1줄·파일명 금지, Basis에서 끝남 → `shape-*/criteria.md`·`ending.md`·fp item 4·`korean-output.md`), LANGUAGE(648) 예(한국어 출력/헤딩, `Mode:` 금지, 내부 어휘 금지 → 13개 grader), ROUTING(1,019) 중 ~300 tok만 예.
- 심각도: med. 확신도: high.

**TC-3 — 호출 최악 31k(tiktoken)/43k(환산), 원인은 "상한 미산입" 대형 파일 두 개와 TOC 부재.**
- 근거: 호출 비용 표; `domain-ethics.md` 31,256 B에 섹션 앵커 없음; 본문은 "relevant domain section"만 읽으라 하지만 Read 도구로 섹션만 읽으려면 줄 범위를 알아야 하고 그 정보가 본문에 없다(실제 모델이 어떻게 읽는지는 저장소에 transcript가 없어 미확인 — 한계 참조).
- 심각도: **high**. load-bearing: 아니오(읽은 바이트를 검사하는 grader 없음). 확신도: med(최악 가정이 실제 행동인지 미검증).

**TC-4 — 같은 호출에서 함께 읽히는 모듈끼리 내용이 겹친다.**
- 근거: RSD `cadence`는 liveops + ethics-tiers + jurisdictions(+domain-ethics)를 읽는데 스트릭/에너지/패스 바운드가 liveops와 domain-ethics 양쪽에, 미성년자 overlay가 ethics-tiers와 domain-ethics 양쪽에, PEGI 등급 규칙이 liveops:62·domain-ethics:19/21/23·ethics-tiers:15·jurisdictions:79–89에 있다. IRM `moments`는 moment-lenses + patterns-X + ethics-tiers를 읽는데 moment-lenses:9–20(≈4.4 KB)이 research-basis 복사본이고 patterns-X도 같은 연구를 재인용.
- 심각도: med. 추정 중복 로드: 호출당 2~5 KB(0.5~1.3k tok). load-bearing: 아니오. 확신도: med(정확한 바이트는 겹침 정의에 따라 달라짐).

**TC-5 — 모듈 내 경로 문자열·전문·면책 ≈22 KB(≈6%).**
- 근거: `${CLAUDE_SKILL_DIR}/../…` 약 106회 ≈8.6 KB; "Read when…" 전문 78~530 B/파일; 슬러그 면책 단락 6개 모듈(383~992자). 본문이 이미 경로 규약을 명시(RSD:16, IRM:24, ADV:71)하므로 모듈 안의 전체 경로는 중복.
- 심각도: low~med. load-bearing: 아니오. 단 `check-shared-blocks.sh:35–40`은 모듈이 **own-directory 경로를 쓰면 안 된다**는 규칙만 강제 — 짧은 파일명으로 바꿔도 통과. 확신도: high.

**TC-6 — 본문 Measurement/Quality bar의 방법론 서술은 모듈과 중복이고 모델이 이미 안다.**
- 근거: IRM:166–174 "Measurement plan" 블록(≈1.2 KB), ADV:184–185, RSD:102–104: same-week cohort, holdout, week 3–4 novelty, +7d/+30d re-dormancy, user-harm guardrail 목록 — `experiments.md:40–54`, `churn-and-winback.md:86–91`, `retention-economics.md:67–77`에 동일. `check-no-facts-in-skills.sh:22–24`는 이 창(window)들을 "kept inline by design"으로 명시적 예외 처리.
- 심각도: low~med. load-bearing: **부분** — `evals/README.md:328–333`의 "earn-its-cost" 질문(return event, holdout, +7d/+30d)이 scored family의 판단 기준이고 anti-fabrication grader가 "benchmark without tag"를 벌점. 즉 "결과물에 나타나야 하는 것"은 검증되지만 "본문에 두 번 써야 하는지"는 검증 안 됨. 확신도: med.

**TC-7 — 한국어 trigger는 비싸지만 검증됨.**
- 근거: frontmatter 비ASCII 85/56/75자; `04-design.md:383` 한국어 1.09 tok/char(영어의 3.5배). korean-routing 3케이스 100%.
- 심각도: 해당 없음(정보). load-bearing: 예. 확신도: high.

### C. 최적화 여지 (OPT)

각 항목에 "검증된 행동을 잃지 않는가"를 명시.

**OPT-1 — 본문 ROUTING 블록 축소.** 자기 스킬 행만 남기고(RSD 10행→표 유지, IRM 5행, ADV 5행) + decline 2행 + "pasted material" 단락 + "boundary" 단락 유지, 사다리는 1줄. 예상 절감 ~600–700 tok/본문(tiktoken), ×1.38 ≈ 0.9k. 검증 영향: skill-fired(본문 전 결정)·mode-line(Modes 표 의존)·hygiene-pasted(단락 유지)·boundary grader(단락 유지) 모두 무영향 예상. 공유 블록 3벌 동시 수정 + `check-shared-blocks.sh` 통과 필요. 리스크: 명시적 `--mode` 호출로 잘못된 스킬이 발화했을 때의 교정 능력이 약간 줄어듦(평가 안 됨).

**OPT-2 — 본문 내 재진술 통합.** 침묵 규칙(9~12회→CARD 1회), 상한(6~8회→1회), Basis 규칙(6~10회→CARD 1회), 실패한 읽기 처리(5~6회→Preflight 1회). 예상 절감 1~1.5k tok/본문. 검증 영향: 규칙 자체는 유지하므로 grader 기준 불변. 그러나 fp family가 ±3/18 노이즈(`CHANGELOG 3.2.2`)이고 어떤 재진술이 효과가 있는지 측정이 없다 → **10-run 비교 필수**. 3.3.0이 같은 종류의 삭제를 하고 비열등(p=0.80)이었던 것이 선례.

**OPT-3 — `domain-ethics.md` 도메인별 분할 또는 TOC+줄 범위.** 현재 31 KB 단일 파일을 `domain-ethics/{games,companion-journaling,learning,narrative,fortune,mental-health}.md`로 나누거나, 최소한 상단 TOC와 본문의 "section = 줄 범위" 안내를 추가. 최악 호출 -5~6k tok. 검증 영향: 없음(읽기 비용은 미측정 영역). 주의: `check-ethics-rows.sh`가 `domain-ethics.md` 단일 경로를 하드코딩(`F=…/domain-ethics.md`), 분할 시 스크립트 수정. `feel-and-accessibility.md`도 "bounds/ranges" 부분(수치 표)과 설명을 나누면 IRM 최악 -2~3k.

**OPT-4 — 모듈 중복 제거(OE-4).** (a) 미성년자 overlay를 ethics-tiers 한 곳으로, domain-ethics는 한 줄 포인터; (b) 스트릭/에너지/패스 바운드는 domain-ethics 행이 소유, liveops는 "cadence 수치"만; (c) "Numbers that do not exist"를 스킬당 1파일(또는 benchmarks.md 한 섹션)로 집약; (d) 경로 문자열을 파일명으로; (e) 깨진 포인터 4개 수정; (f) 날짜 불일치(2014/2019) 정리; (g) `first-session.md:68`·`domain-ethics.md:132`의 법 서술을 jurisdictions로 이관. 예상: 모듈 세트 -30~40 KB(8~11%), 호출당 -0.5~1.3k tok. 검증 영향: hygiene-korea-odds-statute는 정확성이 **올라갈** 가능성(불일치 원천 제거). 리스크: `CONTRIBUTING.md` owner 표와 `04-design.md` 모듈 표 갱신 필요.

**OPT-5 — 본문 Ethics 섹션 축약(OE-6).** 티어 정의·3질문을 `ethics-tiers.md`에만 두고 본문은 호출 지시 + 결과 배치 규칙(CARD에 이미 있음)만. 예상 -400~500 tok/본문. 검증 영향: fp/tp는 **출력**의 침묵/재설계 형태를 보므로 본문의 정의 삭제는 직접 영향 없음 — 단 tp family(11/30, 게이트 미달)가 민감하므로 10-run 비교 필요.

**OPT-6 — `contracts.md` 이동(OE-5).** `plugin/` 밖으로. 런타임 0, 페이로드 -15 KB. `check-shared-blocks.sh:8`, `CONTRIBUTING.md:8,38,61`, `evals/README.md:28`, README 구조도 수정. 리스크 없음.

**OPT-7 — grader 공통 단락 분리(OE-10).** "Headings graded by function"·"No Ethics bullet exists" 등을 `evals/graders-common.md`로 빼고 수동 실행 명령에서 concatenate. -30 KB 유지보수 텍스트, judge 프롬프트 단축. family 1–5 skill-fired는 README가 이미 "script over stream-json"으로 채점한다고 기록 → md를 3줄 스텁으로. 검증 영향: 없음(채점 기준 불변). 단 CLI eval 스키마가 확정되면 공통 파일 방식이 호환 안 될 수 있음.

**OPT-8 — Intake 단락을 공유 블록으로(OE-7).** 토큰 절감은 작지만(≈300 tok/본문) 3벌 drift를 막음. 검증 영향: intake 2케이스 기준 불변.

**OPT-9 — frontmatter는 건드리지 않는다(TC-1).** 유일한 예외 후보: ADV `description`의 "(재미도 살리고 다시 오게)"처럼 Korean 괄호 보강은 `when_to_use`의 Korean triggers와 중복될 수 있음 — 측정 없이 판단 불가.

**OPT-10 — "why" 산문을 docs로(OE-9).** 본문의 이유 문장을 `04-design.md`/CONTRIBUTING으로 옮기고 본문에는 지시만. 추정 10~20%/본문. 검증 영향: 알 수 없음 → OPT-2와 묶어 한 번에 10-run 측정(CONTRIBUTING "Batch fixes, measure once").

---

## 의도된 복잡성 (근거 있는 것 — 과잉으로 분류하지 않음)

| 구조 | 왜 무겁게 보이는가 | 정당화 근거 |
|---|---|---|
| CARD·LANGUAGE 공유 블록 byte-identical 복제 + `check-shared-blocks.sh` | 본문의 ~35%가 3벌 | 스킬 파일은 단독 로드되므로 발화한 파일에 없는 규칙은 존재하지 않음(`CONTRIBUTING.md:61–65`). 두 블록은 shape/ending/korean/fp grader가 직접 검사. 분기 방지 스크립트는 48줄로 가볍다. |
| 4단계 윤리 티어 + `domain-ethics.md` 행 + `check-ethics-rows.sh` | 31 KB 모듈, 티어 코드, family slug | 2.0.0에서 절대 금지 목록을 의도적으로 뒤집음; fp(6)/tp(3) family가 양방향으로 게이트. "Ethics bullet 제거"(3.2.0)가 측정된 최대 개선(fp 18/36→27/36). T3 행에 측정 가능한 spec을 강제하는 스크립트는 "energy is forbidden"을 쓸 수 없게 만드는 장치. |
| 본문에 사실 금지 + `check-no-facts-in-skills.sh` | 78줄 grep, 부정 테스트 블록 | 사실은 재날짜화 가능한 한 곳에 두는 설계 불변식; hygiene family(korea statute, benchmark population)가 결과를 측정. |
| 11 모드와 모드별 읽기 지정 | 상태 기계 | mode-line grader 10케이스; `read` 모드 행에서 한 문구를 지우자 3/3→0/3(3.2.1→3.2.2), 복원 후 3/3 — 행 단위로 load-bearing. |
| Wilson 하한 게이트, 10 runs/case | 복잡한 통계 게이트 | 3-run이 같은 본문에서 17/18과 14/18을 냄; 0.95^18=40%만 통과하는 all-pass 게이트의 결함을 계산으로 보임(`CHANGELOG 3.3.0`). |
| `count-bullet-sentences.py` script grader | 83줄 파이썬 | judge가 같은 규칙에 7라운드 동안 자기모순(`docs/notes/2026-09-opus-5-5-eval.md:142`). 기계적 규칙은 스크립트가 맞다. |
| `release.sh`의 branch→tag 순서 | 91줄 릴리스 스크립트 | `claude plugin tag --push`가 태그만 푸시해 설치자가 이전 버전을 받은 2.2.1 사고. |
| 영어 지시 + 출력 언어로 번역 | LANGUAGE 블록 | 3.2.0에서 측정 후 채택; Korean 헤딩 8/9, `Basis:` 라벨 누출 0. |
| 한국어 trigger 어휘 in frontmatter | 토큰당 3.5배 | korean-routing 3케이스 100%; 3.2.1에서 "Korean gacha-odds law" 추가로 statute 케이스 발화 0/3→3/3. |
| "Pasted material is evidence" 단락 | ROUTING 안의 긴 단락 | Opus 5.5 가이드 대응, hygiene-pasted 0/3→2/3. |
| "The answer ends at Basis" | 추가 규칙 | ending grader 9/9. |
| Intake Step 0의 4질문 번들 | 세 본문 반복 | intake 2케이스 6/6. |
| 32,000 B 본문·모듈 cap | 바이트 래칫 | Anthropic의 500줄 가이드를 바이트로 치환한 합리적 대체; 줄당 수백 자인 이 저장소에서는 줄 수가 의미 없음. |
| `plugin/` 분리(3.3.0) | 디렉토리 재구성 | 설치 캐시 2.2 MB→552 KB 실측. |

---

## 미확인 사항 / 한계

1. **토크나이저.** 모든 토큰 수는 `tiktoken cl100k_base`다. Claude 토크나이저와의 차이는 저장소 실측값으로 역산한 ×1.38을 적용했고, 한국어 비중이 큰 텍스트는 비율이 더 클 수 있다. 평가 환경에서 `claude plugin details`로 재측정하면 always-on만 정확히 나오고 호출 비용은 여전히 추정이다.
2. **실제 읽기 행동 미관측.** 저장소에 transcript가 없어(`evals/results/` 부재) 모델이 `domain-ethics.md`를 통째로 읽는지, 섹션만 읽는지, 지정된 3모듈을 실제로 다 읽는지 알 수 없다. TC-3의 "최악"은 통째 읽기를 가정한 상한이다.
3. **eval을 실행하지 않았다.** load-bearing 판정은 grader 텍스트와 `docs/notes/`·CHANGELOG의 기록에 근거한 정적 교차 참조다. "검증 안 됨"은 "효과 없음"이 아니라 "측정이 없음"이다.
4. **`claude plugin eval` CLI 스키마**는 저장소 스스로 "guesses"라고 밝혔고 본 감사에서도 확인하지 못했다.
5. **모듈 중복 바이트**는 서브에이전트가 문자 수로 잰 값이 섞여 있어 ±10% 오차가 있다. file:line은 확인된 값이다.
6. **frontmatter 1,024자 플랫폼 한도**가 Claude Code 플러그인 로더에 적용되는지는 문서 간 기술이 다르다(Claude Code 문서는 1,536 합산). 현재 ADV/IRM description은 1,024자를 넘는다.
7. **웹 조사 범위.** Anthropic 공식 문서 3개를 직접 fetch했고 그 외 서드파티 글은 인용하지 않았다.
8. 서브에이전트 보고에 포함된 수치 중 본문에서 재검증하지 않은 것(예: research-basis의 "75% 인용 서술")은 "추정"으로 표기했다.
