#!/bin/bash

if variable_is_true "IS_WORK"; then
  header "Setup Node.js environment"

  # Install Node.js

  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
  nvm install "$(variable_get "NODE_VERSION")" --default

  # Add helpers

  bashrc_snippet "NVM Setup" "
    export NVM_DIR=\"$HOME/.nvm\"
    export PATH=\"\$NVM_DIR/versions/node/$(nvm version "$(variable_get "NODE_VERSION")")/bin:\$PATH\"

    nvm() {
      unset -f nvm
      source $(brew --prefix nvm)/nvm.sh
      nvm \$@
    }
  "

  bashrc_snippet "Auto .nvmrc" "
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

  bashrc_snippet "Common NPM commands" "
    ns() {
      npm start \$@
    }

    kn() {
      killall -9 node
    }

    npmclear() {
      find . -name \"node_modules\" -exec rm -rf '{}' +
    }

    npmreset() {
      npmclear
      git checkout HEAD package-lock.json
    }
  "

  # Install Bun

  if [[ -x "$(command -v bun)" ]]; then
    bun upgrade
  else
    curl -fsSL https://bun.sh/install | bash
  fi
  bashrc_path_add "bun" "$HOME/.bun/bin"

  # Install basic packages

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
    nodemon \
    @funboxteam/optimizt \
    wscat
fi
