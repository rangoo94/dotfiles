#!/bin/bash

# Initialize scripts
source "$(dirname "$0")/../_init.sh"

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'
