<script src="/maru-dashboard/js/auth-gate.js"></script>
# 두리콜렉션 디즈니 진행문서·진행 · 9/25 폴더반영 게이트 (SR1MJB080 신규 · DR1LJB080 BT CS3030 · merged 2건) 2026-09-25

- 오더: 두리콜렉션 bot e90e83bf → 대시보드검증 (read-only)
- 경로: `Z:\HDD1\MARU\dashboard\두리콜렉션\디즈니\진행문서\` (index/progress/slots/thumbs/merged) · `…\디즈니\진행\` (index MARU_EMBED_FIRST · progress)
- 기준선: `2026-09-24-duri-disney-docs-regate.md`(승인 rows47) · `2026-09-24-air-broken-links-regate.md`(승인 91/91)
- 박스: `/workspace/uploads/duri-disney-925/` ← Temp `duri-disney-925` (docs_index 99219 · docs_progress 122916 · docs_slots 71698 · prog_index 259741 · prog_progress 122916 · scan_report) · **Z≡Temp SHA256 5/5**
- 적용: R09 논리 · R10 light · read-only (Z/HTML/JSON 미수정)

## 판결
`조건부`

## 기대 vs 실측 건수
| 항목 | 계산 | 실측 | 차 |
|------|------|------|-----|
| 기대 rows | 47(9/24) + 1(SR1MJB080) − 0(행병합 없음) = **48** | progress **48** · slots **48** · 진행문서 article **48**/data-style unique **48** · 진행 embed **48** | 0 |
| unique | rows와 동일 | Counter 중복 **0** (4소스) · 스타일 집합 대칭차 **0** | 0 |
| KPI | `/48 스타일` | 진행문서 `/48 스타일`×7 · `/47` 0 · slots.meta.n_styles=48 · 진행 kN=rows.length(런타임 48) | 0 |
| 추가/삭제 | +SR1MJB080 / 삭제 없음 | 9/24 box본 대비 added {SR1MJB080} · removed ∅ · changed DR1LJB080(bt) · DR2LTS090(wip LTR→LTS 헤리작지명, Air 9/24 수정분 흡수) | 0 |

## 논리증거 (주장|실측|차)
| # | 주장 | 실측 | 차 |
|---|------|------|-----|
| 1 | SR1MJB080 신규 1행 | progress×1 · slots×1(완사입 기획) · 진행문서 article×1 (1/7, 작업지시서 1) · embed×1 · wip=`완사입/기획/SR1-MJB-080/SR1MJB080 메인작업의뢰서 (아소트수량 0923).pdf` **디스크 존재**(160908) · thumb=null (pending_note「칼라물 flat 없음」, 주장 안 함 · `thumbs/SR1MJB080.jpg` 부재=일치) | 0 |
| 2 | DR1LJB080 BT += CS3030.xls | progress.bt_links·slots.bt·HTML BT슬롯 **3건** 동일: BT컨펌.jpg · `(CS3030) BT.xls`(9/19) · **`DR1-LJB-080(CS3030).xls`(mtime 9/24)** · HTML `BT컴펌서 3` · 디스크 존재(70144) | 0 |
| 3 | merged 2건 | **행 병합 아님** — scan_report `merge[]` = 스타일별 문서합본 PDF 2건: `진행문서/merged/SR1MJB080.pdf`(1p·155428) · `merged/DR1LJB080.pdf`(3p·726718) · 박스 원본 크기≡Z · HTML/JSON 링크 0(산출물만) · 행 삭제 0 → 흡수·유령 대상 없음 | 0 (정의 정정) |
| 4 | rows==unique | 48==48 (progress/slots/HTML/embed) | 0 |
| 5a | 진행 embed≡json | `maru-progress-embed` rows **48≡48** · 전 row 필드 Δ**0**(touched 4: SR1MJB080·DR1LJB080·DR2LTR091·SR1MTR081 포함) · top-level Δ = `meta.fix_note` 문구 1곳(embed「asOf 2026-09-25」 vs json「asOf 2026-09-24」 이력문) | ≈0 (비차단) |
| 5b | href exists | progress unique **93** (9/24 91 + SR1MJB080 wip + CS3030) · 전체 합집합(progress+slots+2 HTML+thumb) **94/96 OK** · MISS 2 = `_shared/fold-nav.js`·`visibility.css` (#8) · file:// **0**(양 페이지) | R10 Δ |
| 6a | 회귀: DR2LTR090 standalone 0 | progress/slots/HTML/embed style **0** | 0 |
| 6b | 회귀: DR2LTR091×1 · alias PO | progress≡slots 091 fabric_po[2] = `디즈니 발주서/DR2LTR090.jpg` ✔ · **진행문서 HTML 091 flink href=`디즈니 발주서/DR2LTS090.jpg`** (title/text는 `DR2LTR090.jpg (…→091)`) → **타 품번(DR2LTS090) 발주서로 오링크 · HTML≠slots** | **1** ✗ |
| 6c | 회귀: SR1MTR081 | wip=SM1MTR081 메인작업지시서.pdf · thumb `thumbs/SR1MTR081.jpg`(slots)/`../진행문서/thumbs/…`(progress) 존재 · 9/24 대비 Δ0 | 0 |
| 7 | asOf 2026-09-25 | progress.asOf · slots.meta.asOf · 진행문서 `asOf 2026-09-25` · embed asOf | 0 |
| 8 | R10 light | viewport 양쪽 ✔ · KPI 진행문서 7 / 진행 5 ✔ · fold-nav/visibility **링크는 있음**, 경로 `../../../../_shared/` → `Z:\HDD1\MARU\_shared` **부재** · 실파일은 `Z:\HDD1\MARU\dashboard\_shared\`(=`../../../_shared/`) | **2** ✗ |

### 6b 원인 추적
- 9/24 15:27 승인본(`uploads/duri-disney-docs-regate/index.html`): 091 alias href=`DR2LTR090.jpg` (정상)
- 9/25 08:10 패치 입력본(`/workspace/duri_daily_scan/0925/progdocs_index.html`, 동일 97336B): 이미 `DR2LTS090.jpg` → 9/24 승인 후 Air LTR→LTS 일괄치환이 alias href까지 바꾼 것으로 추정(동일 길이 치환이라 size 불변). 9/25 패치는 그대로 승계
- 파일 두 개 모두 디스크 존재(LTR090 297259 / LTS090 281112) → exists 스캔은 통과하나 **내용 오링크**

### 8 경로 확인
- 진행문서·진행 모두 `<link href="../../../../_shared/visibility.css">` · `<script src="../../../../_shared/fold-nav.js">` → 4단 상위=`Z:\HDD1\MARU\` (생산부 href 기준과 동일 깊이) → `_shared` 없음
- `Z:\HDD1\MARU\dashboard\_shared\fold-nav.js`·`visibility.css` 존재 → 올바른 상대경로 `../../../_shared/`
- 9/24 두 보고서는 삽입 여부만 확인·resolve 미확인(선행 게이트 누락, 9/25 신규 회귀 아님)

## 시각·R10 light
| 항목 | 규격 | 실측 | 차 |
|------|------|------|-----|
| viewport | meta | 양쪽 `width=device-width,initial-scale=1` | 0 |
| fold-nav.js | 링크+resolve | 링크 1 · **resolve ✗** (MARU\_shared 부재) | 1 |
| visibility.css | 링크+resolve | 링크 1 · **resolve ✗** | 1 |
| file:///Z | 0 | 0 / 0 | 0 |
| KPI≥3 | ≥3 | 진행문서 7(`/48 스타일`) · 진행 5(kN·kAvg·kDone·kPo·kLate) | 0 |
| 진행 로드 | embed 우선 | MARU_EMBED_FIRST → `maru-progress-embed`(48) 우선 · render/readEmbed 동일 우선순위 | 0 |

## 관찰(비차단)
1. 진행 index에 구 `<script id="progress-data">` 블록 잔존(rows47 · asOf 2026-09-21 · vis 18) — 현재 폴백 2순위라 미렌더, 단 스태일 데이터 110KB 동봉 → 다음 재생성 때 제거 권장
2. progress.`counts.BT미정` 의미 변경: 4(category=BT미정 행) → **21**(bt_links·bt_cfm 모두 없는 행) · counts 합 65≠48 · UI 미사용이나 키 의미 혼동 → 키 분리(`BT미정`=category / `BT미확인` 등) 권장
3. slots.meta 스키마 변경: `fill_styles`/`fill_files` dict→int(38/107, 실측 일치) · `counts` category→slot별 styles(wip11·fabric_po22·bt25·trim_po2, 실측 일치) · `meta.fix_note` 9/24 문구 그대로(9/25 미기재)
4. progress.vis with_thumb 18→**17** (실측 thumb 17, 9/24 값이 오기였음 → 정정)
5. scan_report silent_skip「나염/원가 파일 원가보드 기존반영」 — 본 게이트 범위 외

## 판정 요약
| 주장 | 결과 |
|------|------|
| SR1MJB080 신규 | **통과** (4소스×1 · wip 존재 · thumb 미주장·보류명시) |
| DR1LJB080 BT CS3030 | **통과** (3소스 동일 · 디스크 존재) |
| merged 2건 | **통과(정의정정)** 문서합본 PDF 2 · 행 병합 0 · 유령 0 |
| rows=unique=48 | **통과** 47+1−0=48 · KPI /48 |
| embed≡json | **통과** rows Δ0 (fix_note 문구만) · href 93 progress 전부 존재 |
| asOf 9/25 | **통과** |
| 회귀(090/091/081) | **실패 1** 091 alias href → DR2LTS090.jpg (HTML≠slots) |
| R10 | **실패** fold-nav·visibility 경로 미해결(양 페이지) |

## 재발키
- `유령품번-병합정합` → **미반영(재발성)** · 두리콜렉션 · 091 alias href 오링크
- `내비-fold-nav전용` → **미반영** · 두리콜렉션 · `_shared` 상대경로 resolve 실패

## 조치 요청(두리콜렉션 bot)
1. 진행문서 index.html DR2LTR091 원단발주 alias flink href를 `디즈니 발주서/DR2LTR090.jpg`로 복원(slots≡HTML). LTR→LTS 일괄치환은 `헤리테잎변경 작지` 파일명에만 한정
2. 진행문서·진행 index `../../../../_shared/` → `../../../_shared/` (fold-nav.js·visibility.css)
3. (권장) 진행 index 구 `progress-data` 블록 제거 · counts.BT미정 키 의미 정리 · slots.meta.fix_note 9/25 추기
→ 수정 후 재게이트(091 href≡slots · `_shared` Test-Path True)

## 질문목록
1. 「merged 2건」은 행 병합이 아니라 `merged/*.pdf` 문서합본 2건으로 판독함 — 맞는지? (행 병합 의도였다면 대상 품번 지정 필요)
2. merged PDF를 대시보드 슬롯/카드에 링크할 계획인지? (현재 HTML/JSON 참조 0)

## 오답 처리
- 조건부 → log.md에 두리콜렉션 `미반영` 2행 추가(`유령품번-병합정합` · `내비-fold-nav전용`) · `sync_index.py`

## 재현1줄
`rows 47+1−0=48 (p/s/html/embed) · unique48 · /48스타일 · MJB080 wip exists thumb null · LJB080 bt3 CS3030.xls exists · merged=pdf×2 not rows · embed≡json Δ0 · href prog93 · all 94/96 (_shared×2 miss) · 091 html href=DR2LTS090.jpg≠slots LTR090 · asOf 9/25 · fileZ0`
