# 두리콜렉션 디즈니진행 품번CODE체계 재게이트 2026-09-21

## 판결: 반려 (재발)

## 경로
`Z:\HDD1\MARU\dashboard\두리콜렉션\디즈니\진행\`

## 목표
품번CODE체계 반영분 재게이트 — 체계 xlsx 저장, 브랜드/년도/시즌/성별/아이템/순번대 파싱·필터, 대분류 유지.

## 논리증거

| 주장 | 실측 | 차 |
|---|---|---|
| 체계 xlsx 저장 | `두리콜렉션_품번CODE체계.xlsx` 존재·HTML 상대링크 · `style_code_system.xlsx` sha 동일 | 0 |
| 코드 파싱 Brand+Year+Season+Gender+Item2+Seq | 48/48 `code.ok` · rules 재파싱 불일치 0 · seq_band MAIN34/기획13/기타1 | 0 |
| 필터: 브랜드·시즌·성별·아이템·순번대 | select 존재·JS 적용 | 0 |
| 필터: **년도** | `fltYear` **없음** (파싱 필드만 있음) | **-1** |
| 대분류 유지 | counts 완사입기획12·정상9·원단23·BT미정4 = 행집계 | 0 |
| 작지/BT href 페이지 존재 (이전 반려 잔여) | 103건 여전히 `../../../생산부` → **0/103** · `../../../../`면 103/103 | **-103 재발** |
| progress.json 정본 | embed==file · fetch 우선 | 0 |

## OK
- stages7 · complete=pack∧logistics · DOCTYPE1 · file://0 · delivery0
- row.brand == code.brand
- xlsx「정상」시트 ↔ code_rules brand/season/gender/item 정합 · year Q+는 note「추정 확장」명시

## 부가
- 미매핑 아이템코드(표시=코드문자·ok true): TP·TW·AP (DR1LTP002, DR1LTW002, DR1MAP080)
- `meta.brand_rule` 옛접두(DR/DQ…) 잔존 ↔ `code_rules` 1글자 브랜드와 모순
- seq 052 → seq_band 기타(밴드표 외) 1건

## 재발키
`정의문서↔수치공식 일치 스캔` (href depth · R01) — **재발**

## 질문목록
1. href·src_rel을 `../../../../생산부/…`로 고칠까? (이전 반려과 동일)
2. 년도 필터(`fltYear`) 추가할까?
3. TP/TW/AP를 체계표에 넣을까, 아니면 ok=false로 둘까?
4. meta.brand_rule을 code_rules(D/S/W/E)에 맞출까?
