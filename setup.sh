#!/bin/bash
# dotfiles setup script
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# .claude/commands 심볼릭 링크
mkdir -p ~/.claude
if [ -L ~/.claude/commands ]; then
  rm ~/.claude/commands
elif [ -d ~/.claude/commands ]; then
  echo "~/.claude/commands already exists as a real directory."
  echo "Backup: mv ~/.claude/commands ~/.claude/commands.bak"
  exit 1
fi

ln -sf "$DOTFILES_DIR/.claude/commands" ~/.claude/commands
echo "Linked: ~/.claude/commands -> $DOTFILES_DIR/.claude/commands"
