#!/bin/zsh

set -e

# Update brewfile
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle dump --global --force
cp -v ~/.Brewfile .

# Update .zshrc
cp -v ~/.zshrc ./shell/.zshrc

# Update ohmyposh config
cp -v ~/.customtheme.omp.json ./shell/.customtheme.omp.json

# Update Editor configs

cp -v ~/.config/zed/settings.json ./.config/zed/settings.json
# Update ghostty config

cp -v ~/.ghostty/config ./.ghostty/config

# Stage and commit changes

gaa
gcmsg "automated: updating configs on $(date '+%Y-%m-%d %H:%M:%S')"