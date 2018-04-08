#!/usr/bin/env bash

# --------------------------------------------zsh and cli-------------------------------------------- #

# install powerline/font
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
# common font
curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash
# Noto Mono for Powerline Bold ---terminal

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install autojump
if hash autojump 2> /dev/null; then
  echo autojump is installed!
else
  sudo $PKMG autojump
  git clone git://github.com/joelthelion/autojump.git
  cd autojump
  ./install.py
  cd ..
  sudo rm autojump -r
fi

# ripgrep
if [ -d /etc/apt ];then
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
  sudo dpkg -i ripgrep_0.8.1_amd64.deb
  rm ripgrep_0.8._amd64.deb
elif [ -d /etc/pacman.d ];then
  sudo pacman -S ripgrep
fi


# has
git clone https://github.com/kdabir/has.git && cd has && sudo make install
cd .. && sudo rm has -r

# trash-cli
git clone https://github.com/andreafrancia/trash-cli.git $HOME/.trash-cli.git
cd $HOME/.trash-cli.git
sudo python setup.py install

# terminmal daily use ------npm
sudo npm install -g $(cat npmdaily | egrep -v "^\s*(#|$)")

# --------------------------------------------dev tools -------------------------------------------- #

# --------------------------------------------vim -------------------------------------------- #


#配置vim vim8 并且须支持python3 javascript
git clone https://github.com/liuchengxu/space-vim.git ~/.space-vim
ln -s $PWD/space-vim/spacevim $HOME/.spacevim
sudo rm $HOME/.space-vim/private/* -r
ln -s $PWD/space-vim/private/* $HOME/.space-vim/private/
mkdir -p $HOME/.vim/UltiSnips/
mkdir -p $HOME/.config/nvim/UltiSnips/
ln -s $PWD/space-vim/UltiSnips/* $HOME/.config/nvim/UltiSnips/
ln -s $PWD/space-vim/UltiSnips/* $HOME/.vim/UltiSnips/
ln -s $PWD/space-vim/codesnippets $HOME/.space-vim/layers/+programming
ln -s $PWD/space-vim/codeformat $HOME/.space-vim/layers/+programming
ln -s $PWD/space-vim/lsp $HOME/.space-vim/layers/+programming
ln -s $PWD/space-vim/lspc $HOME/.space-vim/layers/+programming
ln -s $PWD/space-vim/autocomplete $HOME/.space-vim/layers/+completion

# config ycmd
# sudo git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/plugged/YouCompleteMe
# cd ~/.vim/plugged/YouCompleteMe
# git submodule update --init --recursive
# sudo python3 ./install.py --clang-completer
# manual install 

# cd ~/.space-vim
# make vim 

# --------------------------------------------emacs -------------------------------------------- #

# config emacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -s $PWD/pittcat-spacemacs/spacemacs ~/.spacemacs
sudo rm ~/.emacs.d/private/* -r
ln -s $PWD/pittcat-spacemacs/private/* ~/.emacs.d/private

# --------------------------------------------tmux -------------------------------------------- #


# config tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/thewtex/tmux-mem-cpu-load
cd tmux-mem-cpu-load
cmake .
make
sudo make install 
cd ..
sudo rm tmux-mem-cpu-load -r

netcard=$( cat tmux.conf| grep 'set -g @net_speed_interfaces')
sed -i "s/^set -g @net_speed_interfaces.*/${netcard}/g" tmux.conf
ln -s $PWD/tmux.conf ~/.tmux.conf

# --------------------------------------------manual operation -------------------------------------------- #

# manual operation

# tmux
# prefix + I install

# --------------------------------------------lang -------------------------------------------- #



# python vim  config and include following config
sudo touch /etc/pip.conf
echo "[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple" | sudo tee /etc/pip.conf
source $HOME/.zshrc
sudo pip3 install -r $PWD/config/python/requirements.txt


