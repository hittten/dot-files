#!/usr/bin/env bash

rsync -r -u files/ ~/
rsync -r -u mac_files/ ~/
mkdir -p ~/.local/bin/
rsync -r -u bin/ ~/.local/bin/

echo "close and reopen"
