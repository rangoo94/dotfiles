#!/bin/bash

header "Git Setup"

git config --global user.name "$(variable_get GIT_NAME)"
git config --global user.email "$(variable_get GIT_EMAIL)"
git config --global init.defaultBranch "main"

git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global user.signingkey $HOME/.ssh/id_rsa.pub
mkdir -p ~/.ssh
touch ~/.ssh/config
if ! grep -q "Host github.com" "$HOME/.ssh/config"; then
  echo "Host github.com" >> ~/.ssh/config
  echo "  AddKeysToAgent yes" >> ~/.ssh/config
  echo "  IdentityFile ~/.ssh/id_rsa" >> ~/.ssh/config
fi
#bashrc_snippet "SSH Agent Key" "ssh-add ~/.ssh/id_rsa"

# @see {@link https://stackoverflow.com/a/5188364}
git config --global alias.recentb "!r() { refbranch=\$1 count=\$2; git for-each-ref --sort=-committerdate refs/heads --format='%(refname:short)|%(HEAD)%(color:yellow)%(refname:short)|%(color:bold green)%(committerdate:relative)|%(color:blue)%(subject)|%(color:magenta)%(authorname)%(color:reset)' --color=always --count=\${count:-20} | while read line; do branch=\$(echo \"\$line\" | awk 'BEGIN { FS = \"|\" }; { print \$1 }' | tr -d '*'); ahead=\$(git rev-list --count \"\${refbranch:-origin/master}..\${branch}\"); behind=\$(git rev-list --count \"\${branch}..\${refbranch:-origin/master}\"); colorline=\$(echo \"\$line\" | sed 's/^[^|]*|//'); echo \"\$ahead|\$behind|\$colorline\" | awk -F'|' -vOFS='|' '{\$5=substr(\$5,1,70)}1' ; done | ( echo \"ahead|behind||branch|lastcommit|message|author\\n\" && cat) | column -ts'|';}; r"

success "Git configured."
