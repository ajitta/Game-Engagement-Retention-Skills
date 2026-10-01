# Phase A 구현 보고 — 3.3.1 (항목 6 · 7)

대상: `ajitta/Game-Engagement-Retention-Skills`, 브랜치 `perf/token-diet`, 기준 commit `a12440b` (3.3.0 본문). 날짜: 2026-10-01.
입력: `docs/notes/2026-10-01-token-cost-review/02-proposal.md`(검증 반영본) 항목 6·7, `03-verification.md` "누락된 부수 영향" 11·12번, "필수 수정 사항" 10번.
상태: **커밋하지 않음** — 변경은 working tree에만 있다. push·tag 없음.

---

## 1. 변경 파일 (11 수정 + 1 이동)

| 파일 | 항목 | 변경 |
|---|---|---|
| `plugin/skills/interaction-reward-moments/references/patterns-relief.md` | 6 | :17 Ascarza → `churn-and-winback.md`; :33 Silverman → `research-basis.md`(효과 크기) + `liveops-cadence.md`(responsibility moderator); :39 Streak Revival → `churn-and-winback.md` |
| `plugin/skills/interaction-reward-moments/references/patterns-nongame.md` | 6 | :45 Silverman 퍼센트 → `research-basis.md`; `domain-ethics.md` 포인터는 "guilt-streak 행의 4개 규칙"으로 한정; `retention-playbook.md` 포인터 제거 |
| `plugin/skills/engagement-retention-advisor/references/systems-catalog.md` | 6 | :55 Ascarza → `churn-and-winback.md` |
| `plugin/skills/engagement-retention-advisor/references/domain-ethics.md` | 6 | :146 기다리면-무료 연도 표기를 systems-catalog 형식으로 ("one 2019 write-up of a 2014-era 카카오페이지 launch [DBR via 인터비즈 \| 2019]") |
| `plugin/skills/retention-strategy-designer/references/liveops-cadence.md` | 6 | :161 연도 표기 통일; :125·:126·:129 win-back 3개 bullet에 출처 태그 추가 + `churn-and-winback.md` owner 포인터 1문장 |
| `plugin/skills/engagement-retention-advisor/references/contracts.md` → `scripts/contracts.md` | 7 | `git mv` (내용 무변경, 15,384 B) |
| `scripts/check-shared-blocks.sh` | 7 | :8 `CONTRACTS=scripts/contracts.md` |
| `CONTRIBUTING.md` | 7 | :8 경로; :38 owner 표 행을 `scripts/contracts.md`로 + "모듈이 아니며 런타임에 읽히지 않음" 설명(03 검증 #12); :61 경로 |
| `evals/README.md` | 7 | :28 경로 |
| `README.md` | 7 | :61 `scripts/contracts.md`; :223 페이로드 ~550 → ~525 KB; :229–230 ADV "7 modules, incl. contracts.md" → "6 modules"; scripts/ 트리에 contracts.md 추가; :234–235 "ships to installers" → "tracked, not installed (since 3.3.0 the payload is plugin/ only)"; :239 설명 문단에 새 경로와 이유 |
| `plugin/.claude-plugin/plugin.json` | release | `version` 3.3.0 → 3.3.1 |
| `CHANGELOG.md` | release | `## [Unreleased]` 유지, 그 아래 `## [3.3.1] — 2026-10-01` 신설 (Fixed: 포인터 5개·연도 표기·win-back 태그 / Changed (repository, not skill): contracts.md 이동, 모듈 23개, 페이로드 540→524 KB, README stale 문장, `docs/notes/2026-10-01-token-cost-review/` 추가) |

건드리지 않은 것: 세 `SKILL.md` 전체(frontmatter·Modes 표·공유 블록 포함, 바이트 동일), `ethics-tiers.md`, `.github/workflows/checks.yml:4`(파일명만 언급하는 주석, 03 검증 #12대로 미수정), `docs/features/engagement-retention-v2/{04-design,05-plan,README}.md`의 옛 `skills/…/contracts.md` 경로(3.3.0 이전부터 stale, 03 검증이 "선택"으로 분류, 스크립트 스캔 대상 아님 — 미수정).

---

## 2. 항목별 작업

### 항목 6 — 깨진 owner 포인터 5개 + 사실 불일치

1. **Ascarza (2곳)** — `patterns-relief.md:17`, `systems-catalog.md:55`: `experiments.md` → `churn-and-winback.md`. 대상 파일 :37에 효과 크기(R1 +2.70pp 등), net revenue, [contested] per-round read 전부 있음을 확인. 포인터 문구("effect sizes, the net-revenue read and the rollout design" / "Effect sizes, and why the per-round read misleads")는 그대로.
2. **Silverman (2곳)** — 03 검증 #11·필수수정 #10대로 CONTRIBUTING 소유자 표("Research citations → irm/research-basis.md") 기준으로 `research-basis.md`(:103, 66.23% vs 57.86%)를 목적지로 정함.
   - `patterns-relief.md:33`: 원문 "the effect sizes and the responsibility moderator are in retention-playbook.md" → "the effect sizes are in research-basis.md (streaks entry) and the responsibility moderator in liveops-cadence.md (streak evidence)". responsibility moderator는 `liveops-cadence.md:90`에만 있으므로 제안이 허용한 "병기" 선택지를 택했다(아래 §3-1).
   - `patterns-nongame.md:45`: "the percentages and the habit reading are owned by domain-ethics.md (guilt-streak row) and retention-playbook.md" → "the percentages are owned by research-basis.md (streaks entry) and the four build-testable rules by domain-ethics.md (guilt-streak row)". `domain-ethics.md:47`에는 인용만 있고 수치가 없으므로 제안대로 "행(규칙)"으로 한정. `retention-playbook.md`에는 Silverman도 streak habit 서술도 없어(grep 0건) 그 포인터는 제거.
3. **Streak Revival** — `patterns-relief.md:39`: `domain-ethics.md (learning section)` → `churn-and-winback.md (win-back channels)`. 대상 :64에 15.4M / nearly 8M / retention claim 확인.
4. **기다리면-무료 연도 표기 통일** — `systems-catalog.md:65`의 "one 2019 write-up of a 2014-era launch [DBR via 인터비즈 | 2019]" 형식을 `domain-ethics.md:146`("카카오페이지, 2014 — historical, never current")과 `liveops-cadence.md:161`("[DBR case via 인터비즈, 2019]")에 적용. 수치(25%, ₩30M→₩68M / 3,000만원→6,800만원)는 각 파일 원문 그대로.
5. **win-back 9개 구절 (churn ↔ liveops)** — 제안의 권고("문구만 동기화하고 양쪽 유지")대로 양쪽 유지. 동기화 내용: `liveops-cadence.md`의 Streak Revival(:125)·畅玩服(:126)·Aion2(:129) bullet은 `churn-and-winback.md:63–65`와 같은 수치를 **출처 태그 없이** 재진술하고 있었다. 세 bullet에 churn 쪽 태그를 축약형(URL 제외)으로 넣고, bullet 목록 끝에 "Sources, URLs and the full win-back evidence are owned by churn-and-winback.md" 1문장을 추가. 수치 변경 없음. Zheng(:108 ↔ churn:44)과 Marvel Rivals(:127 ↔ churn:66)는 이미 양쪽에 태그가 있고 수치가 같아 손대지 않음.

### 항목 7 — contracts.md 이동 + README stale 문장

- `git mv plugin/skills/engagement-retention-advisor/references/contracts.md scripts/contracts.md`. 파일 내용 무변경(15,384 B). 파일 자체는 자기 경로를 언급하지 않음(grep 0건).
- 경로 수정 6곳: `check-shared-blocks.sh:8`, `CONTRIBUTING.md:8,38,61`, `evals/README.md:28`, `README.md:61,239`. `README.md:230`의 "incl. contracts.md" 줄은 ADV 트리에서 빼고 `scripts/` 트리로 옮김.
- `README.md:234–235` "tracked, and it ships to installers" → "tracked, not installed (since 3.3.0 the payload is plugin/ only)".
- `README.md:229` ADV "7 modules" → "6 modules". `README.md:223` 페이로드 "~550 KB" → "~525 KB" (`du -sk plugin` 540 → 524 KB).
- `check-claims.sh`가 세는 모듈 수 24 → 23. CHANGELOG 3.3.1 항목에 "23 reference modules"로 기록. 역사 항목(3.0.0 "24 reference modules")은 그대로.

---

## 3. 제안서와 다른 점

1. **Silverman 포인터 — "병기" 선택.** 제안 항목 6은 "responsibility moderator 문구는 빼거나 `liveops-cadence.md:90`을 병기"로 두 선택지를 줬고, 03 검증 #11은 "research-basis로 보낼 경우 그 단어를 뺀다"고 했다. 효과 크기는 `research-basis.md`로 보내되 responsibility moderator는 `liveops-cadence.md`로 병기했다. 이유: 그 moderator는 liveops:90에만 있는 실제 정보라, 단어를 빼면 독자가 찾아갈 곳이 없어진다. 두 포인터 모두 실존 위치를 가리킨다.
2. **win-back 동기화를 "출처 태그 추가"로 해석.** 제안은 "문구만 동기화"라고만 썼다. 두 파일의 수치는 이미 일치했고 차이는 liveops 쪽에 태그가 없다는 것뿐이어서, CONTRIBUTING "Every number carries `[source | population | year | definition]`" 규칙에 맞게 태그를 넣는 것을 동기화로 봤다. 태그는 churn 원문에서 URL을 뺀 축약형이고 URL은 owner 포인터 1문장으로 대신했다. 비용: `liveops-cadence.md` +313 B / +88 tok → RSD `cadence` 최악 호출 +88 tok. 토큰 중립이어야 할 항목에서 유일하게 늘어난 곳이다. 원치 않으면 :125·:126·:129의 태그 3개와 마지막 문장만 되돌리면 된다.
3. **README 페이로드 수치.** 3.3.0 CHANGELOG의 552 KB는 scratch profile에 설치해 잰 값이고, 이번 ~525 KB는 `du -sk plugin`(524 KB)이다. 설치 재측정은 하지 않았다.
4. **CONTRIBUTING owner 표 행에 설명 추가** — 03 검증 #12 요구. 표의 다른 행보다 길어졌다.
5. **CHANGELOG에 `### Changed (repository, not skill)` 소제목 사용** — 3.3.0의 `### Process (no skill change)` 관례에 맞춘 변형. 리뷰 문서(`docs/notes/2026-10-01-token-cost-review/`) 추가도 여기에 기록.
6. **선택 검증 미실행**: `hygiene-korea-odds-statute`·`hygiene-benchmark-population` 3-run(제안이 "선택"으로 둠)은 돌리지 않았다. 4 스크립트 + 3 validator만 실행.

---

## 4. 스크립트 · validator 출력 (그대로 붙임)

```
### bash scripts/check-claims.sh
OK: every count, version and gate claim in the docs matches the tree (39 cases, 10 families, 23 modules, 3 skills, 4 scripts, v3.3.1)
exit=0
### bash scripts/check-ethics-rows.sh
OK: 26 T3 rows, all with a measurable compliant spec
exit=0
### bash scripts/check-no-facts-in-skills.sh
OK: no facts, citations, statutes or prohibition lists in any SKILL.md body
exit=0
### bash scripts/check-shared-blocks.sh
OK: ROUTING, CARD and LANGUAGE blocks identical across 3 skills; no own-directory pointers in reference modules
exit=0
```

```
### claude plugin validate . --strict
Validating marketplace manifest: /home/ubuntu/work/Game-Engagement-Retention-Skills/.claude-plugin/marketplace.json
✔ Validation passed
exit=0
### claude plugin validate ./plugin/skills --strict
Validating components in: /home/ubuntu/work/Game-Engagement-Retention-Skills/plugin/skills
✔ Validation passed
exit=0
### claude plugin validate plugin/.claude-plugin/plugin.json --strict
Validating plugin manifest: /home/ubuntu/work/Game-Engagement-Retention-Skills/plugin/.claude-plugin/plugin.json
✔ Validation passed
exit=0
```

(plugin.json validator는 CONTRIBUTING이 "로컬에서 CLAUDE.local.md 때문에 exit 1"이라 적어 두었으나 이 환경에서는 통과했다.)

```
### claude --plugin-dir ./plugin plugin details game-engagement-retention
Game Engagement & Retention (game-engagement-retention) 3.3.1
Projected token cost
  Always-on:   ~1,840 tok   added to every session
  retention-strategy-designer        ~640      ~9.5k
  interaction-reward-moments         ~600      ~9.9k
  engagement-retention-advisor       ~600      ~9.1k
```

always-on·on-invoke 모두 3.3.0과 동일 (frontmatter·본문 무변경이므로 당연).

```
$ du -sk plugin        # 540 (전) → 524 (후)
$ git status --short
 M CHANGELOG.md
 M CONTRIBUTING.md
 M README.md
 M evals/README.md
 M plugin/.claude-plugin/plugin.json
 M plugin/skills/engagement-retention-advisor/references/domain-ethics.md
 M plugin/skills/engagement-retention-advisor/references/systems-catalog.md
 M plugin/skills/interaction-reward-moments/references/patterns-nongame.md
 M plugin/skills/interaction-reward-moments/references/patterns-relief.md
 M plugin/skills/retention-strategy-designer/references/liveops-cadence.md
 M scripts/check-shared-blocks.sh
R  plugin/skills/engagement-retention-advisor/references/contracts.md -> scripts/contracts.md
 11 files changed, 40 insertions(+), 22 deletions(-)
```

---

## 5. 바이트 · 토큰 (tiktoken cl100k_base, `disallowed_special=()`)

측정 스크립트 `/home/ubuntu/work/ger-review/measure.py`, 원본 출력 `A-before.txt` / `A-after.txt`.

### SKILL.md (변경 없음)

| 파일 | 전 B / tok | 후 B / tok |
|---|---|---|
| `engagement-retention-advisor/SKILL.md` | 28,932 / 6,604 | 28,932 / 6,604 |
| `interaction-reward-moments/SKILL.md` | 31,321 / 7,129 | 31,321 / 7,129 |
| `retention-strategy-designer/SKILL.md` | 30,141 / 6,929 | 30,141 / 6,929 |

### 영향받은 모듈

| 파일 | 전 B / tok | 후 B / tok | Δ B / Δ tok | 원인 |
|---|---|---|---|---|
| `advisor/domain-ethics.md` | 31,256 / 7,490 | 31,309 / 7,512 | +53 / +22 | :146 연도 표기 + 태그 |
| `advisor/systems-catalog.md` | 11,900 / 2,945 | 11,906 / 2,948 | +6 / +3 | 파일명 길이 차 |
| `irm/patterns-nongame.md` | 11,156 / 2,836 | 11,178 / 2,844 | +22 / +8 | :45 포인터 재배치 |
| `irm/patterns-relief.md` | 6,536 / 1,579 | 6,661 / 1,619 | +125 / +40 | :33 포인터 2개 병기, :39 |
| `rsd/liveops-cadence.md` | 25,236 / 6,085 | 25,549 / 6,173 | +313 / +88 | :161 연도, :125·:126·:129 태그 + owner 1문장 |
| `advisor/contracts.md` → `scripts/contracts.md` | 15,384 / 3,549 | 15,384 / 3,549 | 0 (이동) | 페이로드에서 제외 |

나머지 18개 모듈·3 SKILL.md: 바이트 동일. 모듈 합계 24파일 360,835 B → 23파일 345,970 B (contracts −15,384, 편집 +519).

### 호출당 최악값 (제안서와 같은 조합, 모듈 토큰 단순 합산)

| 호출 | 구성 | 전 tok (Claude ×1.38) | 후 tok (Claude ×1.38) | Δ |
|---|---|---|---|---|
| RSD `cadence` + domain-ethics | 본문 + liveops-cadence + jurisdictions + ethics-tiers + domain-ethics | 31,239 (~43.1k) | **31,349 (~43.3k)** | +110 (liveops +88, DE +22) |
| ADV `system` | 본문 + systems-catalog + ethics-tiers + domain-ethics | 20,491 (~28.3k) | **20,516 (~28.3k)** | +25 |
| IRM `moments` + DE + feel | 본문 + moment-lenses + patterns-reveal + ethics-tiers + domain-ethics + feel-and-accessibility | 27,679 (~38.2k) | **27,701 (~38.2k)** | +22 |

항목 6·7의 설계상 절감은 0(포인터는 토큰 중립)이고 실측도 그렇다. 유일한 증가분 +88은 §3-2의 출처 태그다. Phase B 목표(RSD cadence ~24.2k 등)는 이 release의 범위 밖이며, 그 산출 기준점은 이제 31,239가 아니라 31,349다.

---

## 6. 다음 단계 (미실행)

- 커밋·태그는 하지 않았다. `scripts/release.sh "3.3.1 — owner pointer fixes, contracts.md out of payload"`가 dirty tree에서 거부하므로 먼저 커밋이 필요하다.
- 선택 검증(hygiene 2케이스 3-run)은 원하면 `evals/README.md` "Running it manually" 절차로.
- Phase B(항목 1·2·3·4·5a)는 03 검증 "필수 수정 사항" 3·4·5·6·7·8을 반영한 뒤 별도 배치로. 이 보고서의 "후" 값이 그 배치의 before 기준점이다.
