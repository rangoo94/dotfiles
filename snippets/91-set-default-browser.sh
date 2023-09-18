#!/bin/bash

if macos; then
  header "Set default browser"

  if ! [[ -x "$(command -v defaultbrowser)" ]]; then
    brew install defaultbrowser
  fi

  DEFAULTBROWSER="chrome"
  if brew list google-chrome-canary &> /dev/null; then
    DEFAULTBROWSER="canary"
  fi

  osascript -e "
on run
  do shell script \"defaultbrowser $DEFAULTBROWSER\"
  try
    tell application \"System Events\"
      tell application process \"CoreServicesUIAgent\"
        tell window 1
          tell (first button whose name contains \"Chrome\")
            perform action \"AXPress\"
          end tell
        end tell
      end tell
    end tell
  end try
end run
  "

  success "Configured."
fi
