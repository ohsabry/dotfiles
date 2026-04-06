# dotfiles

macOS development environment managed from `~/dev/dotfiles` (configurable via `$DEV_DIR`).

## Setup
- `script/bootstrap` — fresh install (symlinks + installs everything)
- `dot` — sync everything (brew, mise, VS Code, iTerm, starship)
- `vsext` — save current VS Code extensions to `vscode/extensions.txt`
- `vim +PlugInstall` — install vim plugins (first time only)

## Structure
- `*.symlink` files get symlinked to `~/` by bootstrap (e.g., `zsh/zshrc.symlink` → `~/.zshrc`)
- `*.zsh` files in `zsh/` are auto-sourced by zshrc
- `~/.localrc` holds machine-specific credentials (not tracked)

## Code style
- Shell scripts: bash, no `set -e`, explicit `|| fail` on critical commands
- Quote all variables: `"$foo"` not `$foo`
- No `|| true` or `2>/dev/null` to suppress errors
- Tabs in gitconfig, 2-space indent everywhere else

## Key tools
- **mise** manages node/python/ruby/go/deno (replaces nvm, pyenv, rbenv)
- **starship** prompt config lives in `starship.toml` (copied to `~/.config/` by dot)
- **catppuccin mocha** theme everywhere (vim, tmux, iTerm)
- **delta** for git diffs
