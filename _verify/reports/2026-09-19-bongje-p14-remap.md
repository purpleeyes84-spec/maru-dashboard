# 봉제현황 p-14 날짜 오매핑 게이트

- 일시: 2026-09-19
- 경로: `Z:\HDD1\MARU\dashboard\봉제현황\`
- 판결: **조건부**

## 논리증거
| 주장 | 실측 | 차이 |
|------|------|------|
| p-14 → `일별이미지/2026-09-04/` | dash·원천 단일 존재 · 09-02 없음 | 0 |
| 본문 4일 금 | `daily_product` 9/4·금 · proxy 590 | 0 |
| PDF=일자역순 규칙 | `defs.날짜규칙`·`week_compare.pdf_order` 명시 | 0 |
| 주간 2주전 금=590 | `week_compare.weeks[2주전].요일별.금=590` | 0 |
| 전체 553.3 / 35일 | overall.line_avg·조업일 | 0 |
| 이번달 597.5 / 14일 | month.line_avg·조업일 | 0 |
| `recent3w` 9/4 애리후세 | **null** · 주간 금 null · 일평균 659 | **≠590/645** |
| 누적엑셀 원장 p-14 | date/folder=`2026-09-02` · exists=True | **경로·날짜 오매핑 잔존** |
| footer 주간 표기 | `월~금` (본문은 월~토) | 잔여 |

## 재발키
- `표·차트·data.json 키 동기` (week_compare↔recent3w 9/4·590)
- `정의문서↔수치공식 일치 스캔` (원장 date/folder↔실폴더)

## 질문목록
1. `recent3w.daily` 9/4·`weekly` 2주전 금 → 590, 일평균 645로 week_compare와 맞출 것.
2. `일별이미지_누적.xlsx` 원장 p-14 행: date/folder/rel_path→2026-09-04, note 정정, exists 재검.
3. footer `월~금` → `월~토` (또는 삭제).
4. 재게이트 path+goal.

## OK
폴더 이동·overall/month·week_compare·fix_p14 노트.
