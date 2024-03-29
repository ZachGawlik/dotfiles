#!/bin/bash

# Check for Homebrew and install it if missing
if test ! $(which brew)
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install more recent version than OSX default
brew install vim --override-system-vi

# Daily use
brew install --cask 1password
brew install --cask alfred
brew install --cask bettertouchtool
brew install --cask firefox
brew install --cask google-chrome
brew install --cask iina
brew install --cask spectacle
brew install --cask spotify

# dev
brew install git-delta
brew install diff-so-fancy
brew install bat   #cat replacement
brew install exa   #ls replacement
brew install fd
brew install fzf
brew install git
brew install gh
brew install glow
brew install --cask iterm2
brew install jq
brew install jid
brew install jless
brew install --cask kap
brew install imagemagick
brew install mpv
brew install neovim
brew install --cask ngrok
brew install pyenv
brew install sd   #sed replacement
brew install thefuck
brew install tree
brew install the_silver_searcher
brew install yarn
brew install zsh
brew install zoxide
brew install --cask visual-studio-code

brew install koekeishiya/formulae/skhd
brew install koekeishiya/formulae/yabai

# python build dependencies
brew install openssl readline sqlite3 xz zlib

# Quick look plugins
# For details: https://github.com/sindresorhus/quick-look-plugins
brew install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize suspicious-package apparency quicklookase qlvideo

# Remove outdated versions from the cellar
brew cleanup
