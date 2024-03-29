#!/bin/bash

header "Machine Setup"

sudo scutil --set LocalHostName "$(variable_get LOCAL_HOST_NAME)"
sudo scutil --set ComputerName "$(variable_get COMPUTER_NAME)"

success "Machine configured."

if [[ $(uname -m) == 'arm64' ]]; then
  header "Install Rosetta"
  if /usr/bin/pgrep oahd >/dev/null 2>&1; then
    success "Rosetta already installed."
  else
    sudo softwareupdate --install-rosetta --agree-to-license
    success "Rosetta installed."
  fi
fi
