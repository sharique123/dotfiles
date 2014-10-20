#! /usr/bin/env sh
curl -L http://install.ohmyz.sh | sh
brew install zsh-syntax-highlighting
cp ~/.dotfiles/fonts/* ~/Library/Fonts/
brew install caskroom/cask/brew-cask
brew install git hub direnv git-extras
brew install macvim --with-lua --with-luajit --custom-icons --override-system-vim --HEAD
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
brew install boot2docker
brew install mosh
brew install rbenv rbenv-gem-rehash ruby-build
rbenv install 2.1.3
brew cask install istat-menus iterm2 sqwiggle virtualbox xquartz
open ~/.dotfiles/schemes/*.itermcolors
boot2docker init
