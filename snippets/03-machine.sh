#!/bin/bash

header "Machine Setup"

sudo scutil --set LocalHostName "$(variable_get LOCAL_HOST_NAME)"
sudo scutil --set ComputerName "$(variable_get COMPUTER_NAME)"

success "Machine configured."

if [[ $(uname -m) == 'arm64' ]]; then
  header "Install Rosetta"
  sudo softwareupdate --install-rosetta
  success "Rosetta installed."
fi
