# -------
# Environment Variables
# -------

set --export repos $HOME/home/repos
set --export scripts $HOME/home/scripts

set --export GOPATH $repos/go-workspace
set --export FERDPATH $repos/ferd
set --export AX_ENVIRONMENT local

set --export --prepend PATH $scripts $GOPATH/bin
set --export PGPASSWORD axcore

# -------
# Abbreviations
# -------

abbr --add --global abbr abbr --add --global
abbr vpn 'sudo killall openvpn; sudo nohup openvpn --config $HOME/.max@axoni.com.ovpn &'
abbr ls 'colorls --sort-dirs'
abbr lsa 'colorls --long --sort-dirs --almost-all'
abbr vim 'nvim'
abbr g 'git'
abbr d 'docker'
abbr dps 'docker ps --format "table {{.Image}}\t{{.Names}}\t{{.Status}}"'
abbr wifi 'nmtui'

# ------
# Prompt
# ------

set fish_prompt_pwd_dir_length 0

function fish_prompt --description 'Write fish prompt'
	 printf '\n'
	 set_color cyan
	 echo (prompt_pwd) (set_color magenta)(parse_git_branch)
      	 set_color blue
      	 printf '\u226B '
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
