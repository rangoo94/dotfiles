#!/bin/bash

_bashrc_add_snippet_to() {
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

bashrc_setup() {
  _bashrc_add_snippet_to "$HOME/.bash_profile" "Load .bashrc" "source ~/.bashrc"
  _bashrc_add_snippet_to "$HOME/.zshenv" "Load .bashrc" "source ~/.bashrc"
  _bashrc_add_snippet_to "$HOME/.zshrc" "Load .bashrc" "source ~/.bashrc"
}

bashrc_snippet() {
  # "name" "snippet"
  bashrc_setup
  _bashrc_add_snippet_to "$HOME/.bashrc" "$1" "$2"
}

bashrc_path_add() {
  # "name" "path"
  bashrc_snippet "$1 - Path" "export PATH=\"$2:\$PATH\""
}

bashrc_cppflags_add() {
  # "name" "flags"
  bashrc_snippet "$1 - C++ Flags" "export CPPFLAGS=\"\$CPPFLAGS $2\""
}

bashrc_ldflags_add() {
  # "name" "flags"
  bashrc_snippet "$1 - LD Flags" "export LDFLAGS=\"\$LDFLAGS $2\""
}

bashrc_pkgconfig_add() {
  # "name" "path"
  bashrc_snippet "$1 - pkgconfig" "if [ -z \"\$PKG_CONFIG_PATH\" ]; then
  PKG_CONFIG_PATH=\"$2\"
else
  PKG_CONFIG_PATH=\"$2:\$PKG_CONFIG_PATH\"
fi"
}

bashrc_quote() {
  # "command"
  echo "'$(echo $@ | sed "s/'/'\\\''/g")'"
}

bashrc_alias() {
  # "name" "command" "optional_description"
  name="$1"
  command="$2"
  optional_description="$3"
  description="${3:-"alias"} - $name"
  echo bashrc_snippet "$description" "alias $name=$(bashrc_quote $command)"
}
