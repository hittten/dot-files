#!/usr/bin/env bash

rsync -r -u files/ ~/
mkdir -p ~/.local/bin/
rsync -r -u bin/ ~/.local/bin/

echo "close and reopen"
