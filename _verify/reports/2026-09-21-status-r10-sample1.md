# 생산현황 R10 시인성 샘플1 게이트 2026-09-21

## 판결: 승인

## 경로
`Z:\HDD1\MARU\dashboard\status\`

## 목표
R10 시인성 샘플1 게이트. CSS `../_shared/visibility.css` · KPI/topbar/뱃지/고대비표 · 작지 상대경로 89/89 · file://0.

## 논리증거

| 주장 | 실측 | 차 |
|---|---|---|
| visibility.css | `<link href="../_shared/visibility.css">` · Z 존재 | 0 |
| topbar | h1 생산현황 + 기준일 2026-09-21 · R10 표기 | 0 |
| KPI≥3 | kpi-row **5** (NO92·PCS·지연13·작지89/92·자재53/92) · shared val 28px | 0 |
| 상태뱃지 | 92행 전건 badge · 진행68 info · 임박9 warn · 지연13 danger · 완료/입고2 ok | 0 |
| 고대비표 | `table.data` + zebra(shared) | 0 |
| 작지 상대경로 | pdf href **89** · 행단위 존재 **89/89** · noPdf 3(=KPI 89/92) · `%EC` 인코딩 · `file://` **0** | 0 |
| 내비·하단 | fold-nav `.on` 생산현황 · foot 출처·R10 | 0 |

## 재발키
없음

## 질문목록
없음
