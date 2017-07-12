#!/bin/bash

# General development tools only on npm

packages=(
    diff-so-fancy
    git-recent
    git-open
)

npm install -g "${packages[@]}"
