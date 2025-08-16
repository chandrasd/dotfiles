# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Setup oh-my-posh
eval "$(oh-my-posh init zsh --config 'hul10')"

plugins=(git)

source $ZSH/oh-my-zsh.sh


# set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# zoxide setup
eval "$(zoxide init zsh)"

# Aliases - movement
alias cd="z"
alias goto='cd "$(find . -type d -not -path "*/\.*" | fzf)"'

# Aliases - git
alias gaa="git add -A"

source /Users/chandradasari/.docker/init-zsh.sh || true # Added by Docker Desktop
source $(brew --prefix nvm)/nvm.sh

function lazygit() {
  git add .
  git commit -m "$1"
  git push
}

# fzf into git branches
function git-fzf() {
    local branch
    branch=$(git for-each-ref --format='%(refname:short) %(committerdate:short) %(authorname) %(contents:subject)' refs/heads/ |
        column -t -s ' ' |
        fzf --preview "git log --oneline --graph --date=short --color=always --pretty='format:%C(auto)%cd %h%d %s' {1} | head -20" |
        awk '{print $1}') &&
    git checkout "$branch"
}


export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"

[[ "$TERM_PROGRAM" == "CodeEditApp_Terminal" ]] && . "/Applications/CodeEdit.app/Contents/Resources/codeedit_shell_integration.zsh"

# bun completions
[ -s "/Users/chandradasari/.bun/_bun" ] && source "/Users/chandradasari/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "/Users/chandradasari/.deno/env"


# opencode
export PATH=/Users/chandradasari/.opencode/bin:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

DISABLE_AUTO_TITLE="true"

# zsh syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

