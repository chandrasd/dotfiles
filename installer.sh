#!/bin/zsh

set -e

# Homebrew Setup
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! brew list | grep -q "bundle"; then
    brew tap Homebrew/bundle
fi

brew bundle

# ZSH Setup

SOURCE_ZSHRC="$(pwd)/.zshrc"
TARGET_ZSHRC="$HOME/.zshrc"

cp "$SOURCE_ZSHRC" "$TARGET_ZSHRC"
echo "Successfully copied .zshrc to $HOME"

# Need to copy config/ into ~/.config 