#!/bin/bash

if variable_is_true "IS_WORK"; then
  header "Install Google Cloud CLI"

  brew install --cask google-cloud-sdk
  gcloud components install -q gke-gcloud-auth-plugin

  bashrc_snippet "Google Cloud CLI" "
    if [ -n \"\$ZSH_VERSION\" ]; then
     source \"\$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc\"
     source \"\$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc\"
    elif [ -n \"\$BASH_VERSION\" ]; then
      source \"\$(brew --prefix)/share/google-cloud-sdk/path.bash.inc\"
    fi
  "
fi
