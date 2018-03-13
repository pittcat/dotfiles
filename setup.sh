#!/usr/bin/env bash
# set package manager
PKMG="package_manager"

## --------------------------------------------must install -------------------------------------------- ##
# common must install 
sudo $PKMG zsh tmux git curl emacs rsync nodejs npm tig cmake ctags xsel
# npm setting
sudo npm config set registry https://registry.npm.taobao.org --global
sudo npm config set disturl https://npm.taobao.org/dist --global
# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

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

# install proxychains-ng 
if hash proxychains4 2> /dev/null; then
  echo proxychains is installed!

else
  git clone https://github.com/rofl0r/proxychains-ng.git
  cd proxychains-ng
  # configure and install 
  ./configure --prefix=/usr --sysconfdir=/etc
  make
  sudo make install
  sudo make install-config # installs /etc/proxychains.conf
  cd ..
  sudo rm proxychains-ng -r
  sudo sed -i "s/.*socks4[[:space:]]*127.0.0.1.*/socks5  127.0.0.1 1080/g" /etc/proxychains.conf
fi

# choose install
ARCH="pacman -S"
DEBIAN="apt install"
if [[ "$PKMG" = "$ARCH"  ]]; then
  sudo $PKMG gvim ctags the_silver_searcher yaourt shadowsocks-qt5  clang-tools-extra
elif [[ "$PKMG"="$DEBIAN" ]]; then
  sudo add-apt-repository ppa:hzwhuang/ss-qt5
  sudo apt-get update
  sudo $PKMG vim-gtk exuberant-ctags silversearcher-ag shadowsocks-qt5 python3-pip python-pip
fi

# --------------------------------------------common config -------------------------------------------- #

# set up top font
curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash

# remap caps esc
cp ./config/Xmodmap ~/.Xmodmap
sudo sh -c 'echo "xmodmap ~/.Xmodmap" >> /etc/rc.local'

# --------------------------------------------vim -------------------------------------------- #


#配置vim vim8 并且须支持python3 javascript
git clone https://github.com/liuchengxu/space-vim.git ~/.space-vim
ln -s $PWD/space-vim/spacevim $HOME/.spacevim
sudo rm $HOME/.space-vim/private/* -r
ln -s $PWD/space-vim/private/* $HOME/.space-vim/private/
ln -s $PWD/space-vim/UltiSnips/* $HOME/.vim/UltiSnips/
ln -s $PWD/space-vim/codesnippets $HOME/.space-vim/layers/+programming
ln -s $PWD/space-vim/codeformat $HOME/.space-vim/layers/+programming
ln -s $PWD/space-vim/autocomplete $HOME/.space-vim/layers/+completion

# config ycmd
# sudo git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/plugged/YouCompleteMe
# cd ~/.vim/plugged/YouCompleteMe
# git submodule update --init --recursive
# sudo python3 ./install.py --clang-completer

# python vim  config and include following config
sudo touch /etc/pip.conf
echo "[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple" | sudo tee /etc/pip.conf
sudo pip3 install -r $PWD/config/python/requirements.txt

# web vim
sudo npm i -g tern
# ale
sudo $PKMG tidy #html
sudo npm i -g eslint jshint #javascript
sudo npm i -g prettier #css

# lsp
sudo npm install -g typescript typescript-language-server     #vim lsp for typescript and javascript
sudo npm install -g vscode-css-languageserver-bin         #vim lsp css scss

#web 格式化
sudo npm i -g html-beautify js-beautify #html格式化
sudo npm i -g prettier   #前端格式化

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
cargo install rustfmt racer
rustup component add rls-preview rust-analysis rust-src
# manual install 

# cd ~/.space-vim
# make vim 

# --------------------------------------------emacs -------------------------------------------- #

# config emacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -s $PWD/pittcat-spacemacs/spacemacs ~/.spacemacs
sudo rm ~/.emacs.d/private/* -r
ln -s $PWD/pittcat-spacemacs/private/* ~/.emacs.d/private

# --------------------------------------------zsh -------------------------------------------- #


# config zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install thefuck
# pip install -r ./config/requirements.txt

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

ln -s $PWD/zshrc ~/.zshrc

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


ln -s $PWD/tmux.conf ~/.tmux.conf

# --------------------------------------------manual operation -------------------------------------------- #

# manual operation

# tmux
# prefix + I install

# zsh
# git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting



