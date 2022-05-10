#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/../_init.sh"

# Show step information
header "OSX: Install Xcode"

# Install Xcode

mas install 497799835

# Set up Xcode
if ! xcode-select --print-path &> /dev/null; then
  xcode-select --install &> /dev/null

  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done
fi

sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -license accept
