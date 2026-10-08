# dotfiles

개인 Claude Code 스킬 & 커맨드 모음

## 설치

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash setup.sh
```

## 구조

```
.claude/
└── commands/        # /worklog, /issue-summary 등 Claude Code 커맨드
```

## 커맨드 목록

| 커맨드 | 설명 |
|--------|------|
| `/worklog` | JIRA 워크로그 추천 및 입력 |
| `/issue-summary` | JIRA 이슈 한국어 요약 |
| `/issue-deep` | JIRA 이슈 상세 분석 |
| `/meeting-prep` | 회의 준비 |
| `/weeh-weekly` | WEEH 주간 이슈 정리 |
| `/weeh-issues` | WEEH 이슈 목록 |
| `/weeh-mr-label` | WEEH MR 라벨 관리 |
| `/weeh-stale` | WEEH 오래된 이슈 확인 |
