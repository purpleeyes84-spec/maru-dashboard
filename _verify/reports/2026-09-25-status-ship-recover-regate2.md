# 2026-09-25 · 생산현황 · ship 복구 2차 재게이트 (주차 자동선택·라벨·배지·링크·fold-nav)

## 판결: 조건부
직전 조건부 원인(`sync_stage_from_status.js`의 `loadWeeklyDue("9월 4주차")` 하드코딩)은 **해소**됨. meta·UI·stage summary 모두 5주차이고, 불변식은 전부 Δ0.
**조건 1건**: 클레임 4 "status 페이지의 모든 상대 href가 resolve된다"는 사실이 아님. `status/due-from-sep.html`(status index의 「9월~ 납기」 링크 대상)은 48개 중 21개만 resolve되고 **27개가 깨져 있음**. 9/24 파일이라 회귀는 아니지만 클레임과 다름.
fold-nav 제거는 **위반 아님(허용)**으로 판단함. 다만 사용자 확인 질문으로 올림(아래).

## 경로·사본
canon `Z:\HDD1\MARU\생산부\대시보드\생산현황\` · status `Z:\HDD1\MARU\dashboard\status\`
사본 `/workspace/uploads/status-925-regate2/{canon,status}/` (%TEMP%\s925rg2 경유, 08:27 KST 산출물) · 기준 = 직전 재게이트 `status-925-regate/`
Z 편집 없음 (%TEMP%에 복사만 하고 노드 resolver만 읽기 실행함)

## 클레임 검증
| # | 클레임 | 실측 | 차이 |
|---|---|---|---|
| 1 | weekly_resolver.js가 최신 월·주차 자동 선택(--weekly 수동 지정 가능), due·stage sync 둘 다 사용, 주차 하드코딩 0 | resolver: `key=월*100+주차` 내림차순, `~$` 제외, mtime 미사용 · Z 폴더 실행 결과 `9월 5주차 주간회의.xlsx`(key 905, 후보 7개) ✔ · due-sync 113-114행과 stage-sync 93-96·451행 모두 `WR.resolveWeekly(weeklyOverrideFromArgv)` 사용 ✔ · `loadWeeklyDue("9월 4주차")` 0건 ✔ · 활성 _tools JS와 HTML의 코드 내 `N주차` 리터럴 0 (resolver 2행 **주석** 예시 `"9월 4주차"`만 있음. status HTML의 `5주차`는 생성 결과물) · 시뮬레이션: 10월 1주차 vs 9월 5주차 → **10월 1주차** ✔ · 10월 10주차 / 11월 1주차 → 11월 1주차 ✔ (주차 99까지 정렬 안전) · **연도 넘김 12월 5주차 vs 1월 1주차 → 12월 선택 ✗** (연도 키 없음) | 0 (연도 넘김은 잠재 결함 → 질문) |
| 2 | meta.weeklyLabel이 UI 라벨을 결정. 5주차 13 / 기존 64 / 미정 15, meta·stage summary·header 전부 5주차 | data.meta `weeklyLabel=5주차` · `dueSyncSource=weeklyDueSource=9월 5주차 주간회의.xlsx` · dueSyncPath 5주차 · dueFromWeeklyN 13 · dueFallbackN 64 · dueSource 분포 weekly 13 / fallback 64 / none 15 · stage-sync-summary `weekly=9월 5주차` · due-sync-summary source 5주차 · status 헤더 `납기동기 9월 5주차 주간회의.xlsx` · summary `5주차 납품일 13건 · 기존 납기 64건 · 미정 15건` · 행 라벨 `5주차`×13 / `기존 납기`×64 / `미정`×15 | 0 |
| 3 | cutQtyIssue ⚠ 배지는 RH-57(=cutQtyIssue 보유 NO)에만 표시 | data의 cutQtyIssue 보유 NO = RH-57 1건 · status index ⚠ 1건(RH-57, title `재단수량칸에 날짜(2026-09-19)`) · status by-po ⚠ 1건(RH-57) · canon index는 `cutCell()`이 `o.cutQtyIssue`일 때만 배지를 붙이는 조건부 렌더 | 0 (단, canon index는 아래 관찰 1 참조) |
| 4 | canon index 깨진 링크 수정: 폴더홈 `../../../dashboard/index.html` resolve, delivery 제거, canon index와 status 페이지의 모든 상대 href resolve | Resolve-Path → `Z:\HDD1\MARU\dashboard\index.html` ✔ · delivery 0 ✔ · `../index.html`도 제거됨 · canon index 6/6 ✔ · status index 5/5 ✔ · status by-po 4/4 ✔ · **status due-from-sep.html 21/48 (27개 실패)**: `../../1. GOODTRUST/…` 작지 PDF·자재 xlsx 24개, `../공정`·`../교육자료`·`../납기` index 3개 | **27 (status due-from-sep)** |
| 5 | canon index에서 fold-nav.js 제거(canon 자체 nav를 덮어써서), status는 유지 | canon: `fold-nav.js` 0 · `visibility.css` 0 (**직전·9/24 사본에도 visibility.css는 없었음**, 제거가 아님) · 정적 `<nav class="fold-nav">` 5링크(폴더홈·GOODTRUST·생산현황(on)·공정·교육자료) 전부 resolve · status index·by-po: `../_shared/fold-nav.js`·`../_shared/visibility.css` Test-Path True | 판단은 아래 |

## fold-nav 판단: 위반 아님(허용), 사용자 확인 필요
- **R10 범위 밖**: R10 적용 범위는 `Z:\HDD1\MARU\dashboard\` 하위 화면임. canon은 `생산부\대시보드\생산현황\`이라 범위에 포함되지 않음. `내비-fold-nav전용` 스캔도 "전 칸 index" 기준이고, 생산현황 칸의 index는 status.
- **링크되지 않음**: `dashboard\` 전체 html/js(bak·_verify 제외)에서 `대시보드/생산현황`(원문·%인코딩)을 가리키는 링크 0건. hub와 status 어디에서도 canon으로 들어가지 않음. status `POINTER.txt` = `ROLE=R10-sample-board · SOURCE=생산부/대시보드/생산현황/data.json` → canon은 데이터 소스이고 게시 화면은 status.
- **왕복 내비**: canon → hub(폴더홈) 링크는 resolve됨. hub → canon 링크는 설계상 없음(hub → status). visibility.css는 원래 canon에 없었음(canon 자체 인라인 CSS 사용).
- **9/24 승인 기록과의 차이**: 9/24 게이트의 (c) fold-nav 행은 status의 `../_shared/fold-nav.js`였고, canon fold-nav는 직전 재게이트가 "R10 canon ✔"로 기록한 상태 유지 항목이었음. 사용자에게 보이는 화면이 아니므로 이번 제거는 회귀로 보지 않음.
- **판단이 갈리는 부분 (질문 Q1)**: canon 헤더 부제가 `본사 대구 · 열람 부산`이라, 누군가 canon을 직접 여는 용도일 수 있음. 그렇다면 R10 대상이 되고 fold-nav 복원이 필요함.

## 불변식 (vs 직전 재게이트)
| 항목 | 직전 | 지금 | 차이 |
|---|---|---|---|
| shipN (meta·orders·embed·by-po×2·status KPI·헤더 ship=27·by-po html) | 27 | 27 전 표면 | 0 |
| 잠금 | 13/13 | ship_locks.json 해시 동일 · data 13/13 · by-po 13/13 | 0 |
| status≡canon SHA256 | data 38E694C6… / by-po BF4C395B… | data `959A0CAF4CC61C96`=양쪽 · by-po `646E5DDAB042075B`=양쪽 | 0 (해시 변경 원인은 meta만: weeklyLabel·source·path·sync 시각 / by-po는 rebuiltAt만) |
| asOf | 9/25 | 9/25 (data·by-po·헤더·stage summary) | 0 |
| weekly 13 NO 집합 | IO-07~16·RH-1·RH-2·RH-55 | 동일 | 0 |
| ship/due/deliveryDue | 27/77/77 | 27/77/77 | 0 |
| orders 전 필드 (92 NO) | — | **diff 0** (cutQty·cutQtyIssue 포함) | 0 |
| top-level (cal·calDaily·calMonth·teamCal·schedules·nav·teamKpis) | — | deep-equal | 0 |
| embed ≡ data | deep-equal | deep-equal | 0 |
| IO-13 합봉 | 1320 | schedules cum 1320 · calDaily 660+660 | 0 |
| KPI | 7 | status index kpi 7 (≥3) | 0 |
| file:///Z | 0 | canon index·status index·by-po 0 | 0 |
| status fold-nav/visibility | True | True | 0 |

## 관찰
1. **canon index 메인 `<script>` 문법 오류**(node --check): 208행 `"</div><div class="mix-leg">"`의 따옴표 충돌 → 스크립트 전체가 실행되지 않음(sideNav·표·⚠ 배지 미렌더, 정적 헤더/nav만 보임). 9/22·9/24·9/25 사본 모두 같아서 **기존부터 있던 문제, 회귀 아님**. canon이 사용자 화면이 아니라는 판단과도 맞음.
2. `sync_due_from_weekly.js` 7-16행에 `listLatestWeekly()`(key=월*10+주차) 죽은 코드가 남아 있음. 호출 0회라 영향 없음.
3. `_tools/*.bak-20260925-*` 3개에 옛 하드코딩이 남아 있음(실행 대상 아님).
4. override는 `includes` 부분일치. `"1주차"`처럼 짧게 주면 첫 번째로 걸리는 파일을 고름(모호함). 월 포함 지정 권장.
5. canon by-po.html(31/55)·due-from-sep.html(26/49)에도 `../img`·`../theme.css`·`../index.html` 등 깨진 링크가 있음. 클레임 범위(canon index) 밖이고 링크되지 않은 페이지.

## 조치 요청 (재게이트 조건)
1. `status/due-from-sep.html` 27개 링크 수정(작지·자재 → `../../생산부/1. GOODTRUST/…`, `../공정|교육자료|납기` → `../process|education|delivery` 또는 제거) 후 전수 Test-Path. 아니면 클레임 범위에서 이 페이지를 빼고 사용자 결정을 받을 것.
2. (권장) resolver 키에 연도 추가(파일 mtime 연도 또는 12→1월 넘김 보정).

## 질문목록
1. canon index(`생산부\대시보드\생산현황\index.html`)를 부산 등에서 직접 여나? 연다면 R10 대상 → fold-nav 복원(nav 덮어쓰기는 fold-nav.js 쪽에서 수정)이 필요하고, 안 연다면 내부 소스 페이지로 확정.
2. canon index 스크립트 문법 오류(9/22부터)를 고칠까, 아니면 canon을 데이터 전용으로 둘까?
3. 12월 → 1월 넘김 때 resolver 연도 처리를 지금 넣을까?
4. status due-from-sep.html(9/24 판)을 고칠까, canon판으로 재미러할까? (canon판도 링크 23개 깨짐)
5. (이월) RH-57 재단수량을 현장에 확인할까? (O231=9/19 날짜)

## 오답
조건부 → 수정 확인된 3키(`리빌드=잠금보존` · `표·차트·data.json 키 동기` · `동기소스=실사용파일(하드코딩금지)`, 생산현황)는 스킬 규칙 2·3(수정확인→반영, 같은 키 상태 갱신)에 따라 기존 행을 반영으로 갱신. close_open.py는 승인 행이 있어야 동작하므로 실행하지 않음 · 신규 미반영 1행 `허브 href exists 스캔`(status due-from-sep 27) · sync_index.py 실행
