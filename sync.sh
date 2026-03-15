#!/bin/bash
# Rebuild ~/.claude/CLAUDE.md from shared rules + machine-local config.
# Source of truth: claude_config repo (shared-rules.md on server).
#
# Usage: bash sync.sh [mac|server]
# Auto-detects if not specified.

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Auto-detect machine
if [[ -z "$1" ]]; then
  if [[ "$(uname)" == "Darwin" ]]; then
    MACHINE="mac"
  else
    MACHINE="server"
  fi
else
  MACHINE="$1"
fi

# Pull latest shared rules
cd "$SCRIPT_DIR"
git pull --quiet 2>/dev/null || true

LOCAL_FILE="$SCRIPT_DIR/local-${MACHINE}.md"
SHARED_FILE="$SCRIPT_DIR/shared-rules.md"

if [[ ! -f "$LOCAL_FILE" ]]; then
  echo "Error: $LOCAL_FILE not found"
  exit 1
fi

if [[ ! -f "$SHARED_FILE" ]]; then
  echo "Error: $SHARED_FILE not found"
  exit 1
fi

# Determine target
if [[ "$MACHINE" == "mac" ]]; then
  TARGET="$HOME/.claude/CLAUDE.md"
else
  TARGET="$HOME/.claude/CLAUDE.md"
fi

mkdir -p "$(dirname "$TARGET")"

# Concatenate: local header + shared rules
cat "$LOCAL_FILE" > "$TARGET"
echo "" >> "$TARGET"
cat "$SHARED_FILE" >> "$TARGET"

echo "Rebuilt $TARGET from $LOCAL_FILE + $SHARED_FILE"
