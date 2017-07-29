#!/bin/bash

# General development tools only on npm

packages=(
    diff-so-fancy
    git-recent
    git-open
    serve
    trash-cli
)

npm install -g "${packages[@]}"
