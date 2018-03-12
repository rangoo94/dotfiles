#!/bin/bash

# Install Caskroom
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions
brew tap colindean/fonts-nonfree

# Install packages
apps=(
    font-microsoft-office
    flux
    dash
    imagealpha
    imageoptim
    iterm2
    atom
    opera
    firefox
    google-chrome
    google-chrome-canary
    macdown
    opera
    spotify
    skype
    slack
    tower
    gimp
    sketch
    sketch-toolbox
    toggl
    android-studio
    pycharm
    adobe-acrobat-reader
    burp-suite
    owasp-zap
    cyberduck
    virtualbox
    vagrant
    docker
    docker-toolbox
    genymotion
    torbrowser
    tunnelblick
    vlc
    wireshark
    nmap
    postman
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package
