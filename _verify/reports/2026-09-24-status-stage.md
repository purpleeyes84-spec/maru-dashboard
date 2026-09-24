# 2026-09-24 · 생산현황 · 공정단계(stage) 규칙 정합 gate

## 판결: 조건부

## 경로
`Z:\HDD1\MARU\dashboard\status\index.html` (+ canon `Z:\HDD1\MARU\생산부\대시보드\생산현황\`)
규칙: `_tools/stage_rules.md` (업로드본)

## 목표
9월 현황표 기반 공정단계(원단·재단·봉제·완성·입고·납품완료) 표기, 납품일=9월 4주차 주간회의 출고마감일(없으면 fallback), D-day 상태.

## asOf
2026-09-24 (Asia/Seoul) · status/canon `meta.asOf` 일치 · R10 헤더 기준일 일치

## 규칙 요약 (stage_rules.md)
| 항목 | 계약 |
|---|---|
| stage 우선순위 | ship→납품완료 · inbound→입고 · complete→완성 · sewDate→봉제 · artwork→아트웍 · cutDate→재단 · fabric→원단 · else→대기 |
| 재단 라벨 | `재단 {cutQty}/{qty}` (오버컷 허용) |
| 납품일 | `deliveryDue`=4주차 출고마감 · 없으면 `due` + `dueSource=fallback` |
| D-day | 납품완료→완료 · due없음→미정 · D<0→지연 · 0..3→임박 · D>3→정상 |

## 논리증거

| 주장 | 실측 | 차 |
|---|---|---|
| stage 재계산 vs data.stage (92) | mismatch **0** (입고0·아트웍0 · 대기5·원단10·재단26·봉제22·완성2·납품완료27) | **0** |
| stage/라벨 vs R10 HTML | mismatch **0** (재단 cutQty 라벨 포함) | **0** |
| 납품일 weekly/fallback | data: weekly **13** · fallback **64** · none **15** · HTML sub 4주차13·기존79(=64+15) · due셀 불일치 **0** · fallback/none 모두 `기존` 표기 | **0** (표기 OK) |
| D-day vs HTML | mismatch **0** · 납품완료→완료(D- 없음) · 정상50·미정15·지연0·임박0 | **0** |
| R10 KPI | NO92·납품완료27·봉제22·완성2·재단26·지연0·임박0 = 재계산 · summary 공정/납기상태 일치 | **0** |
| status↔canon **orders** | 92건 전필드 동일 · ship set 동일 | **0** |
| status↔canon **shipN** | 양쪽 **27** · baseline 27/27 보존(RH-1 09-11, RH-6/12/15/16/21 09-21, IO-07 09-21, IO-08..15 09-18, SM-01..10 09-02, DS-01/02 08-31) | **0** (복구됨) |
| status↔canon meta | dueSyncAt·packingCloseAt 초단위 Δ · noteMorning↔shipRestore* 키 비대칭 | 소프트 |
| canon **embed** ↔ canon-data | ship set 27=27 OK · 그러나 embed `meta.shipN=1`·`asOf=2026-09-22` · stageDate 전부 null · dday 문자열 · complete 10건 Δ · IO-16 sewDate 누락(embed stage=봉제 vs 필드재계산=재단) | **embed 미동기** |
| teamKpis.shipN | 생산3=0 / 5=1 / 시머=0 / 디즈니=0 vs 실측 6/9/10/2 (status≡canon 동일 스태일) | 팀KPI 미재집계 |
| due-sync-summary | withDue=**6** · changed=0 · vs data weekly=**13** | 질문 |
| 회귀 file:///Z | status·canon **0** | **0** |
| 회귀 fold-nav.js | status-index **미포함**(축소 R10 ~31KB · 09-22 RH-1 close도 비범위 기록) | 관찰 |
| 미납품지연 | `unshipOverdueN=0` = KPI 지연0 | **0** |

## 심층 샘플 (1–3)
| NO | stage(규칙) | 납품일/소스 | D-day | R10 | 비고 |
|---|---|---|---|---|---|
| RH-1 | 납품완료(ship) | 2026-09-18 / weekly | 완료 | OK | ship 09-11 유지 |
| IO-16 | 봉제(sewDate 09-22) | 2026-09-30 / weekly | 정상(D-6) | OK | canon embed sewDate='' → 내부불일치 |
| RH-2 | 완성(complete) | 2026-10-08 / weekly | 정상(D-14) | OK | |
| RH-56 | 원단(fabric) | — / none | 미정 | OK | sub=`기존` |
| SM-01 / DS-01 / IO-07 | 납품완료 | fallback/weekly | 완료 | OK | ship baseline 유지 |

## 재발키
`소스↔UI 건수·집합 스캔` (정본 embed meta.shipN·필드 ↔ data.json)

## 관찰
- status R10 보드·status/canon **data.json orders**는 stage·납품일·D-day·ship 전항 정합.
- 직전 조건부(canon shipN=1)의 **data층 ship 복구는 해소**(restore 노트·shipN=27).
- 잔여: **canon-index.html `const DATA` embed 미재생성**(meta.shipN=1, asOf 9/22, IO-16 sewDate 등).
- teamKpis.shipN 스태일(양측 동일).
- `입고` 단계 0건(inbound 있는 건은 모두 ship) — 규칙상 정상 가능.

## 질문목록
1. canon `index.html` embed를 data.json(shipN=27·asOf=9/24·stageSync)으로 재생성?
2. due-sync-summary `withDue=6` vs data `dueSource=weekly` 13 — 주간회의 파싱 6만? 나머지 7 출처?
3. `meta.teamKpis.*.shipN` 재집계(실측 6/9/10/2)?
4. `dueSource=none` 15건 HTML sub를 `기존`과 구분(예: `미정`)할지?
5. 축소 R10 status-index에 fold-nav.js 재삽입 여부(09-22 링크복구 승인 대비)?

## 오답
조건부 → 생산현황 미반영 append · key=`소스↔UI 건수·집합 스캔` · tag=논리 · sync_index
