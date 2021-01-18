#!/bin/bash

brew update
brew upgrade
brew tap homebrew/cask-versions
brew tap colindean/fonts-nonfree

# Install main applications

HAD_RUBY_INSTALLED=0
if brew ls --versions ruby > /dev/null; then
  HAD_RUBY_INSTALLED=1
fi

HAD_ADOBE_CC_INSTALLED=0
if brew ls --versions adobe-creative-cloud > /dev/null; then
  HAD_ADOBE_CC_INSTALLED=1
fi

# TODO: Install Toggl
brew install --cask \
   iterm2 jetbrains-toolbox google-chrome-canary \
   spotify adobe-acrobat-reader calibre firefox gimp \
   burp-suite cyberduck steam owasp-zap tor-browser \
   virtualbox vlc tunnelblick postman wireshark zenmap \
   skype docker sketch font-microsoft-office adobe-creative-cloud

if [[ "$HAD_ADOBE_CC_INSTALLED" == "0" ]]; then
  open "/usr/local/Caskroom/adobe-creative-cloud/latest/Creative Cloud Installer.app"
fi

brew install \
   git bash-completion2 \
   graphviz tcpdump siege ffmpeg watchman tree \
   coreutils findutils gnu-time gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep \
   ruby

if [[ "$HAD_RUBY_INSTALLED" == "0" ]]; then
  echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.bash_profile
fi
