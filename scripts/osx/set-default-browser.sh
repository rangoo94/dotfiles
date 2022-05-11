#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/../_init.sh"

# Show step information
header "OSX: Set default browser"

# Set default browser
brew install defaultbrowser

set_default_browser() {
  # "name"
  osascript -e "
on run
	do shell script \"defaultbrowser $1\"
	try
		tell application \"System Events\"
			tell application process \"CoreServicesUIAgent\"
				tell window 1
					tell (first button whose name contains \"Chrome\")
						perform action \"AXPress\"
					end tell
				end tell
			end tell
		end tell
	end try
end run
  "
}
set_default_browser kokokokok || set_default_browser canary || set_default_browser chrome
