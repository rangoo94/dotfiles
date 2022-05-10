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

add_to_bash_profile() {
  # "name" "snippet"
  bash_profile_path="$HOME/.bash_profile"
  comment_start="# ---- START: $1 ---- #"
  comment_end="# ---- END:   $1 ---- #"
  snippet="$comment_start"$'\n'"$2"$'\n'"$comment_end"

  found_block=$(ruby -e "
    content = File.read(ARGV[2])
    results = content.scan(Regexp.new(
      Regexp.escape(ARGV[0]) + '.+' + Regexp.escape(ARGV[1]),
      Regexp::MULTILINE
    ))
    if results.length > 0
      print(results[0])
    end
  " "$comment_start" "$comment_end" "$bash_profile_path")
  if [[ $found_block == "" ]]; then
    if [ -s "$bash_profile_path" ]; then
      echo $'\n'"$snippet" >> $bash_profile_path
    else
      echo "$snippet" >> $bash_profile_path
    fi
  else
    ruby -e "
      content = File.read(ARGV[2])
      new_content = content.gsub(ARGV[0], ARGV[1])
      File.open(ARGV[2], 'w') {|file| file.puts(new_content) }
    " "$found_block" "$snippet" "$bash_profile_path"
  fi
}

reboot() {
  read -p "Do you want to reboot your computer now? (y/N)" choice
  case "$choice" in
    y|Yes|yes) echo "Yes"; exit;;
    n|N|No|no) echo "No"; exit;;
    * ) echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return;;
  esac
}
