#!/bin/bash

if variable_is_true "HAS_TOUCHBAR"; then
  header "Configure touchbar"

  brew install --cask bettertouchtool

  postinstructions_add "BetterTouchTool" "Add license to the BetterTouchTool"

  # TODO: Configure BTT
fi
