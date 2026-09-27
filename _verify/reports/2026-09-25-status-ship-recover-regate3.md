<script src="/maru-dashboard/js/auth-gate.js"></script>
# 2026-09-25 · 생산현황 · ship 복구 3차 재게이트 (링크 재기준화·canon 스크립트·resolver 연도)

## 판결: 조건부
regate2 조건(status/due-from-sep 27개 깨짐)은 **해소**됨(49/49). canon index 스크립트 파싱 OK, resolver 연도 키 OK(오늘 9월 5주차), 불변식은 전부 Δ0.
**조건 1건**: 클레임 5 "6페이지 0 broken(--data 포함)"은 JS로 만드는 링크를 넣으면 사실이 아님. canon index의 `imgPath()`가 `"../img/"+file`을 쓰는데 `Z:\HDD1\MARU\생산부\대시보드\img`는 **없음**(Test-Path False). 그래서 도식 이미지 **22종이 전부 깨짐**(imgMap 46참조·teamHero 4·brandStrip 6·라이트박스). 이번에 스크립트 파싱이 복구되면서 새로 **화면에 드러난** 문제임. check_hrefs `--data`는 `jikjiUrl|matUrl|imgUrl`만 grep해서 못 잡음. 22개 파일은 모두 `Z:\HDD1\MARU\dashboard\img\`에 있음 → `imgPath`를 `"../../../dashboard/img/"`로 바꾸면 해결됨.

## 경로·사본
canon `Z:\HDD1\MARU\생산부\대시보드\생산현황\` · status `Z:\HDD1\MARU\dashboard\status\`
사본 `/workspace/uploads/status-925-regate3/{canon,status}/` (%TEMP%\s925rg3 경유, 08:36 KST 복사. Z 최신 mtime 08:35:20) · 기준 = `status-925-regate2/`
Z 편집 0. writer 스크립트는 실행 안 함. 읽기 전용 실행은 `weekly_resolver.js`·`check_hrefs.js`(비교용)만 함. 존재 확인은 PowerShell `Test-Path -LiteralPath` 316경로 + `Resolve-Path` 샘플로 함.

## 클레임 검증
| # | 클레임 | 실측 | 차이 |
|---|---|---|---|
| 1 | rebase_links가 status 미러 때 상대경로 재계산. GOODTRUST=`../../생산부/1. GOODTRUST/…`. 납기 폴더가 없어서 링크 제거 | status dfs 작지·자재 117개 → `../../생산부/1.%20GOODTRUST/…`(UTF-8 %인코딩), Resolve-Path → `Z:\HDD1\MARU\생산부\1. GOODTRUST` ✔ · status dfs = canon dfs를 1:1로 재기준화한 것(157/157 타깃 동일, `./index.html`만 status로 로컬화) ✔ · **납기**: `dashboard\납기`·`dashboard\delivery`·`dashboard\마감`·`생산부\대시보드\납기` 모두 False. MARU depth4 검색 결과 `Network Trashes Folder\…\대시보드\납기`·`…\dashboard\delivery`(휴지통)와 `공유폴더\마감`(대시보드 아님)만 있음. 허브 index·fold-nav.js에도 납기/delivery 항목 0 → **폴더가 없는 건 맞음** · 제거된 링크는 1개뿐. 라벨이 「납기」가 아니라 **「마감」**인 nav 항목(`../납기/index.html`)이고 `<span class="nolink">마감</span>`으로 텍스트는 남음. 그 밖에 텍스트·데이터 손실 0(canon dfs·by-po 텍스트 diff 0, status dfs 텍스트 = canon dfs) | 0 (「마감」의 대상 → 질문 Q2) |
| 2 | canon dfs·by-po 링크 재연결, 6페이지 상대 href 전부 resolve | 정적 href/src 기준(본인 스캔, HTML 엔티티 해제 후 decodeURIComponent): canon index **6/6**(+JS 조각 4개는 아래 렌더에서 검사) · canon dfs **157/157**(고유 48/48, regate2 26/49) · canon by-po **194/194**(55/55, regate2 31/55) · status index **5/5** · status dfs **158/158**(49/49, regate2 21/48) · status by-po **4/4** · **JS 렌더**(vm+DOM 스텁으로 8챕터 전부 렌더): canon index 링크 **178/200** → 깨진 22개 = 전부 `../img/*.jpg` · data.json URL(jikjiUrl·matUrl·jikjiAlts·matAlts·jikjiIndex) **684/684**(고유 214/214) · jikjiIndex.path 194/194 · 폴더 prefix는 아래 표 | **22 (canon index 이미지)** |
| 3 | canon index 따옴표 충돌 2곳(mix-leg, cal-grid) 수정, 메인 스크립트 파싱 | diff는 723·783행 두 곳뿐(`"</div><div class="mix-leg">"` → 작은따옴표). `new vm.Script` 결과 canon index #0 **PARSE OK**(regate2 사본은 FAIL `Unexpected identifier 'mix'` 208행) · status index 인라인 1개 OK · 필드 참조 확인: DOM 스텁 렌더에서 누락 id 0, 예외 0, 8챕터(all·risk·팀4·공정·작지) 렌더 성공 · **⚠ 배지**: `cutCell()`이 `o.cutQtyIssue`일 때 배지를 붙임. all 렌더에서 ⚠ **1개 = RH-57 행**, title `재단수량칸에 날짜(2026-09-19)` ✔ · embed≡data deep-equal ✔ | 0 |
| 4 | resolver에 연도 키 | key=`year*10000+월*100+주차`. 연도 결정 순서: 파일명 `20xx` → `xx년` → 없으면 **mtime 연도**(11–12월 파일을 1–2월에 수정하면 −1, 1–2월 파일을 11–12월에 만들면 +1 보정). 폴더명은 안 씀. 현재 파일명에 연도가 없으므로 **실제로는 mtime** · Z 실행 결과 `9월 5주차 주간회의.xlsx` key 20260905 ✔ (후보 7개, `~$`·주간리포트 제외) · 시뮬: 12월5주(26-12-28) vs 1월1주(27-01-04) → **1월** ✔ / 12월을 27-01-05에 재저장 → 1월 ✔ / 1월1주를 26-12-30에 미리 작성 → 1월 ✔ / 파일명 2026·2027, 26년·27년 → 1월 ✔ / 혼재 → 1월 ✔ · **약점**: 9월4주를 27-01-10에 재저장하면 1월2주보다 앞섬(key 20270904) ✗, 12월5주를 27-03에 재저장하면 3월1주보다 앞섬 ✗. 옛 파일을 다시 저장하면 순위가 올라감 | 0 (잠재 결함 → 권장·Q3) |
| 5 | check_hrefs 6페이지 0 broken(--data 포함) | 요청자 스크립트 실행 결과 157/194/6(→--data 148)/158/4/5, TOTAL_BROKEN 0. 정적 href는 본인 스캔과 **일치** · 다만 `--data`는 정규식이 `"(jikjiUrl|matUrl|imgUrl)"`뿐이라 142개만 봄. jikjiAlts·jikjiIndex(OK였음)와 **imgMap/teamHero/brandStrip→imgPath(22 깨짐)는 대상 밖**. `\b(href|src)`라 `data-lb-src`도 src로 잡힐 수 있음(이번 정적 페이지엔 없음) | **22** |

### JS·데이터 링크 폴더 prefix (canon 기준 resolve, 렌더+data+img)
| 존재/총 | prefix |
|---|---|
| 179/179 | 생산부/1. GOODTRUST/국내생산/2026 |
| 323/323 | 생산부/1. GOODTRUST/국내생산/2027 |
| 6/6 · 18/18 · 46/46 · 30/30 | 1. GOODTRUST/샘플/8월 · 9월 · 굿트 작지모음 · 생산3팀 |
| 186/186 · 17/17 | 1. GOODTRUST/자재리스트/로백 · 아이언오크 |
| 16/16 | 1. GOODTRUST/해외생산/2026 |
| 16/16 · 2/2 · 4/4 | 2. 디즈니/26FW/완사입 · 27SS/샘플 · 27SS/완사입 |
| 16/16 · 2/2 | 3. 시머트리/국내생산/7월 · 4. ICEBERG |
| 1/1 | 생산부/대시보드/생산현황 (`./`) |
| **0/78** | **생산부/대시보드/img** (없음) → dashboard/img에는 22/22 있음 |

### 샘플 resolve (11건, 전부 True)
모닝피플 `PO%230002…pdf`(#) · 로백 자재 `카트&amp;클로버…xlsx`(&) · `더 플뢰르 드리…,허니골드.xlsx`(,) · `[마루] SP27_WVPO(DTP 3, SOLID 6).pdf`([]()) · `4. ICEBERG/프로암 남녀작업지시서.pdf` · 해외생산 `MGPW 작업지시서.pdf` · `샘플/9월/SS27  버드독스…(마루).pdf`(공백 2개) · `아이언오크 PO%230073.xlsx` · `현재 진행건/SP27/3차/…하우스 머니….xlsx` · `35x70 GOLF_SP26…#1027…pdf` · `GEORGIA GOLF COMPANY/조지아 골프…pdf`

## 제거·변경 href 목록 (vs regate2)
- **canon/index.html**: href/src 변경 0 (스크립트 2행만 바뀜)
- **canon/due-from-sep.html** (158→157): 제거 1 = `../납기/index.html`「마감」→ nolink 텍스트 · 교체 5 = `../index.html`→`../../../dashboard/index.html`, `../../1. GOODTRUST/납기순_아트웍/index.html`(없음)→`../../../dashboard/goodtrust/index.html`, `../공정/`→`../../../dashboard/process/index.html`, `../교육자료/`→`../../../dashboard/education/index.html`, `../theme.css`→`../../../dashboard/theme.css` · img 33개 `../img/`→`../../../dashboard/img/` · 나머지 117개는 **타깃이 같고 %인코딩만 바뀜**
- **canon/by-po.html** (194=194): 제거 0 · `../index.html`·`../theme.css`→dashboard · `../img/` 46개→`../../../dashboard/img/` · 142개 인코딩만 바뀜
- **status/due-from-sep.html** (157→158): 9/24판을 canon 9/25판 재기준본으로 교체(62→64 NO, 기준 9/22→9/25. 내용 갱신이고 손실 아님). 제거 1 = `../납기/index.html`「마감」 · `../공정`·`../교육자료`·`../../1. GOODTRUST/납기순_아트웍` → `../process`·`../education`·`../goodtrust` · 작지·자재 → `../../생산부/1. GOODTRUST/…` · `../img/`·`../theme.css` 유지(존재) · `../_shared/fold-nav.js` 유지
- **status/index.html · status/by-po.html**: 바이트 동일(변경 0)
- `<img>/<link>/<script>` 태그 삭제 0 (img 33·33, link 1·1)

## 불변식 (vs regate2)
| 항목 | regate2 | 지금 | 차이 |
|---|---|---|---|
| shipN (meta·orders·embed·by-po.json·status index/by-po html) | 27 | 27 (status html은 바이트 동일) | 0 |
| 잠금 | 13/13 | ship_locks.json 바이트 동일 · data 13/13 일치 | 0 |
| status≡canon SHA256 | data 959A0CAF… / by-po 646E5DDA… | data `7229129E52BDE2AD`=양쪽 · by-po `E997CBFA1EFB0921`=양쪽 | 0 (해시 변경 원인: data는 `meta.stageSyncAt`, by-po는 `meta.rebuiltAt` 시각 필드 1개씩만 바뀜) |
| 92 NO 비링크 필드 | — | orders diff **0**(링크 필드 포함 전체) | 0 |
| asOf | 9/25 | 9/25 | 0 |
| 5주차/기존/미정 | 13/64/15 | 13/64/15 (weeklyLabel 5주차) | 0 |
| ship/due/deliveryDue | 27/77/77 | 27/77/77 | 0 |
| cutQty | cutQtySum 20269 · issue RH-57 | 동일 | 0 |
| embed ≡ data | deep-equal | deep-equal | 0 |
| IO-13 합봉 | 1320 | 660+660=1320 | 0 |
| KPI | 7 | status index 동일 · canon 렌더 kpi 8블록 | 0 |
| file:///Z | 0 | 6페이지 모두 0 | 0 |
| status fold-nav/visibility | True | index·by-po 둘 다 True · dfs는 fold-nav True, visibility.css 없음(9/24판도 없었음) | 0 |

## canon index fold-nav/visibility 상태 (R10 범위는 사용자 질문, 판단 안 함)
`fold-nav.js` 0 · `visibility.css` 0 · 정적 `<nav class="fold-nav">` 5링크 모두 resolve(폴더홈 → `Z:\HDD1\MARU\dashboard\index.html`). regate2와 같음. 이제 스크립트가 돌아서 sideNav·표·⚠ 배지가 렌더되지만 이미지 22개는 깨짐(조건 1).

## 관찰
1. `rebase_links.js` 후보 2(`dashboard/생산현황` 가정 위치)는 존재하지 않는 폴더 기준으로 resolve함. 이번 결과는 전부 맞지만, 우연히 같은 이름 파일이 있으면 의도와 다른 대상으로 연결될 수 있음. `ALIAS["납기순_아트웍"]→goodtrust`는 허브 카드 설명(「GOODTRUST 납기순 아트웍」)과 맞음.
2. dead 처리 코드가 `<img|link|script>`의 경우 **태그 자체를 삭제**함(이번 삭제 0). 앞으로 이미지·CSS가 조용히 사라질 수 있으니 로그를 남기는 게 좋음.
3. `localize()`에 도달하지 않는 `return null;`이 있음(무해).
4. status dfs의 정적 nav는 `fold-nav.js`가 런타임에 대체함(regate2 근거). 그래서 「마감」 제거가 사용자에게 보이는 곳은 canon dfs 한 곳임.

## 조치 요청 (재게이트 조건)
1. canon index `imgPath()` → `"../../../dashboard/img/"`(또는 rebase 대상에 JS 문자열 경로 포함). 그다음 check_hrefs `--data`에 imgMap/teamHero/brandStrip(imgPath)·jikjiAlts·matAlts·jikjiIndex 추가하고, 정규식을 `(?<![\w-])(href|src)`로 바꿔서 재실행.
2. (권장) resolver mtime 연도 폴백 보강: 파일명에 연도를 넣는 규칙, 또는 "mtime 연도 > asOf 연도"이거나 월이 asOf보다 미래면 −1 하는 보정.

## 질문목록
1. (이월 R10) canon index를 직접 여나? 연다면 이미지 22개 수정이 필수이고 fold-nav 적용 여부도 결정해야 함. 안 연다면 조건 1은 내부 페이지 한정 결함.
2. 「마감」 nav 항목을 텍스트로 둘까, `사후정산/index.html`(허브 09 「패킹리스트·정산」, 존재)로 연결할까? `공유폴더\마감`은 대시보드가 아님.
3. 주간회의 파일명에 연도(예: `2026 9월 5주차 주간회의.xlsx`)를 넣는 규칙을 둘까? (mtime 의존 제거)
4. (이월) RH-57 재단수량 현장 확인 (O231=9/19 날짜)

## 오답
조건부 → 기존 미반영 행(허브 href exists 스캔·생산현황)은 스킬 규칙 3(같은 키면 새 행 대신 갱신)에 따라 **날짜·증상 갱신, 미반영 유지**(status dfs 27개 해소는 수정확인으로 기록, 새 증상은 canon index 이미지 22개). close_open.py 미실행(승인 아님) · sync_index.py 실행.
