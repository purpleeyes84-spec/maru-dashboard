# Z:\HDD1\MARU 종합판단 계획서
작성: Air · 2026-09-08 · 샘플 기반(전수 아님)

## 1. 목적
Air가 Z: 전체 정보를 **역할별로 묶어** 판단한다. 전수 열람 금지. 질문 유형 → 정본 경로 → 담당 봇 → 교차검증 순서만 고정.

## 2. 루트 지도 (실측 샘플)
```
Z:\HDD1\MARU\
  OPEN-DASHBOARD.html          # 입구 스텁
  dashboard\                   # ASCII 정본 대시보드 (전 PC)
  생산부\                      # 현장 원천 데이터·작지·거래처 폴더
  영업부\                      # 현재 샘플: 비어 있음(0 files) — 추후 재확인
  공유폴더\마감\               # 마감 공유
  관리부\                      # 월별(1–7월)·양식·IT
  개발팀\                      # 요척·마루&준텍스·디즈니·굿트
  BOSS\                        # 경영/보스
  (사업자등록증 등 루트 서류)
```
폐기/주의:
- `생산부\dashboard`, `dashboard` = 구경로·스텁. 북마크 금지.
- 주소창 `%EC`/`생산부` 섞이면 하위 상대경로 깨짐.

## 3. 정본 vs 원천
| 구분 | 경로 | 쓰임 |
|---|---|---|
| 화면 정본 | `dashboard\` | 전 PC 동일 UI. status/delivery/process/education/img |
| 현황 원천 | `생산부\생산현황표 N월.xlsx` | 아침 갱신 입력. `~$` 잠금 무시 |
| GT 원천 | `생산부\GOODTRUST\` | 정산·국내/해외·샘플·자재·패턴·catalog |
| GT 화면 | `dashboard\GOODTRUST\catalog` (또는 교육/허브 링크) | thumbs 캐시, PDF 재오픈 금지 |
| 교육 정본 | `dashboard\education\` | CSS 인라인·칸별 `_edu.js`. 초안은 교육자료 봇→검증 후만 Z |
| 공정 누적 | `생산부\공정별  누적 일 생산량.xlsx` | 공정 칸 |
| 거래처 작업 | `생산부\시머트리`, `디즈니`, `ICEBERG`, `작업복` 등 | 작지·납기 원천 |

## 4. dashboard 하위 (판단 허브)
- `index.html` — 허브
- `status\` — 생산현황 화면 (`data.json`+index). 소스=현황표 xlsx
- `delivery\` — 납기
- `process\` — 공정
- `education\` — fiber/dyeing/knitting/spinning/finishing/fabric-spec/print/tshirt-process/_errors
- `img\` — 공통 이미지
- `theme.css` — 참고용. 교육은 HTML 인라인 강제(Chrome file://)

## 5. 질문 유형 → 조회 순서 (종합판단 루틴)
1. **지금 공장 리스크(건/PCS/납기경과)**  
   status/data.json → 부족하면 당월 현황표 xlsx → 생산현황 봇
2. **특정 오더·납기·출고**  
   현황표 + delivery + (있으면) 팀시트 출고일 → 마감/생산현황
3. **공정·공수·병목**  
   process + `공정별 누적…xlsx` → 공정 봇
4. **굿트러스트 작지/아트/카탈로그**  
   `생산부\GOODTRUST\` 해당 하위 → catalog thumbs → PDF는 최후
5. **교육·용어·공정 설명**  
   `dashboard\education\` 해당 칸만. 수정=교육자료→교육검증. Air 자검증 금지
6. **요척·개발**  
   `개발팀\` → 필요 시만
7. **마감 공유물**  
   `공유폴더\마감\` → 마감 봇
8. **교차판단** (예: 납기경과 + 교육 이슈 + GT 샘플)  
   각 정본에서 **숫자·경로 한 줄씩만** 모아 Air가 합성. 원문 통째 금지.

## 6. 담당 매핑
| 영역 | 봇 |
|---|---|
| 총괄·교차·차단 | Air |
| status/현황표 | 생산현황 |
| delivery/납기 | 마감 |
| process/공수 | 공정 |
| education | 교육자료 (+교육검증 게이트) |
| NAS 경로·복사 | NAS |
| 도식 이미지 | 공정도식 |

## 7. 토큰·실행 제약 (이 계획서의 운영 규칙)
- 오더 = 경로 + 목표. Z 전수 dir 금지.
- 샘플 깊이: 루트 1단 → 해당 부서 1단 → 목표 파일만.
- 중간 산출은 디스크, 컨텍스트는 경로·KPI만.
- 한 오더 한 채팅.

## 8. 미확정 / 재샘플 필요
- `영업부\` 내용 0 — 권한·빈폴더 여부 다음 접속 시 재확인
- `BOSS\`·`관리부\` 월별 상세는 오더 있을 때만
- `생산부\양식`·PACKING LIST 구조는 해당 오더 시

## 9. 다음 실행 (요청 시)
1. 이 계획서를 `Z:\HDD1\MARU\dashboard\_map\plan.md`에 고정
2. Air 메모리에 루트 지도 요약 고정
3. 영업부/BOSS는 오더 없으면 추가 탐색 안 함
