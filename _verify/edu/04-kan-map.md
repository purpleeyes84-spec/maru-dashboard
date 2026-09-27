# 칸맵 · 정본 경로 (2026-09-17 실측)

## 화면 정본
`Z:\HDD1\MARU\dashboard\` (ASCII). 입구=`index.html`.
폐기·북마크금지: `생산부\dashboard`, `dashboard`, URL `%EC`/`생산부` 섞임.

## 허브 내비 (index.html 실측)
| k | 칸 | 경로 |
|---|---|---|
| 01 | GOODTRUST | goodtrust/ |
| 02 | 생산현황 | status/ |
| 03 | 납기 | delivery/ |
| 04 | 공정 | process/ |
| 05 | 매출 | sales/ |
| 06 | 교육자료 | education/ (+하위 챕터) |
| 07 | 오답노트 | education/_errors/ |

공통: `theme.css`, `img/`. 계획서=`_map/plan.md`.

## 허브 밖(존재·검증 대상 여부)
- `wo-by-style/` — PO별 작지·이미지. 허브 링크 없음. 오더 있을 때만.
- 사후정산 칸 — 봇은 있으나 `dashboard\` 하위 폴더 미실측. 생기면 맵 갱신.

## 소스↔화면
| 칸 | 화면 | 원천(요약) |
|---|---|---|
| status | status/index.html + data.json | `생산부\생산현황표 N월.xlsx` |
| sales | sales/index.html + data.json | `관리부\` 월별 작지 파일명 건수 |
| process | process/ | `생산부\공정별 누적 일 생산량.xlsx` 등 |
| delivery | delivery/ | 현황·마감 공유와 교차 |
| education | education/*/ | 교육자료 초안→교육검증 승인 후 Z |
| goodtrust | goodtrust/ | `생산부\GOODTRUST\` (PDF thumbs·재오픈금지) |
| wo-by-style | wo-by-style/*/ | 작지 PDF·이미지·manifest |

## 담당
칸 산출=해당 칸봇. 게이트=대시보드검증. 교육 본문 논리=교육검증(교차). Air=총괄만.

## 검증 산출 위치
- 박스: `/workspace/대시보드/_검증/`
- Z 미러(ASCII): `Z:\HDD1\MARU\dashboard\_verify\`
