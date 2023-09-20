#!/bin/bash

if variable_is_true "IS_WORK"; then
  header "Setup Docker environment"

  source ~/.bashrc
  gem install docker-sync

  bashrc_snippet "Docker aliases" "
    dcb() {
      docker compose up -d --build \$@ && docker compose logs -f --tail 500 \$@
    }

    dc() {
      docker compose up -d \$@ && docker compose logs -f --tail 500 \$@
    }

    dcl() {
      docker compose logs -f --tail 1000 \$@
    }

    dcs() {
      docker compose stop \$@
    }

    dcr() {
      docker compose restart \$@
    }
  "
fi
