#!/bin/bash

header "Directories"

ensure_not_indexed_directory ~/projects
ensure_not_indexed_directory ~/presentations

success "Created directories for projects and presentations."
