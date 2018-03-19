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

# tldr
npm install -g tldr

# --------------------------------------------dev tools -------------------------------------------- #

# web tools
sudo npm install -g browser-sync live-server

# --------------------------------------------lang -------------------------------------------- #



# python vim  config and include following config
sudo touch /etc/pip.conf
echo "[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple" | sudo tee /etc/pip.conf
sudo pip3 install -r $PWD/config/python/requirements.txt

# web
#  vim setting
# autocomplete
sudo npm i -g tern
# ale
sudo $PKMG tidy #html
sudo npm i -g eslint jshint #javascript
sudo npm i -g prettier #css
#web 格式化
sudo npm i -g html-beautify js-beautify #html格式化
sudo npm i -g prettier   #前端格式化

# lsp
sudo npm install -g typescript typescript-language-server     #vim lsp for typescript and javascript
sudo npm install -g vscode-css-languageserver-bin         #vim lsp css scss

# rust
# install rust
# curl -sf -L https://static.rust-lang.org/rustup.sh | sh
curl https://sh.rustup.rs -sSf | sh
source $HOME/.bashrc
# rust china mirrors
mkdir -p $HOME/.cargo
echo "[source.crates-io]
registry = 'https://github.com/rust-lang/crates.io-index'
replace-with = 'ustc'
[source.ustc]
registry = 'git://mirrors.ustc.edu.cn/crates.io-index'" >>$HOME/.cargo/config

# vim setting
# complete  format check
cargo install rustfmt racer  
# lsp
rustup component add rls-preview rust-analysis rust-src 


# golang 
git clone https://github.com/udhos/update-golang
cd update-golang
sudo ./update-golang.sh


# install direnv  for zsh and cli
if hash direnv 2> /dev/null; then
  echo direnv is installed!
else
  git clone https://github.com/direnv/direnv
  cd direnv
  make install
  cd ..
  sudo rm direnv -r
fi


# rbenv and ruby

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# 用来编译安装 ruby
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
# 用来管理 gemset, 可选, 因为有 bundler 也没什么必要
git clone git://github.com/jamis/rbenv-gemset.git  ~/.rbenv/plugins/rbenv-gemset
# 通过 rbenv update 命令来更新 rbenv 以及所有插件, 推荐
git clone git://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
# 使用 Ruby China 的镜像安装 Ruby, 国内用户推荐
git clone git://github.com/AndorChen/rbenv-china-mirror.git ~/.rbenv/plugins/rbenv-china-mirror
# change mirrors to tuna
gem update --system
gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/

# vim setting
# autocomplete
gem install solargraph
pip install solargraph-utils.py --user
yard gems 
yard config --gem-install-yri
# ale and neoformat
gem install rubocop     

