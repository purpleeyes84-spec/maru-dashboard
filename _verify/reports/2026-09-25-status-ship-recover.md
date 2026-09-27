<script src="/maru-dashboard/js/auth-gate.js"></script>
# 2026-09-25 · 생산현황 · Air 리빌드 후 ship/납기 복구 게이트

## 판결: 조건부

## 경로
`Z:\HDD1\MARU\dashboard\status\` + canon `생산부\대시보드\생산현황\`
잠금: `생산현황\_tools\ship_locks.json` (8:11:53 · 13 NO) · 스냅샷 `_tools\ship_snapshot.json` (27)
리빌드 원본 백업: `data.json.bak-air-20260925-0815` (deliveryDue 0 · dueSource 0 · SM ship=08-24 · RH-1 ship=09-23 → 손실 확인)
사본: `/workspace/uploads/status-925-recover/` (13파일) · 비교기준: `/workspace/uploads/status-stage-regate/` (9/24 승인)

## asOf
2026-09-25 · stage-sync-summary≡canon data≡status data≡canon embed≡status HTML 헤더≡by-po HTML 헤더
(단 status `by-po.json` meta.asOf=`2026-09-22` · canon by-po.json=`2026-09-25` — 관찰)

## 클레임 검증

| # | 주장 | 실측 | 차 |
|---|---|---|---|
| (a) | shipN = 27 | canon data meta 27·ship필드 27 · status data 27 · canon embed 27(deep-equal canon data) · status R10 KPI 납품완료 27·납품실적 셀 27 · status by-po.json 27 · teamKpis 6/9/10/2(=orders 실측) · **canon by-po.json 26** (IO-07 ship 누락) | **canon by-po −1** |
| (b) | 잠금 SM=09-02 · RH-1=09-11 · DS=08-31 | ship_locks.json 13NO 일치 · canon/status data·embed·status UI·status by-po 전부 일치 · 백업 대비 SM 08-24→09-02·RH-1 09-23→09-11 복원 · **canon by-po.json SM-01~10 ship=`2026-08-24`** (잠금 전 리빌드 원값) | **canon by-po SM 10NO 잠금 미반영** |
| (c) | 4주차 납기 11건 재적용 | due-sync `changed=11` (RH-2·IO-08~15·IO-16·RH-55) · weekly 집합 **13** = 9/24와 동일(IO-07~16·RH-1·RH-2·RH-55) · UI `4주차` 13 · 기존 납기 64 · 미정 15 | **0** (11=변경건, 13=집합; 손실 아님) |
| (d) | stage asOf = 2026-09-25 | summary·data·embed·HTML 모두 2026-09-25 · D-day 재계산(RH-2 D-13 등) | **0** |
| (e) | R10 | status/by-po: `../_shared/fold-nav.js`+`visibility.css` · KPI 6 · file:///Z 0 · href 5/5 상대(by-po·due-from-sep·../index) · canon: `../../../dashboard/_shared/fold-nav.js` 존재 · file:// 는 배지 문구 1(링크 아님, 9/24와 동일) | **0** |

### 4주차 13 vs 11 설명
- 9/24 weekly 13 → 9/25 weekly 13 (집합 대칭차 0).
- 11 = 이번 due-sync에서 **값이 바뀐** NO 수(IO-08~15 09-27→10-02 · RH-2 10-09→10-08 · IO-16/RH-55 신규). RH-1(09-18)·IO-07(09-21)은 값 동일로 changed 제외.
- 출하/마감으로 빠진 건 0 · 손실 0.

## 샘플 (잠금 3종)

| NO | lock | canon data | status data | embed | status UI | status by-po | canon by-po |
|---|---|---|---|---|---|---|---|
| SM-01 | 09-02 | 09-02 | 09-02 | 09-02 | 09-02 | 09-02 | **08-24** |
| RH-1 | 09-11 | 09-11 | 09-11 | 09-11 | 09-11 | 09-11 | 09-11 |
| DS-02 | 08-31 | 08-31 | 08-31 | 08-31 | 08-31 | 08-31 | 08-31 |
→ 편차로 확대: 27 ship 전수 → canon by-po만 11건 불일치(SM×10·IO-07), 나머지 표면 0.

## 회귀 (vs 9/24 승인)

| 항목 | 9/24 | 9/25 실측 | 차 |
|---|---|---|---|
| ship / due / deliveryDue 필드 손실 | — | 손실 0 (27/77/77 유지) | 0 |
| ship 집합 | 27 | canon≡status≡snapshot≡9/24 | 0 |
| weekly/fallback/none | 13/64/15 | 13/64/15 | 0 |
| stage | 대기5·원단10·재단26·봉제22·완성2·납품완료27 | 대기5·**원단2·재단34**·봉제22·완성2·납품완료27 | RH-56·64~70 cutDate 9/19~22 신규 → 원단→재단 8 (실변경) |
| D-day | 완료27·정상50·미정15 | 동일 | 0 |
| status-data == canon-data | byte-identical | **불일치** sha canon `35b35fcd` / status `4407e2db` · orders stage/ship/due/dday 동일 · status 측 `days` 75건 −3일 스태일 · IO-13 sched/schedDaily 합봉1320 누락 · meta sewN 44/45·completeN 20/26·cutN 71/79·cal/calMonth/teamCal 합봉·nav sub·calDaily 99/102 · status meta에 9/21 `shipRestoreNote` 잔존 | **회귀** |
| canon embed == canon data | deep-equal | deep-equal | 0 |
| status by-po.json ↔ status data | — | 92/92 · ship·due·stage·dday 불일치 0 | 0 |
| canon by-po.json ↔ canon data | — | ship 11건 불일치 | **−** |
| file:///Z | 0 | 0 | 0 |

## 재발키
- `리빌드=잠금보존` (신규) — 리빌드 후 ship_locks를 data·embed·by-po.json·status 미러 **모든 산출물**에 적용
- `표·차트·data.json 키 동기` — status/data.json ≡ canon/data.json (byte/deep-equal)
- (관련·통과) `소스↔UI 건수·집합 스캔` — status UI 표면은 0

## 조치 요청 (재게이트 조건)
1. canon `by-po.json` 재생성: ship 필드를 ship_locks→snapshot→data 순으로 적용 (SM-01~10=09-02 · IO-07=09-21) → ship 27.
2. status `data.json`을 canon `data.json`으로 재미러(바이트 동일) — meta 집계·days·IO-13 sched 포함.
3. (권장) status `by-po.json` meta.asOf 9/22 → 9/25 동기 또는 "그룹기준일" 라벨 분리.
4. sync_packing_close.js 외 by-po 빌더에도 ship_locks 참조 추가.

## 관찰
- 백업(bak-air)에서 deliveryDue 0·dueSource 0·stage 0 → 전부 복구 확인(77/13/92).
- RH-55 cutQty 598→299 · RH-56 299 · **RH-57 158→299 (qty 150)** — 3행 동일 299는 병합셀 오독 의심. 이번 클레임 범위 밖, 생산현황 봇 확인 요망.
- canon index는 visibility.css 링크 없음(9/24 승인본과 동일, 인라인 스타일) — 유지.
- canon `by-po.html`(8:03:46)은 리빌드 전 정적본·ship 미표시·canon index에서 링크 없음.

## 질문목록
1. canon by-po.json을 소비하는 페이지가 있나? (status/by-po.json은 정상 — 미러 방향이 status→canon인지 확인)
2. RH-55/56/57 cutQty 299 동일값이 xlsx 원본과 맞는가?

## 오답
조건부 → 생산현황 미반영 2행: `리빌드=잠금보존`(신규 키, scans.md 추가) · `표·차트·data.json 키 동기` · `sync_index.py`
