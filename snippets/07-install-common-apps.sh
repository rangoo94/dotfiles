#!/bin/bash

header "Homebrew: install commons"

# Detect Homebrew directory

HOMEBREW_DIR=/usr/local
if [[ $(uname -m) == 'arm64' ]]; then
  HOMEBREW_DIR=/opt/homebrew
fi

# Install apps

brew bundle --file="$(dirname "${BASH_SOURCE[0]}")/../config/Brewfile.common"

# Register the apps

# openjdk
sudo ln -sfn $HOMEBREW_DIR/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
bashrc_cppflags_add "OpenJDK" "-I$HOMEBREW_DIR/opt/openjdk/include"
bashrc_path_add "OpenJDK" "$HOMEBREW_DIR/opt/openjdk/bin"

# git-lfs
git lfs install

# ruby
bashrc_path_add "Ruby" "$HOMEBREW_DIR/opt/ruby/bin"
bashrc_ldflags_add "Ruby" "-L$HOMEBREW_DIR/opt/ruby/lib"
bashrc_cppflags_add "Ruby" "-I$HOMEBREW_DIR/opt/ruby/include"
bashrc_setup

# Microsoft Excel & Microsoft Word
postinstructions_add "microsoft-excel & microsoft-word" "Log in to the Microsoft Office"

# discord
postinstructions_add "discord" "Log in to the Discord"

# slack
postinstructions_add "slack" "Log in to the Slack"

# affinity-photo & affinity-designer
postinstructions_add "affinity-photo & affinity-designer" "Log in to the Affinity stack"

# Toggl
postinstructions_add "toggl" "Log in to the Toggl app"

# spotify
postinstructions_add "spotify" "Log in to the Spotify"
