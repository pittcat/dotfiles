#!/usr/bin/env bash

sudo pacman -S cgdb
pip install gdbgui --user
ln -s $PWD/cgdbrc ~/.cgdb
# wget -P ~ git.io/.gdbinit
