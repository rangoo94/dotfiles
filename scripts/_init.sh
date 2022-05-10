#!/bin/bash

SCRIPTS_PATH="$(dirname "${BASH_SOURCE[0]}")"
source "$SCRIPTS_PATH/_helpers.sh"
source "$SCRIPTS_PATH/_configure.sh"
touch ~/.bash_profile
source ~/.bash_profile
