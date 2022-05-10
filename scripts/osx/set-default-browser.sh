#!/bin/bash

# Initialize scripts
source "$(dirname "$0")/../_init.sh"

# Set default browser
if [[ -x "/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary" ]]; then
  open -a "Google Chrome Canary" --args --make-default-browser
elif [[ -x "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]]; then
  open -a "Google Chrome" --args --make-default-browser
fi