#!/bin/bash

SCRIPTS_PATH="$(dirname "${BASH_SOURCE[0]}")"
source "$SCRIPTS_PATH/_helpers.sh"
source "$SCRIPTS_PATH/_configure.sh"
if test -f "~/.bash_profile"; then
  source ~/.bash_profile
fi
