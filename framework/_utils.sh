#!/bin/bash

_DOT_POST_INSTRUCTIONS=""

postinstructions_add() {
  #"name" "content"
  next="$BOLD_CYAN$1$FORMAT_END\n$2"
  if [ -z "$_DOT_POST_INSTRUCTIONS" ]; then
    _DOT_POST_INSTRUCTIONS="$next"
  else
    _DOT_POST_INSTRUCTIONS="$_DOT_POST_INSTRUCTIONS\n\n$next"
  fi
}

postinstructions_display() {
  if ! [ -z "$_DOT_POST_INSTRUCTIONS" ]; then
    header "Post-install steps"
    echo -e $_DOT_POST_INSTRUCTIONS
  fi
}
