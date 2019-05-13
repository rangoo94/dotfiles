#!/bin/bash

brew update
brew upgrade
brew tap homebrew/cask-versions

# Install main applications

brew cask install \
   iterm2 jetbrains-toolbox toggl google-chrome-canary \
   spotify adobe-acrobat-reader calibre firefox gimp \
   burp-suite cyberduck steam owasp-zap tor-browser \
   virtualbox vlc tunnelblick postman wireshark zenmap \
   skype docker sketch font-microsoft-office

brew install \
   git bash-completion2 \
   graphviz tcpdump siege ffmpeg watchman tree \
   coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep