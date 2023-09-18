#!/bin/bash

if variable_is_true "IS_FUN"; then
  header "Homebrew: install fun"

  # Install apps

  brew bundle --file="$(dirname "${BASH_SOURCE[0]}")/../config/Brewfile.fun"

  # Register the apps

  # steam
  postinstructions_add "steam" "Log in to Steam"
fi
