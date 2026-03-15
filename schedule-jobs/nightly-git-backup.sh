#!/bin/bash
# Nightly git backup for ~/.tinyclaw and ~/.claude/skills
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
ERRORS=0

backup_repo() {
    local dir="$1"
    local name="$2"
    cd "$dir" || { echo "ERROR: Cannot cd to $dir"; return 1; }

    # Stage all changes
    git add -A

    # Only commit if there's something to commit
    if ! git diff --cached --quiet; then
        git commit -m "Nightly backup — $TIMESTAMP" --no-gpg-sign
    fi

    # Always push (in case previous push failed)
    git push origin main 2>&1 || git push origin master 2>&1
}

backup_repo "$HOME/.tinyclaw" "tinyclaw"
backup_repo "$HOME/.claude/skills" "claude-skills"
