# Dot files

Pretty bash terminal (windows: git-bash) with git and more.

## Install

- bash: `./install.sh`
- windows: (git-bash) `./install_win.sh`

After install please update `~/.gitconfig` with your name and email 

## Features

### Bash aliases
```bash
alias ll='ls -lF'
alias la='ls -AlF'
alias l='ls -CF'
alias sl='ls'
alias cd..='cd ..'
alias gti='git'
alias gz='tar czvf'
alias ugz='tar xzvf'
alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'
```

### Git config

```
[alias]
    st = status -sb
    ci = commit
    co = checkout
    br = branch
    df = diff
    pr = pull --rebase --stat
    lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %Cblue<%an>%Creset' --abbrev-commit --date=relative --all
[color]
    ui = always
[core]
    editor = vim
    excludesfile = ~/.gitignore
    autocrlf = input
[user]
    name = usuario
    email = usuario@email.com
```
