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
