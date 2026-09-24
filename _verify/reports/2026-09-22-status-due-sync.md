# 2026-09-22 · 생산현황 · 주간회의 출고마감→due 동기

## 판결: 조건부

## 경로
`Z:\HDD1\MARU\생산부\대시보드\생산현황\` + `Z:\HDD1\MARU\dashboard\status\`

## 목표
주간회의 9월4주차 출고마감일→due 동기 검수(변경13→보정후 RH-1=9/18 등, due-sync-summary.json)

## 논리증거

| 주장 | 실측 | 차 |
|---|---|---|
| due-sync-summary | kind=`due-sync-from-weekly` · source=`9월 4주차 주간회의.xlsx` · sheet=보고용 · parsed=92 · withDue=6 · **changed=2** · unmatched=0 | 변경13≠최종2(보정후 서술과 정합 가능) |
| RH-1 due=2026-09-18 | summary old 9/17→9/18 · status·canon orders due=**2026-09-18** · R10 납기셀 2026-09-18 · by-po(양쪽) due=9/18 | **0** |
| IO-07 due(보정쌍) | summary 9/20→9/21 · status·canon due=**2026-09-21** · R10 일치 | **0** |
| status↔canon **due** | due 필드 불일치 **0** | **0** |
| status↔canon **ship** | status shipN=**27** · canon shipN=**1**(IO-07만) · ship Δ **26** · by-po sha 불일치 | **−26** |
| R10 KPI | 납품완료27·미납품지연0 (status 기준) | status측0 |

## 재발키
`소스↔UI 건수·집합 스캔` (정본↔status ship 집합)

## 관찰
- summary `changed=2`(RH-1·IO-07) — 「변경13→보정후」최종 스냅으로 해석. 13 목록은 summary에 없음
- withDue=6: 주간회의에서 due 파싱된 6건만(변경 2+동일 4)로 보임

## 질문목록
1. 정본 `data.json`/`by-po`에 packing ship 26건 복구 후 status 재미러?
2. summary changed=2를 최종(13보정 후)으로 확정?
3. withDue=6 외 출고마감 미파싱은 의도?
