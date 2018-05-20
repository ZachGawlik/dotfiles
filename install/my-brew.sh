#!/bin/bash

# Installs homebrew and development packages on brew

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install more recent version than OSX default
brew install vim --override-system-vi

# dev
brew install diff-so-fancy
brew install git
brew install hub
brew install imagemagick
brew install tree
brew install node
brew install the_silver_searcher
brew install zsh
brew install zsh-syntax-highlighting

# Remove outdated versions from the cellar
brew cleanup
