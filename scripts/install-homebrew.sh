#!/bin/bash

# Initialize scripts
source "$(realpath $(dirname "${BASH_SOURCE[0]}"))/_init.sh"

# Install Homebrew
if ! [[ -x "$(command -v brew)" ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
