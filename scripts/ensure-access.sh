#!/bin/bash

sudo chown -R $(whoami) /usr/local/lib/pkgconfig

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this process has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &