#!/bin/bash

# Initialize scripts
source "$(dirname "$0")/_init.sh"

# Configure Git
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
