# 2026-09-24 · 대시보드 · NAS INDEX 접속 재게이트

## 판결: 조건부

## 경로
`Z:\HDD1\MARU\dashboard\`

## 목표
폰·태블릿·PC file/SMB NAS INDEX 접속 정밀점검 후 수정분 재검증.
Focus: fold-nav · viewport 전칸 · 허브링크 · progress.json embed · 모바일 CSS.

## Prior
- `reports/2026-09-22-dash-link-regate2.md` **승인** (status·사후정산 fold-nav · dash-nav CSS0/14)
- key `내비-fold-nav전용` closed → 본 게이트 **education/_errors** 에서 live dash-nav 재발
- R10 visibility 규칙 유지 · 박스 `_shared/visibility.css`·`fold-nav.js` mtime 2026-09-24 14:41 KST

## 박스
`/workspace/uploads/nas-index-regate/`
- hub-index · theme.css · hub-hrefs.txt · scan-indexes.json (39, excl woimg/bak)
- `_shared/fold-nav.js` · `_shared/visibility.css`
- 샘플: status · 봉제 · 사후정산 · sales · process(+IO-VPL004) · edu(+sewing·_errors) · 두리 · disney진행(+progress.json) · GT

## 논리증거

| 주장 | 실측 | 차 |
|---|---|---|
| fold-nav.js 전칸 | scan `scriptFold` 39/39 주장 · **재실측** 샘플 12/13 OK · **education/_errors script src=0** (본문·표 텍스트에 `fold-nav.js` 1회만 → scan 위양성) → 정직 **≤38/39** | **_errors 누락** |
| fold-nav 상대 depth | hub `./_shared/fold-nav.js` · d1 `../_shared/` · sewing·IO `../../_shared/` · disney진행 `../../../_shared/` — DEPTH_OK | **0** |
| fold-nav file:// 안전 | `file:///Z`=0 · `location.origin` 미사용 · `pathPrefix`+`scriptBase` · 헤더 NAS/file:///mobile safe | **0** |
| viewport 전칸 | scan `vp` **39/39** · 샘플 전부 `width=device-width` · 누락목록 없음 | **0** |
| 허브 href | 상대만 · `file:///Z`=0 · 카드8(봉제·GT·두리·status·process·sales·edu·오답)+kids · hub-hrefs.txt와 일치 | **0**(형식) |
| 허브 사후정산 | **카드·kids·본문 부재** (KPI「운영 칸 8」) · fold-nav items에도 사후정산 없음(`currentKey` settle만) | **허브 미등재** |
| progress embed 정본 | `#maru-progress-embed` **≡** `progress.json` deep-equal · rows**=48** · sha256 `766e499ef711df01f9de1c184fa9691da6c3eb820988ca0cbbeafcc57c7fc4be` · styles sample DR2LTS090·DR2MTS090·SR1MTR081 · counts 완사입기획12/정상9/원단23/BT미정4 | **0** |
| progress 2중 embed | `#progress-data`(boot `getElementById` 우선) rows·비thumb 동등 · **thumb Δ×3**(생산부 원경로 vs `진행문서/thumbs`) · fetch 훅은 maru-embed(≡json) 공급 | **thumb Δ×3** |
| 모바일 CSS | visibility `@media max 800/900/480` + `.fold-nav a` min-height36px · touch-action:manipulation · 본칸 샘플 visibility.css 링크 OK · board @media 충돌 증거 없음 | **0**(본칸) |
| _errors visibility | education/_errors **`visibility.css`=0** (scan `vis=0`) · edu 인라인 공통껍데기만 | **_errors 미적용** |
| dash-nav 잔여 | **education/_errors only** · live `.dash-nav` CSS **4** + `<nav class="dash-nav">` **1** + 로그표 문맥 ≈7 · **inert 아님** · href `../../delivery/index.html`(삭제칸) 잔존 | **live+delivery** |
| file:///Z 회귀 | scan sum **0** · 전 샘플 **0** | **0** |
| SMB/UNC href | sales embed meta `source:"Z:\\HDD1\\MARU\\관리부"` **표시문자** · href UNC/smb **0** | **0**(href) |

## 스코프
정적 분석 only(브라우저·스크린샷 없음). scan 39 + 위 샘플 스팟. Z/HTML 미수정.

## dash-nav 상세 (education/_errors)
- live CSS 4: `.dash-nav` / `a` / `a:hover` / `a.here`
- live HTML: 폴더홈 · 생산현황 · **납기(delivery)** · 공정 · 교육자료
- fold-nav.js · visibility.css 미삽입
- 게이트 시점 박스 `edu-errors-index.html` ≡ 당시 오답노트 index (11135B) · sync_index 후 오답 index 갱신(11252B, 미반영 2건 반영)

## 오답
- **미반영** · slot `education` · key `내비-fold-nav전용` · tag `CSS`
- 증상: NAS INDEX 재게이트 — `_errors` live dash-nav(+delivery) · fold-nav.js0 · visibility0
- `sync_index.py` 실행

## 질문목록
1. education/_errors → fold-nav.js + `_shared/visibility.css` 이관 · `.dash-nav`·delivery 삭제 확정인가?
2. 허브·fold-nav items **사후정산** 미등재 — 운영칸8 의도 제외인가, 누락인가?
3. disney 진행 boot이 `#progress-data`(thumb 변형) 우선 — `#maru-progress-embed`(≡json) 단일화인가?

## 관찰(비차단)
- fold-nav items: 폴더홈·봉제·GT·두리·status·process·sales·edu·오답 (사후정산·delivery 없음)
- scan `_errors` scriptFold=1 = 표 텍스트 위양성
- theme.css `@media` 없음 · fold-nav 규칙 보유
