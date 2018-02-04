#!/usr/bin/env bash
# must install 
sudo package manager gvim zsh tmux git curl emacs rsync npm tig cmake ctags
# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install proxychains-ng 
git clone https://github.com/rofl0r/proxychains-ng.git
cd proxychains-ng
# configure and install 
./configure --prefix=/usr --sysconfdir=/etc
make
sudo make install
sudo make install-config # installs /etc/proxychains.conf
sudo sed -i "s/.*socks4[[:space:]]*127.0.0.1.*/socks5  127.0.0.1 1080/g" /etc/proxychains.conf

# set up top font
curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash

# remap caps esc
cp ./config/Xmodmap ~/.Xmodmap
sudo sh -c 'echo "xmodmap ~/.Xmodmap" >> /etc/rc.local'

#配置vim vim8 并且须支持python3 javascript
git clone https://github.com/liuchengxu/space-vim.git ~/.space-vim
cp ./space-vim/spacevim ~/.spacevim
cp ./space-vim/private ~/.space-vim/ -r
cp ./UltiSnips/ ~/.vim/

# by manual
# cd ~/.space-vim
# make vim 

# config ycmd
# sudo git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/plugged/YouCompleteMe
# cd ~/.vim/plugged/YouCompleteMe
# git submodule update --init --recursive
# sudo python3 ./install.py --clang-completer

# python vim  config and include following config
sudo pip install -r ./config/requirements.txt

# web vim

# html 
sudo package manager tidy #查错
sudo npm i -g js-beautify #js 和html格式化
# javascript 
sudo npm i -g eslint jslint tern #查错 补全
# vue 
sudo npm i -g eslint-plugin-vue #查错

# config emacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp ./pittcat-spacemacs/spacemacs ~/.spacemacs
cp ./pittcat-spacemacs/private ~/.emacs.d/ -r


# config zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install thefuck
# pip install -r ./config/requirements.txt

# install autojump
sudo package manager autojump
git clone git://github.com/joelthelion/autojump.git
cd autojump
./install.py
cd ..
sudo rm autojump -r

cp ./zshrc ~/.zshrc


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

# manual operation

# tmux
# prefix + I install

# zsh
# git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

 # must install 
# silversearcher-ag 

# desktop
sudo package manager plank chromium

# plank 
cp ./config/autostart/plank.desktop ~/.config/autostart/


