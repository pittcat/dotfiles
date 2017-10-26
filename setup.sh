#!/usr/bin/env bash
sudo apt install vim vim-gtk vim-gnome zsh tmux git curl python3-pip python-pip silversearcher-ag
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
source ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo pip3 install thefuck
sudo apt install autojump
git clone git://github.com/joelthelion/autojump.git
cd autojump
./install.py
cd ..
sudo rm autojump -r

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo apt install xsel
# prefix + I install


#配置vim vim8 并且须支持python3
sh -c "$(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)"
sh config.sh
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
sudo git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/plugged/YouCompleteMe
cd ~/.vim/plugged/YouCompleteMe
git submodule update --init --recursive
sudo python3 ./install.py --clang-completer
sudo pip3 install yapf flake8
sudo pip install yapf flake8
sudo apt install ctags 
cd ~/.dotfiles
