#!/bin/bash

header "Update applications"

brew tap buo/cask-upgrade
brew cu -y -q --include-mas
