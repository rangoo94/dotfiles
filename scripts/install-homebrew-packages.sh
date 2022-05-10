#!/bin/bash

brew update
brew upgrade
brew tap homebrew/cask-versions
brew tap colindean/fonts-nonfree

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/_init.sh"

# Detect installed apps

HAD_ADOBE_CC_INSTALLED=0
if brew ls --versions adobe-creative-cloud > /dev/null; then
  HAD_ADOBE_CC_INSTALLED=1
fi

# Install all applications

HOMEBREW_CONFIG_PATH="$(dirname "${BASH_SOURCE[0]}")/../homebrew"

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

add_to_bash_profile "Ruby Path" "export PATH=\"/usr/local/opt/ruby/bin:\$PATH\""
