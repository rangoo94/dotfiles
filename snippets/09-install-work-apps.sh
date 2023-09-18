#!/bin/bash

if variable_is_true "IS_WORK"; then
  header "Homebrew: install work"

  # Install apps

  brew bundle --file="$(dirname "${BASH_SOURCE[0]}")/../config/Brewfile.work"

  # Register the apps

  # libpq
  bashrc_path_add "libpq" "/usr/local/opt/libpq/bin"
  bashrc_ldflags_add "libpq" "-L/usr/local/opt/libpq/lib"
  bashrc_cppflags_add "libpq" "-I/usr/local/opt/libpq/include"
  bashrc_pkgconfig_add "libpq" "/usr/local/opt/libpq/lib/pkgconfig"

  # go
  bashrc_snippet "Golang Path" "export PATH=\"\$(go env GOPATH)/bin:\$PATH\""

  # kubernetes-cli
  brew link --overwrite kubernetes-cli

  # jetbrains-toolbox
  postinstructions_add "jetbrains-toolbox" "Log in to JetBrains Toolbox and install required IDEs and plugins"
  postinstructions_add "wallaby & quokka" "Install these plugins and apply license"

  # postman
  postinstructions_add "postman" "Log in to Postman"

  # affinity-publisher
  postinstructions_add "affinity-publisher" "Log in to Affinity Publisher"

  # docker
  postinstructions_add "docker" "Log in to Docker"
fi
