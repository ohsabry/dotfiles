alias :q='exit'
alias mkdir='mkdir -p'
alias dtf="cd ~/dev/dotfiles"

alias ev='vim ~/.vimrc'

alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'

alias paths='echo $PATH | tr \: \\n'
alias note='touch $(date "+%Y_%m_%d.md")'

alias cat='bat'
alias ls="eza -lah"

alias p8="cd ~/Library/Application\ Support/pico-8/carts"

alias vsext="code --list-extensions | sort > ~/dev/dotfiles/vscode/extensions.txt && echo 'VS Code extensions saved'"
