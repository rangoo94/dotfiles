# Tap definitions
tap "homebrew/cask"
tap "homebrew/cask-versions"
tap "buo/cask-upgrade"
tap "colindean/fonts-nonfree"
brew "mas"

# Configure
cask_args appdir: "~/Applications", require_sha: true

# Ebooks
cask "calibre"

# Games
cask "steam"
