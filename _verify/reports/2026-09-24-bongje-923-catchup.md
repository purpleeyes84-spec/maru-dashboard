# 봉제현황 2026-09-23 catchup 게이트 2026-09-24

## 판결: 조건부

## 경로
`Z:\HDD1\MARU\dashboard\봉제현황\index.html`

## 목표
9/23 catchup · data/xlsx/묶음 정합

## 논리증거

| 주장 | 실측 | 차 |
|---|---|---|
| asOf/updated=2026-09-23 | data/embed `updated`·`week_compare.as_of`·`recent3w.as_of`=**2026-09-23** · foot `갱신 ${D.updated}` | 0 |
| 조업일 38 · 일평균 549.1 | daily_product **38** · sum=20865 → avg **549.0789**≈**549.1** · overall.line_avg/조업일 일치 | 0 |
| 9/23 애리후세=300 | daily_product·month·xlsx 일별·금주 수요일 **300** · days.jsonl note「본문9월23일(수)」 | 0 |
| 9/22 undated 586 KPI/주간 미반영 | dated series·week_compare·recent3w 애리후세 **586 부재** · 화=미기록/null · xlsx 금주진행에 **참고행만**(집계칸 아님) | 0 |
| embed≡data | `#DATA` == data.json | 0 |
| xlsx 애리후세 9/23=300 | `생산평균_애리후세_20260923.xlsx` 일별 38행≡daily_product · 요약 일평균549.1·고유38 | 0 |
| xlsx 주간비교≡week_compare | `생산평균_주간비교_월토_20260923.xlsx` 6주 avg·요일별 ≡ data · 금주 9/21~9/26 수=300 | 0 |
| 묶음·state | 일별이미지/2026-09-23 `{new,p}-01.png` 2장 · `_undated` blankdate 9/22 2장 · processed에 9/23 sha `43839be4…` + undated 9/22 · daily-state≡work-daily-state≡일별이미지_state | 0 |
| days.jsonl↔data 일자집합 | dated unique **38**=daily_product · 9/21·9/22 없음 · 9/20=640 1건(misname 중복일자 없음) | 0 |
| 회귀 9/20=640 · file://Z=0 | daily_product·xlsx·jsonl 9/20=**640** 유지 · index file://Z **0** · R10 visibility.css + KPI≥3(8) + badge | 0 |
| **정본 xlsx 링크·source명 = 20260923** | 디스크에 `…_20260923.xlsx` 2종 존재·내용정합 · **index href·source.xlsx/xlsx_week는 여전히 `…_20260921.xlsx`** · source.fix에 9/23 미기재 | **잔존** |

## 관찰(비차단)
- days.jsonl 44행 = dated 38 + null-date 2(p-20/23) + 동일일자 복수페이지(max집계) — 정의(조업일=고유날짜)와 일치
- 금주 진행 1/6 · 대비 완료주평균 −282.4 (data≡xlsx)
- image_count state=50 (참고; 본 게이트 판정항 아님)
- 업로드 미러 ≡ 박스 `대시보드/봉제현황/` (data/index/state/xlsx sha 일치)

## 재발키
- 소스↔UI 건수·집합 스캔 (정본 xlsx href·source 파일명 ↔ 디스크 최신)

## 질문목록
1. index `href`·`source.xlsx`/`xlsx_week`를 `생산평균_애리후세_20260923.xlsx`·`생산평균_주간비교_월토_20260923.xlsx`로 갱신한 뒤 재게이트할까?
2. `source.fix`에 「9/23수300·9/22 undated KPI제외」 한 줄 append할까? (판정 비차단)

## 재현1줄
`python3 -c`로 daily_product n/avg/9-23·9-20·9-22부재 + openpyxl 일별≡data + index href 20260923 vs 20260921 카운트
