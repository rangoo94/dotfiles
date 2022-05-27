#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/../_init.sh"

# Show step information
header "OSX: Configure touch bar"

# Install Better Touch Tool
brew install --cask bettertouchtool
