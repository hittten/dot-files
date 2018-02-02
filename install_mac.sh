#!/usr/bin/env bash
rsync -r -u files/ ~/

rm -f ~/.bashrc

rsync -r -u mac_files/ ~/

source ~/.bash_profile
