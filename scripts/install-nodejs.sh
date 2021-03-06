#!/bin/bash

sudo chown -R $(whoami) /usr/local/lib/pkgconfig

if ! [[ -x "$(command -v nvm)" ]]; then
  brew install nvm
  mkdir ~/.nvm
  grep -qxF 'export NVM_DIR=~/.nvm' ~/.bash_profile || echo 'export NVM_DIR=~/.nvm' >> ~/.bash_profile
  grep -qxF 'source $(brew --prefix nvm)/nvm.sh' ~/.bash_profile || echo 'source $(brew --prefix nvm)/nvm.sh' >> ~/.bash_profile
  source ~/.bash_profile
  nvm install 12
fi

# Install NPM packages

npm i -g clinic cloc autocannon source-map-unpacker webpack-bundle-analyzer
