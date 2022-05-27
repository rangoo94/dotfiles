#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/_init.sh"

# Show step information
header "Install Homebrew"

# Use local binaries as preferred
add_to_bashrc "Local binaries" "export PATH=\"/usr/local/bin:\$PATH\""

# Install Homebrew
if ! [[ -x "$(command -v brew)" ]]; then
  echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install "mas"

brew install mas
