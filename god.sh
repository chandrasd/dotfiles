#!/bin/zsh

set -e

if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! brew list | grep -q "bundle"; then
    brew tap Homebrew/bundle
fi

brew bundle

if [ -f "$HOME/.bashrc" ]; then
    # Need to replace the file
fi

if [ -f "$HOME/.zshrc" ]; then
    # Need to replace the file and the else part
fi
