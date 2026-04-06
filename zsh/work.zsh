# work                        — create/attach dev session
# work <project>              — new window with Claude on main branch
# work <project> <worktree>   — new window with Claude on an isolated worktree
work() {
  local session="dev"

  local in_tmux="${TMUX:-}"

  # No args: create or attach to the dev session
  if [ -z "$1" ]; then
    if [ -n "$in_tmux" ]; then
      return
    elif tmux has-session -t "$session" 2>/dev/null; then
      tmux attach -t "$session"
    else
      tmux new-session -s "$session" -n "shell"
    fi
    return
  fi

  local project="$1"
  local window="$project"
  local cmd="claude"

  if [ -n "$2" ]; then
    window="$project-$2"
    cmd="claude --worktree $2"
  fi

  # Ensure dev session exists
  if ! tmux has-session -t "$session" 2>/dev/null; then
    tmux new-session -d -s "$session" -n "shell"
  fi

  # Create window if it doesn't exist, otherwise select it
  if ! tmux select-window -t "$session:$window" 2>/dev/null; then
    tmux new-window -t "$session" -n "$window" -c "$DEV_DIR/$project" \; send-keys "$cmd" Enter
  fi

  # Attach or switch to the dev session
  if [ -z "$in_tmux" ]; then
    tmux attach -t "$session"
  else
    tmux switch-client -t "$session"
  fi
}

mkjira() {
  jira create \
    --noedit \
    --issuetype Task \
    --endpoint "$JIRA_ENDPOINT" \
    --login "$JIRA_LOGIN" \
    --project "$JIRA_PROJECT" \
    --override summary="$*"
}
