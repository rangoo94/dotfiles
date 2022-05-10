#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/../_init.sh"

# Install Xcode

mas install 497799835

# Set up Xcode
if ! xcode-select --print-path &> /dev/null; then
  xcode-select --install &> /dev/null

  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done

  if [[ -x "/Applications/Xcode.app" ]]; then
    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
    sudo xcodebuild -license accept
  fi
fi
