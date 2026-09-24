# R10 시인성 샘플 게이트 (허브+봉제현황) 2026-09-21

## 판결: 조건부

## 경로
- `Z:\HDD1\MARU\dashboard\index.html`
- `Z:\HDD1\MARU\dashboard\봉제현황\`

## 목표
R10 시인성 샘플 게이트(허브+봉제현황). KPI≥3·topbar·상태색·visibility.css·본문≥14px. prevent-key=`시인성=참고대시보드급·전칸공통`.

## 논리증거

| 칸 | 주장 | 실측 | 차 |
|---|---|---|---|
| 봉제 | visibility.css·topbar·KPI4·상태뱃지·본문14 | 직전 승인분과 byte 동일 · badge ok/warn/info | 0 |
| 허브 | visibility.css | `_shared/visibility.css` + theme.css · Z 존재 | 0 |
| 허브 | topbar | header.topbar + h1 + meta | 0 |
| 허브 | KPI≥3 | kpi-row **4** (운영칸/교육/브랜드/시인성) | 0 |
| 허브 | KPI≥28px | 4번째 `.val` 인라인 **22px** | **-6px** |
| 허브 | 상태색·뱃지 | badge/ok/warn/danger **0** (내비 카드만) | **누락** |
| 허브 | 본문≥14px·내비·foot | ink/var · fold-nav `.on` · foot 출처·R10 | 0 |
| 허브 | 내비 타깃 | status/process/봉제/sales/두리/education/_errors/GT/mail 존재 | 0 |

## 봉제현황
별도 리포트 `reports/2026-09-21-bongje-r10-visibility.md` **승인** 유지.

## 재발키
`시인성=참고대시보드급·전칸공통`

## 질문목록
1. 허브에 상태 요약 뱃지(예: 칸별 진행/주의)를 넣을까, 허브는 내비-only라 상태색 면제할까?
2. KPI「시인성」숫자(R10)를 28px로 맞출까, 라벨형이라 22px 유지할까?
