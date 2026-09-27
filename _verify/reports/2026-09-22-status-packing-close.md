# 2026-09-22 · 생산현황 · packing-close→ship 종결 동기

- 오더: `Z:\HDD1\MARU\생산부\대시보드\생산현황\`(정본) + `Z:\HDD1\MARU\dashboard\status\`(R10)
- 목표: 패킹리스트→ship 종결 동기 검수(신규 RH/IO 13건 · 디즈니·시머트리 기존 ship 유지 · packing-close-summary.json)
- 박스: `/workspace/uploads/status-packing-close/` · baseline `/workspace/uploads/status-ship-regate/` · Read-only (Z/HTML 미수정)
- 적용: R09 · R10 · 논리스캔 `소스↔UI 건수·집합 스캔`
- POINTER: `ROLE=R10-sample-board` · `SOURCE=생산부/대시보드/생산현황/data.json` + packing-close

## 판결
**조건부**

## 논리증거

| 주장 | 실측 | 차 |
|---|---|---|
| summary 구조·건수 | kind=`packing-close-summary` · runAt=2026-09-21T22:50:16.079Z · shipChangedCount=**13**=list · scanned=9 · packingRecords=29 · matched=10 · unmatched=19 · force=false · embedPatches=13 | **0** |
| 신규 RH/IO 13 ship (data status·canon) | RH-6/21/12/16/15=**2026-09-21** · IO-08..15=**2026-09-18** · blank=0 · summary dates 일치 | **0** |
| DS-01/02 · SM-01..10 회귀 | DS=**2026-08-31** · SM=**2026-09-02** · baseline≡status≡canon 12/12 | **0** |
| by-po ship (status≡canon) | sha 동일 `3f15beb8…` · 13 closes ship OK · with_ship=**26**/92 = meta.shipN | **0** |
| meta.shipN · teamKpis | shipN=**26** · Δbaseline+13 · 팀 5+9+10+2=26 · clientKpis 동수 | **0** |
| log ↔ summary | shipChanges·counts·runAt 일치 · log만 `records` 29 추가 | **0** |
| status-data ↔ canon-data sha | **불일치** · 유일 Δ `meta.packingCloseAt` status=`…12.717Z` vs canon=`…11.962Z` · orders/ship **동일** | **≠0**(메타) |
| R10 status-index | KPI 납품완료=**13**≠meta.shipN26 · RH/IO13 납품일 전부 **—**(진행/임박) · DS/SM 뱃지 유지 · banner「디즈니8/31·시머트리9/2」만 · `file:///Z`=**0** | **−13**(UI) |

### 13 closes (claim = data status/canon = by-po)

| NO | claim ship | data | by-po | R10 납품일 | δ |
|---|---|---|---|---|---|
| RH-6 | 2026-09-21 | 2026-09-21 | 2026-09-21 | **—** | UI |
| RH-21 | 2026-09-21 | 2026-09-21 | 2026-09-21 | **—** | UI |
| RH-12 | 2026-09-21 | 2026-09-21 | 2026-09-21 | **—** | UI |
| RH-16 | 2026-09-21 | 2026-09-21 | 2026-09-21 | **—** | UI |
| RH-15 | 2026-09-21 | 2026-09-21 | 2026-09-21 | **—** | UI |
| IO-08 | 2026-09-18 | 2026-09-18 | 2026-09-18 | **—** | UI |
| IO-09 | 2026-09-18 | 2026-09-18 | 2026-09-18 | **—** | UI |
| IO-10 | 2026-09-18 | 2026-09-18 | 2026-09-18 | **—** | UI |
| IO-11 | 2026-09-18 | 2026-09-18 | 2026-09-18 | **—** | UI |
| IO-12 | 2026-09-18 | 2026-09-18 | 2026-09-18 | **—** | UI |
| IO-13 | 2026-09-18 | 2026-09-18 | 2026-09-18 | **—** | UI |
| IO-14 | 2026-09-18 | 2026-09-18 | 2026-09-18 | **—** | UI |
| IO-15 | 2026-09-18 | 2026-09-18 | 2026-09-18 | **—** | UI |

회귀 유지: DS-01/02=2026-08-31 · SM-01..10=2026-09-02 (data·by-po·R10 뱃지).

## canon vs status sync

| 파일 | sync |
|---|---|
| data.json | **sha 불일치** (packingCloseAt만) · orders/ship 집합 동일 · status `a48e6d79…` · canon `7aea4fad…` |
| by-po.json | **동일** sha `3f15beb8…` |
| packing-close-summary.json | sha `5c74fe5a…` (status측 산출) |
| status-index.html | 정적표 · **packing-close 미반영**(KPI13·납품뱃지=DS/SM(+IO-07)만) |

summary.note: `기존 ship 보존(force 없음). 사용자 확정 납품일 우선.` · meta.packingCloseAt(status)=2026-09-21T22:50:12.717Z · meta.shipUpdate 문구는 DS/SM만(패킹클로즈 문구 없음).

## 재발키
`소스↔UI 건수·집합 스캔` (tag 논리 · 칸 생산현황) — data/by-po shipN=26 vs R10 KPI·표 납품완료/뱃지=13 · 오답 **미반영** append + sync_index.py

## 질문목록
1. `dashboard/status/index.html`(및 정본 index embed)을 data.json `orders[].ship` 기준으로 재생성해 KPI 납품완료=26 · RH/IO13 납품 뱃지를 올릴까?
2. status/canon `meta.packingCloseAt` 755ms 차를 한쪽 값으로 맞출까? (orders 동일·기능무관)
3. unmatchedPacking 19건(no-order 등)은 후속 매칭 오더 대상인가, 무시 확정인가?

## 관찰(비차단)
- baseline ship 13 → 현재 26 (Δ+13=요약 closes) · IO-07 기존 납품 2026-09-21 R10 유지
- teamKpis: 생산3팀 shipN=5(RH5) · 생산5팀=9(IO-07+IO8..15) · 시머트리10 · 디즈니2
- `file:///Z`=0 · 상대 `../../` PDF 링크
- packing-close-log = summary + records[29]
