#!/bin/bash

# Load dotfiles path
DOTFILES_PATH="$(realpath "$(dirname "$(dirname "${BASH_SOURCE[0]}")")")"
if [[ $DOTFILES_PATH = $HOME* ]]; then
  DOTFILES_PATH="${DOTFILES_PATH/$HOME/~}"
fi

# Load the framework
for f in $(dirname "${BASH_SOURCE[0]}")/_*.sh; do source $f; done
