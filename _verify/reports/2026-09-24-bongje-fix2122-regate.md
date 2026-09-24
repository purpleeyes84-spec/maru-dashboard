# 봉제현황 fix2122 재게이트 2026-09-24

- 오더: `Z:\HDD1\MARU\dashboard\봉제현황\index.html` (+ data.json · `생산평균_*_20260924.xlsx`) · unlock+overwrite 후 fix2122 반영 검수
- 직전: reports/2026-09-24-bongje-fix2122.md (조건부 · 금주_진행 미동기 · live 46980)
- 적용: R09 · R10 · 논리스캔 `표·차트·data.json 키 동기`
- 산출루트: `Z:\HDD1\MARU\dashboard\봉제현황\` (읽기만)

## 판결
`조건부`

## 논리증거

| 항목 | 주장 | 실측 | 차 |
|------|------|------|-----|
| A live size overwrite | index.html=47532 · lock cleared | size **47532** · sha16=`432ed9f23c5b0219` ≡ prior `index_fix2122.html` · embed≡data | **0** (해소) |
| B 9/21·22·23 | 640·586·300 | daily_product·month·recent3w 일치 · 재계산 OK | 0 |
| B 일요일제외 | 9/20 KPI제외 | daily/month.dates에 9/20 부재 · sunday_excluded=true · 일요일0건 | 0 |
| B 조업38·543.4 | overall | n=38 sum=20651 → **543.4** · 조업일38 | 0 |
| B weeks[] 금주 | 월640·화586·수300 · avg508.7 | weeks 금주 **508.7** · dates 21–23 | 0 |
| **B 금주_진행·비교·이번주_*** | 동수로 동기 | `금주_진행` 월·화=**미기록** · 일평균=**300** · 진행1/6 · `비교.금주_일평균`=300 · `이번주_dates`=[9/23] · `이번주_일평균`=300 | **잔존** |
| **B UI 바인딩** | 칩이 weeks만 쓰면 비차단 가능 | 칩 meta=`W.이번주_일평균` · 본문=`G.일평균`(금주_진행) · 표=`C.금주_일평균` → **여전히 300 표기** | **잔존** |
| C xlsx20260924 daily | ≡data 21–23·38/543.4 | `avg-ari-20260924.xlsx` 일별 set≡daily · 요약543.4/38 · 이번달19/581.7 · 21/22/23=640/586/300 | 0 |
| C xlsx 주간/금주진행 | 508.7·640·586 | 주간금주508.7·월640화586수300 · **xlsx 금주진행=기록640/586/300·비교508.7** ≠ data 금주_진행300 | **잔존**(xlsx↔data 부분) |
| C href·source | …_20260924 | href 애리후세+주간비교_월토 **20260924** · source.xlsx/xlsx_week 동일 | 0 |
| D 이중집계 | 9/20+9/21 SHA동일해도 KPI1회 | KPI 640=9/21만 · 9/20 미포함 · state 양일 processed(의도) | 0 |
| D 회귀 | file://Z=0 · R10 | file://·Z: **0** · visibility.css · kpi8 | 0 |

## 해소 / 잔존
- **해소:** live overwrite 47532 · 일요 KPI제외(live) · daily/weeks/xlsx일별/href 20260924
- **잔존(차단):** data `금주_진행`/`비교`/`이번주_*` 미갱신 · UI가 해당 키 바인딩 → 금주칩·대비표 **300** (xlsx·weeks는 508.7)

## 재발키
- `표·차트·data.json 키 동기` (**재발** · 직전 조건부와 동일 잔여)

## 질문목록
1. `금주_진행`(월640·화586·수300·진행3/6·일평균508.7) · `비교.금주_일평균/대비`(-73.7) · `이번주_dates/일평균`을 xlsx·weeks[]에 맞춘 뒤 `#DATA`/data.json 재기록·재게이트할까?
2. (정보) 열린 `봉제조업일=일요일제외`는 live data 기준 해소 상태 — 금주_* 승인 게이트에서 함께 close_open 할지?

## 재현1줄
`python3` embed≡data + weeks금주508.7 vs 금주_진행/비교/이번주_=300 + html count 바인딩 + openpyxl ari/week 20260924 daily≡·금주진행≠data + index size==47532
