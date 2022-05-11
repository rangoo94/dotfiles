#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/_init.sh"

# Show step information
header "Install Node.js"

# Install NVM

sudo chown -R $(whoami) /usr/local/lib/pkgconfig

brew install nvm
nvm install "$NODE_VERSION" --default
add_to_bashrc "NVM Setup" "
  export NVM_DIR=~/.nvm
  export PATH=\"\$NVM_DIR/versions/node/$(nvm version "$NODE_VERSION")/bin:\$PATH\"

  nvm() {
    unset -f nvm
    source $(brew --prefix nvm)/nvm.sh
    nvm \$@
  }
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
