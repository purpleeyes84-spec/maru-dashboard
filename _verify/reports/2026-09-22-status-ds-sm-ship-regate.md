# 2026-09-22 · 생산현황 · DS/SM 선적일 조건부 재게이트

## 판결: 승인

## 경로
`Z:\HDD1\MARU\생산부\대시보드\생산현황\` + `Z:\HDD1\MARU\dashboard\status\`

## 목표
조건부 잔여 해소 재검수 — status by-po←정본 미러 · teamKpis/clientKpis 재집계

## Prior
`reports/2026-09-22-status-ds-sm-ship.md` (조건부)

## 논리증거

| 주장 | 실측 | 차 |
|---|---|---|
| status by-po ≡ 정본 | sha 동일 `732c4850…` · byte 92695=92695 · items92 · **ship 13/92** | **0** |
| DS-01/02 · SM-01~10 by-po.ship | 12/12 기대일(8/31·9/2) | **0** |
| data.json status≡정본 | sha 동일 `63f79b6f…` · orders ship 12PO 유지 | **0** |
| teamKpis | 시머트리 shipN=**10**/shipQ=3009 · 디즈니 shipN=**2**/shipQ=1100 | **0** |
| clientKpis | 시머트리/디즈니 shipN 10/2 동일 | **0** |
| meta.shipN | 13 | **0** |

## 관찰(비차단)
- R10 `status/index`는 by-po 미참조(담당 답변). by-po는 정본↔status 동기용 — 본 오더는 by-po를 목표에 포함해 검증·해소 확인. 이후 R10-only 오더에서는 by-po를 필수로 두지 않아도 됨(정책 선택).
- by-po meta.asOf=2026-09-21 (ship 반영과 별개)

## 오답
prevent-key `소스↔UI 건수·집합 스캔` + slot `생산현황` → close_open

## 질문목록
(없음)
