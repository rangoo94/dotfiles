#!/bin/bash

# Initialize scripts
source "$(dirname "$0")/../_init.sh"

# Install Xcode
if ! xcode-select --print-path &> /dev/null; then
  xcode-select --install &> /dev/null

  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done

  sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

  sudo xcodebuild -license accept
fi
