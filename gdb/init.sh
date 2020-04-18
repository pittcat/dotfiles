#! /usr/bin/env bash

ln -s $pwd/gdbinit ~/.gdbinit
# gui
yay -S qtcreator gede

# cli
pip install --user libtmux pygments
wget -O ~/.gdbdashboard -q https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/master/.gdbinit
wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
wget -O ~/.tgdbinit -q https://raw.githubusercontent.com/pittcat/tgdbdb/master/tgdbinit
