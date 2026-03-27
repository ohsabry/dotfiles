BREW_PREFIX="${BREW_PREFIX:-$(brew --prefix)}"
[ -f "$BREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ] && \
  source "$BREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
