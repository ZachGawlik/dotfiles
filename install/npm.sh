#!/bin/bash

# General development tools only on npm

packages=(
    alfred-mdn
    alfred-npms
    diff-so-fancy
    git-recent
    git-open
    serve
    trash-cli
)

npm install -g "${packages[@]}"
