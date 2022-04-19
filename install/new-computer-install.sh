#!/bin/bash

echo "Setting osx defaults"
bash ../osx/set-defaults.sh

echo "Installing XCode Command Line Tools"
xcode-select --install

echo "Installing nvm..."
# https://github.com/nvm-sh/nvm#install--update-script
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

bash ./brew.sh

echo "Installing python 3.10.3 (latest as of 03/24/22)"
pyenv install 3.10.3
pyenv global 3.10.3

# https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Linking dotfiles to home"
ln -s ~/dev/dotfiles/.aliases.zsh ~/.aliases.zsh
ln -s ~/dev/dotfiles/.zshrc ~/.zshrc
ln -s ~/dev/dotfiles/.zshenv ~/.zshenv
ln -s ~/dev/dotfiles/.zprofile ~/.zprofile
ln -s ~/dev/dotfiles/.vimrc ~/.vimrc
ln -s ~/dev/dotfiles/.gitconfig ~/.gitconfig
cp -r ../oh-my-zsh-custom/* $ZSH_CUSTOM

echo "Installing zsh plugins"
bash ./zsh-plugins.sh

source ~/.zshrc

echo "Nvm installing latest node LTS"
nvm install --lts
nvm use --lts
nvm alias default node

echo "Done!"
echo "Quit and restart iterm."
echo "Double-check to ensure `python` and `node` are properly registered"
