#!/usr/bin/env bash

# zsh-interactive-cd
git clone https://github.com/changyuheng/zsh-interactive-cd  $HOME/.zsh-interactive-cd

# qfc
git clone https://github.com/pindexis/qfc $HOME/.qfc

# has
git clone https://github.com/kdabir/has.git && cd has && sudo make install
cd .. && sudo rm has -r

# trash-cli
git clone https://github.com/andreafrancia/trash-cli.git $HOME/.trash-cli.git
cd $HOME/.trash-cli.git
sudo python setup.py install


# golang config
git clone https://github.com/udhos/update-golang
cd update-golang
sudo ./update-golang.sh

# install direnv
if hash direnv 2> /dev/null; then
  echo direnv is installed!
else
  git clone https://github.com/direnv/direnv
  cd direnv
  make install
  cd ..
  sudo rm direnv -r
fi


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
