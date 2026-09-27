# 봉제현황 마이바스지연영향 근거그래프·표 보강 재게이트 2026-09-21

## 판결: 승인

## 경로
`Z:\HDD1\MARU\dashboard\봉제현황\마이바스_생산지연_영향.html` (+ sibling data/xlsx · `리포트/`)

## 목표
근거 그래프·표 보강 재검증 — KPI n=27·연동9·−342.8/0.544·foot 유지, SVG산점도·삼분위막대·상관/delta막대·극단5일표 추가

## Prior
- `reports/2026-09-21-bongje-mybas-delay-impact-regate.md` (승인)
- `reports/2026-09-21-bongje-mybas-delay-plain.md` (승인 · 쉽게말하면)
- byte baseline: `/workspace/uploads/bongje-delay-plain/` · `/workspace/uploads/bongje-delay-regate/`
- 업로드본: `/workspace/uploads/bongje-delay-charts/` (impact.html·data.json·rep.json·impact.xlsx)

## 논리증거

| 주장 | 실측 | 차 |
|---|---|---|
| A1) KPI n=27 | meta·KPI「기록일수 n=27」·삼분위 10+9+8=27 · data.`공정지연_마이바스.마이바스.n`=27 · rep.`마이바스_분포.n`·`표본제한.마이바스_일수`=27 · xlsx요약 `마이바스_n`=27 | **0** |
| A2) 연동9=공정지연_마이바스 | 이름 애리지누이·마이지누이·마이시·마이우·마이오바·견반오바·앞요크오바·애리후세·삼봉 · data.`연동` ↔ rep.`연동공정` ↔ HTML표 ↔ xlsx`연동` 셀일치 | **0** |
| A3) 영향 −342.8 / −48.6% · 상관 0.544 · 동시 27 | okbox·KPI·표본제한·xlsx 요약 전부 동치 | **0** |
| A4) foot href | `./생산평균_마이바스_생산지연영향_20260921.xlsx` + `./리포트/마이바스_생산지연_영향.json` · file:///Z **0** · impact.xlsx sha==regate (`a7f23c4b…`) | **0** |
| A5) data.json vs prior plain | **byte동일** (sha `0fa81c79…` = plain = regate). 변경키 **없음** | **0** |
| A6) rep.json | plain 대비 shared 키 값동일 · **additive only** `근거시각` (산점도_동시일·삼분위·상관_표시공정·극단샘플) | **0** |
| A7) `#easy` 쉽게 말하면 | panel 유지 · 363·706·343 말풀이 · meta「숫자 표·상관은 아래와 같아」 | **0** |
| B1) SVG 산점도 마이바스×애리후세 | `<circle>` **27** · title 날짜/마/애리 = pair daily∩daily_product 동시27 · empty SVG 아님 · meta「동시 27·상관 0.544」 | **0** |
| B2) 삼분위 막대 | SVG 라벨 363/641/706 (=round 362.8/640.6/705.6) · 옆표 exact 362.8/640.6/705.6 · 일수 10/9/8 · p33=429·p66=649 · rep.`삼분위_애리후세`·`근거시각.삼분위` 동치 | **0** |
| B3) 상관·delta 막대 | 상관6: 마이지누이0.666·마이오바0.600·애리후세0.544·애리지누이0.236·삼봉0.118·견반오바0.101 = data.`상관_vs_마이바스`/rep.`상관` · delta6: −346.9/−249.5/−220.7/−170.8/−136.3/−5.7 = data.`delta`/rep.`delta_상대` · null상관(마이시·마이우·앞요크오바) 막대 미표시(표·주석과 정합) | **0** |
| B4) 극단5일표 | 낮음5+높음5=10행 · 날짜/마/애리 = simul 정렬 top/bottom5 · pair+daily_product·rep.`근거시각.극단샘플_*` 일치 · 날조 없음 | **0** |

## 재발키
`소스↔UI 건수·집합 스캔` (tag 논리) — 본 게이트 승인 · 동키 open 미반영 행 없음(직전 마이바스영향 반영 클로즈 유지) → **오답 append/close_open 불필요**

## 관찰(비차단)
- 삼분위 SVG는 정수 반올림(363/641/706), KPI·표·json은 소수(362.8/640.6/705.6) — 쉬운말 섹션과 동일 규칙
- 연동 애리후세 low/high(389.9/736.8) ≠ 삼분위 하위/상위(362.8/705.6): 밴드정의 차이(기승인 관찰과 동일)
- 상관/delta 막대는 수치 있는 6공정만 표시(null 3공정은 표에 —)

## 질문목록
(없음)
