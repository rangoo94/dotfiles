#!/bin/bash

# Configure

install_extensions() {
  # "browser"
  browser=$1

  chrome_extension_add "$browser" "jeoacafpbcihiomhlakheieifhpjdfeo" # Disconnect
  chrome_extension_add "$browser" "kbfnbcaeplbcioakkpcpgfkobkghlhen" # Grammarly
  chrome_extension_add "$browser" "gbmdgpbipfallnflgajpaliibnhdgobh" # JSON Viewer
  chrome_extension_add "$browser" "fdpohaocaechififmbbbbbknoalclacl" # Full Page Screen Capture

  if variable_is_true "IS_WORK"; then
    chrome_extension_add "$browser" "hgpnhiajcdppfbogcpfdgcceepgkhdmk" # Perfmap
    chrome_extension_add "$browser" "fmkadmapgofadopljbjfkapdkoienihi" # React DevTools
    chrome_extension_add "$browser" "lmhkpmbekcpmknklioeibfkpmmfibljd" # Redux DevTools
    chrome_extension_add "$browser" "kejbdjndbnbjgmefkgdddjlbokphdefk" # Tag Assistant
    chrome_extension_add "$browser" "ndlbedplllcgconngcnfmkadhokfaaln" # GraphQL Network Inspector
  fi
}

header "Install Chrome extensions"

install_extensions "Chrome"
postinstructions_add "google-chrome" "Run Google Chrome and enable all extensions from alerts."
postinstructions_add "grammarly" "Log in to Grammarly in Google Chrome."

if brew list "google-chrome@canary" &> /dev/null; then
  install_extensions "Chrome Canary"
  postinstructions_add "google-chrome-canary" "Run Google Chrome and enable all extensions from alerts."
fi

success "Installed."
