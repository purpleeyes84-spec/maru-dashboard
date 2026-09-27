# 2026-09-24 · 대시보드 · Air broken-links 재게이트 (a02481ff)

## 판결: 승인

## 경로
1. `Z:\HDD1\MARU\dashboard\두리콜렉션\디즈니\진행\index.html` (+ `progress.json`)
2. `Z:\HDD1\MARU\dashboard\봉제현황\index.html` · `index_live.html` · `index_fix2122.html`
3. 잔여 샘플: `두리콜렉션/index.html` · `두리콜렉션/27SS/index.html`

## 목표
선행 조건부(`/workspace/대시보드/_검증/reports/2026-09-24-air-broken-links.md`) Air 답변 반영분 재검증. read-only (Z/HTML/JSON 미수정).

## 박스
`/workspace/uploads/air-broken-links-regate/` ← Temp `air-broken-links-regate`
- 진행-index.html **257309** · progress.json **120485**
- 봉제-index **47635** · live **47635** · fix2122 **47616**
- 두리-hub **74417** · 두리-27ss **86767**
- Z size ≡ Temp (전원 match)

## Air 답변 vs 실측
| # | Air 주장 | 실측 | 차 |
|---|---|---|---|
| 1 | LTR→LTS YES · still_ltr_miss=0 · 두리 JPG before37→after0 | 진행 LTR-090헤리=**0** · LTS-090헤리=**12**(html)·**6**(json) · progress/hub/27SS prior-fail miss=**0** | **0** |
| 2 | 발주서091 keep original under DR2LTR091 folder (thumbs secondary) | href는 `진행문서/thumbs/DR2LTR091.jpg`(존재) · 발주서/품번폴더에 `DR2LTR091.jpg` **부재**(품번폴더엔 CFM/작지 등) · 발주서엔 `DR2LTR090.jpg`만 | **관측**(href resolve OK·원본파일명 미배치) |
| 3 | 진행 embed≡json YES (PROG_OK) | embed rows=**47** · json=**47** · 091 dup=**1/1** · href set ≡ · 081/091/080/MTS081 field Δ=**0** | **0** |
| 4 | 봉제 fold-nav YES · 3pages `../_shared/fold-nav.js` + visibility.css | Z 3파일 전부 fold+vis 링크 · `_shared` 실존(fold 3816·vis 3281) | **0** |

## 논리증거 (must-pass)

| # | 주장 | 실측 | 차 |
|---|---|---|---|
| (1) | progress unique hrefs 전부 존재 (구 MISS→LTS) | unique **91** · OK **91** · MISS **0** · LTS-090 디스크존재(907622) · LTR typo path 부재(의도) | **0** |
| (2) | embed≡json rows47 · no 091 dup · 081/091 Δ0 | embed47≡json47 · Counter(091)=1 · SR1MTR081·DR2LTR091·DR2LTR080·SR1MTS081 field Δ0 · file://=0 · MARU_EMBED_FIRST | **0** |
| (3) | 봉제3 fold-nav+visibility resolve · nav3 OK · fileZ0 | 3/3 `../_shared/fold-nav.js`+`visibility.css` · nav status·process·education **3/3** · file://=0 | **0** |
| (4) | hub+27SS jpg miss0 (LTR·발주서091 prior) | hub jpg **23/23** · 27SS **42/42** · LTR-090헤리 href0 · 발주서/DR2LTR091 참조0 · thumbs/DR2LTR091 OK | **0** |

## R10 light

| 페이지 | fold-nav.js | visibility.css | file://Z | nav |
|---|---|---|---|---|
| 디즈니 진행 | 1 (`../../../_shared`) | 1 | 0 | — |
| 봉제 index / live / fix2122 | **1** (`../_shared`) | **1** | **0** | status·process·education 3/3 |

## 판정 요약
| 항목 | 결과 |
|---|---|
| (1) progress href | **통과** 91/91 |
| (2) embed≡json | **통과** 47≡47 · sample Δ0 |
| (3) 봉제 fold-nav | **통과** 3/3 + nav3 + fileZ0 |
| (4) hub/27SS jpg | **통과** miss0 |

## 재발키
`허브 href exists 스캔`(두리콜렉션) · `내비-fold-nav전용`(봉제현황) → **클로즈(반영)**

## 질문목록
1. (관측) Air「품번폴더 원본 DR2LTR091.jpg」는 미배치·thumbs만 존재. 발주서/기획폴더에 원본 복사할까, thumbs 경로 유지할까? (현재 href resolve OK·비차단)

## 오답 처리
- 승인 → append 승인행 ×2 · 선행 미반영 봉제 symptom `|`→`·` 파스수정 · `close_open.py` → 2 closed · 미반영 (없음) · `sync_index.py`

## 재현1줄
`progress 91/91 · embed≡json47 · LTR헤리0/LTS존재 · hub23/27SS42 jpg miss0 · 봉제3 fold+vis ../_shared · nav3/3 · fileZ0 · Z≡Temp size`
