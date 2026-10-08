JIRA 이슈를 깊게 분석하여 Confluence 분석 보고서 페이지를 작성합니다.

## 사용법
`/issue-deep <JIRA URL 또는 이슈 키>`

예시:
- `/issue-deep WEEHKNRTK-4654`
- `/issue-deep https://harmony.lge.com:8443/issue/browse/WEEHKNRTK-4654`

## 지시사항

1. `$ARGUMENTS`로 전달된 이슈 키 또는 URL로 `jira_get_issue`를 호출하세요.
   - harmony.lge.com URL이면 전체 URL을 그대로 전달

2. 이슈 데이터(description, comments, customfield_10002 등)를 분석하여 아래 섹션을 작성하세요.

3. 분석 내용을 먼저 채팅창에 마크다운으로 출력하고, 사용자에게 Confluence에 저장할지 확인하세요.

4. 사용자가 저장을 승인하면 `collab_writer` MCP의 `collab_create_page`로 페이지를 생성하세요.
   - space_key: WEE
   - parent_id: 2883272080  (80. 외부공유)
   - title: `{이슈키} {이슈 제목 한글 요약}`
   - content_type: markdown
   - 본문 맨 끝에 아래 HTML 주석을 반드시 추가하세요:
     `<!-- generated-by: issue-deep -->`

## 출력 형식 (마크다운)

# {이슈키} {이슈 제목} 분석 보고서

## 1. 이슈 링크
- JIRA: {이슈 URL}
- 연관 이슈: (있으면 나열)

## 2. 플랫폼
- OS Version: (webOS 버전)
- SoC / Chipset: (모델명)
- SW 버전: (버전 정보)
- 특이사항: (있으면 기재)

## 3. 이슈 발생 이력
| 날짜 | 주요 활동 및 업데이트 내용 |
|------|--------------------------|
| YYYY-MM-DD | 내용 |
(comments를 시간 순으로 읽어 주요 전환점만 표로 정리)

## 4. 재현 조건 및 현상
- **재현 경로**: (단계별로 간결하게)
- **현상 상세**: (구체적인 현상 설명)
- **재현 빈도**: Always / Intermittent

## 5. 원인 및 개선
- **근본 원인**: (분석된 원인, 미분석이면 "분석 중"으로 표기)
- **개선 방향**: (패치 내용 또는 대응 방향)
- **부작용(Side Effect)**: (있으면 기재)

## 6. 연관 이슈 및 패치
- TVPM: (있으면)
- CCC: (있으면)
- Gerrit 패치: (있으면)

## 7. 향후 대응 일정
- 현재 상태: {Open / In Progress / Resolved 등}
- (코멘트에서 일정 관련 내용 추출)

## 작성 규칙
- 정보가 없는 섹션은 "(정보 없음)" 대신 해당 섹션 자체를 생략
- 날짜는 YYYY-MM-DD 형식
- 기술 용어(SoC, TVPM, CCC 등)는 원문 그대로 유지
- 코멘트에서 단순 확인 요청은 생략, 분석 결과·결론·결정 사항만 이력에 포함
