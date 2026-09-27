# 2026-09-22 · 대시보드 · 링크복구 조건부 재게이트

## 판결: 승인

## 경로
`Z:\HDD1\MARU\dashboard\`

## 목표
조건부 잔여(fold-nav 누락·dash-nav CSS) 해소 후 전칸 재검증

## Prior
`reports/2026-09-22-dash-link-regate.md` (조건부)

## 논리증거

| 주장 | 실측 | 차 |
|---|---|---|
| status fold-nav.js | status/index.html **fnjs=1** | **0** |
| 사후정산(패킹·종결) fold-nav.js | 해당칸 index **fnjs=1** (직전 0) | **0** |
| `.dash-nav` CSS 삭제 | 샘플 14파일(허브·process·교육·status·sales·gt·woimg·두리·봉제·사후·proc×4) **dnC합=0** · dnH=0 | **0** |
| delivery / file:///Z / 끝슬래시 | 전 샘플 **0** (회귀없음) | **0** |
| process→4자식 | IO-VPL004·SP27_* ×3 index 존재·각 fold-nav.js=1 | **0** |

## 스코프
상위 칸 index + process 4자식 (직전과 동일). education 챕터·두리 하위는 샘플 밖.

## 오답
prevent-key `내비-fold-nav전용` + slot `공정·생산현황` → close_open

## 질문목록
(없음)
