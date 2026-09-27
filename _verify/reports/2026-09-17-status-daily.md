# 2026-09-17 · status · 일일갱신 게이트

- 오더: `Z:\HDD1\MARU\dashboard\생산현황\` · asOf=2026-09-17 n=92 jikji=89/92 mat=53/92 · index·due-from-sep·by-po
- 샘플: data.json / by-po·due·current-work json · index·by-po·due html · 상대링크 18건 존재검사
- 적용 rules: R01 · R02 · R03 · R05 · R06

## 판결
`반려`

## 근거
1. **R05 정본 미반영**: 일일 산출은 스텁 `dashboard\생산현황\`에만 있음(index·due-from-sep·by-po·data asOf=2026-09-17 n=92). 허브 정본 `Z:\HDD1\MARU\dashboard\status\`는 asOf=2026-09-08 n=76·due/by-po 없음. 허브 `status/index.html` 진입 시 구데이터.
2. **R01/R05 index 내비**: `index.html`에 `file:///Z:/...%EC...` 절대경로 6건(대시홈·GT·현황·납기·공정·교육). by-po·due는 상대경로만.
3. **README 날짜 불일치**: README `asOf: 2026-09-16` vs data/meta `2026-09-17`.
4. **스텁 내부 논리는 오더 KPI와 일치**: meta.n=92·orders=92·asOf=2026-09-17 · jikjiUrl 89/92 · matUrl 53/92.
5. **R03 통과**: by-po current∩월별 = 공집합 · union=92 · current-work nos와 current 섹션 일치(78).
6. **R02 통과(by-po)**: by-po.html img=0 · 첨부 링크/칩 형태. due-from-sep의 `../img/*.jpg`는 아트웍 썸네일(첨부칩 규칙 대상 아님).
7. **상대경로 샘플 존재**: by-po·due에서 뽑은 18링크(작지PDF·자재xlsx·img·theme) 전부 Test-Path True.

## 질문목록
1. 스텁 산출을 `dashboard\status\`로 동기화한 뒤 재게이트 할지?
2. index 내비 6건을 상대경로(`../index.html` 등)로 고칠지? (ASCII 허브 기준)
3. README asOf를 2026-09-17로 맞출지?

## 재발키 후보
- `status-publish-to-stub-not-canon` · `status-index-file-pctEC-nav`
