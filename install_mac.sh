#!/usr/bin/env bash

rsync -r -u files/ ~/
rm ~/.bash_profile
rsync -r -u mac_files/ ~/
mkdir -p ~/.local/bin/
rsync -r -u bin/ ~/.local/bin/

echo "close and reopen"
