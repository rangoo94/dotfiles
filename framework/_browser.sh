#!/bin/bash

chrome_extension_add() {
  # "name" "id"
  dir_path="$HOME/Library/Application Support/Google/$1/External Extensions/"
  mkdir -p "$dir_path"

  if [ ! -f "$dir_path/$2.json" ]; then
    echo "{\"external_update_url\": \"https://clients2.google.com/service/update2/crx\"}" > "$dir_path/$2.json"
  fi
}
