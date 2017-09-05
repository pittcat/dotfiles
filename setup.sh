#!/usr/bin/env bash

cp spacevim ~/.spacevim
cp zshrc ~/.zshrc
cp tmux.conf ~/.tmux.conf
cp spacemacs ~/.spacemacs

sudo apt install git vim zsh tmux python3-pip python-pip curl ctags autojump
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone git://github.com/joelthelion/autojump.git
cd autojump
./install.py
cd ..
sudo rm autojump -r
sudo pip3 install flake8
