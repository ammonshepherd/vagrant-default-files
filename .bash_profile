# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi;
source ~/.bashrc

##############################
#  User Defined Aliases

# Directory listing
alias lsd='ls -ld */.' #list only the directories
alias ls='ls --color=always' #show color files/folders
alias lsh='ls -lhA' #list all files/folders in long form

# Commands
alias rm="rm -i"
alias vim='vim -p' # allows vim to open multiple files in tabs

alias duh='dulist=$(du -sh */); for i in T G M K; do printf "$dulist"|egrep "^[0-9\.]+$i" | sort -rn; done'

# Colors
BLACK='\[\e[0;30m\]'
BLUE='\[\e[0;34m\]'
GREEN='\[\e[0;32m\]'
CYAN='\[\e[0;36m\]'
RED='\[\e[0;31m\]'
PURPLE='\[\e[0;35m\]'
BROWN='\[\e[0;33m\]'
LIGHTGRAY='\[\e[0;37m\]'
DARKGRAY='\[\e[1;30m\]'
LIGHTBLUE='\[\e[1;34m\]'
LIGHTGREEN='\[\e[1;32m\]'
LIGHTCYAN='\[\e[1;36m\]'
LIGHTRED='\[\e[1;31m\]'
LIGHTPURPLE='\[\e[1;35m\]'
YELLOW='\[\e[1;33m\]'
WHITE='\[\e[1;37m\]'
NC='\[\033[00m\]' #'\e[0m'              # No Color

export PS1="${BROWN}\u${LIGHTGRAY}@${PURPLE}\h ${CYAN}[\w]${BROWN}\n % ${NC}"
export LD_LIBRARY_PATH=/usr/local/lib


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

