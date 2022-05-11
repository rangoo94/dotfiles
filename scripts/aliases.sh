#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/_init.sh"

# Show step information
header "Set up aliases"

# Docker

add_to_bashrc "Docker aliases" "
  dcb() {
    docker-compose up -d --build \$@ && docker-compose logs -f --tail 500 \$@
  }

  dc() {
    docker-compose up -d \$@ && docker-compose logs -f --tail 500 \$@
  }

  dcl() {
    docker-compose logs -f --tail 1000 \$@
  }

  dcs() {
    docker-compose stop \$@
  }

  dcr() {
    docker-compose restart \$@
  }
"

# Dotfiles

add_to_bashrc "Dotfiles" "
  dotfiles_run() {
    sh -c "`curl -fsSL https://raw.github.com/rangoo94/dotfiles/master/remote-setup.sh`"
  }

  dotfiles_cd() {
    cd ~/dotfiles
  }
"
