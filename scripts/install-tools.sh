#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/_init.sh"

# Set up tools directory

mkdir -p ~/tools

# Show step information
header "Install Sherlock"

# Install Sherlock

git clone https://github.com/sherlock-project/sherlock.git ~/tools/sherlock || cd ~/tools/sherlock && git pull
cd ~/tools/sherlock && python3 -m pip install -r requirements.txt
add_to_bashrc "Sherlock alias" "
  sherlock() {
    python3 ~/tools/sherlock/sherlock \$@
  }
"
