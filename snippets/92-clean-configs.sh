#!/bin/bash

header "Clean configs"

# Clean safe.directory
safe_directories="$(git config --global --get-all safe.directory | sort | uniq)"
git config --global --unset-all safe.directory || true
while IFS= read -r dir; do
  git config --global --add safe.directory "$dir"
done <<< "$safe_directories"

success "Completed."
