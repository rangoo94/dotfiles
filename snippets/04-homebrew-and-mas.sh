#!/bin/bash

header "Install Homebrew"

if ! [[ -x "$(command -v brew)" ]]; then
  echo "Installing Homebrew..."
  HOMEBREW_NO_ANALYTICS=1 NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/usr/local/bin/brew shellenv)"
  success "Homebrew installed."
else
  success "Homebrew already installed."
fi

git config --global --add safe.directory /usr/local/Homebrew

sudo dscl . create /Groups/homebrew
sudo dscl . -create /Groups/homebrew gid 799
sudo dscl . -append /Groups/homebrew GroupMembership "$(whoami)"
sudo chgrp -R homebrew $(brew --prefix)/* &> /dev/null || true
sudo chmod -R g+w $(brew --prefix)/* &> /dev/null || true
success "Updated Homebrew permissions."

brew analytics off
success "Opted-out of Homebrew analytics."

brew doctor
success "Verified Homebrew installation."

if macos && ! [[ -x "$(command -v mas)" ]]; then
  brew install mas
  success "Mac App Store CLI installed."
elif macos; then
  success "Mac App Store CLI already installed."
fi

bashrc_snippet "Init Homebrew" 'eval "$(/usr/local/bin/brew shellenv)"'
