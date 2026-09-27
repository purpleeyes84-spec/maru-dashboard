# 2026-09-24 · 대시보드 · Air broken-links 게이트 (a02481ff)

## 판결: 조건부

## 경로
1. `Z:\HDD1\MARU\dashboard\두리콜렉션\디즈니\진행\index.html` (+ `progress.json`)
2. `Z:\HDD1\MARU\dashboard\봉제현황\index.html` · `index_live.html` · `index_fix2122.html`
3. 잔여 샘플: `두리콜렉션/index.html` · `두리콜렉션/27SS/index.html` · `status/index.html`

## 목표
file:// broken-link 수정분 게이트. (1) 디즈니 진행 링크존재+MARU_EMBED_FIRST (2) 봉제 nav `../status|process|education/`→`/index.html` (3) 두리 스타일 JPG 원본·생산현황 report 상대경로.

## 박스
`/workspace/uploads/air-broken-links/`
- 진행-index.html · progress.json
- 봉제현황-index.html · index_live · index_fix2122 · 봉제-data.json

## Prior / Preflight
- Peek: 진행 file://=0 · MARU_EMBED_FIRST=1 · 봉제3 file://=0 · nav href×3
- open 미반영: 두리콜렉션 `유령품번-병합정합` (slots/HTML≠progress · 48≠47)
- 적용 스캔: `허브 href exists 스캔` · `내비-fold-nav전용` · `표·차트·data.json 키 동기`

## 논리증거 (claim|actual|delta)

| # | 주장 | 실측 | 차 |
|---|---|---|---|
| 1a | MARU_EMBED_FIRST boot (embed→patch→fetch) | `#maru-progress-embed` pos≈5222 · `MARU_EMBED_FIRST` 230292 · `fetch('progress.json')` 238252 · fetch 가로채기 후 Response(embed) | **0**(구조) |
| 1b | embed≡progress.json | embed **rows=48**(DR2LTR091 중복2) · json **rows=47** · SR1MTR081 wip 0vs1 · DR2LTR091 thumb/wip/fabric/bt Δ · DR2LTR080·SR1MTS081 thumb Δ | **Δ**(스태일 embed) |
| 1c | progress 상대링크 디스크 존재 | unique **91** · OK **90** · MISS **1** | **−1** |
| 1d | MISS 상세 | href `…/DR2LTS090/DR2-LTR-090 헤리테잎변경 작지(09.11).jpg` · 디스크 실명 `DR2-LTS-090 헤리테잎변경 작지(09.11).jpg`(LTR≠LTS) · 폴더 존재 | **파일명오타** |
| 1e | file:///Z · sibling xlsx | file://=0 · Z:=0 · `style_code_system.xlsx`·품번CODE xlsx·progress.json 존재 | **0** |
| 2a | `../status/index.html` | `Z:\…\dashboard\status\index.html` exists · size 31791 | **0** |
| 2b | `../process/index.html` | `…\process\index.html` exists · size 1881 | **0** |
| 2c | `../education/index.html` | `…\education\index.html` exists · size 8079 | **0** |
| 2d | 영문 폴더 부재? | status/process/education **전부 존재**(한글 생산현황/공정/교육자료 폴더명 불필요) · 봉제3 HTML 각 nav3=3 | **0**(해소) |
| 2e | 봉제 sibling 링크 | 마이바스_생산지연_영향.html · 애리후세/주간_20260924.xlsx · 마이바스애리_20260921.xlsx · data.json · `../index.html` · visibility.css **전부 존재** · file://=0 | **0** |
| 3a | 두리 스타일 JPG 원본 | 허브 `두리콜렉션/index.html` jpg unique miss **2** · `27SS/index.html` miss **2**(동일) | **잔여** |
| 3a′ | miss 목록 | (1) `DR2-LTR-090 헤리…jpg`(LTS 오타) (2) `…/디즈니 발주서/DR2LTR091.jpg` — 발주서 폴더에 `DR2LTR090.jpg`만·091 없음(thumbs/DR2LTR091.jpg는 진행문서에 존재) | **원본경로깨짐** |
| 3b | 생산현황 report 경로 | status `file://`=0 · 절대/Z href=0 · 상대 `../../생산부/대시보드/생산현황/index.html` → 디스크 **존재** | **0** |

## R10 light (터치 페이지)

| 페이지 | fold-nav.js | visibility.css | file://Z | 비고 |
|---|---|---|---|---|
| 디즈니 진행 | **1** | **1** | **0** | dash-nav0 · viewport OK |
| 봉제 index / live / fix2122 | **0** | **1** | **0** | nav 상대영문 OK · fold-nav 미삽입 |

## 판정 요약
| 항목 | 결과 |
|---|---|
| (1) 디즈니 진행 | **부분** — boot 보강 OK · 링크 90/91 · embed≠json(48≠47) |
| (2) 봉제 nav 3파일 | **통과** — status/process/education index 해석 OK |
| (3) 잔여 JPG·생산현황 | **부분** — 스타일 JPG 원본 2결손 · 생산현황 상대경로 OK |

## 재발키
`허브 href exists 스캔` (LTR/LTS 오타·발주서 DR2LTR091.jpg 원본부재) · 병행 open `유령품번-병합정합`(embed 스태일 48≠47)

## 질문목록
1. `DR2-LTR-090 헤리…jpg` href를 디스크명 `DR2-LTS-090 …`로 일괄 수정할까?
2. 허브/27SS의 `디즈니 발주서/DR2LTR091.jpg`를 `진행문서/thumbs/DR2LTR091.jpg`로 바꾸거나 발주서에 091 원본을 둘까?
3. 진행 `index.html` embed를 progress.json(47행)으로 재생성해 MARU_EMBED_FIRST≡json 맞출까? (open 유령품번 건과 동일)
4. 봉제 3파일에 `../_shared/fold-nav.js` 재삽입할까? (R10 light 잔여)

## 오답 처리
- 조건부 → 두리콜렉션·봉제현황 **미반영** append · 키 `허브 href exists 스캔`(href) + 봉제 fold 잔여 시 `내비-fold-nav전용`(CSS) · `sync_index.py`
- 기존 open `유령품번-병합정합` **미클로즈**(본 건 비승인·동일 Δ 재확인)
- 승인 아님 → `close_open.py` 미실행

## 재현1줄
`Test-Path ../status|process|education/index.html`=3/3 · progress href 90/91(MISS=LTR오타) · embed48≠json47 · 허브 jpg miss2 · status fileZ=0·상대생산현황 OK · 봉제 fold-nav=0
