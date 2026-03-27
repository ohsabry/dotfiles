# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Selection menu on TAB
zstyle ':completion:*' menu select

# Colorize completions using LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending
