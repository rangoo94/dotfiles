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

# Automatically use .nvmrc

add_to_bashrc "Auto .nvmrc" "
  nvm_use() {
    if [ -f \".nvmrc\" ]; then
      CD_NVMRC_VERSION=\"\$(cat .nvmrc | sed 's/[[:blank:]]//g' | sed 's/v//g')\"
      CD_NODE_VERSION=\"\$(node -v | sed 's/[[:blank:]]//g' | sed 's/v//g')\"
      if [[ \"\$CD_NVMRC_VERSION\" == \"\$CD_NODE_VERSION\" ]]; then
        echo -e \$'\e[1;36m'\"[.nvmrc]\"\$'\e[0;37m'\" Using already Node.js v\$CD_NVMRC_VERSION\"\$'\e[0m'
      else
        nvm use \"\$CD_NVMRC_VERSION\" > >(sed -e 's/^/[.nvmrc] /;') 2>&1 || (echo -e \$'\e[1;31m'\"[.nvmrc] \"\$'\e[0m'$'\e[0;31m'\"You need to install Node.js v\$CD_NVMRC_VERSION for this project\"\$'\e[0m')
      fi
    fi
  }
  cd() {
    builtin cd \"\$@\" && nvm_use
  }
  nvm_use
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
  namelix-cli \
  yarn \
  nx \
  create-next-app \
  ts-node \
  @funboxteam/optimizt
