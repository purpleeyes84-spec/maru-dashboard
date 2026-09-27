# 2026-09-17 · status · 일일갱신 재게이트

- 오더: `Z:\HDD1\MARU\dashboard\생산현황\` · 반려3건 조치 후 재검
- 선행: `reports/2026-09-17-status-daily.md` 반려
- 적용: R01 · R05(정본 해석 갱신) · R06

## 판결
`승인`

## 근거
1. **fold-nav file:///%EC 제거**: stub `index.html` file://=0 · %EC=0. fold-nav 6링크 전부 상대경로  
   `../index.html` · `../../../dashboard/goodtrust|delivery|process|education/index.html` · `./index.html` — Test-Path 6/6 True (+ due-from-sep 링크 True).
2. **README asOf**: stub README `현재 asOf: 2026-09-17` (이전 9/16 불일치 해소).
3. **정본 위치 명확화**: `POINTER.txt` CANON=`dashboard\생산현황\` ROLE=redirect-only.  
   `dashboard\status\index.html` = meta-refresh + 상대링크 → 정본. 리다이렉트 타깃 Test-Path True.  
   허브 `status/` 진입=정본 이동으로 이전 “미동기 반려” 해소(작지 상대링크 베이스 사유 수용).

## 잔여(비차단·질문)
- `dashboard\status\data.json` 여전히 asOf=2026-09-08 n=76 · README 구버전. POINTER/index만 보면 안전하나, data.json 직독 시 오인 가능.

## 질문목록
1. redirect-only 폴더의 구 `data.json`·구 README 삭제 또는 `STALE` 스탬프 할지?
2. R05에 status 예외(한글 칸=정본, ASCII status=리다이렉트만) 문구 고정할지?

## 재발키
- (이전) `status-publish-to-stub-not-canon` → **해소(정본 정의 정정)**
- (이전) `status-index-file-pctEC-nav` → **해소**
