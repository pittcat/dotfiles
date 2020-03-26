# zsh
git clone https://github.com/zsh-users/antigen.git ~/.antigen

# gtags
sudo mkdir -p /usr/local/share/gtags
sudo cp $PWD/gtags.conf /usr/local/share/gtags

# cgdb

wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
mkdir -p ~/.cgdb

#Image
mkdir -p ~/Image

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# pudb
mkdir -p ~/.config/pudb
ln -s $PWD/pudb.cfg ~/.config/pudb
