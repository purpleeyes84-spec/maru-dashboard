# 봉제현황 원천단일화 재게이트

- 일시: 2026-09-19
- 경로: `Z:\HDD1\MARU\dashboard\봉제현황\`
- 선행: `reports/2026-09-19-bongje-source-unify.md` 조건부
- 판결: **승인**

## 논리증거
| 주장 | 실측 | 차이 |
|------|------|------|
| state.processed[].name | `봉제생산현황_묶음.pdf` · `2026-07-18_일지.pdf` | 0 |
| 현재 name=옛파일명 | 0 | 0 |
| name↔sha | 묶음=`0a4d441c…` · 일지=`00d62fe9…` | 0 |
| 원장 src_pdf 집합 | 위 2이름만 · 42행 | 0 |
| PDF처리 name | 동일 2이름 | 0 |
| 박스↔Z state/xlsx sha | 동일 | 0 |
| name_old·rename_note | 이력 보관만 (현재 name 아님) | 허용 |

## 오답노트
키 `정의문서↔수치공식 일치 스캔` · 칸 봉제현황 → close.

## 재발키
(승인) 없음 신규.
