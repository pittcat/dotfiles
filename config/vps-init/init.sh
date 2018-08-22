#!/usr/bin/env bash
if [ -d /etc/apt ];then
  PKMG="apt install"
elif [-d /etc/yum];then
  PKMG="yum install"
fi

sudo $PKMG git zsh vim tmux mosh iptables -y

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# config zsh
mkdir -p $HOME/.antigen/
curl -L git.io/antigen > $HOME/.antigen/antigen.zsh
curl https://raw.githubusercontent.com/pittcat/dotfiles/dotfiles/config/vps-init/centos/zshrc > ~/.zshrc
# vimrc
curl https://raw.githubusercontent.com/pittcat/dotfiles/dotfiles/config/vps-init/centos/vimrc > ~/.vimrc
# mosh
sudo iptables -I INPUT 1 -p udp --dport 60000:61000 -j ACCEPT
