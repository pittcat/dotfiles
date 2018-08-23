#!/usr/bin/env bash

git clone https://aur.archlinux.org/trizen.git
cd trizen
makepkg -si
# --------------------------------------------zsh and cli-------------------------------------------- #

# install powerline/font
# clone
# git clone https://github.com/powerline/fonts.git --depth=1
# cd fonts
# ./install.sh ## install
# cd ..
# rm -rf fonts  ## # clean-up a bit
# curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash    ## common font
# Noto Mono for Powerline Bold ---terminal

  
trizen -S  otf-fira-code-git
# bat  ripgrep
sudo pacman -S bat ripgrep

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

# tags

trizen -S universal-ctags-git cscope global
pip install pygments --user
mkdir -p ~/.ctags.d/
ln -s $PWD/config/ctags ~/.ctags.d/.ctags


# has
git clone https://github.com/kdabir/has.git && cd has && sudo make install
cd .. && sudo rm has -r

# trash-cli
git clone https://github.com/andreafrancia/trash-cli.git $HOME/.trash-cli.git
cd $HOME/.trash-cli.git
sudo python setup.py install
cd -
# --------------------------------------------dev tools -------------------------------------------- #

# --------------------------------------------vim -------------------------------------------- #


#配置vim vim8 并且须支持python3 javascript
git clone -b dotfiles https://github.com/pittcat/space-vim.git ~/.space-vim
ln -s $PWD/space-vim/spacevim $HOME/.spacevim
sudo rm $HOME/.space-vim/private/* -r
ln -s $PWD/space-vim/private/* $HOME/.space-vim/private/
ln -s $PWD/space-vim/UltiSnips/ $HOME/.config/nvim/
ln -s $PWD/space-vim/UltiSnips/ $HOME/.vim/
# cd ~/.space-vim
# make vim 

# --------------------------------------------emacs -------------------------------------------- #

# config emacs
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
# ln -s $PWD/pittcat-spacemacs/spacemacs ~/.spacemacs
# sudo rm ~/.emacs.d/private/* -r
# ln -s $PWD/pittcat-spacemacs/private/* ~/.emacs.d/private

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
ln -s $PWD/tmux/tmux.conf ~/.tmux.conf

# --------------------------------------------manual operation -------------------------------------------- #

# manual operation

# tmux
# prefix + I install

# --------------------------------------------lang -------------------------------------------- #

# python
# pip install 'python-language-server[all]' --user
# rust

# terminmal daily use ------npm
# sudo npm install -g $(cat npmdaily | egrep -v "^\s*(#|$)")

