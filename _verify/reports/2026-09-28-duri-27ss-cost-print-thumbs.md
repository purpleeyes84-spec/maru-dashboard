# 두리콜렉션 27SS 원가 — 나염 단가비교표 도안 썸네일 칸 게이트 2026-09-28

- 오더: 두리콜렉션 봇 · `Z:\HDD1\MARU\dashboard\두리콜렉션\27SS\원가\index.html` · read-only(대시보드 수정·Z 배포·브라우저 없음)
- 주장: 나염 단가비교표 2개에 도안 썸네일 칸 추가(`print_img\gieun_no1~6.jpg`, 출처 `생산부\2. 디즈니\27SS\해외생산\기은 나염단가비교.pdf`, NO·사이즈 1:1) · 백업을 `두리콜렉션\_bak\27SS_원가\`로 옮김
- 비교 기준: 오늘 아침 승인본 SHA256 `7DD1A69E…60154C0` (박스 `/workspace/uploads/duri-cost-merge-0928/index.html`, 보고서 2026-09-28-duri-27ss-cost-merge.md)
- 신: index.html **2026-09-28 08:19:20 KST** · 43,239B · SHA256 `B0F9B110…77EC3DE` (게이트 끝에 다시 확인해도 같음) · print_img 6장 08:19:21~23 KST
- 박스: `/workspace/uploads/duri-cost-thumbs-0928/` · 스크립트 `/workspace/대시보드/_검증/_verify/duri-cost-merge-0928/{thumbs.js,grid2.js,sim_thumbs.js}` → `thumbs_out.json`, `sim_thumbs_out.json`
- PDF 내용: 앞선 게이트 때 만든 캐시 `print_mapping.json`(9/24 print+FX 승인 때 쓴 것, rows NO1~6 · design · size · qty · usd)을 사용. PDF는 스캔본이라 새로 복사·pdftotext 하지 않음

## 판결
`승인`

## 주장 | 실측 | 차

| 항목 | 주장 | 실측 | 차 |
|------|------|------|-----|
| 수치 불변 — 원가 마스터 | 변경 없음 | `#master` outerHTML 승인본과 **똑같음** · jsdom 렌더 후 논리 그리드 셀 차 **0/192** | 0 |
| 불변식 | qty 24300 · wavg 5450.29 · FX | **24,300 · 5,450.29** · 4×16 · 스타일별 4,133.08/3,502.82/8,529.40/9,463.30 · 헤더(FX 1366.0/202.6 asOf 9/24 09:20) innerHTML 동일 | 0 |
| KPI | 변경 없음 | KPI 8카드 텍스트 동일 | 0 |
| 나염 비교표(스타일 합산) 값 | 변경 없음 | 도안 칸 빼고 4행 셀 텍스트·class·rowspan/colspan 동일 | 0 |
| 기은 도안별 표(NO) 값 | 변경 없음 | 도안 칸 빼고 6행 동일 · 스타일 총액표·발주수익표 5행씩 동일 | 0 |
| 썸네일 칸 말고 다른 변경 | 없음 | diff 8군데 = CSS 4줄(`td.art`·`a.thumb`·img 64px·hover) + 헤더 2개(`<th>도안</th>`) + 비교표 td.art 4개 + NO표 td.art 6개. 스크립트·상세 카드·링크 섹션 변경 0 | 0 |
| NO표 행↔이미지 | NO·사이즈 1:1 | NO1 162.5x182.1→no1 · NO2 220.1x140.4→no2 · NO3 80x41→no3 · NO4 45x30→no4 · NO5 121.1x154.1→no5 · NO6 51x49→no6 · `print_mapping.json` rows 6/6와 같음 · 각 셀의 href·src·title·alt 번호 4개가 모두 같음 12/12 | 0 |
| 비교표 행↔이미지 | 스타일별 | DR1LTR080→no2 · DR2LTR091→no1 · DR2LTS090→no5+no6 · DR2MTS090→no3+no4 = 표의 "기은#…" 문자열·print_mapping by_style와 같음 | 0 |
| jpg 6장 | 있고·서로 다르고·실제 그림 | Z Test-Path True 6/6 · SHA256 6개 모두 다름 · JPEG 309~400px · 밝기 표준편차 65~86(빈 그림 아님) | 0 |
| 그림 내용(Read로 봄) | 도안 | no1 초록 DAISY 글씨+데이지 얼굴 · no2 체크 하트 미키+MICKEY MOUSE · no3 빨간 MICKEY MOUSE+미키 귀 · no4 MM EST.1928 · no5 데이지 얼굴+필기체 Daisy · no6 줄무늬 필기체 D → 디자인 이름과 모두 맞음. 가로세로 비율도 사이즈 순서와 맞음(no3 1.83≈80x41 1.95 · no6 1.03≈51x49 1.04 · no5 0.89≈0.79 등) | 중복·밀림 0 |
| 나염표 병합 | 유지 | NO표 rowspan 2개(DR2MTS090 rs2 · DR2LTS090 rs2, class merged) 그대로 · 도안 칸이 STYLE 앞이라 NO4·NO6 행 td 10개 = 11칸 − rowspan 1 → rowspan 반영 그리드 11칸, 빠짐·겹침 0 · 비교표 10칸×4행 | 0 |
| 마스터 병합·필터 | 유지 | ALL rowspan **40**(품번4+값36) run length 불일치 0 · 버튼 5개 14번 전환(왕복·같은 버튼 반복 포함) 오류 0 · 필터별 qty/wavg 정상 · 숨김 행 rowspan 잔존 0 | 0 |
| 링크 | 전부 resolve | 고유 href/src 13개(img·확대 링크 12개 = jpg 6개 × href+src 2벌씩, 공통 css/js 2개, json·md 5개) Z Test-Path True **13/13** · 확대는 `target="_blank"`로 같은 jpg를 여는 링크(따로 라이트박스 스크립트 없음) · `file:///`·`Z:\` 0 | 0 |
| R10 | 유지 | 표 font-size 14px 그대로 · 새 CSS에 font-size 없음 · 썸네일 높이 64px(글자 크기에 영향 없음) · KPI 8 · fold-nav/visibility 링크 그대로 | 0 |
| 백업 이동 | 원가 폴더에서 빼서 _bak로 | `27SS\원가\index.html.bak_20260928_merge` Test-Path **False** · 원가 폴더 `*.bak*` 0개 · `두리콜렉션\_bak\27SS_원가\index.html.bak_20260928_merge` **True**(SHA `81E9CE86…`) · 같은 폴더의 `index.html.bak_20260928_img` = 승인본 SHA `7DD1A69E…` | 0 |

## 관찰(비차단)
1. PDF 원본과 픽셀까지 대조하지는 않음(스캔 PDF · 캐시 print_mapping 기준 + 그림을 눈으로 확인). 이미지 번호가 PDF의 NO 칸과 맞는지 원본으로 최종 확인하려면 PDF 한 번만 확인하면 됨.
2. `_bak\27SS_원가\`도 `dashboard\` 아래(게시 트리)에 있음. 원가 폴더보다는 낫지만 링크 없는 보관이라도 NAS 밖/비게시 위치가 더 안전.
3. 썸네일은 `loading="lazy"`에 jpg 원본(14~35KB)을 그대로 씀 — 용량 문제 없음.

## 질문목록
1. `_bak` 폴더를 게시 트리 밖으로 옮길 계획이 있나요?
2. 원가 마스터(품번별 행)에도 도안 썸네일을 넣을 예정인가요? 넣는다면 다시 게이트 요청 바랍니다(병합·칸 수 영향).
3. 썸네일 이미지를 PDF 몇 쪽에서 어떤 방식으로 잘랐는지 `print_mapping.json`이나 report.md에 적어 두면 다음 게이트에서 PDF를 다시 열 필요가 없습니다. 적어 둘까요?

## 오답 처리
- 승인 → 두리콜렉션 승인 행 1줄(키 `소스↔UI 건수·집합 스캔`, 태그 논리) · `close_open.py` 실행 · 열린 건 0

## 재현1줄
`node thumbs.js` 비교표 4행·NO표 6행 도안칸 제외 diff 0 · master outerHTML 같음 · `node grid2.js` NO표 11칸 rowspan2 오류0 · `node sim_thumbs.js` 192셀 차0·rowspan40·필터14회 오류0 · NO1~6↔no1~6 12/12 · jpg 해시 6개 다름 · Test-Path 13/13 · bak 원가 False/_bak True
