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