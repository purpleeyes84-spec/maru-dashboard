# 2026-09-17 · _검증 · 프로세스 보충

- 오더: 전체 대시보드 살펴보고 검증 프로세서 확립에 필요한 보충 추가
- 샘플: hub index · status/sales/process README · _map/plan.md · education 하위목록 · wo-by-style/_VERIFY
- 적용: 교육 00–03 기존 + 갭보충

## 판결
`승인` (프로세스 문서 보충 완료. 칸 HTML 본검증 오더 아님)

## 실측 요약
정본=`Z:\HDD1\MARU\dashboard\`
칸=status·delivery·process·sales·education(+챕터)·goodtrust·education/_errors
허브밖=`wo-by-style/` · 사후정산 폴더 미실측

## 보충한 산출 (박스)
- 교육/04-칸맵.md
- 교육/05-칸별체크.md
- 교육/06-판결수위.md
- 교육/03-절차.md (갱신)
- rules/R05–R08
- templates/report-template.md · order-handoff.md
- README.md 갱신

## 근거
1. 기존 교육은 원칙만 있고 칸맵·칸별체크·판결수위·오더양식 없음 → 게이트 운영 불가에 가까움
2. 실측상 ASCII 정본 vs 생산부 스텁·고아폴더(wo-by-style)·교육검증 경계가 문서화 필요 → R05–R08
3. 칸 HTML 수정 없음(읽기만)

## Z 미러
- 정본(박스): `/workspace/대시보드/_검증/`
- Z ASCII 미러: `Z:\HDD1\MARU\dashboard\_verify\` (edu 영문파일명). 한글 `_검증` 직접쓰기는 CopyFromBox/tar 인코딩 이슈로 보류.
- `dashboard\_검증` 스텁 미사용(R05)

## 질문목록
1. `wo-by-style` 허브 등재할지, 오더시에만 검증할지? (현재 가정: 오더시만 · R07)
2. 사후정산 칸 경로 정해지면 04-칸맵에 넣을지? (현재 가정: 폴더 생기면 갱신)

## 재발키 후보
- (없음 · 프로세스 신설)
