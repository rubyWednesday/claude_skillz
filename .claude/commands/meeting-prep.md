실통합점검회의용 이슈 정리를 작성합니다. 이슈 키를 입력하면 통점표 양식에 맞게 정리하여 Confluence 페이지에 작성합니다.

## 사용법
`/meeting-prep <이슈키1> <이슈키2> ...`

예시:
- `/meeting-prep WEEHKNRTK-4667 WEEHKNRTK-4670 WEECVTERTK-2862`

## 지시사항

### 1. 이슈 조회
`$ARGUMENTS`로 전달된 이슈 키들을 공백으로 분리하여, 각각 `jira_get_issue`를 호출하세요.
- harmony.lge.com URL이면 전체 URL을 그대로 전달
- 이슈 키만 있으면 `include_secondary: true`로 조회

### 2. 출력 형식

Confluence 페이지에 아래 표 형식으로 작성합니다. (xhtml 테이블)

| No. | Input | Harmony / Issue·Title | Platform | 진행 현황/대응 |
|-----|-------|----------------------|----------|--------------|

각 행의 내용:

- **No.**: 순번 (1, 2, 3...)
- **Input**: 이슈 생성일 또는 최초 보고일 (M/D 형식)
- **Harmony / Issue·Title**: 
  - 1행: harmony 이슈 링크 (클릭 가능한 URL)
  - 2행: 한글 이슈 요약 제목 (직접 작성)
- **Platform**: 플랫폼 정보 한 줄로 (예: WEE2.0S 1G KF23F webOS23)
- **진행 현황/대응**:
  - `이슈내용` — description의 Function/Condition/Problem 기반 한국어 요약. SW 버전, 재현 빈도 포함
  - `검토현황` — 코멘트에서 핵심 전환점만 추출. 날짜는 M/D 형식
  - 사람 이름·조직명 표기 금지, 행위와 결과만 서술

### 3. 저장
- 먼저 채팅창에 표 형태로 미리보기 출력
- 사용자에게 저장할 통점 페이지 URL 또는 pageId를 물어보세요
  - 통점 페이지 위치: "25년 실통합점검회의" 하위의 월별 페이지 → 그 아래 주차별 페이지 (예: `260616_실통합점검회의`)
  - 페이지 내 "주요 진행 현황" 표의 기존 빈 행(No.1 등)에 내용을 채워 넣는 방식
- 승인 시 해당 페이지의 기존 표에 행을 추가/수정 (collab_update_page)
- 본문 맨 끝에 `<!-- generated-by: meeting-prep -->` 주석 추가

### 4. 작성 규칙
- 이슈 링크: 클릭 가능한 하이퍼링크 (`<a href="URL">WEEHKNRTK-XXXX</a>`)
- 한글 이슈 요약 제목: 영문 제목을 의역하여 간결한 한국어로 (예: "홈허브 진입시 블랙스크린 발생")
- Platform: `WEE버전 메모리 모델명 webOS버전` 형태 (예: WEE3.0 UHD KF23U webOS25)
- 검토현황은 줄바꿈으로 구분하여 시간 순 나열
- 이모티콘 사용 금지
