#!/bin/bash

brew update
brew upgrade
brew tap homebrew/cask-versions
brew tap colindean/fonts-nonfree

# Install main applications

brew cask install \
   iterm2 jetbrains-toolbox toggl google-chrome-canary \
   spotify adobe-acrobat-reader calibre firefox gimp \
   burp-suite cyberduck steam owasp-zap tor-browser \
   virtualbox vlc tunnelblick postman wireshark zenmap \
   skype docker sketch font-microsoft-office

HAD_RUBY_INSTALLED=0
if brew ls --versions ruby > /dev/null; then
  HAD_RUBY_INSTALLED=1
fi

brew install \
   git bash-completion2 \
   graphviz tcpdump siege ffmpeg watchman tree \
   coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep \
   ruby

if [[ "$HAD_RUBY_INSTALLED" == "0" ]]; then
  echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.bash_profile
fi
