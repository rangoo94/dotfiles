#!/bin/bash

# Optimize battery in OSX, speed up FS

sudo curl https://raw.githubusercontent.com/wilsonmar/mac-setup/master/configs/limit.maxfiles.plist > limit.maxfiles.plist
sudo mv limit.maxfiles.plist /Library/LaunchDaemons/limit.maxfiles.plist
sudo chmod 644 /Library/LaunchDaemons/limit.maxfiles.plist
sudo chown root:wheel /Library/LaunchDaemons/limit.maxfiles.plist

sudo curl https://raw.githubusercontent.com/wilsonmar/mac-setup/master/configs/limit.maxproc.plist > limit.maxproc.plist
sudo mv limit.maxproc.plist /Library/LaunchDaemons/limit.maxproc.plist
sudo chmod 644 /Library/LaunchDaemons/limit.maxproc.plist
sudo chown root:wheel /Library/LaunchDaemons/limit.maxproc.plist

sudo launchctl load -w /Library/LaunchDaemons/limit.maxfiles.plist
sudo launchctl load -w /Library/LaunchDaemons/limit.maxproc.plist

sudo ulimit -n 65536 200000
sudo sysctl -w kern.maxfiles=5242880
sudo sysctl -w kern.maxfilesperproc=524288
sudo sysctl -w net.inet.tcp.msl=1000
ulimit -S -n 65535

sudo touch /etc/sysctl.conf
echo "kern.maxfiles=5242880" | sudo tee -a /etc/sysctl.conf
echo "kern.maxfilesperproc=524288" | sudo tee -a /etc/sysctl.conf
echo "net.inet.tcp.msl=1000" | sudo tee -a /etc/sysctl.conf

echo "ulimit -n 65536" >> ~/.bash_profile
echo "ulimit -u 2048" >> ~/.bash_profile

# https://www.lifewire.com/terminal-tricks-to-speed-up-your-mac-4120954
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dashboard mcx-disabled -bool true
defaults write com.apple.screencapture disable-shadow -bool true

# Remove font cache
sudo atsutil databases -remove

# Switch off connections while it's hibernated
sudo pmset -b tcpkeepalive 0
sudo pmset hibernatemode 25
# To revert this just use:
# sudo pmset -b tcpkeepalive 1
# sudo pmset hibernatemode 3
