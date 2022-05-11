#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/_init.sh"

# Show step information
header "Install Node.js"

# Install NVM

sudo chown -R $(whoami) /usr/local/lib/pkgconfig

brew install nvm
nvm install 18
nvm alias default 18
add_to_bashrc "NVM Setup" "
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
"

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
