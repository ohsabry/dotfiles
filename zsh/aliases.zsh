alias :q='exit'
#alias ls="ls -lAh"
alias  ls="exa -lah"
alias mkdir='mkdir -p'
alias dtf="cd ~/.dotfiles"

alias ev='vim ~/.vimrc'
alias bs="browser-sync start --server --files '**/*.css, **/*.html, **/*.js, !node_modules/**/*' --directory --port 7777 --browser 'Firefox'"

alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'

alias paths='echo $PATH | tr \: \\n'
alias note='touch $(date "+%Y_%m_%d.md")'

alias cat='bat'
alias ls="exa -lah"

alias p8="cd ~/Library/Application\ Support/pico-8/carts"

alias nvmn='[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'
