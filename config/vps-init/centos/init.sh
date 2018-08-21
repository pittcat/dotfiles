#!/usr/bin/env bash

sudo yum install git zsh vim tmux

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# config zsh
mkdir -p $HOME/.antigen/
curl -L git.io/antigen > $HOME/.antigen/antigen.zsh
cp $PWD/zshrc ~/.zshrc
# vimrc
curl https://raw.githubusercontent.com/pittcat/dotfiles/dotfiles/config/vps-init/centos/vimrc > ~/.vimrc
