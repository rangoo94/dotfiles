#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/../_init.sh"

# Show step information
header "OSX: Set default browser"

# Set default browser
brew install defaultbrowser
defaultbrowser canary || defaultbrowser chrome || defaultbrowser firefox
