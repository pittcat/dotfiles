#!/usr/bin/env bash

sudo pacman -S cgdb
pip install gdbgui --user
ln -s $PWD/cgdbrc ~/.cgdb
# wget -P ~ git.io/.gdbinit

wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
sudo cp $PWD/gef /usr/local/bin
sudo chmod 777 /usr/local/bin/gef
