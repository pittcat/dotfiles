#!/usr/bin/env bash

# zsh
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/supercrabtree/k $HOME/.oh-my-zsh/custom/plugins/k

# bd
mkdir -p $HOME/.zsh/plugins/bd
curl https://raw.githubusercontent.com/Tarrasch/zsh-bd/master/bd.zsh > $HOME/.zsh/plugins/bd/bd.zsh

# up
curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh

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

