<script src="/maru-dashboard/js/auth-gate.js"></script>
# 2026-09-25 · 생산현황 · ship 복구 재게이트 (조건부 후속)

## 판결: 조건부
클레임 1~5 통과·회귀 0. **클레임 6만 불일치**: due-sync는 5주차로 돌았지만(changed 0) 게시된 data.json meta와 status UI 헤더는 여전히 `9월 4주차`로 표시됨. 원인은 `sync_stage_from_status.js`에 `loadWeeklyDue("9월 4주차")`가 하드코딩되어 있고(449행), 이 스크립트가 due-sync(08:19 KST) 다음에 실행(08:20 KST)되면서 매번 deliveryDue/dueSource를 4주차 기준으로 다시 계산하기 때문.
이번에는 수치 영향이 없음: 4주차와 5주차 `보고용` 시트의 `출고 마감일`(M열)이 같고, 다른 칸은 N66~N70 비고 5칸뿐.

## 경로·사본
canon `Z:\HDD1\MARU\생산부\대시보드\생산현황\` · status `Z:\HDD1\MARU\dashboard\status\`
사본 `/workspace/uploads/status-925-regate/` (21파일 + src/ 생산현황표 9월.xlsx·9월 4/5주차 주간회의.xlsx)
기준: 9/24 승인본 `status-stage-regate/` · 오늘 아침 게이트 `status-925-recover/` (08:14 KST)
Z 편집 없음 (%TEMP% 스테이징 복사만 함)

## 클레임 검증
| # | 클레임 | 실측 | 차이 |
|---|---|---|---|
| 1 | canon by-po.json 잠금 적용 재생성·ship 27·SM=09-02·IO-07·잠금 13 | items 92 · ship 27 · meta.shipN 27 · SM-01~10=2026-09-02 · IO-07=2026-09-21 · 잠금 13/13 일치(by-po·data 둘 다) · by-po↔data 15키 불일치 0 · rebuiltAt 08:20:26 KST | 0 |
| 2 | status data/by-po = canon (SHA256) | data `38E694C6AFCE5B3A…` 양쪽 동일 · by-po `BF4C395BF2249488…` 양쪽 동일 (Windows Get-FileHash, 박스 sha256sum 재확인) | 0 |
| 3 | status by-po meta.asOf=9/25 | `2026-09-25` (9/22 스태일 해소) | 0 |
| 4 | by-po.json을 읽는 페이지 없음 | 두 폴더 html/js 11개 grep: 페이지 6개(index·by-po·due-from-sep ×2)에서 `by-po.json`·fetch·XHR 0건 · 참조는 _tools 노드 스크립트 5개(작성기)뿐 | 0 |
| 5 | RH-55/56 299 실값 · RH-57 qty 150·재단칸 날짜 → 아래 1행만 읽음 · cutQty 공란+cutQtyIssue | xlsx `생산3팀`: RH-55 O223=299·H223=294 / RH-56 O227=299·H227=294 / RH-57 H231=150·**O231=2026-09-19(날짜)**·O232=299(2행 아래 일수량 행 → 이전 파서가 오독한 값) · data: RH-57 cutQty null·cutQtyIssue `재단수량칸에 날짜(2026-09-19)` · **92 NO 전수: cutQty·qty 모두 xlsx NO행+1과 불일치 0** | 0 |
| 6 | 납기 소스 = 9월 5주차·변경 0 | due-sync-summary: 5주차·보고용·parsed 92·withDue 6·changed 0 ✔ · **data.meta dueSyncSource/weeklyDueSource=`9월 4주차`** · stage-sync-summary weekly=4주차 · status UI 헤더 `납기동기 9월 4주차 주간회의.xlsx` · 배포 백업(bak-deploy-0819) meta는 5주차였으나 stage-sync가 4주차로 되돌림 | **라벨/소스 불일치 (값은 0)** |

## 샘플 (1~3)
| NO | lock/xlsx | canon data | status data | embed | status UI | by-po(양쪽) |
|---|---|---|---|---|---|---|
| SM-01 | 09-02 | 09-02 | 09-02 | 09-02 | 09-02 | 09-02 |
| IO-07 | ship 09-21 | 09-21 | 09-21 | 09-21 | 09-21 | 09-21 |
| RH-57 | O231=날짜·qty150 | cutQty null+issue | 동일 | 동일 | `재단` (수량 없음) | `재단` |
→ 편차 없음. 전수 확인으로 확대(아래).

## 회귀 (vs 9/24 승인 · 오늘 아침 게이트)
| 항목 | 9/24 | 아침 | 지금 | 차이 |
|---|---|---|---|---|
| shipN (data meta·필드·embed·by-po×2·R10 KPI·납품실적 셀) | 27 | 27 | 27 전 표면 | 0 |
| teamKpis 3팀/5팀/시머/디즈니 | 6/9/10/2 | 6/9/10/2 | 6/9/10/2 (meta·top·UI 행 = orders 실측) | 0 |
| ship 집합·값 | 27 | — | 9/24와 동일·아침과 값 동일 | 0 |
| weekly 집합 | 13 | 13 | 13 (IO-07~16·RH-1·RH-2·RH-55) | 0 |
| UI 라벨 4주차/기존 납기/미정 | 13/64/15 | 13/64/15 | 13/64/15 | 0 (5주차 M열이 4주차와 같아 집합 변화 없음) |
| ship/due/deliveryDue/dueSource 필드 | 27/77/77/92 | 동일 | 27/77/77/92 · 키 92/92 | 손실 0 |
| cutQty (92 NO 전수, vs 아침) | — | — | **RH-57 299→null 1건만** | 의도한 수정 |
| cutQty (vs 9/24) | — | — | RH-55 598→299 · RH-56 —→299 · RH-57 158→null · RH-64 —→200 · RH-65 —→4 · RH-66 —→176 · RH-67 —→175 · RH-68 —→4 · RH-69 —→233 · RH-70 —→4 | 10건: 모두 xlsx NO행+1과 일치 |
| 그 외 orders 필드 (vs 아침) | — | — | cutQtyIssue 키 92개 신규(값 1개) · RH-57 stageLabel `재단 299/150`→`재단` | 의도한 변경 |
| stage / D-day | — | 대기5·원단2·재단34·봉제22·완성2·납품27 / 27·50·15 | 동일 | 0 |
| cutN/cutQtySum/sewN/completeN | 71/19631/44/20 | 79/20269*/45/26 | 79/**20269**/45/26 · 팀별 cutQtySum = orders 합 | 0 (*아침 meta 20269 vs orders 합 20568 불일치가 이번에 해소됨) |
| calDaily·cal·calMonth·teamCal·schedules·nav | 99 | 102 (9/25 재계산) | = 아침 (deep-equal) | 0 |
| IO-13 합봉 | 1320 | 1320 | sched 합봉 1320 · schedDaily 660+660 | 0 |
| days | — | fresh | = 아침 · 시트 납기 − 9/25 (RH-2 10/09→14 · SM 08/31→−25) | 0 |
| embed ≡ data | deep-equal | deep-equal | deep-equal (asOf 9/25·shipN 27) | 0 |
| asOf | 9/24 | 9/25 | 9/25 (data·embed·by-po×2·UI 헤더×2·stage summary) | 0 |
| R10 status | ✔ | ✔ | `../_shared/fold-nav.js`·`visibility.css`·`../index.html`·by-po·due-from-sep 모두 Test-Path True · KPI 7 · file:///Z 0 (index·by-po) | 0 |
| R10 canon | ✔ | ✔ | fold-nav `../../../dashboard/_shared/fold-nav.js` True · file:///Z 0 · file:// 문구 1 (링크 아님, 9/24와 같음) | 0 |

## 관찰
- `days`는 시트 원래 납기 기준이라 due-sync가 바꾼 9 NO(RH-2·IO-08~15)는 `due − asOf`와 맞지 않음. UI는 `dday`(RH-2 D-13)를 쓰므로 표시는 정상이고, 9/24부터 같은 상태라 회귀 아님.
- RH-57 cutQtyIssue는 data에만 있고 UI(status index·by-po)에 배지로 안 보임. 화면에는 `재단`만 표시됨.
- canon index.html의 `../../../dashboard/delivery/index.html`과 `../index.html`(생산부\대시보드\index.html)은 Test-Path False. fold-nav/visibility 대상이 아니고 9/24 승인본부터 그대로라 회귀 아님.
- status `due-from-sep.html/json`은 canon과 해시가 다름(status 9/24·9/22 버전). 미러 대상(data·by-po)이 아님.
- xlsx 기준 RH-57 재단수량 실값은 확인 불가(O231 날짜, 2행 아래 O232=299는 qty 150 대비 199%라 비현실적). 공란+issue 처리는 타당함.

## 조치 요청 (재게이트 조건)
1. `sync_stage_from_status.js` 449행 `loadWeeklyDue("9월 4주차")` 하드코딩 제거 → due-sync와 같은 최신 주차(또는 due-sync-summary.source) 사용.
2. 재실행 후 data.meta `dueSyncSource`·`weeklyDueSource`와 status UI 헤더가 `9월 5주차`인지, weekly 13·라벨 13/64/15가 유지되는지 확인 (값 변화 0 예상).
3. (선택) UI 라벨 `4주차`/`4주차납품일`을 소스 파일명 기반으로 바꿀지 결정. 지금은 sync_stage 183행·355행에 하드코딩되어 있음.

## 재발키
- `리빌드=잠금보존`: 이번에 해소 확인 (canon by-po ship 27·잠금 13/13)
- `표·차트·data.json 키 동기`: 이번에 해소 확인 (status≡canon byte)
- **신규** `동기소스=실사용파일(하드코딩금지)`: 동기 스크립트 간 소스 파일 일치, meta·UI 라벨 = 실제 사용 파일

## 질문목록
1. 납기 기준은 앞으로 최신 주차 자동 선택인가, 아니면 수동 지정인가? (지금은 due-sync=최신, stage-sync=4주차 고정이라 둘이 다름)
2. UI 라벨 `4주차`(dueSource=weekly)를 `주간회의`나 `5주차`처럼 소스를 따라가게 바꿀까?
3. RH-57 재단수량을 현장에 확인할까? (시트 O231=9/19 날짜, O232=299)
4. RH-57처럼 cutQtyIssue가 있는 NO를 UI에 배지로 보여줄까?
5. canon index의 delivery·생산부\대시보드\index.html 링크 2개(Test-Path False, 9/24부터)를 정리할까?

## 오답
조건부 → 생산현황 미반영 1행 추가 (`동기소스=실사용파일(하드코딩금지)`, scans.md 신규 키) · 기존 2행(리빌드=잠금보존·표·차트·data.json 키 동기)은 수정 확인됐지만 지시대로 승인 시 close_open 예정이라 미반영 유지 · sync_index.py 실행
