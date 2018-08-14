source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle docker
antigen bundle pj

antigen apply

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=magenta"

autoload -U promptinit; promptinit
PURE_GIT_DELAY_DIRTY_CHECK=600
prompt pure

export GOPATH=$HOME/home/repos/go-workspace
export PATH=$PATH:$GOPATH/bin

export PROJECT_PATHS=(~/home/repos/ ~/.axops/localdata/)

alias g='git'
alias d='docker'

alias ls='colorls --sort-dirs'
alias lsa='colorls --long --sort-dirs --almost-all'

alias dc='docker-compose -f /Users/max/home/docker-compose.yml'