# 03 — 검증: 02-proposal.md

대상: `02-proposal.md` (ajitta/Game-Engagement-Retention-Skills v3.3.0, commit `c636c15`). 날짜: 2026-10-01.
방법: 저장소 파일은 수정하지 않았다. 토큰은 `tiktoken cl100k_base`로 직접 재측정했고, 모든 file:line은 `sed -n`/`grep -n`으로 읽어 확인했다. 항목 4·7의 실행 가능성은 저장소를 `/tmp/ger-sim*`에 복사해 실제로 적용한 뒤 `scripts/check-*.sh` 4개와 `claude plugin validate ./plugin/skills --strict`(Claude Code 2.1.284)를 돌려 확인했다.

---

## 판정 요약

**종합: 조건부 승인.** 수치의 95% 이상이 재측정과 1% 이내로 일치하고, 추천 항목 7개 모두 방향은 타당하다. 그러나 항목 4(domain-ethics 분할)는 제안서가 놓친 구조적 문제가 셋 있고(메커닉 행이 도메인을 가로지름, 스크립트 glob이 하위 디렉토리를 안 봄, 복제된 전문이 `check-ethics-rows.sh`를 깨뜨림), "리서치 정정" 표의 수치 3개는 제안서 쪽이 틀렸다. 아래 "필수 수정 사항"을 반영하기 전에는 Phase B에 착수하면 안 된다. Phase A(항목 6·7)는 수정 2건만 반영하면 바로 진행 가능하다.

| 항목 | 판정 | 한 줄 사유 |
|---|---|---|
| 요약표 (절감 합산) | 수정필요 | RSD cadence "~23.4k"는 Phase C 항목 5b(−0.9k)를 포함해야 나온다. Phase B(1·2·3·4·5a)만으로는 ~24.2k. 5a의 −400은 항목 4의 minors 삭제(387)와 이중 계산 |
| 리서치 정정 표 | 수정필요 | `retention-playbook.md` 경로 23개(리서치가 맞음, 제안서의 16은 오류), 경로 ≥3 모듈 14개(11 아님), `domain-ethics.md` 경로 7개(6 아님). 나머지 정정은 정확 |
| 1. ROUTING 표·사다리 제거 | 확인 (소수정) | 토큰 538/111/100/231/109/101/81 전부 일치. 축약 후 ROUTING ≈ 363~390 tok로 제안의 "≈430"보다 더 줄어듦(절감 −630~655). "A retention metric cited only as motivation… NOT a second ask" 문장의 처분을 명시해야 하고, README 63–86행 표도 같이 고쳐야 함 |
| 2. Ethics 섹션 축약 | 수정필요 | 토큰 451/462/573(제안 454/468/579, 헤딩 포함 차이) 일치. 단 IRM:109는 IRM 본문에서 `jurisdictions.md` 경로를 가진 **유일한 줄**이므로 삭제 대상에서 빼야 함(LANGUAGE 블록이 "jurisdiction reference에서 복사"를 요구) |
| 3. 재진술 통합 | 확인 | 인용 줄 번호 전부 일치(RSD:14,71,84,86,108,110,116 / IRM:24,26,69,88,98,166–174 / ADV:73,77,85,100,184–185). 절감 −350~500은 편집 전이라 미검증이지만 삭제 목록 합산으로 상한 ~600 tok, 타당. 10-run 전제 유지 |
| 4. domain-ethics 분할 | 수정필요 | 섹션 토큰 9개 전부 일치, validator 통과 확인. 그러나 (a) streak 행(`guilt-streak`·`streak-repair`)은 Learning 섹션에만 있어 "게임이면 games.md" 지시로는 게임의 스트릭 메커닉이 행을 못 찾음, (b) `check-no-facts-in-skills.sh`·`check-shared-blocks.sh`·`check-claims.sh`의 glob `references/*.md`가 하위 디렉토리를 안 봄, (c) 공통 전문에 "T3" 토큰이 있으면 `check-ethics-rows.sh`가 전문을 행으로 세어 FAIL(샌드박스에서 재현) |
| 5a. minors overlay 단일화 | 수정필요 | 두 섹션은 같은 6개 관할(EU DSA·Brazil·China·Texas·CA SB 243·Korea 12-3)과 같은 Roblox 문장을 가짐 — 확인. 단 `domain-ethics.md:136–142`에만 있는 두 절("likely" 판정 기준: rating·art style·platform·under-18 cohort / "T4→T2b 상향, Brazil은 flat 금지")을 `ethics-tiers.md`로 옮긴 뒤 지워야 함. Duolingo Energy 중복 줄은 `:30`이 아니라 `:25` |
| 5b. liveops acceptance bounds 축약 | 수정필요 (선택 항목) | "Acceptance bounds" 단락은 7곳(22/427/338/688/821/701/275 B), 합계 3,250 B ≈ 0.8k tok. 그중 `:80`·`:94`는 domain-ethics 행의 **상위집합**(ad-chaining 결합 bound, rolling window 4/7, 최소 행동, EU minors default off 등 cadence 고유 내용 포함)이라 포인터로 대체 불가. 현실적 절감 ~0.4~0.5k tok / ~1.5~2 KB — 제안의 −0.8~1.0k / −3~4 KB는 약 2배 과대 |
| 6. 깨진 포인터 수정 | 수정필요 (경미) | 5개 깨짐 + 1개 부분 전부 확인. 단 Silverman 수치 위치는 `liveops-cadence.md:94`가 아니라 **`:90`**("Evidence, stated at its real strength", 66.23% vs 57.86%, responsibility moderator 포함). `research-basis.md:103`에도 같은 수치가 있고 CONTRIBUTING 소유자 표상 "Research citations"의 owner는 `research-basis.md`이므로 IRM 모듈끼리의 포인터는 그쪽이 더 일관됨 |
| 7. contracts.md 이동 | 확인 | 샌드박스 적용: 스크립트 4개 OK(모듈 23), validator 통과, `du -sk plugin` 540→524 KB. `checks.yml:4`는 파일명만 언급하는 주석이라 수정 불필요(해도 무해) |
| 8. feel 분할 (선택) | 확인 | 섹션 토큰 10개 전부 일치. bounds 2,524 + rationale 1,576 + 전문 74 = 4,174 ✓. −1.5k ✓ |
| 9. 경로 축약 (선택) | 확인 | 107개 / 8,408 B(제안 8,379, 0.3%). own-dir grep은 `check-shared-blocks.sh:42`(제안의 35–40은 주석 영역) |
| 10. grader 공통 단락 (비추천) | 확인 | 29회 출현, 23파일, 21,040 B 정확히 일치. 비추천 논거 타당 |
| 하지 말아야 할 것 1–9 | 확인 | 인용된 사고 기록 9건 모두 CHANGELOG·docs/notes·CONTRIBUTING에서 확인 (아래 사실 검증 표) |
| Phase A/B/C · semver | 확인 | 3.2.1(PATCH, 모듈·모드행 수정 포함)·3.3.0(MINOR, 본문 슬림+payload 재구성) 선례와 일치. `[Unreleased]` 섹션이 CHANGELOG:12에 이미 있어 `check-claims.sh` §4 함정 없음 |

---

## 수치 검증

측정 스크립트: `/tmp/measure.py`, `/tmp/m2.py`, `/tmp/m3.py`, `/tmp/m4.py` (tiktoken cl100k_base, `disallowed_special=()`). 바이트는 `wc -c`, 페이로드는 `du -sk`.

### 파일·블록 단위

| 주장 | 제안서 값 | 측정값 | 판정 |
|---|---|---|---|
| SKILL.md 전체 tok ADV/IRM/RSD | 6,604 / 7,129 / 6,929 | 6,604 / 7,129 / 6,929 | ok |
| SKILL.md bytes | 28,932 / 31,321 / 30,141 | 동일 | ok |
| always-on (name+desc+wtu+hint) | 1,325 | 1,325 (429/409/487) | ok |
| desc+wtu 글자수 | 1,423 / 1,436 / 1,512 | 1,423 / 1,436 / 1,512 | ok |
| ADV·IRM description 글자수 >1,024 | 넘음 | 1,198 / 1,082 (RSD 1,023) | ok |
| 공유 블록 ROUTING/CARD/LANGUAGE (마커 포함) | 1,028 / 1,650 / 655 | 1,028 / 1,650 / 655 (내부 1,019/1,643/648; 4,150/7,120/3,099 B) | ok |
| 모듈 합계 | 24파일, 360,835 B, 89,600 tok | 24파일, 360,835 B, 89,600 tok | ok |
| contracts.md | 15,384 B / 3,549 tok | 15,384 B / 3,549 tok | ok |
| domain-ethics.md | 31,256 B / 7,490 tok | 31,256 / 7,490 | ok |
| feel-and-accessibility.md | 4,174 tok | 4,174 | ok |
| jurisdictions.md | 7,283 tok, 8 h2 | 7,283, h2 8개 | ok |
| 설치 페이로드 | 540 KB → ~525 KB | `du -sk plugin` 540 → 524 KB (apparent 453,031 B) | ok |

### 섹션 단위

| 주장 | 제안서 값 | 측정값 | 판정 |
|---|---|---|---|
| ROUTING: 22행 표 / 사다리 / 첫 단락 | 538 / 111 / 100 | 538 / 111 / 100 | ok |
| 자기 행 RSD / IRM / ADV, decline 2행 | 231 / 109 / 101 / 81 | 231 / 109 / 101 / 81 | ok |
| 유지 단락: Pasted / boundary / Tutorial 1줄 | (명시 없음) | 97 / 150 / 20 | — |
| 축약 후 ROUTING | ≈430 | 363 (제안 문구 그대로 조립) ~390 ("metric as motivation" 문장 유지 시) | **off** (제안이 보수적; 절감은 −630~655, 제안 −550~600) |
| 본문 Ethics 섹션 ADV / IRM / RSD | 454 / 468 / 579 | 451 / 462 / 573 (헤딩 제외) · 헤딩 포함 시 일치 | ok |
| ethics-tiers 티어표 / 3질문 / minors overlay | 385 / 314 / 318 | 385 / 314 / 318 | ok |
| domain-ethics 섹션: 전문·Games·Learning·Companion·MH·Narrative·Fortune·minors·NTDNE | 310·1,681·645·1,314·962·1,145·672·387·374 | 전부 동일 | ok |
| feel 섹션 10개 | 1,071·382·490·423·158·435·284·304·294·259 | 전부 동일 | ok |
| ADV:73 단락 | ~200 | 188 | ok |
| IRM Measurement plan | 279 | 279 (166–174) | ok |
| 항목 2 절감 | −300~380/본문 | 451~573 − (150~200) = −250~−425 | ok (ADV 하한 250) |
| 항목 4 절감 | −5.5k(games) ~ −6.5k(fortune) | games.md ≈ 1,681+~100+NTDNE 일부 ≈ 1.9k → −5.6k; fortune ≈ 0.85k → −6.6k | ok (단, 아래 cross-domain 문제로 2파일 읽기가 필요한 경우 −5.0k) |
| 항목 4 단독: RSD cadence / ADV system / IRM moments | 25.7k / 15.0k / 22.2k | 25.6k / 14.9k / 22.1k | ok |
| 요약표 RSD cadence 최악 (항목 1–5) | ~23.4k | 1·2·3·4·5a: 31,239 − 5,640 − 575 − 340 − 425 − ~50(5a 잔여) ≈ **24.2k**; 5b(−0.9k) 포함 시 23.3k | **off** — 5b는 Phase C인데 Phase B 수치처럼 읽힘 |
| 요약표 IRM moments / ADV system | ~20.7k / ~13.5k | 20.7k / 13.5k (항목 1–4 기준) | ok |
| 요약표 본문 1벌 | 5.2–5.7k | 6,604−1,500 = 5.1k ~ 7,129−1,300 = 5.8k | ok |
| 5a 절감 | −400/호출 | 단독 적용 시 387+~50 ≈ −430; 항목 4 위에 얹으면 ≈ −50 | **off** (이중 계산) |
| 5b 절감 | −0.8~1.0k tok, liveops −3~4 KB | 단락 7곳 합계 3,250 B(≈0.8k)이 **상한**이고 cadence 고유 내용은 남겨야 함 → 현실 −0.4~0.5k / −1.5~2 KB | **off** (약 2배 과대) |
| 항목 8 분할 | bounds ≈2.6k / rationale ≈1.6k, −1.5k | 2,524 / 1,576, −1,576 | ok |
| 항목 10: 공통 단락 복제 | 23파일 21,040 B; 판정당 ~0.4k × 180 ≈ 70k | 29회/23파일/21,040 B; 725 B/회 ≈ 0.18~0.4k tok/파일 → ×180 = 32~72k | ok |

### 모듈 세트 통계 (리서치 정정 표)

| 주장 | 제안서 값 | 측정값 | 판정 |
|---|---|---|---|
| "Numbers that do not exist" 보유 파일 | 22개 (contracts·jurisdictions 없음), 23,493 B | 22개, 동일 두 파일 없음, 23,474 B | ok |
| 경로 문자열 전체 | 107개, 8,379 B | 107개, 8,408 B, 2,343 tok | ok |
| `retention-playbook.md` 경로 수 | **16** (리서치 23을 "정정") | **23** (`grep -o '\${CLAUDE_SKILL_DIR}[^ \`)>]*' \| sort \| uniq -c` → churn 4·genre 4·metric 4·benchmarks 2·experiments 2·liveops 2·기타 5) | **off — 리서치가 맞고 제안서가 틀림** |
| 경로 3개 이상 모듈 | 11개 | 14개 (playbook 23, ethics-tiers 9, nongame 7, liveops 7, genre 7, domain-ethics 7, systems 6, korea 6, economics 5, relief 5, jurisdictions 5, churn 5, progress 3, benchmarks 3) | **off** |
| `domain-ethics.md` 안의 경로 | 6개 | 7개 | off (17%) |
| `domain-ethics.md`를 가리키는 포인터 | 23개 | 23개 | ok |
| 90자 이상 verbatim 공통 문장 | 1개, 111 B | 1개, 111 B (liveops ↔ patterns-nongame, "ticket expires unused") | ok |
| Intake verbatim 공통 | 3문장 368 B | 3문장 ~297 B (문장 분할 기준 차이) | 근사 (방향 동일, 결론 불변) |
| install-cohort 반복 파일 / wait-or-pay | 7 / 8 | 7 / 10 (`wait-or-pay\|기다리면 무료`) | 근사 |
| co-read 겹침 (12-word shingle) | DE↔ET, LO↔DE, PR↔DE 만 유의 | DE↔ET 16, PR↔DE 22, **LO↔DE 2**, CW↔LO 62, LO↔JU 0, ET↔JU 0 | ok — 단 LO↔DE는 "필드 단위 재진술"이지 문장 복제가 아님(5b 판정 근거) |
| grader 파일 수 | (제안서에 없음; 리서치 69개) | graders 57개 90,925 B (+prompt 39) | 참고 |

---

## 사실·참조 검증

### 본문 SKILL.md 줄 번호

| 참조 | 결과 |
|---|---|
| ADV Ethics 92–102 / IRM 103–115 / RSD 106–116 | 확인 (`## Ethics` 헤딩이 각각 92/103/106) |
| RSD:112 "Cadence caps are house bounds", RSD:116·ADV:102 "Wire residual risk", ADV:94 "Judging from memory…" | 확인 |
| RSD:84 "The ceiling stays three either way", RSD:108 counts/never counts, IRM:26, IRM:88 "still inside the ceiling"/"never counts", ADV:73 | 확인 |
| RSD:108 끝·IRM:88 끝·IRM:24·ADV:77 (failed read) | 확인 |
| ADV:100, RSD:110 끝 "null finding" | 확인 |
| RSD:71, IRM:69, RSD:14 (mode name / ceiling 비노출) | 확인 |
| RSD:86 "Two-column tables cannot collapse", IRM:98 마지막 문장, ADV:85 "lost matchup" | 확인 |
| IRM `## Measurement plan` 166–174, ADV Quality bar 184–185, RSD Workflow 6·7 = 102·104 | 확인 |
| IRM:20 "if it fired here anyway … ask the one question that makes it yours" | 확인 |
| RSD `economics` Modes 행 문구 = 라우팅 표 행 문구 | 확인 (RSD:79 ≡ RSD:56 "ARPDAU/LTV vs D7, ad load, offer cadence, first purchase, paywall") |
| "22행 중 자기 행은 Modes 표 Fires when에 다 있다" | **대체로 확인, 3행은 부분 일치**: RSD "Tutorial/FTUE funnel: which step, order, gating, D0→D1 leak"(Modes는 "FTUE funnel"만), IRM "Accessibility of a feel effect"(Modes 행이 아니라 IRM:88 substitution 단락), ADV "Moment complaint paired with a churn complaint"(Modes integrate 행에 없음, frontmatter description에 있음) |
| 22행 구성 IRM 5 / RSD 10 / ADV 5 / decline 2 | 확인 (RSD:43–64) |

### 모듈·스크립트·문서 줄 번호

| 참조 | 결과 |
|---|---|
| `patterns-relief.md:17`·`systems-catalog.md:55` Ascarza → `experiments.md` | 확인. `experiments.md`에 Ascarza 0건, 실제 `churn-and-winback.md:37` (+`patterns-progress.md:65,68`, `first-session.md:45`) |
| `patterns-relief.md:33`·`patterns-nongame.md:45` Silverman → `retention-playbook.md` | 확인. playbook에 Silverman 0건. 수치 66.23/57.86은 **`liveops-cadence.md:90`**(제안의 :94는 streak Acceptance bounds 줄)과 `research-basis.md:103` |
| `patterns-relief.md:39` Streak Revival → `domain-ethics.md` (learning section) | 확인 깨짐. Revival은 `churn-and-winback.md:64`, `liveops-cadence.md:125` |
| `patterns-nongame.md:46` → `domain-ethics.md:49` 3.6×/0.38% | 확인 (부분 유효) |
| `domain-ethics.md:47` Silverman 인용만, 수치 없음 | 확인 |
| 기다리면-무료 연도: `domain-ethics.md:146` "2014 — historical" / `liveops-cadence.md:161` "2019" / `systems-catalog.md:65` "2019 write-up of a 2014-era launch" | 확인 |
| win-back 5개 증거(畅玩·Aion·Rivals·Zheng·Revival)가 churn↔liveops 양쪽 | 확인. 두 파일은 어떤 모드 행에도 함께 없음 (RSD:75–80) |
| `domain-ethics.md:30` Duolingo Energy [contested] 2문장 ≡ `ethics-tiers.md:116` | **줄 번호 오류**: `:25`(metered-access 행). :30은 "Refill clock" 표 행. 문장 내용은 거의 동일 — 확인 |
| minors overlay `ethics-tiers.md:29–39` vs `domain-ethics.md:136–142`, 같은 6개 관할·Roblox 문장 | 확인. ethics-tiers 쪽이 Australia(loot box M/R18+)를 하나 더 가짐. domain-ethics 쪽에만 있는 것: "likely" 판정 기준 절, "T4→T2b 상향·Brazil flat 금지" 절 |
| `patterns-reveal.md:82` ↔ `domain-ethics.md:102` cliffhanger 5테스트 | 확인 (22 shingle ≈ 30단어대) |
| `first-session.md:68` 게임산업법 §12-3 + 시행령 §8-3 경고문, IRM first-win에서 읽힘 | 확인 (IRM:74 first-win = lenses + first-session + patterns-progress; jurisdictions 미독) |
| `liveops-cadence.md:80`(에너지)·`:94`(스트릭) Acceptance bounds, "5개 메커닉 각 600–900 B" | 위치 확인. 크기는 **7곳** 22/427/338/688/821/701/275 B — 600–900 B는 3곳만 |
| `contracts.md:3` "never read at runtime" | 확인 |
| `check-shared-blocks.sh:8` `CONTRACTS=` | 확인 |
| `check-shared-blocks.sh:35–40` own-directory 금지 | grep은 **:42**, 35–41은 주석. 내용은 맞음 |
| `check-ethics-rows.sh:10` `F=` 단일 경로 | 확인 |
| `check-no-facts-in-skills.sh:22–24` "kept inline by design", 32,000 B 상한 | 확인 (:22–24, :62–69) |
| `check-claims.sh` 모듈 수 = `ls plugin/skills/*/references/*.md` | 확인 (하위 디렉토리 미포함) |
| `CONTRIBUTING.md:8,38,61` contracts 경로 / `:53–57` 분담 원칙 / `:90` bump 규칙 / `:116` no-bump 규칙 / `:144` Batch once / `:146–148` "four rewordings moved nothing" | 전부 확인 |
| `evals/README.md:28` contracts 경로 / `:185` "authored before the ethics files were touched" / `:328–333` earn-its-cost 질문 / `:262` Running it manually / `:290–296` 저장소 밖 절대경로 | 전부 확인 |
| `README.md:61` 표 설명("identical in all three skill bodies"), `:63–86` 22행 표, `:210` ~1,840, `:226` plugin ~550 KB, `:229` "7 modules", `:234–235` "ships to installers" stale, `:239` contracts 설명 | 전부 확인 |
| `.github/workflows/checks.yml:4` | 확인 — 주석에 "contracts.md" 파일명만, 경로 없음 |
| `04-design.md:39` "~11k", `:150` "22-row table … only helps after a skill fires", `:158` superseded, `:383` 0.31/1.09 tok/char, `:392` "under 1,024 as insurance" | 전부 확인 |
| `docs/notes/2026-09-28-gate-10x.md`: 도구 Skill/Read/Glob/Grep, `/tmp`에서 실행, fp 50/60→52/60 p=0.80, tp 11/30 p=1.00, companion 3/10 (:34) | 전부 확인 |
| CHANGELOG 3.2.1: 예시 삭제 3/3→0/3, 1,679→1,512; 3.1.2: when_to_use 추가로 refusal 발화 0/6→6/6; 3.2.2: "convention first" 3/3→0/3→3/3, fp ±3/18; 3.3.0 MINOR(본문 B 28,932/31,321/30,141, 캐시 2.2MB→552KB); 3.0.0 "24 reference modules" | 전부 확인 |
| 3.2.0 fp 18/36→27/36 | 확인 — 출처는 `CONTRIBUTING.md:146`; CHANGELOG 3.2.0은 "14/18 then 13/18, best before 11/18"로 기록 |
| hygiene-pasted 0/3→2/3 | 확인 (`docs/notes/2026-09-opus-5-5-eval.md:15`) |
| routing 54/54, intake 6/6, ending 9/9 | 확인 (CHANGELOG 3.2.2·3.2.0) |

### Grader 검증 (load-bearing 주장)

| 주장 | 결과 |
|---|---|
| skill-fired grader 18개, 전부 "두 스킬 발화 시 FAIL" | 18개 확인(`evals/*/graders/skill-fired.md`). 18개 모두 PASS 조건이 "fired alone"/"neither sibling fired"이므로 동시 발화는 FAIL. 문구상 "both fired in sequence"를 명시한 것은 5개, 나머지는 "a sibling fired"/"two of the three fired" 형태 |
| mode-line 10케이스 | 확인 (homeless 6 + mode 4). 모드 결정은 Modes 표 + 모드별 artifact 검사 |
| `hygiene-pasted-review-instruction`가 Pasted 단락을 검사 | 확인 (criteria 항목 1–4) |
| `refusal-tp-ad-chaining` "ad load를 금지로 다루면 FAIL" | 확인 ("the answer must not treat ad load as forbidden") |
| `homeless-arpdau-vs-d7` boundary | 확인 (skill-fired "Boundary check" + mode-line economics artifact) |
| 22행 표·사다리를 검사하는 grader 없음 | 확인 (`grep -ri "ladder\|routing table\|hand-off" evals/` → 0건 해당) |
| grader가 `domain-ethics.md` 경로를 참조 | 0건 — 항목 4가 grader를 건드리지 않음 확인 |
| fp 4케이스(stamina·pass-weeklies·wait-or-pay·streak-freeze)가 cadence, grader가 "acceptance bounds와 reviewer flags는 artifact" 명시 | 확인 (6개 fp criteria 전부 같은 단락) |
| **"fp 6케이스 전부 games 도메인 + companion 1건"** | **오류**. 프롬프트 기준: stamina·pass-weeklies·licensed-collab = games, **earned-streak-freeze = 언어학습 앱(Learning)**, **wait-or-pay-23h = 웹툰 앱(Narrative)**, companion = 저널링. 분할 후 6개 도메인 파일 중 4개가 운동됨 — 항목 4 검증에 오히려 유리하지만 서술은 고쳐야 함 |
| shape-irm·mode-irm-first-win이 craft value(ms/frame) 요구 | 확인 (항목 8 리스크 근거) |
| anti-fabrication.md 3개, hygiene-benchmark-population 존재 | 확인 |

### 실행 가능성 (샌드박스)

| 시험 | 결과 |
|---|---|
| **항목 7**: `git mv …/contracts.md scripts/contracts.md` + `check-shared-blocks.sh:8` 경로 수정 | 스크립트 4개 모두 OK (`check-claims` "23 modules"), `claude plugin validate ./plugin/skills --strict` 통과, `du -sk plugin` 524 KB. README·CHANGELOG·evals/README에 "24 reference modules" 주장이 최신 항목에 없어 check-claims 실패 없음 |
| **항목 4**: 6개 섹션을 `references/domain-ethics/{games,…}.md`로 분할(전문 복사), 원본 삭제 | validator 통과. `check-ethics-rows.sh` FAIL("missing") — 예상대로. `check-no-facts`·`check-shared-blocks`·`check-claims`는 **OK로 통과하지만 새 파일을 아예 보지 않음**(아래 부수 영향) |
| 항목 4 + `check-ethics-rows.sh`를 `for F in …/domain-ethics/*.md` 루프로 수정 | games·fortune·companion은 OK, **learning·mental-health·narrative FAIL**: 복사된 전문 5행 "**How to read a row.** … (T2b–T3) …"의 "T3" 토큰이 행으로 집계되고, 6줄 창 안에 숫자가 없음. 원본에서는 Games 행이 바로 뒤에 있어 우연히 통과했던 것 |
| 항목 4 glob 구멍 재현: games.md에 `${CLAUDE_SKILL_DIR}/references/x.md` 삽입 → `check-shared-blocks.sh` OK; games.md를 33 KB로 패딩 → `check-no-facts-in-skills.sh` OK | 두 불변식이 하위 디렉토리에 적용되지 않음 확인 |

---

## 누락된 부수 영향

### 항목 4 (domain-ethics 분할) — 반드시 보완

1. **메커닉 행이 도메인을 가로지른다.** `guilt-streak`·`streak-repair` 행은 Learning 섹션(`domain-ethics.md:47,49`)에만 있고 Games 섹션(7–40)에는 streak 행이 없다. `ethics-tiers.md:80–112` Compliant-spec index도 "Guilt streaks → Learning", "Paid streak freeze → Learning", "Expiring login chains → Games, Learning", "metered-access → Games, Learning"으로 적는다. 제안의 본문 지시 "games for any game, else the product's domain"대로면 **게임의 스트릭 cadence 요청(RSD `cadence`의 대표 케이스)이 행을 못 찾고 "no row → proceed silently"로 빠진다**. 지금은 단일 파일이라 한 번의 Read로 모든 행이 보인다. 수정: 본문 지시를 "ethics-tiers.md의 compliant-spec index가 그 slug에 적은 섹션의 파일을 읽는다(둘이면 둘 다)"로 바꾸거나, streak 두 행을 games.md에도 두거나(소유자 원칙 위반), index의 "Section" 열을 파일명으로 바꾼다. 2파일 읽기가 생기는 경우 절감은 −5.6k가 아니라 −5.0k.
2. **스크립트 glob 3개.** `scripts/check-no-facts-in-skills.sh:72`(`for m in plugin/skills/*/references/*.md` — 32,000 B 모듈 상한), `scripts/check-shared-blocks.sh:42`(own-directory 포인터 금지), `scripts/check-claims.sh`(`n_modules`) 모두 `references/*.md`만 본다. 하위 디렉토리 파일은 세 불변식 밖으로 나간다. `references/*/*.md`를 추가해야 한다. `n_modules`는 24→22(contracts 이동 포함)가 될지 28이 될지 정의를 정해야 하고, README:229 "7 modules" 표기도 그에 맞춘다.
3. **`check-ethics-rows.sh` 전문 충돌.** 새 공통 전문(~100 tok)에 "T3" 토큰이 들어가면 행으로 집계된다. 전문에서 티어 코드를 쓰지 않거나, 행 정규식을 `— T3 —` 형태로 좁혀야 한다.
4. **`ethics-tiers.md` 4곳.** `:26`(3질문의 2번, 경로), `:82`(index 전문, 경로), `:112`("This index is complete against …", 경로), `:110`(index 마지막 행 "Domain-ethics universal check 6 · the overlay section above" — 5a로 universal check 6이 사라지면 문구 수정). 23개 포인터 집계에 :26/:82/:112는 포함돼 있지만 :110은 산문이라 빠져 있다.
5. **본문 구체 위치.** ADV:69 Modes `system` 행(`domain-ethics.md`를 3번째 슬롯 모듈로 명시), ADV:71 Paths 목록, ADV:84 Procedure 2, ADV:94, IRM:26, IRM:105, RSD:108. 제안은 "경로 문구"로 뭉뚱그렸다.
6. **`04-design.md:373` 모듈 표, `05-plan.md`** — 스크립트가 스캔하지 않으므로 선택.

### 항목 1 (ROUTING)

7. **README 57–90행**이 같은 22행 표를 싣고 ":61 The table is identical in all three skill bodies"라고 쓴다. 표를 지우면 이 절 전체를 다시 써야 한다(제안은 ":61 부근" 한 줄로만 언급).
8. 첫 단락 축약안이 "A retention metric cited only as motivation or as a success criterion is NOT a second ask" 문장을 남기는지 지우는지 "…"로 가려져 있다. 이 문장은 ADV·IRM frontmatter에는 있지만 RSD frontmatter에는 다른 표현("even if D1/D7 is the motivating metric")으로만 있고, 발화 후 ADV `integrate` 판단("Two deliverables")에 쓰인다. 유지(≈25 tok)를 권한다.

### 항목 2 (Ethics 축약)

9. **IRM:109** "Legal and platform claims come from `…/jurisdictions.md` under the Output language rule"은 IRM 본문에서 `jurisdictions.md`를 가리키는 **유일한 줄**이다(`grep -n jurisdictions IRM/SKILL.md` → 109만). LANGUAGE 블록은 "copied from the jurisdiction reference"를 요구하므로 이 줄이 사라지면 IRM은 그 파일이 어디 있는지 모른다. 제안 골격(경로 2개)에 세 번째 경로로 넣거나 그대로 둔다. ADV:79, RSD:77(cadence 행)은 유지되므로 문제없다.

### 항목 5a

10. `domain-ethics.md:137–140`에만 있는 두 절 — "Answer yes when minors are declared, likely (rating, art style, platform, an existing under-18 cohort in the data), or store-signalled"와 "The overlay can raise a T4 to T2b, and in Brazil converts a T1-with-a-compliant-spec into a flat prohibition" — 를 `ethics-tiers.md` §Minors overlay로 옮긴 뒤 지워야 "정보 손실 없음"이 성립한다(index :110에 "raises the row's tier; flat T1 in Brazil"로 축약본만 있음).

### 항목 6

11. Silverman 포인터 재지정 대상 줄은 `liveops-cadence.md:90`. 또한 CONTRIBUTING 소유자 표(`:50` "Research citations and the contested list → irm/research-basis.md")를 따르면 IRM 모듈(`patterns-relief.md:33`, `patterns-nongame.md:45`)에서는 `research-basis.md:103`(같은 수치, 같은 스킬)을 가리키는 쪽이 일관되다. 둘 중 하나로 정하고 "responsibility moderator" 문구는 liveops:90에만 있으므로 research-basis로 보낼 경우 pointer 문구에서 그 단어를 뺀다.

### 항목 7

12. `CONTRIBUTING.md:38` 소유자 표 행 `advisor/contracts.md` → `scripts/contracts.md`(제안의 ":8,38,61"에 포함돼 있으나 "모듈이 아니게 된다"는 점을 표 설명에 반영). `docs/features/engagement-retention-v2/README.md:39`, `05-plan.md:19`는 이미 3.3.0 이전 경로(`skills/…`)라 stale — 선택.

---

## 필수 수정 사항 (구현 착수 전)

1. **요약표**: RSD cadence 최악값을 "Phase B 적용 후 ~24.2k / Phase C 5b 포함 시 ~23.3k"로 분리 표기. 5a 절감을 "단독 −430 / 항목 4와 동시 적용 시 −50(Duolingo Energy 문장만)"으로 고친다.
2. **리서치 정정 표**: `retention-playbook.md` 경로 수 16 → **23**(리서치 원값 복원), 경로 ≥3 모듈 11 → **14**, `domain-ethics.md` 경로 6 → 7. 항목 9의 "11개 모듈" 대상도 14개로.
3. **항목 4 본문 지시**를 "slug가 속한 섹션 파일을 compliant-spec index에서 찾아 읽는다"로 바꾸고, 게임 스트릭처럼 두 파일이 필요한 경우를 명시한다. 절감 표기는 "−5.0~6.6k(1~2파일)"로.
4. **항목 4 대상 파일 목록에 추가**: `scripts/check-no-facts-in-skills.sh`(모듈 상한 glob), `scripts/check-shared-blocks.sh:42`(own-dir glob), `scripts/check-claims.sh`(`n_modules` 정의 결정), `ethics-tiers.md:26,82,110,112`, ADV:69 Modes `system` 행, README:229 모듈 수.
5. **항목 4 공통 전문**에 티어 코드 토큰("T3")을 쓰지 않는다는 제약을 적거나, `check-ethics-rows.sh` 행 정규식을 `— T3 —`로 좁히는 수정을 함께 넣는다.
6. **항목 2 삭제 목록에서 IRM:109 제외**(또는 Mandatory read 문장에 `jurisdictions.md` 경로를 세 번째로 포함).
7. **항목 1**: 첫 단락 축약안에서 "metric cited only as motivation … NOT a second ask" 문장의 처분을 명시(유지 권장). 대상 파일에 README 57–90행 추가. 예상 ROUTING을 "≈370–390"으로, 절감을 "−630~655"로 갱신.
8. **항목 5a**: 삭제 전 `domain-ethics.md:137,140`의 두 절을 `ethics-tiers.md` §Minors overlay로 이관하는 단계를 추가. Duolingo Energy 줄 번호 :30 → :25.
9. **항목 5b**: 절감을 "−0.4~0.5k tok / −1.5~2 KB"로 낮추고, liveops `:80`·`:94`가 domain-ethics 행의 상위집합(ad-chaining bound, rolling window, 최소 행동, EU minors default off)이라 "포인터 + cadence 고유 bound만 남김" 형태로 범위를 정의한다.
10. **항목 6**: `liveops-cadence.md:94` → `:90`. Silverman 포인터의 목적지(liveops:90 vs research-basis:103)를 CONTRIBUTING 소유자 표 기준으로 하나 정한다.
11. **fp 케이스 도메인 서술 정정**: games 3(stamina·pass-weeklies·licensed-collab) + learning 1(streak-freeze) + narrative 1(wait-or-pay) + companion 1. 항목 4 검증 문단을 "6개 도메인 파일 중 4개가 10-run 배치에서 운동됨; mental-health·fortune은 미운동"으로.
12. **경미**: `check-shared-blocks.sh:35–40` → `:42`; `checks.yml:4`는 수정 불필요로 표기.

위 12건 반영 후에는 제안서를 승인한다. 반영 없이 Phase B를 시작하면 항목 4에서 `check-ethics-rows.sh` FAIL, 하위 디렉토리 불변식 미적용, 게임 스트릭 행 누락이 그대로 발생한다.
