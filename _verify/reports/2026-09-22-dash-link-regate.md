# 2026-09-22 · 대시보드 · 링크복구 전칸 재검증 (dash-link-regate)

## 판결: 조건부

## 경로
`Z:\HDD1\MARU\dashboard\` (전칸 index · 특히 process) · Read-only (Z/HTML 미수정 · 셀프수정·배포 금지)

## 목표
링크복구 후 전칸 재검증. 구 dash-nav / delivery / 끝슬래시 제거 · fold-nav만.

## 박스 샘플
`/workspace/uploads/dash-link-regate/`
- hub / process / education / status / sales / gt / woimg indexes
- kan-map: kan1=두리콜렉션 · kan2=봉제현황 · kan3=사후정산
- kan3 실측 타이틀=`패킹리스트 · 종결` (정산·패킹 보드)
- process 자식: `IO-VPL004` · `SP27_WVPO_RHO` · `SP27_MPOL_RHO` · `SP27_TPOL_RHO` (박스 proc-* ×4)
- fold-nav.js

## 스코프
샘플 상위 index + process 4자식. education 챕터·두리 하위 index는 박스 미제공 → 샘플 밖.

## 논리증거

| 주장 | 실측 | 차 |
|---|---|---|
| delivery 링크=0 | 전 HTML + fold-nav.js `delivery` **0** · 허브 카드에 delivery 칸 없음 | **0** |
| file:///Z =0 | 전 샘플 **0** | **0** |
| 끝슬래시-only 삭제루트 href=0 | trailing-slash 상대 href **0** | **0** |
| live dash-nav HTML=0 | class/id HTML dash-nav 사용 **0** | **0** |
| fold-nav.js (허브+주칸) | hub·process·education·sales·gt·woimg·kan1·kan2·proc×4=Y · **status=N** · **kan3=N** | **status·kan3** |
| dash-nav CSS 잔여 | process·education·proc×4 = 각 **4** (CSS only) | **조건부 잔여** |
| process→4자식 | IO-VPL004 / SP27_WVPO_RHO / SP27_MPOL_RHO / SP27_TPOL_RHO → 샘플 **4/4** | **0** |
| 허브 카드 상대타깃 | 봉제현황→kan2 · goodtrust→gt · 두리콜렉션→kan1 · status·process·sales·education 샘플 존재. education/_errors·두리/교육 하위=샘플외 | **0**(샘플범위) |

## 칸별 fold-nav / dash-nav / delivery

| 샘플 | 칸 | fold-nav.js | fold-nav CSS | dash-nav HTML | dash-nav CSS | delivery |
|---|---|---|---|---|---|---|
| hub-index | 허브 | Y | Y | 0 | 0 | 0 |
| kan1 | 두리콜렉션 | Y | Y | 0 | 0 | 0 |
| kan2 | 봉제현황 | Y | (visibility) | 0 | 0 | 0 |
| kan3 | 사후정산(패킹·종결) | **N** | N | 0 | 0 | 0 |
| status | 생산현황 | **N** | Y(+visibility) | 0 | 0 | 0 |
| process | 공정 | Y | (visibility) | 0 | **4** | 0 |
| proc×4 | 공정 자식 | Y | (visibility) | 0 | **4** | 0 |
| education | 교육자료 | Y | (visibility) | 0 | **4** | 0 |
| sales | 매출 | Y | Y | 0 | 0 | 0 |
| gt | goodtrust | Y | Y | 0 | 0 | 0 |
| woimg | 작지이미지(봉인) | Y | Y | 0 | 0 | 0 |

## process 상세
- process-index 소형 · 카드 4 → `IO-VPL004/index.html` 등
- 박스 proc-* 4종 존재 · fold-nav.js = `../../_shared/fold-nav.js`
- 정적 hub back href 없음(fold-nav 주입) · delivery 0
- 구 `.dash-nav` CSS 4규칙 잔여 · HTML 내비 마크업 없음

## CSS 잔여
- **6파일** (process + education + proc×4): `.dash-nav` CSS 4규칙/파일 — HTML class 사용 0
- 오더 기준: CSS-only 잔여 → **조건부** (전 페이지 clean이어야 승인)

## 오답
- prevent-key: `내비-fold-nav전용` · slot: `공정·생산현황` · 상태 **미반영**
- scans.md 키 추가 · sync_index.py → open=1
- log: `/workspace/교육자료/_오답노트/log.md`

## 질문목록
1. `status/index.html`에 fold-nav.js 미삽입(CSS·visibility만) — 의도(정적표 최소화)인가, 누락인가?
2. kan3(사후정산 샘플=패킹리스트·종결) fold-nav=0 · fold-nav.js 항목에도 사후정산 없음 — 허브 밖 특수페이지로 fold-nav 면제인가?
3. process/education/proc-* 의 `.dash-nav` CSS 4규칙 — 삭제 확정(fold-nav+visibility 대체 완료)인가?
4. education 챕터·두리 하위 index는 박스 미제공 — 본 게이트 스코프=상위 샘플만으로 확정인가?

## 관찰(비차단)
- fold-nav.js 항목: 폴더홈·봉제현황·goodtrust·두리콜렉션·생산현황·공정·매출·교육자료·오답노트 — **delivery 없음**
- 허브 foot: 메일 칸 삭제 · woimg 봉인 · 카드에 delivery/woimg 없음
- 구 칸맵(교육 04) delivery=03 은 허브 실측과 불일치(허브 신스키마) — 맵 갱신 비차단
- 기준: 2026-09-22 ≈08:00 KST · 박스 `/workspace/uploads/dash-link-regate/`
