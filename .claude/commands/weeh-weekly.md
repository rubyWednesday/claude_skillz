WEEHKNRTK 프로젝트의 지난주 이슈를 정리합니다. (신규 이슈 + 지난주에 검토된 이슈)

## 사용법
`/weeh-weekly`

## 지시사항

### 1. 날짜 계산
오늘 날짜를 기준으로 지난주 월요일(D-7~D-13 범위)과 일요일을 계산하세요.
예) 오늘이 2026-06-12(목)이면 지난주 = 2026-06-01(월) ~ 2026-06-07(일)

### 2. 이슈 조회
아래 2개 JQL을 `jira_search_jql`로 호출하세요. (모두 `include_secondary: true`)

**쿼리 1 — 지난주 신규 이슈**
```
project = WEEHKNRTK AND created >= "지난주월요일" AND created <= "지난주일요일" ORDER BY created ASC
```
max_results: 50

**쿼리 2 — 지난주 업데이트된 이슈 (신규 제외)**
```
project = WEEHKNRTK AND updated >= "지난주월요일" AND updated <= "지난주일요일" AND created < "지난주월요일" ORDER BY updated DESC
```
max_results: 50

날짜 형식: `"YYYY-MM-DD"`

### 3. 이슈 상세 조회
조회된 각 이슈에 대해 `jira_get_issue`를 호출하여 description, comments를 가져오세요.
- 이슈 수가 많을 경우 업데이트 최신순으로 우선순위를 두고 최대 20건까지 처리하세요.

### 4. 출력 형식

아래 형식으로 섹션을 나눠 출력하세요.

---

## WEEHKNRTK 주간 이슈 요약 (YYYY-MM-DD W~ / 지난주 월~일)

https://harmony.lge.com:8443/issue/browse/WEEHKNRTK-XXXX - [이슈 제목]

이슈내용 : [description의 Function/Condition/Problem 기반으로 한국어 요약. 영향 모델·SW버전·재현 빈도 포함]

검토현황 : [코멘트 흐름(발견→원인분석→결정→조치)을 핵심만 한두 줄. 날짜는 M/D 형식]

## 작성 규칙
- 이슈 링크는 URL을 그대로 출력 (예: `https://harmony.lge.com:8443/issue/browse/WEEHKNRTK-1234`), `<a href>` 태그 사용 금지
- 이슈 링크 뒤에 이슈 제목만 표시, 상태(Open/In Progress/Closed 등) 표시 금지
- 이슈 링크 다음 한 줄 띄우고 이슈내용, 한 줄 띄우고 검토현황, 한 줄 띄우고 다음 이슈 작성
- 이슈 사이 구분선(`---`) 사용 금지
- 신규/검토 구분 소제목 없이 이슈를 순서대로 나열
- 이모티콘 사용 금지
- 이슈내용: 한국어로 간결하게. 재현 조건·영향 모델·버전 포함
- 검토현황: 이슈 흐름이 드러나도록 핵심만. 단순 확인 요청·전달은 생략
  - 사람 이름, 조직명 모두 표기 금지 — 행위와 결과만 서술
  - 날짜: M/D 형식 (예: 6/2)
  - 같은 단계의 내용은 합쳐서 표현, 사람별 나열 금지
- 지난주 내 코멘트가 없는 이슈는 검토현황을 "지난주 업데이트 없음"으로 표기
