# 2026-09-22 · 생산현황 · DS/SM 선적일 게이트

- 오더: `Z:\HDD1\MARU\생산부\대시보드\생산현황\`(정본) · `Z:\HDD1\MARU\dashboard\status\`(R10 mirror)
- 목표: 디즈니 DS-01/02 ship=2026-08-31 · 시머트리 SM-01~10 ship=2026-09-02 반영 검수 (data.json · 정본 index embed · R10 status · by-po.json)
- 박스: `/workspace/uploads/status-ship-gate/` · Read-only (Z/HTML 미수정)
- 적용: R09 · R10 · 논리스캔 `소스↔UI 건수·집합 스캔`
- POINTER: `ROLE=R10-sample-board` · `SOURCE=생산부/대시보드/생산현황/data.json`

## 판결
**조건부**

## 논리증거

| 주장 | 실측 | 차 |
|---|---|---|
| data.json 정본=status | sha256 `c2d5be255d70afa4…` 동일 · byte 503271=503271 | **0** |
| 필드 | `orders[].ship` (납기=`due` 별도) | — |
| DS-01/02 ship | data·정본embed·R10표 납품일 **2026-08-31** | **0** |
| SM-01~10 ship | data·정본embed·R10표 납품일 **2026-09-02** | **0** |
| 정본 index embed | `const DATA={…}` · 12PO ship == data.json · stale 아님 | **0** |
| R10 status index | 정적표 92행 · meta「디즈니 8/31 · 시머트리 9/2」· KPI 납품완료**13**=meta.shipN · 미납품지연**1** · visibility.css 링크 · `file:///Z` **0** | **0** |
| canon-by-po ship | 12PO 전원 `ship` 존재·기대일 일치 (외 IO-07=2026-09-21) · with_ship=13/92 | **0** |
| status-by-po ship | **ship 키 전무** (0/92) · DS/SM 12건 ship=없음 · byte 92227 vs 92695 (Δ−468) · sha 불일치 | **−12** |
| teamKpis vs orders | meta.shipN=13 OK · 팀 `시머트리.shipN=0`(orders10)·`디즈니.shipN=0`(orders2) · unshipOverdue 잔존 | **−12**(팀집계) |

### PO → ship 표 (data / by-po / embeds)

| PO | claim | data.json | canon embed | R10 납품일 | canon-by-po | status-by-po | δ |
|---|---|---|---|---|---|---|---|
| DS-01 | 2026-08-31 | 2026-08-31 | 2026-08-31 | 2026-08-31 | 2026-08-31 | **(없음)** | status-by-po |
| DS-02 | 2026-08-31 | 2026-08-31 | 2026-08-31 | 2026-08-31 | 2026-08-31 | **(없음)** | status-by-po |
| SM-01 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | **(없음)** | status-by-po |
| SM-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | **(없음)** | status-by-po |
| SM-03 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | **(없음)** | status-by-po |
| SM-04 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | **(없음)** | status-by-po |
| SM-05 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | **(없음)** | status-by-po |
| SM-06 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | **(없음)** | status-by-po |
| SM-07 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | **(없음)** | status-by-po |
| SM-08 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | **(없음)** | status-by-po |
| SM-09 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | **(없음)** | status-by-po |
| SM-10 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | 2026-09-02 | **(없음)** | status-by-po |

기타 DS-/SM- 오선적: 없음 (전량 위 12 + 비대상 IO-07).

## canon vs status sync

| 파일 | sync |
|---|---|
| data.json | **동일** (sha·byte) |
| index.html | 정본=embed DATA · status=정적표(선적 표면화 OK) · 구조 이원 |
| by-po.json | **불일치** — status에 `ship` 필드 누락(스키마/미러 지연) |

meta.shipUpdate(data): `2026-09-22 디즈니 ship=2026-08-31 (DS-01/02); 시머트리 ship=2026-09-02 (SM-01..10)`

## 재발키
`소스↔UI 건수·집합 스캔` (tag 논리 · 칸 생산현황) — status-by-po (no→ship) 집합 공집합 vs 기대 12 · 오답 미반영 append + sync_index.py

## 질문목록
1. `dashboard/status/by-po.json`을 정본 `생산현황/by-po.json`(ship 포함)으로 재미러할까?
2. data.json `teamKpis`의 시머트리/디즈니 `shipN`·`unshipOverdueN`을 `orders[].ship` 기준으로 재집계할까? (전역 meta.shipN=13·R10 KPI는 이미 정합)
3. R10 status index는 data fetch 없이 정적 HTML인데, by-po 미러를 게이트 필수에서 빼도 될까?

## 관찰(비차단)
- due(납기)는 DS=2026-08-30 · SM=2026-08-31 — ship과 별개, 본 게이트 claim 외
- status-index `file:///Z`=0 · 상대 `../../` PDF 링크
