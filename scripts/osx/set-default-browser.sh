#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/../_init.sh"

# Show step information
header "OSX: Set default browser"

# Set default browser
if [[ -x "/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary" ]]; then
  open -a "Google Chrome Canary" --args --make-default-browser
elif [[ -x "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]]; then
  open -a "Google Chrome" --args --make-default-browser
fi
