<script src="/maru-dashboard/js/auth-gate.js"></script>
# 2026-09-25 · 생산현황 · ship 복구 4차 재게이트 (canon imgPath·check_hrefs 범위·resolver 오늘 기준 연도)

## 판결: 승인
regate3 조건 1(canon index 이미지 22종 깨짐)은 **해소**됨. JS로 만드는 링크 **200/200**, 이미지 22/22, check_hrefs 결과와 본인 스캔이 **건수까지 일치**(canon index 712 = 정적 6 + imgPath 22 + data 684). resolver는 오늘(서울) 기준으로 연도를 정하고 mtime은 안 씀. 불변식 전부 Δ0.
막지 않는 항목: resolver 경계 사례 2건(아래 R-1·R-2, 권장·질문), 「마감」·canon fold-nav는 사용자 답을 기다리는 중(내부 페이지로 처리).

## 경로·사본
canon `Z:\HDD1\MARU\생산부\대시보드\생산현황\` · status `Z:\HDD1\MARU\dashboard\status\`
사본 `/workspace/uploads/status-925-regate4/{canon,status}/` (%TEMP%\s925rg4 경유, 08:44 KST 복사. Z 최신 mtime 08:43:29 `stage_rules.md`) · 기준 = `status-925-regate3/`
Z 편집 0. writer 스크립트는 실행 안 함. 읽기 전용 실행은 `weekly_resolver.js`·`check_hrefs.js`(기본·`--no-data`, 비교용)만 함. 존재 확인은 PowerShell `Test-Path -LiteralPath` 262경로 + `Resolve-Path` 샘플 5건으로 함.

## 바뀐 파일 (vs regate3)
- 바이트 동일: canon dfs·canon by-po·status index·status dfs·status by-po html, `ship_locks.json`
- canon index.html: 2행만 바뀜. 578행 `imgPath` `"../img/"` → `"../../../dashboard/img/"`, 517행 embed(meta 시각 필드만 바뀜, embed≡data)
- data.json(양쪽): `meta.dueSyncAt`·`meta.stageSyncAt`만 바뀜 / by-po.json(양쪽): `meta.rebuiltAt`만 바뀜 → orders diff 0
- _tools: `rebase_links.js`(+`fixImgPath()`), `check_hrefs.js`(재작성), `weekly_resolver.js`(오늘 기준 연도)

## 클레임 검증
| # | 클레임 | 실측 | 차이 |
|---|---|---|---|
| 1 | canon imgPath=`../../../dashboard/img/`, 참조 이미지 22/22 존재. 8챕터 JS 링크 200/200 | 578행 확인. vm+DOM 스텁으로 8챕터(all·risk·생산3팀·생산5팀·시머트리·디즈니·공정·작지) 렌더, 누락 id 0, 예외 0 → 고유 링크 **200/200**(href 178 + src 22, regate3 178/200). src 22개 모두 `../../../dashboard/img/` → Resolve-Path `Z:\HDD1\MARU\dashboard\img` ✔ · imgMap 46/46(고유 22)·teamHero 4/4·brandStrip 6/6 · 라이트박스·jikji/mat alts·jikjiIndex는 렌더 링크와 data URL에 포함됨 → data URL **684/684**(고유 214), jikjiIndex.path 194/194 · `생산부\대시보드\img`는 여전히 없음(False). 이제 참조 0 · **status 페이지**: `imgPath`·`const DATA` 0개(JS 이미지 경로 없음). status dfs의 정적 `../img/*.jpg`는 `dashboard\img`로 resolve됨(158/158) | 0 |
| 2 | check_hrefs가 imgPath·jikjiAlts·jikjiIndex·matAlts 포함, 6페이지 0 broken | Z 실행 결과 157/194/**712**/158/4/5, TOTAL_BROKEN 0 · `--no-data` 157/194/6/158/4/5 · 본인 스캔: 정적 링크는 전 페이지 같은 건수 · canon index 712 = 정적 6 + imgPath 파일 22 + orders(jikjiUrl·matUrl·imgUrl·jikjiAlts·matAlts)+jikjiIndex.url 684 → **정확히 일치** · 정규식 `(?:^|[\s<])(href|src)`라서 `data-lb-src` 오탐 없음(regate3 지적 해소) · 한계(막지 않음): data는 **인라인 embed만** 읽고(주석은 "또는 data.json"이라고 되어 있음, embed≡data라 이번엔 무해), jikjiIndex `.path`(Z: 절대경로)는 대상이 아니고, 렌더된 HTML이 아니라 소스 필드를 검사함(이번엔 렌더 200과 같은 결과) | 0 |
| 3 | resolver 연도: 파일명 → 없으면 오늘(mtime 안 씀) | 코드: `20\d{2}` → `\d{2}\s*년` → 없으면 `todaySeoul()`(Intl, Asia/Seoul) 사용. **월 > 이번 달이면 작년, 월 ≤ 이번 달이면 올해**. `fs.statSync`/mtime 호출 0. key=`year*10000+월*100+주차`. 대상은 `주간회의.xlsx`이고 `~$`는 제외 · Z 실행 결과 `9월 5주차` key 20260905 ✔ · 시뮬(Date 목, 폴더 목): 아래 표 | 0 (경계 사례 R-1·R-2 → 권장·Q2) |
| 4 | 「마감」 문구·canon fold-nav 그대로(사용자 답 대기) | canon dfs·status dfs `<span class="nolink">마감</span>` 각 1개 그대로 · canon index/dfs/by-po `fold-nav.js` 0·`visibility.css` 0, 정적 `<nav class="fold-nav">` 1개씩 그대로 · `dashboard\사후정산\index.html` 존재(True) | 막지 않음 |

### resolver 시뮬 (weekly_resolver.js 4차본, 오늘은 서울 기준)
| 사례 | 오늘 | 파일 | 결과 | 판정 |
|---|---|---|---|---|
| 실제 폴더 | 26-09-25 | 8월2·4, 9월1~5 (+리포트·~$·기타 제외) | **9월 5주차** (20260905) | ✔ |
| 1월 중순 | 27-01-15 | 12월 5주차, 1월 1주차 | **1월 1주차** (12월→2026, 1월→2027) | ✔ |
| 옛 파일 재저장 | 27-01-15 | 9월 4주차(재저장), 1월 2주차 | **1월 2주차**. mtime을 안 쓰므로 순위가 올라가지 않음 | ✔ (regate3 약점 해소) |
| 다음 달 파일 미리 작성 | 26-09-25 | 실제 폴더 + 10월 1주차 | **9월 5주차**. 10월은 이번 달보다 크므로 **2025**로 보고 key 20251001 → 순위 최하 | 수용 가능(보수적). 10/1 00:00 KST부터 10월 1주차가 선택됨(TZ 경계 검증: 9/30 23:30 KST→9월5주, 10/1 00:30 KST→10월1주) |
| 12월에 1월 파일 미리 작성 | 26-12-28 | 12월 4·5주차, 1월 1주차 | **12월 5주차**. 1월은 이번 달 이하이므로 **2026**으로 보고 key 20260101 → 최하 | ✔ (앞서 나가지 않음). 27-01-01부터 1월 1주차 |
| 파일명 연도 혼재 | 26-12-28 | `2027 1월 1주차` + 연도 없는 12월 5주차 | 2027 1월 1주차 | ✔ (명시한 연도가 우선) |
| 파일명 연도 혼재 | 26-12-28 | `2026 12월 5주차` + 연도 없는 1월 1주차 | 2026 12월 5주차 | ✔ |
| **R-1** 월 경계 주차 | 26-09-28(월) | 실제 폴더 + 10월 1주차 | 9월 5주차 | ⚠ 10월 1주차가 9/28(월)에 시작하는 규칙이라면 9/28~9/30 사흘 동안 전 주 파일을 씀(앞서 나가지는 않고 늦어짐) |
| **R-2** 1년 된 같은 달 파일이 남아 있음 | 26-09-20 | 9월 3주차(올해), 9월 5주차(**작년** 잔존) | **9월 5주차(오답)**. 작년 파일인데 월 ≤ 이번 달이라 2026으로 봄 | ✗ 이론상 결함. 현재 폴더엔 2026년 8~9월 파일만 있어서 실제 영향 0 |

추론 규칙 요약: 연도가 없는 파일은 "오늘 기준 과거 12개월(이번 달 포함) 안의 회의"로 가정함. 월 > 이번 달이면 작년, 아니면 올해. 그래서 (a) 미래 월 파일은 그 달 1일 전까지 항상 무시되고(R-1), (b) 11개월보다 오래된 파일 중 월 ≤ 이번 달인 것은 1년 뒤로 잘못 판정됨(R-2). 또 기준이 데이터 asOf가 아니라 **실행 시점 시계**라서 과거 날짜로 재빌드하면 다르게 판정될 수 있음. 10행 주석은 아직 "없으면 mtime 연도"로 되어 있음(코드와 다름, 표기만 문제).

## 불변식 (vs regate3)
| 항목 | regate3 | 지금 | 차이 |
|---|---|---|---|
| shipN (meta·orders·embed·by-po.json·status index/by-po html) | 27 | 27·27·27·27 · status html은 바이트 동일(`ship=27`, `납품완료 27`) | 0 |
| 잠금 | 13/13 | ship_locks.json 바이트 동일 · data ship 13/13 일치 | 0 |
| status≡canon SHA256 | data 7229129E… / by-po E997CBFA… | data `5AC4E11D249C7131`=양쪽 · by-po `9CBFCB89A8546570`=양쪽 | 0 (해시 변경 원인: data는 `meta.dueSyncAt`·`meta.stageSyncAt`, by-po는 `meta.rebuiltAt` 시각 필드만 바뀜) |
| 92 NO 필드 | orders diff 0 | orders diff **0**(모든 필드) | 0 |
| asOf | 9/25 | data·by-po 9/25 | 0 |
| 5주차/기존/미정 | 13/64/15 | weekly 13 / fallback 64 / 없음 15 · weeklyLabel 5주차 | 0 |
| ship/due/deliveryDue | 27/77/77 | 27/77/77 | 0 |
| cutQtySum | 20269 · issue RH-57 | 20269(재계산 일치) · issue RH-57 1건 | 0 |
| embed ≡ data | deep-equal | deep-equal(status data도 동일) | 0 |
| IO-13 합봉 | 1320 | sched.합봉 1320 = 660(9/22)+660(9/23) | 0 |
| ⚠ 배지 | RH-57만 | all 렌더 ⚠ 1개 = RH-57, title `재단수량칸에 날짜(2026-09-19)` | 0 |
| canon 스크립트 파싱 | OK | `vm.Script` PARSE OK · status index 인라인 OK | 0 |
| 정적 href 6페이지 | 전부 resolve | 6/6·157/157·194/194·5/5·158/158·4/4 (canon index JS 조각 4개는 렌더로 검사) | 0 |
| data URL | 684/684 | 684/684 (고유 214) | 0 |
| file:///Z | 0 | 6페이지 모두 0 | 0 |
| KPI | status 7 · canon 렌더 8 | 7 · 8 | 0 |
| status fold-nav/visibility | True | index·by-po 둘 다 True, dfs는 fold-nav만(전과 같음) · `_shared\fold-nav.js`·`visibility.css` True | 0 |

## href 변경 목록 (vs regate3)
- 정적 href/src 변경 **0** (5페이지는 바이트 동일, canon index 정적 10개 동일)
- JS 생성 경로 변경 1종: canon index `imgPath()` 접두 `../img/` → `../../../dashboard/img/` (렌더 src 22개, imgMap/teamHero/brandStrip 56참조)

## 관찰
1. `rebase_links.js`의 `fixImgPath()`는 정규식으로 `imgPath` 함수 본문을 통째로 바꿈. 템플릿 모양이 바뀌면 조용히 매치되지 않을 수 있음(`indexQuoteFix` 플래그가 두 수정을 합쳐서 보고함).
2. `fixImgPath`의 기준은 `CANON`이므로 status로 복사하는 용도가 아님. 현재 status엔 imgPath가 없어서 무해.

## 권장 (막지 않음)
1. resolver R-2 방지: 연도 없는 파일 중 "추론 연도·월이 오늘보다 11개월 이상 전"이면 경고하거나 제외, 또는 파일명에 연도 넣는 규칙(Q2).
2. resolver 10행 주석을 "없으면 오늘 기준"으로 고치기. check_hrefs 주석(data.json 폴백)은 실제 동작에 맞추기.

## 질문목록
1. (이월 R10) canon index를 직접 여나? 이미지는 이제 정상. fold-nav 적용 여부와 「마감」 링크 대상(텍스트 유지 vs `사후정산/index.html`)은 답을 기다리는 중.
2. 주간회의 파일명에 연도를 넣을까(예: `2026 10월 1주차 주간회의.xlsx`)? 넣으면 R-1(월 경계 주를 미리 작성)·R-2(작년 파일 잔존)가 둘 다 해결됨. 아니면 이전 연도 파일을 폴더에서 치우는 운영 규칙을 둘까?
3. 월 경계 주차를 어떻게 부르나? 9/28(월)~10/4 주를 「10월 1주차」라고 부른다면 9/28~9/30엔 resolver가 9월 5주차를 씀. 이걸 허용할까?
4. (이월) RH-57 재단수량 현장 확인 (O231=9/19 날짜)

## 오답
승인 → 승인 행 추가(slot 생산현황, key 허브 href exists 스캔, tag href) → `close_open.py`로 2026-09-25 생산현황 미반영 행 반영 처리 → sync_index.py.
