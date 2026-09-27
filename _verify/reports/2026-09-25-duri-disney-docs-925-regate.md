# 두리콜렉션 디즈니 진행문서·진행 · 9/25 조건부 재게이트 (091 alias href · _shared resolve · merged PDF 링크) 2026-09-25

- 오더: 대시보드검증 (read-only) · 선행: `2026-09-25-duri-disney-docs-925.md`(조건부)
- 경로: `Z:\HDD1\MARU\dashboard\두리콜렉션\디즈니\진행문서\` · `…\디즈니\진행\` (수정본 mtime 09-25 08:19 KST)
- 박스: `/workspace/uploads/duri-disney-925-regate/` ← Temp `duri-disney-925-regate` (Z 경로는 CopyToBox 허용 루트 밖 → PowerShell Copy-Item 스테이징) · **Z≡Temp≡박스 SHA256 6/6**
- 기준선: `*.bak_20260925_fix` SHA256 ≡ 선행 박스본 `/workspace/uploads/duri-disney-925/` (docs_index 3CE1B0CC… · progress 99172F8D… · slots FF41520A… · prog_index 8A9F67C9…) → 선행본과 diff로 비교
- 적용: R09 논리 · R10 light · 브라우저/스크린샷 없음 · PDF 미오픈(크기·존재만) · Z/HTML/JSON 미수정

## 판결
`승인`

## 변경 diff (bak → 현재)
- 진행문서 index: `_shared` 2줄 `../../../../`→`../../../` · 091 alias href `DR2LTS090.jpg`→`DR2LTR090.jpg` · `.mergedpdf` CSS 1줄 + 합본 PDF 앵커 2 (DR1LJB080·SR1MJB080 카드)
- 진행 index: `_shared` 2줄 · 구 `<script id="progress-data">`(asOf 9/21·rows47) 블록 삭제 · embed meta에 counts_note 추가 · embed fix_note 문구 `asOf 2026-09-25`→`2026-09-24`(json과 일치화)
- progress.json(양 폴더 동일 SHA D3BFC3F8…, `디즈니-progress.json`도 동일): meta.counts_note 추가만 · rows Δ0
- slots.json: meta.fix_note에 9/25 fixes 추기만 · rows Δ0

## 주장|실측|차
| # | 주장 | 실측 | 차 |
|---|------|------|-----|
| 1a | 091 alias PO href → `디즈니 발주서/DR2LTR090.jpg` | HTML 091 카드 발주서 href = `…/완사입/디즈니 발주서/DR2LTR090.jpg` 1건 · slots≡progress 동일 href · Test-Path True (297259B) · HTML^slots flink 대칭차 **0/48 카드** | 0 |
| 1b | 타 LTR→LTS 드리프트 없음 | bak 대비 LTR/LTS 토큰 변화 = 091 href 1건(LTS→LTR 복원) + note 문구뿐 · progress/prog_progress LTR146/LTS136 불변 · 카드 style이 LTR인데 href가 LTS인 교차링크 HTML **0**·JSON **0** · HTML LTS href 13건 전부 실제 LTS 품번(DR2LTS090 폴더·발주서, DR1-LTS-0xx 원단 등), `헤리테잎변경 작지`는 DR2LTS090 본행 | 0 |
| 2 | `_shared` → `../../../_shared/` · resolve | 양 페이지 fold-nav.js·visibility.css 각 1 · 진행문서/진행 폴더 기준 resolve = `Z:\HDD1\MARU\dashboard\_shared\fold-nav.js`(3816B) / `visibility.css`(3281B) · Resolve-Path·Test-Path **True ×4** (구경로 `Z:\HDD1\MARU\_shared` 여전히 부재 → 신경로만 유효) | 0 |
| 3 | merged PDF 링크 2 | `a.mergedpdf` 2: `merged/SR1MJB080.pdf`(SR1MJB080 카드, 155428B) · `merged/DR1LJB080.pdf`(DR1LJB080 카드, 726718B) · 진행문서 기준 resolve Test-Path **True ×2** · JSON 참조 0(HTML 전용) | 0 |
| 4 | 구 progress-data 블록 제거 · embed 1 | `type="application/json"` 스크립트 **1**(= `maru-progress-embed`) · `"asOf": "2026-09-21"` 0 · 파일 259741→139398B · JS 폴백 `getElementById('progress-data')` 참조 2곳 잔존(요소 없음 → null, 무해) | 0 |
| 5a | counts_note가 BT미정 21 설명 | progress.meta.counts_note「BT미정(counts)=bt_links·bt_cfm 모두 없는 행 수…category=BT미정 행 수와 다름(현재 4)…합계≠rows」 · 재계산 bt 없음 **21** · category=BT미정 **4** · embed 동일 | 0 |
| 5b | fix_note 9/25 갱신 | slots.meta.fix_note에 `2026-09-25 fixes:`(091 href·_shared·합본 PDF·progress-data 제거) 추기 ✔ · progress.meta.fix_note는 기존 `2026-09-25 daily` 문구 그대로(9/25 fixes 미기재) | ≈0 (비차단) |

## 회귀 (선행 9/25 대비)
| 항목 | 실측 | 차 |
|------|------|-----|
| rows=unique=48 | progress 48/48 · slots 48/48 · 진행문서 article 48·data-style 48/48 · embed 48/48 · 4소스 집합 동일 · Counter 중복 0 · `/48 스타일`×7 · `/47` 0 | 0 |
| embed≡json | notes 제외 deep-equal True · **raw 전체도 True**(fix_note·counts_note 포함 일치) · progress 두 폴더 SHA 동일 | 0 |
| SR1MJB080 ×1 | 4소스 ×1 · row bak 대비 Δ0 | 0 |
| DR1LJB080 BT 3 | progress.bt_links 3 · slots.bt 3 · HTML `BT컴펌서 · 3` · row Δ0 | 0 |
| DR2LTR090 standalone | 4소스 0 | 0 |
| DR2LTR091 ×1 | 4소스 ×1 · progress/slots row Δ0 | 0 |
| SR1MTR081 | 4소스 ×1 · progress/slots row Δ0 | 0 |
| asOf | progress·slots.meta·진행문서 HTML·embed 전부 2026-09-25 | 0 |
| href exists | 합집합 unique 102(진행문서 HTML 88·진행 HTML 7·progress 93·slots 91) → Test-Path **99/99 실링크 OK** · 나머지 3 = 진행 JS 템플릿 `${esc(L.href)}`·`${esc(thumb)}`·`${esc(wip.href)}`(정규식 오탐, 실링크 아님) | 0 |
| file:// | 0 / 0 | 0 |
| viewport | 양쪽 `width=device-width,initial-scale=1` | 0 |
| KPI≥3 | 진행문서 7(`/48 스타일`) · 진행 5(kN·kAvg·kDone·kPo·kLate) | 0 |

## 관찰(비차단)
1. progress.meta.fix_note(및 embed)에는 9/25 fixes가 적혀 있지 않음 — slots에만 있음. 다음 재생성 때 progress에도 한 줄 추가 권장
2. 진행 폴더에 `index.html.tmp_air`(09-24 15:31, 257309B) 잔존 — 서빙 대상은 아니지만 정리 권장
3. 진행 JS 폴백 `|| getElementById('progress-data')`는 이제 사용되지 않는 코드 — 무해, 정리해도 됨

## 재발키
- `유령품번-병합정합` → **반영** · 두리콜렉션 (091 alias href≡slots, 교차 LTS 0)
- `내비-fold-nav전용` → **반영** · 두리콜렉션 (`_shared` resolve True ×4)

## 질문목록
1. progress.meta.fix_note에도 9/25 fixes 문구를 넣을지, 아니면 slots.meta에만 이력을 두는 방식으로 할지?
2. 진행 `index.html.tmp_air`(9/24)를 지워도 되는지? (게이트는 read-only라 손대지 않음)

## 오답 처리
- 승인 → log.md에 두리콜렉션 승인 2행 추가 → `close_open.py` (9/25 미반영 2건 → 반영) → sync

## 재현1줄
`bak≡prior SHA · 091 href DR2LTR090.jpg≡slots≡prog · LTS cross 0 · _shared→dashboard\_shared True×4 · merged pdf 2 True · json script 1 (asOf9/21 0) · counts_note BT미정21/cat4 · rows48=unique48 ×4 · embed≡json raw · MJB080×1 · LJB bt3 · 090=0 · 091×1 · 081 Δ0 · asOf 9/25 · href 99/99 (+3 JS tpl) · file0 · viewport · KPI 7/5`
