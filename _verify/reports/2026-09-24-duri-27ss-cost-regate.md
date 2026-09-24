# 두리콜렉션 27SS 기획티셔츠 원가 재게이트 2026-09-24

- 오더: `Z:\HDD1\MARU\dashboard\두리콜렉션\27SS\원가\index.html` · read-only · R10 수정 후 재게이트
- 직전: reports/2026-09-24-duri-27ss-cost.md (`조건부` · KPI0·fold-nav0·visibility0·표0.86rem)
- 박스: `/workspace/uploads/duri-27ss-cost-regate/` (index·styles_cost.json·assumptions.json)
- 적용: R09 논리 · R10 시인성 · 추정표시 · 별칭 CODE

## 판결
`승인`

## 논리증거

| 항목 | 주장 | 실측 | 차 |
|------|------|------|-----|
| FX/roll | USD1358.4 · CNY202.47 · roll_yd80 · CN육/KR해/VN완 | assumptions≡styles_cost.fx · HTML KPI/헤더 동수 · freight inland120 / sea95 / FG W190·M230 / 통관 W120·M140 | 0 |
| 라인합→unit | 16 colorway Σ(lines)=total_krw_per_pc | 16/16 일치(tol≤0.05) · color_tot=unit×qty 일치 | 0 |
| 공식재계산 | 원단 YD×단가×FX · CM$×USD · 운송YD×rate · trimΣ | sample1 fab 0.756×6.73×202.47=1030.14 · CM $1.1×1358.4 · LTS ship 0.79×95=75.05 · trim 4×22+0.495×470+1350=1670.65 · MTS ship 1.05×95·FG230·관140 | 0 |
| sample1 DR1LTR080/WHITE | 4475.10 · fab1030.14 · CM1494.24 · est 부자재/나염/운송/해상/통관 | 4475.1 · badge≡json.estimate · Δ0 | 0 |
| sample2 DR2LTS090/BLACK | 9083.54 · fab1896 · trim1670.65 · CM3531.84 · ship75.05 | 동수 · file/estimate 태그≡json | 0 |
| sample3 DR2MTS090/CHARCOAL | 9913.55 · fab2520 · trim1691.96 · CM3531.84 · ship99.75 · FG230·관140 | 동수 · 태그≡json | 0 |
| 별칭 | DR2LTR080↔DR1LTR080 · DR1LTR090↔DR2LTR091 | assumptions.style_codes.aka OK · HTML 정본 CODE만 · CODE 혼선0 | 0(표시=관찰) |
| 집계 | 스타일 qty·가중평균 | DR1LTR080 4000/4566.21 · DR2LTR091 12000/4842.23 · DR2LTS090 5000/9083.54 · DR2MTS090 3300/9913.55 | 0 |
| 전역 KPI | qty 24300 · wavg 6358.19 · 4×16 | HTML KPI 4카드: 24,300 · 6,358 · 4×16 · FX 09/23(USD1,358.4·CNY202.47) · json 집계≡ | 0 |
| embed | styles_cost(+assumptions) | JSON 미embed · 정적 HTML 셀↔JSON 16×8 라인·태그 일치(표시반올림≤0.05) · issues=0 | N/A·정합 |
| 추정투명 | estimate 라인 표기 · silent estimate→file 금지 | badge est/file ≡ json.estimate · est73/file55 · silent0 | 0 |
| file://Z | 0 | cost file://·Z: **0** · href 상대 `../../../_shared` | 0 |

## 시각·R10 (필수·통과)

| 항목 | 주장/규격 | 실측 | 차 |
|------|-----------|------|-----|
| fold-nav | 원가 depth `../../../_shared/fold-nav.js` | **삽입** (dashboard 루트 `_shared` · depth3) | 0 |
| visibility.css | R10 공통 `../../../_shared/visibility.css` | **링크** | 0 |
| KPI≥3 | 요약 카드 3–6 · 24300/가중6358/4×16/FX | KPI 카드 **4** · 주장숫자 전원 노출 | 0 |
| 본문≥14px | master/detail ≥14px | master **14px** · detail **14px** | 0 |
| 상태색 | file/estimate 배지 | file청·estimate황 양호 | OK |
| 테마 | cream/navy if used | 다크(#0f1419) 자체 · cream/navy 미사용 | N/A |
| 표가독 | zebra/대비 | sticky th·tabular nums · 대비양호 | OK |

## 관찰(비차단)
- HTML 원단운송 LTS `75` 표시 vs JSON 75.05(1자리 반올림) — 합계 9,083.5 정합 (직전과 동일)
- 별칭은 assumptions에만 · UI 라벨 미병기
- 나염·물류·LTR부자재·통관은 estimate(assumption gaps와 일치) — 미답변 Q는 비차단

## 재발키
없음(직전 `시인성=참고대시보드급·전칸공통` R10 잔여 해소 → close_open)

## 질문목록
1. 물류·통관 estimate(육로120/해상95·FG W190/M230·통관 W120/M140) 확정 단가·근거 파일?
2. 나염 도안↔품번 매핑(print_mapping estimate) 확정 가능?
3. LTR080/091 부자재 발주서(현재 150KRW estimate) 확보 일정?

## 오답 처리
- 승인 → `두리콜렉션` · 키 `시인성=참고대시보드급·전칸공통` · `close_open.py` 미반영→반영
- `두리콜렉션-thumbs-도식만` 미터치(본 게이트 범위 외)

## 재현1줄
`python3` fx≡assumptions · 16 colorway lineΣ=unit · sample3 Δ0 · by_style qty/avg · HTML↔JSON 셀/태그0 · KPI4(24300/6358/4×16/FX) · fold-nav+visibility `../../../_shared` · 표14px · file://Z=0
