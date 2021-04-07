# Human readable colors
source ~/.bash_colors

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# prompt
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

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
