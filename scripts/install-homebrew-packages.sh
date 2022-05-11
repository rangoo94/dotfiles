#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/_init.sh"

# Show step information
header "Install Homebrew packages"

# Set up basics

brew update
brew upgrade
mas upgrade

# Detect installed apps

HAD_ADOBE_CC_INSTALLED=0
if brew ls --versions adobe-creative-cloud > /dev/null; then
  HAD_ADOBE_CC_INSTALLED=1
fi

# Install all applications

HOMEBREW_CONFIG_PATH="$(dirname "${BASH_SOURCE[0]}")/../config"

brew bundle --file="$HOMEBREW_CONFIG_PATH/Brewfile"

if [[ "$IS_WORK" == "true" ]]; then
  brew bundle --file="$HOMEBREW_CONFIG_PATH/Brewfile.work"
fi

if [[ "$IS_FUN" == "true" ]]; then
  brew bundle --file="$HOMEBREW_CONFIG_PATH/Brewfile.fun"
fi

# Apply required changes for the apps

if [[ "$HAD_ADOBE_CC_INSTALLED" == "0" ]]; then
  open "/usr/local/Caskroom/adobe-creative-cloud/latest/Creative Cloud Installer.app" || echo "OK"
fi

add_to_bashrc "Ruby Path" "export PATH=\"/usr/local/opt/ruby/bin:\$PATH\""
add_to_bashrc "Open SSL Path" "export PATH=\"/usr/local/opt/openssl@3/bin:\$PATH\""
