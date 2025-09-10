#!/bin/zsh

set -e

# Update brewfile
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update .zshrc

# Update ohmyposh config

# Update Editor configs

# Update ghostty config

# Stage and commit changes