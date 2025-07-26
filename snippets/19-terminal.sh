#!/bin/bash

# add syntax highlighting to nano
echo 'include "/opt/homebrew/Cellar/nano/*/share/nano/*.nanorc"' >> ~/.nanorc

cp "$(dirname "${BASH_SOURCE[0]}")/../assets/.p10k.zsh" "$HOME/.p10k.zsh"

zshrc_snippet "ZSH: PowerLevel" "
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r \"\${XDG_CACHE_HOME:-\$HOME/.cache}/p10k-instant-prompt-\${(%):-%n}.zsh\" ]]; then
    source \"\${XDG_CACHE_HOME:-\$HOME/.cache}/p10k-instant-prompt-\${(%):-%n}.zsh\"
  fi
"

zshrc_snippet "ZSH: Antigen" "
  source /opt/homebrew/share/antigen/antigen.zsh

  antigen use oh-my-zsh

  antigen bundle <<EOBUNDLES
    common-aliases
    aws azure gcloud docker-compose docker helm kubectl skaffold terraform argocd localstack
    git git-extras git-lfs gh adb bun golang nats node npm nvm postgres pip pyenv python react-native ruby virtualenv yarn
    brew colored-man-pages colorize macos command-not-found 1password history-substring-search

    MichaelAquilina/zsh-you-should-use
    unixorn/autoupdate-antigen.zshplugin
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
EOBUNDLES

  antigen theme romkatv/powerlevel10k

  antigen apply
"
