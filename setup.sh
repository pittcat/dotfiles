#!/usr/bin/env bash
sudo package manager vim vim-gtk vim-gnome zsh tmux git curl python3-pip python-pip silversearcher-ag emacs rsync npm
# inquire word 
sudo pip3 install iSearch
# set up top font
curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash
# remap caps esc
cp ./config/Xmodmap ~/.Xmodmap
sudo sh -c 'echo "xmodmap ~/.Xmodmap" >> /etc/rc.local'

#配置vim vim8 并且须支持python3 javascript
sh -c "$(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)"
sudo package manager build-essential cmake
sudo package manager python-dev python3-dev
cp ./UltiSnips/ ~/.vim/
# install YouCompleteMe
# sudo git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/plugged/YouCompleteMe
# cd ~/.vim/plugged/YouCompleteMe
# git submodule update --init --recursive
# sudo python3 ./install.py --clang-completer
sudo pip3 install yapf flake8 jedi # 格式化 查错 补全
sudo pip install yapf flake8 jedi
sudo package manager ctags 
cp spacevim ~/.spacevim

# web 

# html 
sudo package manager tidy #查错
sudo npm i -g js-beautify #js 和html格式化
# javascript 
sudo npm i -g eslint jslint tern #查错 补全
# vue 
sudo npm i -g eslint-plugin-vue #查错

# config emacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp spacemacs ~/.spacemacs
cp ./snippets/ ~/.emacs.d/private/ -r


# config zsh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo pip3 install thefuck isort
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
# prefix + I install
# git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# cp private ~/.space-vim/ -r
