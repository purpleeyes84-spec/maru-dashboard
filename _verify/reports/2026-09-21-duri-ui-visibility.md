# 두리콜렉션 시인성 UI 개편 게이트 2026-09-21

## 판결: 승인

## 경로
`Z:\HDD1\MARU\dashboard\두리콜렉션\` (주력 `디즈니\진행\` + 하위 톤)

## 목표
시인성 UI 개편 검증 — 카드그리드·썸네일·color_str 띄어쓰기·링크 depth4·밝은톤. 샘플 thumb DR2LTS090 존재확인됨.

## 논리증거

| 주장 | 실측 | 차 |
|---|---|---|
| 카드그리드 | `cardHtml`→`article.card` · `grid-template-columns:repeat(auto-fill,minmax(260px,1fr))` · `#sections` 그룹 렌더 | 0 |
| 썸네일 | thumb 있는 18건 페이지기준 존재 **18/18** · DR2LTS090 BT CFM jpg OK · `images[].exists` 38/38 true | 0 |
| color_str 띄어쓰기 | 18건 `CODE qty` 공백분리 · code↔qty 붙어쓰기 0 · 수량합=colors합 0불일치 | 0 |
| 링크 depth4 | src_rel·자산103·thumb 포함 href 전부 `../../../../생산부` · 자산 디스크 **103/103** | 0 |
| 밝은톤 | hub·디즈니·스팍스·워너·27SS·일방향재단·진행 전부 `--bg:#f0f4f8` · bg_dark 0 | 0 |
| 정본 유지 | embed==file · counts 12/9/23/4 · fltYear 유지 · file://0 · delivery0 · SELF_OK0 | 0 |

## 관찰(비차단)
- thumb∩color_str=9 · thumb만9 · color_str만9 · 둘다없음21 (NO IMG 플레이스홀더)
- 27SS/브랜드허브는 톤만 통일(카드그리드는 진행 보드 주력)

## 재발키
없음

## 질문목록
없음
