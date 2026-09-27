# fix_geumju 핸드오프 (봉제현황)

게이트 잔존 `금주_진행/비교/이번주_*` 를 weeks[]·xlsx(508.7)에 맞춤. **대시보드검증 재게이트 요청.**

## 변경
| 키 | before | after |
|----|--------|-------|
| 금주_진행.일평균 | 300 | **508.7** |
| 금주_진행.진행 | 1/6 | **3/6** |
| 금주_진행.days | 월·화 미기록 / 수300 | **월640·화586·수300 기록** |
| 금주_진행.대비_완료주평균 | -282.4 | **-73.7** |
| 비교.금주_일평균 | 300 | **508.7** |
| 비교.금주_대비 | -282.4 | **-73.7** |
| 이번주_dates | [9/23] | **[9/21,9/22,9/23]** |
| 이번주_일평균 | 300 | **508.7** |
| 차이(이번주−앞선2주) | -272.6 | -63.9 |

weeks[] 금주·overall 543.4/38·일요제외·href20260924·xlsx 는 이미 OK → 손대지 않음.
완료주_평균 582.4 유지 → 508.7−582.4=**-73.7**.

## 디스크 경로
- live: `Z:\HDD1\MARU\dashboard\봉제현황\index.html` (47551, sha256 `97d06ede…c1ce92`)
- live: `Z:\HDD1\MARU\dashboard\봉제현황\index_live.html` · `index.htm` 동일
- live: `Z:\HDD1\MARU\dashboard\봉제현황\data.json` (47983, sha256 `9e6430d0…a45208`)
- bak: `Z:\HDD1\MARU\dashboard\봉제현황\_work\*.bak_geumju_pre`
- box: `/workspace/대시보드/봉제현황/index.html` · `data.json` · `_work/index_geumju.html` · `_work/data_geumju.json`
- transit: `C:\Users\USER\AppData\Local\Temp\_bongje_transit\index_geumju.html` · `data_geumju.json`

## 덮어쓰기
unlock **불필요** — Copy-Item 바로 성공. (ipdisk_mounter kill/remount 안 함)

## 비고
9/23 반일 300 유지. KPI=애리후세. 브라우저/캡처 없음. 자체게이트 안 함.
