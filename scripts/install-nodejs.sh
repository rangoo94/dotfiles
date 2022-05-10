#!/bin/bash

# Initialize scripts
source "$(realpath $(dirname "${BASH_SOURCE[0]}"))/_init.sh"

# Install NVM

sudo chown -R $(whoami) /usr/local/lib/pkgconfig

if ! [[ -x "$(command -v nvm)" ]]; then
  brew install nvm
  mkdir ~/.nvm
  grep -qxF 'export NVM_DIR=~/.nvm' ~/.bash_profile || echo 'export NVM_DIR=~/.nvm' >> ~/.bash_profile
  grep -qxF 'source $(brew --prefix nvm)/nvm.sh' ~/.bash_profile || echo 'source $(brew --prefix nvm)/nvm.sh' >> ~/.bash_profile
  source ~/.bash_profile
  nvm install 18
fi

# Install NPM packages

npm i -g \
  clinic \
  cloc \
  autocannon \
  source-map-unpack \
  webpack-bundle-analyzer \
  localtunnel \
  madge \
  available-domains \
  namelix-cli
