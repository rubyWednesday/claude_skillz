WEEHKNRTK 프로젝트에서 특정 칩/MR에 반영되어야 하는 버그 이슈를 찾아 라벨을 추가합니다.

## 사용법
`/weeh-mr-label <chip> <mr번호>`

예시:
- `/weeh-mr-label k24n mr5`
- `/weeh-mr-label k25lp mr6`

## 지시사항

### 1. 인자 파싱
- `$ARGUMENTS`에서 chip 이름과 MR 번호를 추출
- chip: k24n, k25lp 등 (대소문자 무시)
- MR 번호: mr5, mr6 등

### 2. 칩별 설정 매핑

| chip | customfield_13830 값 | 라벨 형식 |
|------|---------------------|-----------|
| k24n | K24nWee | target.wee30_k24n_uhd.{mr} |
| k25lp | K25lpWee | target.wee30_k25lp_uhd.{mr} |

- `{mr}` 자리에 mr5, mr6 등을 대입

### 3. 이슈 검색
`jira_search`를 두 번 호출하세요 (`include_secondary: true` 필수):

**검색 1 - Open/In Progress/FixReady:**
```
project = "WEEHKNRTK" AND (cf[13830] in ("{chip_value}") OR summary ~ "{chip}") AND statusCategory != Done
```

**검색 2 - Resolved/FixReady (추가 확인용):**
```
project = "WEEHKNRTK" AND (cf[13830] in ("{chip_value}") OR summary ~ "{chip}") AND status in ("FixReady", "Resolved")
```

- `max_results: 50`

### 4. 버그 필터링 (자동 판단)

**포함 (버그):** 화면 결함, 기능 미동작, 크래시, 깜빡임, 블랙스크린, 지연, 데이터 미저장 등 실제 현상이 있는 이슈

**제외 (버그 아님):**
- SW Release / MP Release / BugPatch Release
- NSU Test Report / Vendor Test Report
- eMMC AVL 확장 / Vendor Expansion
- 요청 (Request) / 문의 / 가이드
- 일정 (Schedule) / 개발 계획
- Schematic Review / 설계 논의
- 생산 택트타임 조사
- custompack 공유 요청
- Widevine Key / DRM 관련 요청
- Tool/Simulator 배포

### 5. 결과 출력

먼저 버그로 판단된 이슈 목록을 표로 출력하세요:

```
**수평전개 대상 이슈** (chip: {chip}, 라벨: `{label}`)

| # | 이슈 키 | 상태 | Summary |
|---|---------|------|---------|
| 1 | WEEHKNRTK-XXXX | 상태 | 요약 |
```

그 다음, 제외한 이슈도 간략히 보여주세요:
```
**제외 (버그 아님):** XXXX(SW Release), YYYY(AVL 확장), ...
```

### 6. 사용자 확인 후 라벨 추가

- 사용자에게 "위 N개 이슈에 `{label}` 라벨을 추가할까요?" 확인
- 사용자가 수정 요청하면 반영 (특정 이슈 빼기/추가 등)
- 승인되면 `jira_update_issue`로 각 이슈에 labels 추가
  - issue_key는 harmony URL 형식: `https://harmony.lge.com:8443/issue/browse/{이슈키}`

### 7. 완료 보고
```
✅ {N}개 이슈에 `{label}` 라벨 추가 완료
```

## 주의사항
- labels 업데이트 시 기존 라벨이 덮어써질 수 있으므로, 가능하면 기존 라벨을 유지하면서 추가할 것
- Resolved 이슈는 별도로 "이전 MR에 이미 반영된 것일 수 있음"을 안내
- 판단이 애매한 이슈는 "경계선" 카테고리로 분리하여 사용자에게 판단 위임
