# 두리콜렉션 디즈니 진행문서 · 유령품번병합·SR1MTR081 게이트 2026-09-24

- 오더: `Z:\HDD1\MARU\dashboard\두리콜렉션\디즈니\진행문서\index.html`
- 목표: DR2LTR090 유령품번 제거·DR2LTR091 병합 + SR1MTR081 thumbs/SM1작지 반영 후 논리+시각 검증
- 박스: `/workspace/uploads/duri-disney-docs/` (index·progress·slots·진행-progress·thumb-DR2LTR091·thumb-SR1MTR081)
- 적용: R09 논리 · R10 시인성 · 내비-fold-nav · thumbs-도식만(참고)
- read-only (Z/HTML/JSON 미수정)

## 판결
`조건부`

## 논리증거

| 항목 | 주장 | 실측 | 차 |
|------|------|------|-----|
| Ghost 090 standalone | progress/slots/HTML에 스타일행·카드·필터 **0** | style/code/data-style에 `DR2LTR090` **0** (progress47·slots unique47·HTML unique47) | 0 |
| Ghost 잔여(비 alias) | 제거 또는 alias/history만 | **slots.rows[9]** 중복 `DR2LTR091`(qty0) · thumb=`…/DR2LTR090.jpg` · fabric_po=`DR2LTR090.jpg` · **HTML article 중복 091**(filled1, href는 `DR2LTR091.jpg`로 개명≠slots) | **잔여** |
| progress 090 | alias만 | fabric_po_links[2] name=`DR2LTR090.jpg (개별발주서·품번오기→091)` + `meta.fix_note` 병합기록 · standalone행 없음 | alias OK |
| 091 병합 | 구090 문서·슬롯이 091 단일행 | progress 091: wip2·fabric_po3(090 alias포함)·bt2 · **slots 이중행**(잔여+본행) · 본행 fabric_po에 090미포함 · HTML 본행6링크 OK·잔여카드1 | **부분** |
| SR1MTR081 thumb | `thumbs/SR1MTR081.jpg` 반영·디스크 존재 | progress.thumb=`../진행문서/thumbs/SR1MTR081.jpg` · 박스 `thumb-SR1MTR081.jpg` 존재 · **slots.thumb=고주파와펜 발주서.png** · **HTML thumbs/·img=0** | **slots/UI 미반영** |
| SR1MTR081 SM1 작지 | WIP 링크 존재 | progress.wip=`SM1MTR081 메인작업지시서.pdf`(경로 `…/SR1MTR081/`) · SR1MTS081행에도 동일 WIP 3필드×2=6 + fix_note1 → SM1카운트7 · **slots.wip=[]** · **HTML「작업지시서 없음」·SM1 href0** | **slots/UI 미반영** |
| 7슬롯 인덱스 | 48×7 · href · 원본미이동 | meta.slots7키 전원합 · href103 전부 `../../../../` · missing0 · original_moved=false · **rows48/unique47(091중복)** · KPI `/48` | **+1 유령잔여행** |
| embed | HTML≡json 또는 상대 fetch | 정적빌드(slots 기반) · progress/slots **fetch·embed 0** · note에 progress.json 언급 · **HTML≠slots**(091 잔여 href 091.jpg vs 090.jpg) · **progress≠slots**(081/091) | **Δ** |
| 진행/ cross-check | sibling 진행-progress와 정합 | `진행-progress.json` **≡** `progress.json` (asOf 2026-09-21 · fix_note 9/24) | 0 |
| asOf | 수정일 반영 | asOf/HTML 문구 **2026-09-21** · fix_note만 2026-09-24 | 스태일 |

### 090 residual locations (exact `DR2LTR090`)
- **progress×4:** `rows[DR2LTR091].fabric_po_links[2].{name,href,rel}` + `meta.fix_note` (alias/history)
- **slots×4:** `rows[9]`(중복091) `.thumb` + `.slots.fabric_po[0].{name,href,rel}` (**standalone 잔여행**)
- **HTML×0**

### 091 merge / 081 sample
- 091 본행(slots[10]/HTML filled3): 작지2·원단발주2·BT2 · thumb=`thumbs/DR2LTR091.jpg` — OK
- 091 잔여(slots[9]/HTML filled1): 사실상 구090 껍데기 — **미해소**
- 081: progress만 thumb+SM1 완료 · slots/HTML 미동기

## 시각·R10

| 항목 | 규격 | 실측 | 차 |
|------|------|------|-----|
| viewport | meta | `width=device-width,initial-scale=1` | 0 |
| fold-nav | `../../../_shared/fold-nav.js` | 삽입 · dash-nav HTML/CSS **0** · delivery0 | 0 |
| visibility.css | R10 공통 | 링크1 | 0 |
| file:///Z | 0 | **0** | 0 |
| KPI | ≥3 | KPI카드 **7**(슬롯채움) | 0 |
| thumbs 도식만 | 표글자·그리드0 | 디스크 `thumb-DR2LTR091`(1320×535)·`thumb-SR1MTR081`(1417×500) = 칼라도식/라인도식 · 섹션6·7 표영역 **없음** | 0(디스크) |
| UI thumb 노출 | 진행문서 7슬롯 페이지 | **`<img>`/thumbs/ href 0** (슬롯링크형 UI) · progress 경로만 갱신 | N/A·비차단 |

## 관찰(비차단)
- DR2LTS090/DR2MTS090 등 타품번 `*090*`는 본 게이트 유령(DR2LTR090)과 무관
- SR1MTS081 별행이 SR1MTR081 폴더·SM1 WIP를 공유(alias 성격) — progress에만 반영
- 본 페이지는 썸네일 미렌더(선행 7슬롯 게이트와 동일 패턴)

## 재발키
`유령품번-병합정합` (progress 병합·thumb/SM1 주장 vs slots·정적HTML 잔여행·미반영 · 소스↔UI 집합 Δ)

## 질문목록
1. slots 중복 `DR2LTR091` 잔여행(thumb/PO=`DR2LTR090.jpg`)을 삭제하고 090 PO를 본행 fabric_po(+alias 노트)로만 둘까?
2. HTML 정적 재생성 시 잔여카드의 `DR2LTR091.jpg` 개명을 롤백·삭제할까, 아니면 파일을 091로 실개명할까?
3. SR1MTR081: slots.wip←`SM1MTR081 메인작업지시서.pdf` · thumb←`thumbs/SR1MTR081.jpg` 후 index 재빌드할까?
4. asOf/HTML 기준일을 2026-09-24로 올릴까?

## 오답 처리
- 조건부 → 두리콜렉션 **미반영** · 키 `유령품번-병합정합` · 태그 논리 · `sync_index.py`
- 기존 open `시인성=참고대시보드급·전칸공통`(원가게이트) **미클로즈**(본 건 비승인)
- `두리콜렉션-thumbs-도식만` 디스크샘플 OK · 본 게이트로 클로즈 안 함(이미 반영 상태·UI thumb 미노출)

## 재현1줄
`rg DR2LTR090 progress/slots/html` · slots style Counter(091=2) · 081 wip/thumb progress≠slots≠HTML · SM1 HTML=0 · fold-nav+visibility+fileZ0 · thumb jpg 도식-only
