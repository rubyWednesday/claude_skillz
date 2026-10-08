WEEHKNRTK 프로젝트에서 최근 3주간 업데이트된 Open/In Progress 이슈 목록을 조회합니다.

## 사용법
`/weeh-issues`

## 지시사항

1. `jira_reader` MCP 도구의 `jira_search_jql`을 호출하세요.
   - `include_secondary: true` 반드시 설정
   - JQL: `project = WEEHKNRTK AND status in (Open, "In Progress", FixReady) AND updated >= -3w ORDER BY updated DESC`
   - `max_results: 50`

2. 결과를 아래 형식으로 출력하세요.

## 출력 형식

**WEEHKNRTK 진행 중 이슈** (최근 3주 업데이트, N건)

| 이슈 | 상태 | 요약 | 담당 | 업데이트 |
|------|------|------|------|----------|
| [WEEHKNRTK-XXXX](url) | Open | 요약 | 담당자 | M/D |

3. 출력 규칙:
   - 이슈 키는 URL 링크로 표시
   - 담당자는 이름만 (영문 성명이면 성 제외하고 이름만, 한국어면 한글 이름만)
   - 업데이트 날짜는 M/D 형식
   - 요약이 너무 길면 40자로 자르기
   - 상태: Open → 🔵 Open, In Progress → 🟡 In Progress, FixReady → 🟢 FixReady
