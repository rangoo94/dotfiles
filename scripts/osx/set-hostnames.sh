#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/../_init.sh"

# Show step information
header "OSX: Set hostnames"

# Set hostnames
sudo scutil --set LocalHostName "$LOCAL_HOST_NAME"
sudo scutil --set ComputerName "$COMPUTER_NAME"
