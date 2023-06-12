# Human readable colors
source ~/.profile
source ~/.bash_colors

# prompt
GIT_PS1_SHOWDIRTYSTATE=true

host_color=$BRIGHT_GREEN

if [ "$(whoami)" = "root" ]; then
host_color=$BRIGHT_RED
fi

# prompt modules
host="\n${BRIGHT_GREEN}┌ ${RESET}\${debian_chroot:+($debian_chroot)}$host_color\u@\h"
date="${RESET} \d \t"
git="${BRIGHT_YELLOW}\$(__git_ps1)${RESET}"
path="${BRIGHT_BLUE}\w${RESET}"

PS1="${host} ${date} ${memory} ${battery}\n${BRIGHT_GREEN}└${RESET} ${path}${git}\$ "

unset host_color
