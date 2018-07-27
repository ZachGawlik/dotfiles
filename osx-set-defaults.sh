#!/bin/bash

# Unhide user library folder
chflags nohidden ~/Library

# Show full path in finder title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Always expand save panel
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true 

# Increase bluetooth audio quality
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Cmd+Shift+4 cropped to window size, no shadow
defaults write com.apple.screencapture disable-shadow -bool TRUE
