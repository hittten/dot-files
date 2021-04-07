#!/usr/bin/env bash

Robocopy files/ ~/ -s
mkdir -p ~/.local/bin/
Robocopy bin/ ~/.local/bin/ -s

echo "close and reopen"
