#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Helper Functions ---
install_package() {
    if [ "$(uname)" == "Darwin" ]; then
        if ! command -v brew &> /dev/null; then
            echo "Homebrew not found. Please install it first."
            exit 1
        fi
        brew install "$1"
    else
        sudo apt-get update
        sudo apt-get install -y "$1"
    fi
}

# --- Zsh Installation ---
if ! command -v zsh &> /dev/null; then
    echo "zsh could not be found, installing..."
    install_package zsh
fi

# --- Set zsh as default shell ---
# Check if the user's login shell is already zsh
if ! getent passwd "$USER" | cut -d: -f7 | grep -q "zsh"; then
    echo "Setting zsh as default shell..."
    # This command usually requires user password
    chsh -s "$(which zsh)"
    echo "Default shell changed to zsh. You may need to log out and log back in for the change to take effect."
else
    echo "zsh is already the default shell."
fi

# --- Powerlevel10k Installation ---
if [ ! -d "$HOME/powerlevel10k" ]; then
  echo "Instalando Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
else
  echo "Powerlevel10k is already installed."
fi

# --- File Synchronization ---
echo "Copying configuration files (new files only)..."
# -r: recursive, -v: verbose, --ignore-existing: don't overwrite
rsync -rv --ignore-existing files/ ~/

# macOS specific files
if [ "$(uname -s)" = "Darwin" ]; then
  echo "Copying macOS specific configuration files (new files only)..."
  rsync -rv --ignore-existing mac_files/ ~/
fi

# Binaries
echo "Copying binary files (new files only)..."
mkdir -p ~/.local/bin/
rsync -rv --ignore-existing bin/ ~/.local/bin/

echo "------------------------------------------------"
echo "Installation complete!"
echo "Please close and reopen your terminal."
echo "If zsh doesn't start, you may need to log out and log back in."
echo "Run 'p10k configure' to customize your prompt."
echo "------------------------------------------------"
