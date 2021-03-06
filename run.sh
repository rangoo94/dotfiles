#!/bin/bash

set -e

# Start in current directory
cd "$(dirname "$0")"

# Ensure proper accesses
if [[ "$OSTYPE" == "darwin"* ]]; then
  . ./scripts/osx/ensure-environment.sh
fi

. ./scripts/ensure-access.sh

# Configure OSX
if [[ "$OSTYPE" == "darwin"* ]]; then
  . ./scripts/osx/install-xcode.sh
  . ./scripts/osx/configure-defaults.sh
  . ./scripts/osx/optimize-battery-and-fs.sh
fi

# Install Homebrew
. ./scripts/install-homebrew.sh

# Install some packages
. ./scripts/install-homebrew-packages.sh
. ./scripts/install-docker-utils.sh

# Install Node.js
. ./scripts/install-nodejs.sh

# Set default browser to Google Chrome Canary
if [[ "$OSTYPE" == "darwin"* ]]; then
  . ./scripts/osx/set-default-chrome-browser.sh
fi

# Set up Git user
. ./scripts/set-up-git.sh

# Reboot

reboot () {
  read -p "Do you want to reboot your computer now? (y/N)" choice
  case "$choice" in
    y | Yes | yes ) echo "Yes"; exit;;
    n | N | No | no) echo "No"; exit;;
    * ) echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return;;
  esac
}

echo "Everything is done! Do you want to reboot now (y/n)?"

# Call on the function
if [[ "Yes" == $(reboot) ]]
then
  echo "Rebooting."
  sudo reboot
  exit 0
else
  exit 1
fi
