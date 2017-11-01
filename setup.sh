#!/usr/bin/env bash
sudo package manager vim vim-gtk vim-gnome zsh tmux git curl python3-pip python-pip silversearcher-ag emacs rsync

#配置vim vim8 并且须支持python3
sh -c "$(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)"
sudo package manager build-essential cmake
sudo package manager python-dev python3-dev
# install YouCompleteMe
# sudo git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/plugged/YouCompleteMe
# cd ~/.vim/plugged/YouCompleteMe
# git submodule update --init --recursive
# sudo python3 ./install.py --clang-completer
sudo pip3 install yapf flake8 jedi
sudo pip install yapf flake8 jedi
sudo package manager ctags 
cp spacevim ~/.spacevim

# config emacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp spacemacs ~/.spacemacs
cp ./snippets/ ~/.emacs.d/private/ -r


# config zsh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo pip3 install thefuck
sudo package manager autojump
git clone git://github.com/joelthelion/autojump.git
cd autojump
./install.py
cd ..
sudo rm autojump -r
cp ./zshrc ~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions


# config tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/thewtex/tmux-mem-cpu-load
cd tmux-mem-cpu-load
cmake .
make
sudo make install 
cd ..
sudo rm tmux-mem-cpu-load -r
sudo package manager xsel
cp tmux.conf ~/.tmux.conf
# prefix + I install
