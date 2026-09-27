# Sample QA — 3 styles unit cost trace
FX: USD/KRW=1358.4, CNY/KRW=202.47 (2026-09-23 15:30 Seoul 연합)

## DR1LTR080 / WHITE  (qty=1800)
- **Unit total: 4,475.10 KRW** (nego ref 7,400)
- 원단: **1,030.14** [file]
  - trace: 요척 0.756 × 단가 6.73 CNY × CNY 202.47 = 0.756×6.73×202.47 = 1030.14
  - source cells: `overseas_fabric_labor.xlsx` sheet `금액정리` rows for DR1LTR080 WHITE; fabric_po 단가 일치
- 소탕(염색차지): **0.00** [file]
- 부자재: **150.00** [estimate]
- 나염(실리콘): **1,400.00** [estimate]
  - designs ['도안1']; source print_cost_4styles.pdf; mapping estimate
- 공임(CM/labor): **1,494.24** [file]
  - trace: $1.1 × 1358.4 = 1494.24
  - source: `1차 확정 수량` 임가공 공임란
- 원단운송(inland_CN_to_VN): **90.72** [estimate]
- 완제품해상(VN→KR): **190.00** [estimate]
- 통관/관세추정: **120.00** [estimate]

## DR2LTS090 / BLACK  (qty=1300)
- **Unit total: 9,083.54 KRW** (nego ref 10,000)
- 원단: **1,896.00** [file]
  - trace: 요척 0.79 × 단가 2400 KRW = 1896.0 KRW (이미 KRW)
  - source: `overseas_fabric_labor.xlsx` 금액정리 + `DR2LTS090_fabric_po.xlsx` 단가 2400
- 소탕(염색차지): **0.00** [file]
- 부자재: **1,670.65** [file]
  - button: 4×22=88 (DR2LTS090_trim_po 단추 BT-12 11MM)
  - tape: 0.495×470=232.65 (DR2LTS090_trim_po TAPE TP-01)
  - yoko: 1×1350=1350 (DR2LTS090_trim_po color sheets (태흥 YOKO))
- 나염(실리콘): **1,600.00** [estimate]
  - designs ['도안5', '도안6']; source print_cost_4styles.pdf; mapping estimate
- 공임(CM/labor): **3,531.84** [file]
  - trace: $2.6 × 1358.4 = 3531.84
  - source: `1차 확정 수량` 임가공 공임란
- 원단운송(sea_KR_to_VN): **75.05** [estimate]
- 완제품해상(VN→KR): **190.00** [estimate]
- 통관/관세추정: **120.00** [estimate]

## DR2MTS090 / CHARCOAL  (qty=1300)
- **Unit total: 9,913.55 KRW** (nego ref 11,000)
- 원단: **2,520.00** [file]
  - trace: 요척 1.05 × 단가 2400 KRW = 2520.0 KRW (이미 KRW)
  - source: `overseas_fabric_labor.xlsx` 금액정리 + `DR2LTS090_fabric_po.xlsx` 단가 2400
- 소탕(염색차지): **0.00** [file]
- 부자재: **1,691.96** [file]
  - button: 4×25=100 (DR2MTS090_trim_po 단추 BT-12 13MM)
  - tape: 0.5148×470=241.96 (DR2MTS090_trim_po TAPE TP-01 10MM)
  - yoko: 1×1350=1350 (DR2MTS090_trim_po color sheets)
- 나염(실리콘): **1,700.00** [estimate]
  - designs ['도안2']; source print_cost_4styles.pdf; mapping estimate
- 공임(CM/labor): **3,531.84** [file]
  - trace: $2.6 × 1358.4 = 3531.84
  - source: `1차 확정 수량` 임가공 공임란
- 원단운송(sea_KR_to_VN): **99.75** [estimate]
- 완제품해상(VN→KR): **230.00** [estimate]
- 통관/관세추정: **140.00** [estimate]
