#!/bin/bash

set -e

# Start in current directory
cd "$(dirname "${BASH_SOURCE[0]}")"

# Initialize framework
source ./framework/init.sh

# Load the credentials
info "Hello!"$'\n\n'"This wizard will take you through the configuration process."$'\n'"You may be asked for the password to get root permissions."
keep_sudo_access

# Set up variables
header "Configuration ($DOTFILES_PATH}/.dotconfig)"
variable_wizard

# Confirmation
header "Confirm"
read -p $BOLD"Do you want to continue?"$FORMAT_END" [Y/n] " -n 1 -r
echo
if ! [[ $REPLY =~ ^[Yy]*$ ]]; then
    echo "Closing then."
    exit 0
fi

# Start
close_everything
for f in $(dirname "${BASH_SOURCE[0]}")/snippets/*.sh; do source $f; done

# Display post instructions
postinstructions_display

# Reboot

header "Finish!"

read -p $BOLD"Do you want to reboot now?"$FORMAT_END" [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Rebooting."
  sudo reboot
fi

## Confirm configuration
#. ./scripts/_init.sh
#
## Ensure proper accesses
#if macos; then
#  . ./scripts/osx/ensure-environment.sh
#fi
#
#. ./scripts/ensure-access.sh
#
## Create basic directories
#. ./scripts/create-directories.sh
#
## Configure OSX
#if macos; then
#  . ./scripts/osx/configure-defaults.sh
#  . ./scripts/osx/optimize-battery-and-fs.sh
#  . ./scripts/osx/set-hostnames.sh
#fi
#
## Install Homebrew
#. ./scripts/install-homebrew.sh
#
## Install some packages
#if macos; then
#  if [[ "$HAS_TOUCHBAR" == "true" ]]; then
#    . ./scripts/osx/configure-touchbar.sh
#  fi
#  . ./scripts/osx/install-xcode.sh
#fi
#. ./scripts/install-homebrew-packages.sh
#. ./scripts/install-docker-utils.sh
#
## Install Node.js
#if [[ "$IS_WORK" == "true" ]]; then
#  . ./scripts/install-nodejs.sh
#fi
#
## Set-up additional tools
#if [[ "$IS_WORK" == "true" ]]; then
#  . ./scripts/install-tools.sh
#fi
#
## Set default browser to Google Chrome or Google Chrome Canary
#if macos; then
#  . ./scripts/osx/set-default-browser.sh
#fi
#
## Set up Git user
#. ./scripts/set-up-git.sh
#
## Set up aliases
#. ./scripts/aliases.sh
#
## Reboot
#
#reboot () {
#  read -p "Do you want to reboot your computer now? (y/N)" choice
#  case "$choice" in
#    y | Yes | yes ) echo "Yes"; exit;;
#    n | N | No | no) echo "No"; exit;;
#    * ) echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return;;
#  esac
#}
#
#header "Finished"
#
## Call on the function
#if [[ "Yes" == $(reboot) ]]
#then
#  echo "Rebooting."
#  sudo reboot
#  exit 0
#else
#  exit 1
#fi
