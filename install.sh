#!/usr/bin/env bash

rsync -r -u files/ ~/

# Detectar el sistema operativo
OS="$(uname -s)"

# Si el sistema operativo es Darwin (macOS)
if [ "$OS" = "Darwin" ]; then
  rsync -r -u mac_files/ ~/
fi

mkdir -p ~/.local/bin/
rsync -r -u bin/ ~/.local/bin/

echo "close and reopen"
