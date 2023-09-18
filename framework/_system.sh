#!/bin/bash

macos() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    return 0
  fi
}

keep_sudo_access() {
  # Ask for the administrator password upfront
  sudo -v

  # Keep-alive: update existing `sudo` time stamp until this process has finished
  while true; do sudo -n true; sleep 30; kill -0 "$$" || exit; done 2>/dev/null &
}

close_everything() {
  if macos; then
    osascript -e 'tell application "System Preferences" to quit'
  fi
}

dont_index() {
  #"$directory_path_to_not_index"
  touch "$1/.metadata_never_index"
}

ensure_not_indexed_directory() {
  #"$directory_path_to_create_and_not_index"
  mkdir -p $1
  dont_index $1
}
