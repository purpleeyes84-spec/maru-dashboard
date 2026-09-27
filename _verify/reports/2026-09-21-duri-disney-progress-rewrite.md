# 두리콜렉션 디즈니진행 재작성본 게이트 2026-09-21

## 판결: 반려

## 경로
`Z:\HDD1\MARU\dashboard\두리콜렉션\디즈니\진행\`

## 목표
디즈니 스타일 진행 재작성본 검증 — 대분류(완사입기획/정상·원단·BT미정), 단계(원/부자재발주→QC→봉제→완성→납품→물류입고), 완료=패킹+물류입고, 작지/BT링크·칼라수량.

## 논리증거

| 주장 | 실측 | 차 |
|---|---|---|
| 대분류 counts = 행 집계 | 완사입기획12·완사입정상9·원단23·BT미정4 =48 | 0 |
| 단계 7 = README/meta | 원단발주·부자재발주·QC·봉제·완성·납품·물류입고 · flag_keys 7 | 0 |
| 완료 = pack∧logistics | complete_rule 문구 일치 · complete↔flags 불일치 0 · 현재 완료0(pack/logistics/pack_links 전부0) | 0 |
| progress.json 정본 | embed `#progress-data` == file · fetch 우선 | 0 |
| KPI JS | kN48 · kAvg8% · kDone0 · kPo25 · kBt4 | json 재계산 일치 |
| 칼라합 = qty (있을 때) | colors 있는 18건 합=qty · 불일치0 | 0 |
| 작지/BT 등 상대링크 페이지에서 열림 | href 103건 전부 `../../../생산부/…` → 페이지기준 존재 **0/103** | **-103** |
| 같은 파일을 MARU 루트·`../../../../`로 보면 | **103/103** 존재 (`Z:\HDD1\MARU\생산부\2. 디즈니\27SS\…`) | depth `../` 1단 부족 |

## OK (잔여 아님)
- brand/source 분리 · DOCTYPE1 · file://0 · delivery0 · SELF_OK 없음
- oneway DR1LTR080/DR2LTR091
- BT미정4 pending_note「예정: 원단 또는 완사입」

## 부가 이슈 (반려 주원인은 아님)
- `fabric_po` True인데 `fabric_po_links` 없음: DR1LPA006, DR1MJV002
- `trim_po` True인데 `trim_po_links` 없음: SR1MTR081
- qty·colors 둘 다 빈 스타일 30건(미기입으로 보이며 합 모순은 없음)

## 재발키
`정의문서↔수치공식 일치 스캔` (src_rel/href depth ↔ 실제 `Z:\HDD1\MARU\생산부` 루트) · R01 상대경로 이탈

## 질문목록
1. 모든 자산 href·`src_rel`을 `../../../../생산부/2. 디즈니/27SS/…`로 올릴까? (페이지 `dashboard\두리콜렉션\디즈니\진행` → MARU까지 4단)
2. fabric_po/trim_po 플래그만 있고 링크 없는 3스타일 — 링크 보강 vs 플래그 해제?
