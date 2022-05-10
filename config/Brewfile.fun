# Tap definitions
tap "homebrew/cask"
tap "homebrew/cask-versions"
tap "buo/cask-upgrade"
tap "colindean/fonts-nonfree"
brew "mas"

# Configure
cask_args appdir: "~/Applications"

# Ebooks
cask "calibre"

# Games
cask "steam"
