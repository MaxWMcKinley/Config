# ----------------------------------------------------------------------
# Packages
# ----------------------------------------------------------------------

source $HOME/home/.antigen.zsh

antigen use oh-my-zsh

antigen bundle docker
antigen bundle pj
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle djui/alias-tips
antigen bundle marzocchi/zsh-notify
antigen bundle command-not-found

antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

antigen apply

autoload zmv

autoload -U tetris
zle -N tetris
bindkey tetris tetris


# ----------------------------------------------------------------------
# exports
# ----------------------------------------------------------------------

export SPACESHIP_CHAR_COLOR_SUCCESS=magenta;
export SPACESHIP_CHAR_COLOR_SECONDARY=blue;
export SPACESHIP_USER_PREFIX=as;
export SPACESHIP_GIT_BRANCH_COLOR=blue;
export SPACESHIP_GIT_STATUS_PREFIX=' ';
export SPACESHIP_GIT_STATUS_SUFFIX='';
export SPACESHIP_PACKAGE_SYMBOL='';

export REPOS=$HOME/home/repos
export SCRIPTS=$HOME/home/scripts

export PROJECT_PATHS=($REPOS)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=blue"


# ----------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------

alias ..='cd ..'
alias apt-rm='sudo apt-get --purge autoremove'
alias ls='colorls --sort-dirs'
alias lsa='colorls --long --sort-dirs --almost-all'
alias vim='nvim'
alias zcp='zmv -C'
alias zln='zmv -L'
alias g='git'
alias d='docker'
alias dps='docker ps --format "{{.ID}} {{.Names}} {{.Status}}"'
alias s='sudo systemctl'
alias info='neofetch'
alias wifi='nmtui'

export NVM_DIR="/home/max/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# startup virtualenv-burrito
if [ -f $HOME/.venvburrito/startup.sh ]; then
    . $HOME/.venvburrito/startup.sh
fi

# ----------------------------------------------------------------------
# Import local config
# ----------------------------------------------------------------------
source $HOME/.localrc