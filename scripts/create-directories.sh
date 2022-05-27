#!/bin/bash

# Initialize scripts
source "$(dirname "${BASH_SOURCE[0]}")/_init.sh"

# Show step information
header "Creating basic directories"

# Create directories
mkdir -p ~/projects
mkdir -p ~/presentations
