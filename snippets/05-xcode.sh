#!/bin/bash

if macos; then
  header "Install XCode"

  mas install 497799835

  if ! xcode-select --print-path &> /dev/null; then
    xcode-select --install &> /dev/null

    until xcode-select --print-path &> /dev/null; do
      sleep 5
    done
  fi

  sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
  sudo xcodebuild -license accept

  success "XCode configured."
fi
