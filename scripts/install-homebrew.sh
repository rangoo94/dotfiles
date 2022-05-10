#!/bin/bash

# Initialize scripts
source "$(dirname "$0")/_init.sh"

# Install Homebrew
if ! [[ -x "$(command -v brew)" ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
