#!/bin/bash

# Initialize scripts
source "$(realpath $(dirname "${BASH_SOURCE[0]}"))/_init.sh"

# Install Docker helpers
gem install docker-sync
