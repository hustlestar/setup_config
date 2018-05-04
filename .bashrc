cyan=$(tput setaf 6);
yellow=$(tput setaf 3);
green=$(tput setaf 2);
white=$(tput setaf 7);
bold=$(tput bold);
reset=$(tput sgr0);

PS1="\[${bold}\]\n";
PS1+="\[${cyan}\]\u"; #username
PS1+="\[${white}\] at ";
PS1+="\[${yellow}\]\h"; #host
PS1+="\[${white}\] in ";
PS1+="\[${green}\]\w"; # working dir full path
PS1+="\n";
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` and reset color
export PS1;

function shut_all_prcs() {
for pid in `ps -ux | grep "$1"| awk '{print $2}'`; do kill -9 $pid; done
}

# git aliases
alias gs='git status'
alias gpu='git push -u origin'
alias ga='git add'
alias gc='git checkout'
alias gcm='git commit -m'
alias gb='git branch'

# linux aliases
alias ..='cd ..'
alias ...='cd ../..'
alias shut="shut_all_prcs" # takes a process name as parameter
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'

# docker aliases
alias d='docker '
alias c=' container '
alias b=' build '
alias i=' image '
alias r=' run '