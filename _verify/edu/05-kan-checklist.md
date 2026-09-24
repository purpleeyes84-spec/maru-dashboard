# 칸별 체크 (샘플 1–3 후 본실행)

공통(전칸): R01 상대경로·파일존재 · R06 허브내비 · 메타문/프롬프트잔재 · theme 대비.

## status (생산현황)
- data.json ↔ index KPI·건수·팀 PCS (R03 현작업∩월별=공집합)
- README 소스 xlsx와 asOf 일치 여부(날짜만)
- 빈 납기·(PO없음) 숨김 금지
- 첨부칩만이면 큰 img 미리보기 금지(R02)

## delivery (납기)
- 지각·패킹·출고 집합이 status/원천과 모순 없는지(샘플 PO 1–3)
- 링크·상대경로 resolve

## process (공정)
- index·하위(IO-VPL004 등) 링크 존재
- PDF thumbs 있으면 재오픈 흔적/캐시 재생성 지시 없는지
- 셋팅·공수 **확정숫자 새로 박기** 요구는 게이트 밖(질문목록)

## sales (매출)
- data.json 건수·거래처·월 ↔ README asOf
- “매출금액(원) 없음”이면 UI에 금액 KPI 없어야 함(있으면 조건부)

## education (교육자료)
- 챕터 index·이미지·상대경로 전수(샘플 챕터 1–3)
- 한글깨짐·영문폴백·업체명(마루/MARU) 화면노출 → 반려/조건부
- CSS 인라인·로컬 `_edu.js` (상위 `_shared.css` 링크 폐기)
- **본문 논리·팩트**는 교육검증 판결 우선. 여기선 경로·UI·허브연결

## education/_errors (오답노트)
- log.md·index 링크. 미반영 항목 게이트 재발키와 맞는지(있을 때)

## goodtrust
- catalog/thumbs 존재. PDF 재오픈 금지
- `file:///Z:...%EC` 금지

## wo-by-style (오더 시)
- manifest·_VERIFY·샘플 PO 폴더 이미지/PDF 존재
- 허브 미등재면 “고아폴더”로 보고(R07)
