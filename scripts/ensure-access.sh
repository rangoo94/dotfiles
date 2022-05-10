#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/_init.sh"

# Show step information
header "Ensure 'sudo' access"

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this process has finished
while true; do sudo -n true; sleep 30; kill -0 "$$" || exit; done 2>/dev/null &
