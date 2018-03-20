#!/usr/bin/env bash
# set package manager
PKMG="package_manager"

## --------------------------------------------must install -------------------------------------------- ##
# common must install 
sudo $PKMG zsh tmux git curl emacs rsync nodejs npm tig cmake ctags xsel privoxy ranger httpie 

# privoxy autostart
sudo sed -i "s/127.0.0.1:9050/127.0.0.1:1080/g;/127.0.0.1:1080/s/^#//g" /etc/privoxy/config
sudo systemctl enable privoxy.service 

# npm setting
sudo npm config set registry https://registry.npm.taobao.org --global
sudo npm config set disturl https://npm.taobao.org/dist --global


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
  sudo $PKMG gvim ctags the_silver_searcher yaourt clang-tools-extra
  source $HOME/.zshrc
  yaourt -S shadowsocks-qt5 direnv
elif [[ "$PKMG"="$DEBIAN" ]]; then
  sudo add-apt-repository ppa:hzwhuang/ss-qt5
  sudo apt-get update
  sudo $PKMG vim-gtk exuberant-ctags silversearcher-ag shadowsocks-qt5 python3-pip python-pip direnv
fi

# --------------------------------------------common config -------------------------------------------- #

# remap caps esc
# cp ./config/Xmodmap ~/.Xmodmap
# sudo sh -c 'echo "xmodmap ~/.Xmodmap" >> /etc/rc.local'

echo "xcape -e 'Caps_Lock=Escape;'" >> $HOME/.profile

# --------------------------------------------zsh -------------------------------------------- #

mkdir -p $HOME/.antigen/
curl -L git.io/antigen > $HOME/.antigen/antigen.zsh


# install thefuck
# pip install -r ./config/requirements.txt

ln -s $PWD/zsh/zshrc ~/.zshrc
ln -s $PWD/zsh/zshaliases ~/.zshaliases
ln -s $PWD/zsh/zshenv ~/.zshenv


