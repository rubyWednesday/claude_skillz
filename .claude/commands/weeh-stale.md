WEEHKNRTK 프로젝트의 Open/In Progress 이슈를 마지막 업데이트 기준으로 분류하고, 코멘트 없는 이슈도 목록화합니다.

## 사용법
`/weeh-stale`

## 지시사항

오늘 날짜를 먼저 확인한 뒤, 아래 3개 JQL을 `jira_search_jql`로 호출하세요 (모두 `include_secondary: true`).

> **제외 기준:** `BugPatch SU`, `SW Release` 관련 이슈는 모니터링 대상에서 제외합니다.
> JQL의 `summary !~ "BugPatch SU" AND summary !~ "SW Release"` 조건으로 필터링하세요.

**쿼리 1 — 2주 이상 업데이트 없음**
```
project = WEEHKNRTK AND status in (Open, "In Progress", "To Do") AND summary !~ "BugPatch SU" AND summary !~ "SW Release" AND updated <= -2w ORDER BY updated ASC
```
max_results: 50

**쿼리 2 — 1주~2주 업데이트 없음**
```
project = WEEHKNRTK AND status in (Open, "In Progress", "To Do") AND summary !~ "BugPatch SU" AND summary !~ "SW Release" AND updated > -2w AND updated <= -1w ORDER BY updated ASC
```
max_results: 50

**쿼리 3 — 코멘트 없는 이슈 (정확한 확인)**
```
project = WEEHKNRTK AND status in (Open, "In Progress", "To Do") AND summary !~ "BugPatch SU" AND summary !~ "SW Release" ORDER BY created DESC
```
max_results: 50

쿼리 3 결과의 각 이슈에 대해 `jira_get_issue`를 호출하여 `comment.total == 0`인 이슈만 추려내세요.
이슈 수가 많을 경우 최근 30일 이내 생성된 이슈를 우선 확인하고, 확인한 범위를 출력에 명시하세요.
(주의: JQL에서 `comment is EMPTY` 구문은 이 JIRA에서 동작하지 않으므로 개별 조회로 확인해야 합니다.)

## 출력 형식

### 🔴 2주 이상 무응답 (N건)
| 이슈 | 상태 | 요약 | 담당 | 마지막 업데이트 |
|------|------|------|------|----------------|
| [WEEHKNRTK-XXXX](url) | 🟡 In Progress | 요약 (40자) | 담당자 이름 | M/D (D일 경과) |

### 🟡 1주~2주 무응답 (N건)
(동일 형식)

### ⚪ 코멘트 없음 (N건)
| 이슈 | 상태 | 요약 | 담당 | 생성일 |
|------|------|------|------|--------|
| [WEEHKNRTK-XXXX](url) | 🔵 Open | 요약 | 담당자 이름 | M/D |

## 출력 규칙
- 이슈 키는 harmony URL 링크로 표시
- 담당자: 영문은 이름만, 한국어는 한글 이름만
- 날짜: M/D 형식, 경과일수 병기 (예: 5/19 (22일 경과))
- 요약이 40자 초과 시 자르고 "..." 추가
- 상태: Open → 🔵, In Progress → 🟡, FixReady → 🟢

## Confluence 페이지 자동 생성

조회 결과를 아래 위치에 **오늘 날짜** 제목으로 Confluence 페이지를 생성합니다.
확인 없이 바로 생성하세요 (skip confirmation).

- **Space:** WEE
- **Parent Page ID:** 3704149101
- **제목 형식:** `WEEHKNRTK Stale 현황 (YYYY-MM-DD)`
- **내용:** 위 출력 형식과 동일한 내용을 XHTML 테이블로 작성
  - `<h2>` 로 섹션 구분
  - 이슈 키는 `<a href="harmony URL">KEY</a>` 링크
  - 마지막에 `<p><em>생성: Claude Code /weeh-stale skill</em></p>` 추가
- 같은 날짜 제목의 페이지가 이미 존재하면 `collab_update_page`로 덮어쓰기
