# -------
# Environment Variables
# -------

set --export proj $HOME/proj
        
set --export GOPATH $proj/go-workspace
set --export FERDPATH $proj/ferd
set --export AX_ENVIRONMENT local
set --export nvm_prefix $HOME/.nvm

set --export --prepend PATH $scripts $GOPATH/bin
set --export PGPASSWORD axcore

# -------
# Abbreviations
# -------

abbr --add --global abbr abbr --add --global
abbr ls 'colorls --sort-dirs'
abbr lsa 'colorls --long --sort-dirs --almost-all'
abbr lst 'colorls --tree --gs --sort-dirs --almost-all'
abbr vim 'nvim'
abbr g 'git'
abbr d 'docker'
abbr dc 'docker-compose'
abbr dps 'docker ps --format "table {{.Image}}\t{{.Names}}\t{{.Status}}"'
abbr npmls 'npm -g list --depth 0'

# ------
# Prompt
# ------

set fish_prompt_pwd_dir_length 0

function fish_prompt --description 'Write fish prompt'
	 printf '\n'
	 set_color cyan
	 echo (prompt_pwd) (set_color magenta)(parse_git_branch)
      	 set_color blue
      	 printf '\uf0e7 '
end	 


# -------
# Functions
# -------

function parse_git_branch --description 'Prints the git branch for the current directory, if there is one'
	     echo ' '(printf '\uE0A0') (git branch ^/dev/null | grep \* | sed 's/* //')
end

function cool_prompts --description 'Collection of cool prompt characters'
	 set -l chars '\u03FF \u1440 \u0720 \u1642 \u21AA \u226B \u227B \u22D9 \u09E7 \u27E9 \u27EB \u276F \u27A4'
      	 printf '\n'
	 printf $chars
	 printf '\n'
	 echo   $chars
end
