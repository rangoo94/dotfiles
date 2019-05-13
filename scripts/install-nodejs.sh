#!/bin/bash

if ! [[ -x "$(command -v nvm)" ]]; then
  brew install nvm
  mkdir ~/.nvm
  echo "export NVM_DIR=~/.nvm" >> ~/.bash_profile
  echo "source $(brew --prefix nvm)/nvm.sh" >> ~/.bash_profile
  source ~/.bash_profile
  nvm install 11
fi

# Install NPM packages

npm i -g clinic cloc
