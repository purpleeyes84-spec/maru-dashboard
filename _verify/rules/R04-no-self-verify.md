# R04 칸봇 셀프검증 금지
- id: R04-no-self-verify
- when: 칸 산출 후 “검증했다” 자가판정
- must: 대시보드검증 게이트 경로·판결만 유효
- deviation → action: 조건부(게이트 재요청)
