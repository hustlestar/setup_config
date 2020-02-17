source ~/.git_prompt

if tput setaf 1 &> /dev/null; then
    tput sgr0
    BLACK=$(tput setaf 0)
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
        RED=$(tput setaf 160)
        GREEN=$(tput setaf 118)
        YELLOW=$(tput setaf 226)
        BLUE=$(tput setaf 27)
        PURPLE=$(tput setaf 141)
        CYAN=$(tput setaf 51)
        WHITE=$(tput setaf 255)
    else
        RED=$(tput setaf 1)
        GREEN=$(tput setaf 2)
        YELLOW=$(tput setaf 3)
        BLUE=$(tput setaf 4)
        PURPLE=$(tput setaf 5)
        CYAN=$(tput setaf 6)
        WHITE=$(tput setaf 7)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    RESET="\[\033[0m\]"
    # ASCII Oct Regular Colors
    BLACK="\[\033[0;30m\]"        # Black
    RED="\[\033[0;31m\]"          # Red
    GREEN="\[\033[0;32m\]"        # Green
    YELLOW="\[\033[0;33m\]"       # Yellow
    BLUE="\[\033[0;34m\]"         # Blue
    PURPLE="\[\033[0;35m\]"       # Purple
    CYAN="\[\033[0;36m\]"         # Cyan
    WHITE="\[\033[0;37m\]"        # White
fi
# \012 is \n in ASCII, trick for Windows
PS1="\[${BOLD}\]\012";
PS1+="\[${CYAN}\]\u"; #username
PS1+="\[${WHITE}\] at ";
PS1+="\[${YELLOW}\]\h"; #host
PS1+="\[${WHITE}\] in ";
PS1+="\[${GREEN}\]\w"; # working dir full path
PS1+="\$(prompt_git \"\[${WHITE}\] on \[${BLUE}\]\" \"\[${BLUE}\]\")"; # Git repository details
PS1+="\012";
PS1+="\[${WHITE}\]\$ \[${RESET}\]"; # `$` and reset color
export PS1;

# Git branch bash completion
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
  # Add git completion to aliases
  __git_complete gc _git_checkout
fi

# Avoid duplicates
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# git aliases
alias gs='git status'
alias gpu='git push -u origin'
alias ga='git add'
alias gc='git checkout'
alias gcm='git commit -m'
alias gb='git branch'
alias gp='git pull'

# linux aliases
alias ..='cd ..'
alias ...='cd ../..'
export HISTTIMEFORMAT="%d/%m/%y %T " # to show datetime in history command
alias hist="history | tail -n 30" # last 30 commands in history
alias untar="tar -xvzf" # extracts .tgz archive

function shut_all_prcs() {
    for pid in `ps -ux | grep -v | grep "$1"| awk '{print $2}'`; do kill -9 $pid; done
    echo "Killed all " $1 " processes"
}
funcion pull_all() {
    find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
}
alias pr="pull_all"
alias shut="shut_all_prcs" # takes a process name as parameter
alias l.='ls -d .*'
alias ll='ls -l'
alias ls='ls'

# docker aliases
alias dd='docker'
alias dc='docker container'
alias db='docker build '
alias di='docker image '
alias dr='docker run '
alias dl='docker logs '
alias de='docker exec '

# kubernetes aliases
alias kk='sudo kubectl'
alias kubectl='sudo kubectl'
alias kp='sudo kubectl get pods'
alias kn='sudo kubectl get nodes'
alias kd='sudo kubectl get deployments'
alias ks='sudo kubectl get services'
alias kl='sudo kubectl logs'
alias ke='sudo kubectl exec'

