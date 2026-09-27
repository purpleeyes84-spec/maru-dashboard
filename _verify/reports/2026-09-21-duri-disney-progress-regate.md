# 두리콜렉션 디즈니진행 재게이트 2026-09-21

## 판결: 승인

## 경로
`Z:\HDD1\MARU\dashboard\두리콜렉션\디즈니\진행\`

## 목표
조건부 잔여 수정 재게이트 — progress.json 정본(embed+fetch), brand/source 분리.

## 이전 조건부 잔여
1. progress.json 미로드(정적 HTML 이중 소스)
2. brand에 출처태그(파일발견/원단시트) 혼입

## 논리증거

| 키 | 결과 | 근거 |
|---|---|---|
| 표·차트·data.json 키 동기 | OK | `id=progress-data` embed == `progress.json` (bytes일치) · `fetch('progress.json',{cache:'no-store'})` 우선 · 실패시 embed boot · meta.canonical=progress.json |
| 소스↔UI | OK | KPI JS계산 = json: n=50 · avg=49% · done100=2 · lt50=20 · oneway DR1LTR080/DR2LTR091 |
| 정의↔공식 | OK | brand=디즈니41/스팍스9 (접두규칙 meta.brand_rule) · source=파일발견31/원단시트11/메인리스트8 · brand에 출처태그 0건 · UI `r.brand`/`r.source` 분리열 |
| 필터합계 | OK | fltBrand는 data-brand(디즈니/스팍스)만 |
| 일수달력블록 | N/A | 진행보드(스타일단위) |

## 시각·구조
- DOCTYPE 1 · file:// 0 · delivery 0
- tbody `#tb` 런타임 렌더 · 정적 data-style tr 잔여 1(템플릿/빈)
- stages 6 · flags 6키 유지

## 재발키
(승인 — 이전 미반영 닫음) `표·차트·data.json 키 동기`

## 질문목록
없음
