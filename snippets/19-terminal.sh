#!/bin/bash

zshrc_snippet "ZSH: Antigen" "
  source /opt/homebrew/share/antigen/antigen.zsh

  antigen theme robbyrussell

  antigen use oh-my-zsh

  antigen bundle <<EOBUNDLES
    common-aliases
    aws azure gcloud docker-compose docker helm kubectl skaffold terraform argocd
    git git-extras git-lfs gh adb bun golang nats node npm nvm postgres pip pyenv python react-native ruby virtualenv yarn
    brew colored-man-pages colorize macos command-not-found 1password history-substring-search

    unixorn/autoupdate-antigen.zshplugin
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
EOBUNDLES

  antigen apply
"