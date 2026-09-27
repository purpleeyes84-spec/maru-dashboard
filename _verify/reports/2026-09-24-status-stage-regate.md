# 2026-09-24 · 생산현황 · 공정단계 stage 재게이트

## 판결: 승인

## 경로
`Z:\HDD1\MARU\dashboard\status\` + canon `생산부\대시보드\생산현황\`
규칙: `stage_rules.md` (납품일 UI 라벨: 4주차 / 기존 납기 / 미정)

## asOf
2026-09-24 · status≡canon≡embed≡R10 헤더

## 수정 클레임 검증

| # | 주장 | 실측 | 차 |
|---|---|---|---|
| (a) | canon embed = data (shipN27·asOf 9/24) | embed `meta.shipN=27` · `asOf=2026-09-24` · `const DATA` **deep-equal** canon-data.json · IO-16 sewDate=`2026-09-22`/stage=봉제 · complete·stageDate 샘플 OK | **0** |
| (b) | teamKpis.shipN = 6/9/10/2 | 생산3=**6** · 생산5=**9** · 시머트리=**10** · 디즈니=**2** (= orders 실측) | **0** |
| (c) | fold-nav.js 상대경로 재삽입 | `<script src="../_shared/fold-nav.js">` · file:///Z=0 | **0** |
| (d) | 라벨 4주차/기존 납기/미정 | HTML sub: 4주차**13** · 기존 납기**64** · 미정**15** = dueSource weekly/fallback/none · 셀 불일치 0 | **0** |
| (e) | withDue=6 → NO 13 (PO#0073→IO-08~15) | weekly 고유 PO **6** · NO **13** · `PO #0073`→IO-08..15(8) · 나머지 PO당 1(RH-1·RH-2·RH-55·IO-07·IO-16) · prior due-sync `withDue=6`와 논리 정합 | **0** (설명 채택) |

## 회귀

| 주장 | 실측 | 차 |
|---|---|---|
| stage 재계산 vs data/HTML (92) | mismatch **0** (대기5·원단10·재단26·봉제22·완성2·납품완료27·입고0) | **0** |
| 납품일 weekly13/fallback64/none15 | data·HTML·summary 일치 · 규칙 라벨 정합 | **0** |
| D-day | mismatch **0** · 완료27·정상50·미정15·지연0·임박0 | **0** |
| R10 KPI | NO92·납품완료27·봉제22·완성2·재단26·지연0·임박0 | **0** |
| status-data == canon-data | 파일 **byte-identical** sha=`df1f50940e90cacc` · deep-equal | **0** |
| canon embed == canon-data | deep-equal (meta·orders 전부) | **0** |
| ship 27 baseline | RH-1 09-11 · RH-6/12/15/16/21 09-21 · IO-07 09-21 · IO-08..15 09-18 · SM-01..10 09-02 · DS-01/02 08-31 | **0** |
| file:///Z | status·canon **0** | **0** |

## 재발키
`소스↔UI 건수·집합 스캔`

## 관찰
- 직전 조건부(embed shipN=1·teamKpis 스태일·fold-nav 누락·none=`기존` 혼동) 전부 해소.
- due-sync withDue=6은 주간회의 **PO행** 수; NO 전개 13은 데이터로 확인.

## 질문목록
(없음 — 전항 해소)

## 오답
승인 → 생산현황 반영 append(증상含승인) · key=`소스↔UI 건수·집합 스캔` · `close_open.py`
