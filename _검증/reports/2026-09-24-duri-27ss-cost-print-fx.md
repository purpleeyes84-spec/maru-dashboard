# 두리콜렉션 27SS 기획티셔츠 원가 print+FX 재게이트 2026-09-24

- 오더: `Z:\HDD1\MARU\dashboard\두리콜렉션\27SS\원가\` · read-only · data+mapping 갱신 재게이트
- 직전 승인(R10 only): reports/2026-09-24-duri-27ss-cost-regate.md (FX USD1358.4/CNY202.47 · print=estimate)
- 박스: `/workspace/uploads/duri-27ss-cost-regate2/` (index≡Z SHA256 · styles_cost · assumptions · report · sample_qa)
- 적용: FX 9/24 · 나염 기은 file · print_mapping · R10 회귀 · 추정표시

## 판결
`승인`

## 논리증거

| 항목 | 주장 | 실측 | 차 |
|------|------|------|-----|
| FX | USD1366 · CNY202.60 · asOf 9/24 | assumptions≡styles_cost.fx (USD1366.0·CNY202.6·as_of 2026-09-24 09:20 Asia/Seoul) · HTML KPI/헤더 동수 | 0 |
| 나염=기은 file | estimate→file · silent estimate=0 | 나염(기은) 16/16 `estimate=false` · `mapping_tag=file` · HTML badge file16 · silent0 · est_print0 | 0 |
| print_mapping | DR2LTR091→#1 · DR1LTR080→#2 · DR2LTS090→#5+#6 · DR2MTS090→#3+#4 | assumptions designs + HTML 나염비교·도안별 NO표 일치 · gieun USD×1366=KRW(751.3/956.2/1024.5/1229.4) Δ0 | 0 |
| 라인합→unit | 16 colorway Σ(lines)=total | 16/16 tol≤0.05 · HTML↔JSON 16 unit + 128 라인·태그 mism0 | 0 |
| sample1 DR1LTR080/WHITE | 신FX 재계산 · Δ0 | unit **4041.9** · fab 0.756×6.73×202.6=1030.80 · CM $1.1×1366=1502.6 · 나염 file 956.2 · inland 0.756×120.7≈91.2(est) | 0 |
| sample2 DR2LTS090/BLACK | 신FX · Δ0 | unit **8529.4** · fab1896 · trim1670.65 · CM $2.6×1366=3551.6 · 나염 file 1024.5 · sea 0.79×95.5≈75.5(est) | 0 |
| sample3 DR2MTS090/CHARCOAL | 신FX · Δ0 | unit **9463.3** · fab2520 · trim1691.96 · CM3551.6 · 나염 file 1229.4 · sea 1.05×95.5≈100.3(est) · FG230·관140(est) | 0 |
| 집계 | 스타일 qty·가중평균 | DR1LTR080 4000/**4133.08** · DR2LTR091 12000/**3502.82** · DR2LTS090 5000/**8529.40** · DR2MTS090 3300/**9463.30** · report.md≡ | 0 |
| 전역 KPI | qty/wavg 정합 | **qty 24300 · wavg 5450.29** · HTML KPI 5,450.3 · 24,300 pcs · 4카드 · 나염절감709.6 · 매핑 file | 0 |
| 추정잔여 | freight/통관/LTR trim | est57/file71 · 부자재(LTR)9·원단운송16·완제품해상16·통관16 모두 badge=estimate · FX refresh inland120.7/sea95.5/FG W191.1 · 비차단 | OK |
| file://Z | 0 | cost file://·Z: **0** · href `../../../_shared` | 0 |

## 시각·R10 (회귀·통과)

| 항목 | 주장/규격 | 실측 | 차 |
|------|-----------|------|-----|
| fold-nav | `../../../_shared/fold-nav.js` | **삽입** | 0 |
| visibility.css | `../../../_shared/visibility.css` | **링크** | 0 |
| KPI≥3 | 요약 카드 | KPI **4** (wavg·기은·절감709.6·file) | 0 |
| 나염비교표≥14px | table.cmp/master/detail | **14px** | 0 |
| 상태색 | file/estimate 배지 | file청·estimate황 · 나염 file16 | OK |

## 관찰(비차단)
- `sample_qa.md`는 구 FX(1358.4)·나염 estimate 잔존 — JSON/HTML/report.md 정본과 불일치(산출 스냅샷 미갱신). 게이트는 JSON≡HTML 기준.
- 남티 FG M=230·통관 120/140은 FX 미스케일(assumptions basis 그대로) — estimate 표기 유지.
- 별칭 assumptions only · UI 정본 CODE만.

## 재발키
없음(시인성 키 재오픈 없음 · R10 회귀 통과)

## 질문목록
1. 물류·통관 estimate(육로120.7/해상95.5·FG W191.1/M230·통관 W120/M140) 확정 단가·근거 파일?
2. LTR080/091 부자재 발주서(현재 150KRW estimate) 확보 일정?
3. `sample_qa.md`를 신 FX·기은 file 기준으로 재생성할지?

## 오답 처리
- 승인 → `두리콜렉션` · 신규 미반영 없음 · 시인성 키 미재오픈 · `close_open.py` 실행(열린 건 0)

## 재현1줄
`python3` fx≡assumptions≡HTML · print file16 silent0 · map #1/#2/#5+6/#3+4 · sample3 Δ0 · KPI 24300/5450.29 · HTML↔JSON 16×8 mism0 · fold-nav+visibility `../../../_shared` · cmp14px · file://Z=0
