JIRA 이슈를 읽어서 아래 형식으로 한국어 요약을 작성합니다.

## 사용법
`/issue-summary <JIRA URL 또는 이슈 키>`

예시:
- `/issue-summary WEEHKNRTK-4626`
- `/issue-summary https://harmony.lge.com:8443/issue/browse/WEEHKNRTK-4626`

## 출력 형식

**ISSUE-KEY** | `Status` | Priority | 담당: Assignee

이슈내용 : [이슈 설명 - 문제 현상, 재현 조건, 영향 모델/버전을 한국어로 간결하게]

검토현황 : [이슈 흐름(발견→원인분석→결정→조치)이 드러나도록 핵심만 한두 줄로 요약]

## 지시사항

1. `$ARGUMENTS`로 전달된 이슈 키 또는 URL로 `jira_reader` MCP 도구의 `jira_get_issue`를 호출하세요.
   - harmony.lge.com URL이면 전체 URL을 그대로 전달
   - 이슈 키만 있으면 그대로 전달

2. 이슈 내용 작성 규칙:
   - description의 Function, Condition, Problem 항목을 기반으로 한국어로 요약
   - 영향 모델(KF23U, K25LP 등)과 SW 버전이 있으면 포함
   - 재현 빈도(Always/Intermittent)가 있으면 포함

3. 검토현황 작성 규칙:
   - 이슈의 흐름(발견→원인분석→결정→조치)이 드러나도록 핵심만 한두 줄로 요약
   - 사람별로 나열하지 말고, 같은 단계의 내용은 합쳐서 표현
   - 단순 확인 요청·전달은 생략, 분석 결과·결론·조치 완료 등 전환점만 포함
   - 조직 표기: LGE 임직원은 이름(LGE), Morestar는 이름(Morestar), RTK는 이름(RTK), LGSI는 이름(LGSI) — (LGE) 괄호 표기는 생략해도 됨
   - 날짜는 M/D 형식으로 표기 (예: 6/2)
