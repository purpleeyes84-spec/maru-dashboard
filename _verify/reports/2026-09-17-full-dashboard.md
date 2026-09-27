# 2026-09-17 · full-dashboard · 전칸 재점검

- 오더: `Z:\HDD1\MARU\dashboard\` (+ `OPEN-DASHBOARD.html`) · 전칸 링크·file:///%EC·상대경로·연동
- 요청: NAS 경유 / 부장
- 샘플: hub·status·delivery·process·education·sales·goodtrust index + hub 전 챕터 링크 + status redirect 타깃 · 존재검사 56건
- 적용: R01 · R05(status 예외) · R06 · R07

## 판결
`조건부`

## 근거
1. **file:// / %EC**: hub·status·delivery·process·education·sales·goodtrust index 모두 **0건**.
2. **허브 링크 생존**: status·delivery·woimg·process·sales·education(+18챕터)·_errors·goodtrust·theme.css **전부 True**.
3. **status**: POINTER + meta-refresh → `dashboard\생산현황\index.html` 존재 True (R05 예외 유지).
4. **칸 간 내비**: delivery/process/sales/gt → hub·타칸 상대경로 존재 True. GT catalog 상대링크(`../../생산부/1. GOODTRUST/catalog/`) True.
5. **OPEN-DASHBOARD.html**: `Z:\HDD1\MARU\OPEN-DASHBOARD.html` **없음** (스킬/맵 입구 스텁). 허브 `dashboard\index.html`은 정상.
6. **mail/**: 루트에 `mail\` 폴더 실측되나 허브 내비 미등재 (R07 고아·범위 — 메일정리 칸이면 등재/제외 의도 확인).
7. **wo-images 이상경로**: 루트에 `woimg\`(정상 PO 트리)로 대체·허브 연결됨. 이전 `wo-images` 루프 이슈는 별도(현재 허브는 woimg).

## 질문목록
1. `OPEN-DASHBOARD.html` 재배치(허브로 리다이렉트) 할지, 입구를 `dashboard\index.html`만으로 공식화할지?
2. `mail\` 허브 등재할지, `_from-desktop`급 비내비로 둘지?

## 재발키 후보
- `missing-OPEN-DASHBOARD-stub`
- `mail-folder-not-on-hub` (등재 전이면 보류)
