# 2026-09-24 · 대시보드 · NAS INDEX 접속 재게이트2

## 판결: 승인

## 경로
`Z:\HDD1\MARU\dashboard\`

## 목표
직전 조건부 잔여(1)(2)(3) 수정분 재검증. PACKING 월 교정은 이번 스코프 밖(문서만).

## Prior
- `reports/2026-09-24-nas-index-regate.md` **조건부**
- open key `내비-fold-nav전용` · slot `education`

## 박스
`/workspace/uploads/nas-index-regate2/`
- hub-index · edu-errors-index · duri-disney-progress-index · duri-progress.json
- settlement-index · settlement-p2 · `_shared/fold-nav.js` · `visibility.css`

## 논리증거 (claim|actual|delta)

| # | 주장 | 실측 | 차 |
|---|---|---|---|
| 1a | `_errors` fold-nav.js | `<script src="../../_shared/fold-nav.js">` 존재 (depth2 OK) | **0** |
| 1b | `_errors` visibility.css | `<link href="../../_shared/visibility.css">` 존재 | **0** |
| 1c | `.dash-nav` CSS / `class="dash-nav"` | CSS규칙 **0** · html class **0** · `<nav class="dash-nav">` **0** · 표 텍스트 `dash-nav` 2회(오답로그 문맥, inert) | **0**(live) |
| 1d | delivery href | href **0** (본문 로그 텍스트 1회만) | **0** |
| 2a | 허브 사후정산 | 카드 `[09] 사후정산` → `사후정산/index.html` | **0** |
| 2b | fold-nav settle | `{ key:"settle", href: up+"사후정산/index.html", label:"사후정산" }` + pathDetect | **0** |
| 2c | KPI 운영 칸 | 표시 **8** · 카드 실수 **9**(사후정산 포함) | **KPI 미갱신**(비차단) |
| 3a | boot 우선순위 | `getElementById('maru-progress-embed')||getElementById('progress-data')` | **0** |
| 3b | embed≡json | `#maru-progress-embed` **≡** `progress.json` deep · rows=48 · sha256 `766e499ef711df01f9de1c184fa9691da6c3eb820988ca0cbbeafcc57c7fc4be` | **0** |
| 3c | progress-data sync | `#progress-data` **≡** embed **≡** json · thumb Δ **0** | **0** |
| R | file:///Z 회귀 | 터치 파일(hub·_errors·disney·fold-nav) **0** | **0** |

## 스코프 외 · PACKING (문서만, 판결 비차단)
- 원인: live `사후정산/index.html` file-lock → 9월→8월 미반영 · staging `index.p2.html` 대기
- 실측: live≠p2 · **5곳** 문자 `9`→`8` (PACKING 월 교정분) · `data-month` 집계는 양측 동일(9월9/8월5)이나 셀·속성 일부 값 live=9·p2=8
- 조치 대기: lock 해제 후 p2→live 덮어쓰기. **(1)(2)(3) 승인과 분리**

## 오답
- **반영** 행 추가(증상含 승인) · slot `education` · key `내비-fold-nav전용` → `close_open.py`
- PACKING은 새 미반영 미개설(질문만). 필요 시 별키 `사후정산-PACKING-월`

## 질문목록
1. 허브 KPI `운영 칸=8` vs 카드9(사후정산 포함) — KPI를 9로 올릴까, 사후정산을 운영칸 집계에서 뺄까?
2. 사후정산 PACKING 9→8: file-lock 해제 후 `index.p2.html`→live 반영 시점/담당은?

## 관찰(비차단)
- fold-nav items 10: 폴더홈·봉제·GT·두리·status·process·sales·**사후정산**·edu·오답
- `_errors`에 `<nav class="sec-nav">` 잔존(섹션앵커, dash-nav 아님)
