#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/_init.sh"

# Show step information
header "Install Node.js"

# Install NVM

sudo chown -R $(whoami) /usr/local/lib/pkgconfig

if ! [[ -x "$(command -v nvm)" ]]; then
  brew install nvm
  mkdir -p ~/.nvm
  add_to_bash_profile "NVM Setup" "
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh
  "
  source ~/.bash_profile
  nvm install 18
  nvm alias default 18
fi

# Install NPM packages

npm i -g \
  npm \
  clinic \
  cloc \
  autocannon \
  source-map-unpack \
  webpack-bundle-analyzer \
  localtunnel \
  madge \
  available-domains \
  namelix-cli
