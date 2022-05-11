#!/bin/bash

# Decisioning

macos() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    return 0
  fi
}


# CLI

BOLD_CYAN=$'\e[1;36m'
FORMAT_END=$'\e[0m'

header() {
  echo $'\n'$BOLD_CYAN"======= $1 ======="$FORMAT_END$'\n'
}

# Operations

add_to_file() {
  # "real_file_path" "name" "snippet"
  real_file_path="$1"
  comment_start="# ---- START: $2 ---- #"
  comment_end="# ---- END:   $2 ---- #"
  snippet="$comment_start"$'\n'"$3"$'\n'"$comment_end"

  touch "$real_file_path"

  found_block=$(ruby -e "
    content = File.read(ARGV[2])
    results = content.scan(Regexp.new(
      Regexp.escape(ARGV[0]) + '.+' + Regexp.escape(ARGV[1]),
      Regexp::MULTILINE
    ))
    if results.length > 0
      print(results[0])
    end
  " "$comment_start" "$comment_end" "$real_file_path")
  if [[ $found_block == "" ]]; then
    if [ -s "$real_file_path" ]; then
      echo $'\n'"$snippet" >> $real_file_path
    else
      echo "$snippet" >> $real_file_path
    fi
  else
    ruby -e "
      content = File.read(ARGV[2])
      new_content = content.gsub(ARGV[0], ARGV[1])
      File.open(ARGV[2], 'w') {|file| file.puts(new_content) }
    " "$found_block" "$snippet" "$real_file_path"
  fi
}

setup_bashrc() {
  add_to_file "$HOME/.bash_profile" "Load .bashrc" "source ~/.bashrc"
  add_to_file "$HOME/.zshenv" "Load .bashrc" "source ~/.bashrc"
  add_to_file "$HOME/.zshrc" "Load .bashrc" "source ~/.bashrc"
}

add_to_bashrc() {
  # "name" "snippet"
  setup_bashrc
  add_to_file "$HOME/.bashrc" "$1" "$2"
}

reboot() {
  read -p "Do you want to reboot your computer now? (y/N)" choice
  case "$choice" in
    y|Yes|yes) echo "Yes"; exit;;
    n|N|No|no) echo "No"; exit;;
    * ) echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return;;
  esac
}
