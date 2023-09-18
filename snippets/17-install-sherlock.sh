#!/bin/bash

ensure_not_indexed_directory "$HOME/tools"

if variable_is_true "IS_WORK"; then
  if [ ! -d "$HOME/tools/sherlock" ]; then
    current_dir="$(pwd)"
    git clone https://github.com/sherlock-project/sherlock.git $HOME/tools/sherlock || cd $HOME/tools/sherlock && git pull
    cd $HOME/tools/sherlock && python3 -m pip install -r requirements.txt && cd "$current_dir"
  fi

  bashrc_snippet "Sherlock alias" "
    sherlock() {
      python3 $HOME/tools/sherlock/sherlock \$@
    }
  "
fi
