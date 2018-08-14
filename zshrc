# ----------------------------------------------------------------------
# Packages
# ----------------------------------------------------------------------

source $HOME/home/.antigen.zsh

antigen use oh-my-zsh

antigen bundle docker
antigen bundle pj
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')
autoload -U promptinit; promptinit
PURE_GIT_DELAY_DIRTY_CHECK=600
prompt pure

# ----------------------------------------------------------------------
# exports
# ----------------------------------------------------------------------

export GOPATH=$HOME/home/repos/go-workspace
export PATH=$PATH:$GOPATH/bin

export PROJECT_PATHS=(~/home/repos/ ~/.axops/localdata/)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"


# ----------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------

alias ..='cd ..'
alias apt-rm='sudo apt-get --purge autoremove'

alias g='git'
alias d='sudo docker'

alias ls='colorls --sort-dirs'
alias lsa='colorls --long --sort-dirs --almost-all'

alias dc='docker-compose -f /Users/max/home/docker-compose.yml'