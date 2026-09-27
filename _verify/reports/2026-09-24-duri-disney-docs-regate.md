# 두리콜렉션 디즈니 진행문서 · 유령품번병합·SR1MTR081 재게이트 2026-09-24

- 오더: `Z:\HDD1\MARU\dashboard\두리콜렉션\디즈니\진행문서\`
- 선행: `2026-09-24-duri-disney-docs-merge.md` (조건부 · 091잔여·081미동기·rows48·asOf9/21)
- 박스: `/workspace/uploads/duri-disney-docs-regate/` (index 97336 · progress 120503 · slots 70581 · Temp 복제)
- 적용: R09 논리 · R10 light · read-only (Z/HTML/JSON 미수정)

## 판결
`승인`

## 논리증거

| 항목 | 주장 | 실측 | 차 |
|------|------|------|-----|
| 090 standalone | style/code/data-style 행·카드 **0** | progress style=`DR2LTR090` **0** · slots **0** · HTML data-style **0** · article/option/h 제목 **0** | 0 |
| 090 잔여(비 alias) | alias/history만 | **progress×4** = 091 `fabric_po_links[2].{name,href,rel}` + `meta.fix_note` · **slots×3** = 091본행 `slots.fabric_po[2].{name,href,rel}` · **HTML×3** = 동일 flink name/href/title(alias 노트) · 잔여 091껍데기행 **0** | 0 |
| 091 단일행 | Counter(091)=1 · unique==rows | slots rows**47**/unique**47** · 091 count**1**(idx9 qty12000 filled3) · HTML articles**47**/data-style unique**47** · KPI `/47 스타일` · 48 mentions **0** | 0 |
| 091 fabric_po alias | 본행에 `DR2LTR090.jpg` | progress≡slots name=`DR2LTR090.jpg (개별발주서·품번오기→091)` · HTML flink href=`…/DR2LTR090.jpg` title/text 동일 alias | OK |
| SR1MTR081 thumb | `thumbs/SR1MTR081.jpg` | progress.thumb·slots.thumb basename=`SR1MTR081.jpg` (≠발주서.png) | 0 |
| SR1MTR081 SM1 WIP | slots.wip + HTML | slots.wip=`SM1MTR081 메인작업지시서.pdf` · HTML 작업지시서 flink SM1×3 · 「없음」아님 | 0 |
| progress≡slots | 091/081 필드 | thumb·wip_links·fabric_po·bt **≡** (081/091/MTS081) | 0 |
| HTML≡slots | 091/081 링크집합 | flink basename 집합 ≡ slots wip+fabric_po+bt (090은 href basename vs name alias노트만 Δ·동일파일) | 0 |
| asOf | 2026-09-24 | progress.asOf · slots.meta.asOf · HTML `asOf 2026-09-24` · fix_note 9/24 | 0 |

### 090 residual locations (exact `DR2LTR090`) — alias-only
- progress: `rows[DR2LTR091].fabric_po_links[2].{name,href,rel}` + `meta.fix_note`
- slots: `rows[9=DR2LTR091].slots.fabric_po[2].{name,href,rel}`
- HTML: 091 본행 원단발주 flink 1건 (title/text에 품번오기→091)

## 시각·R10 light

| 항목 | 규격 | 실측 | 차 |
|------|------|------|-----|
| viewport | meta | `width=device-width,initial-scale=1` | 0 |
| fold-nav | `_shared/fold-nav.js` | 삽입 | 0 |
| visibility.css | R10 | 링크1 | 0 |
| file:///Z | 0 | **0** | 0 |
| KPI | /47 | KPI `/47 스타일`×7 · n_styles=47 | 0 |
| UI thumb `<img>` | 본 페이지 패턴 | 전칸 `thumbs/`·`<img>` **0** (선행과 동일·비차단) · 소스 thumb 경로는 progress/slots에만 | N/A |

## 관찰(비차단)
- DR2LTS090/DR2MTS090 등 타품번 `*090*`는 유령(DR2LTR090)과 무관
- SR1MTS081는 SR1MTR081 thumb·SM1 WIP 공유(alias) · progress≡slots
- 정적 HTML은 슬롯링크형(썸네일 미렌더) — 081 검증은 wip/SM1·slots.thumb 경로로 충족

## 재발키
`유령품번-병합정합` → **클로즈(반영)** (승인·동일 칸 두리콜렉션)

## 질문목록
(없음 — 선행 Q1–4 해소: 090잔여삭제·091본행 alias·081 wip/thumb 동기·asOf 9/24)

## 오답 처리
- 승인 → `유령품번-병합정합` · 두리콜렉션 · `close_open.py` → 미반영→반영 · `sync_index.py`

## 재현1줄
`style==DR2LTR090 →0` · Counter(091)=1 · rows=unique=47 · 090 strings=alias on 091 fabric_po only · 081 wip=SM1·thumb=thumbs/SR1MTR081.jpg · asOf=2026-09-24 · fold-nav+visibility+fileZ0
