#!/bin/bash

set -e

# Start in current directory
cd "$(dirname "${BASH_SOURCE[0]}")"

# Confirm configuration
. ./scripts/_init.sh

# Ensure proper accesses
if macos; then
  . ./scripts/osx/ensure-environment.sh
fi

. ./scripts/ensure-access.sh

# Create basic directories
. ./scripts/create-directories.sh

# Configure OSX
if macos; then
  . ./scripts/osx/configure-defaults.sh
  . ./scripts/osx/optimize-battery-and-fs.sh
  . ./scripts/osx/set-hostnames.sh
fi

# Install Homebrew
. ./scripts/install-homebrew.sh

# Install some packages
if macos; then
  . ./scripts/osx/install-xcode.sh
fi
. ./scripts/install-homebrew-packages.sh
. ./scripts/install-docker-utils.sh

# Install Node.js
if [[ "$IS_WORK" == "true" ]]; then
  . ./scripts/install-nodejs.sh
fi

# Set default browser to Google Chrome or Google Chrome Canary
if macos; then
  . ./scripts/osx/set-default-browser.sh
fi

# Set up Git user
. ./scripts/set-up-git.sh

# Set up aliases
. ./scripts/aliases.sh

# Reboot

reboot () {
  read -p "Do you want to reboot your computer now? (y/N)" choice
  case "$choice" in
    y | Yes | yes ) echo "Yes"; exit;;
    n | N | No | no) echo "No"; exit;;
    * ) echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return;;
  esac
}

header "Finished"

# Call on the function
if [[ "Yes" == $(reboot) ]]
then
  echo "Rebooting."
  sudo reboot
  exit 0
else
  exit 1
fi
