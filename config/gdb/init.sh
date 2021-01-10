#! /usr/bin/env bash

ln -s $pwd/gdbinit ~/.gdbinit
# gui
yay -S qtcreator gede

# cli
pip install --user pygments
wget -O ~/.gdbdashboard -q https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/master/.gdbinit
wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
wget -O ~/.tgdbinit -q https://raw.githubusercontent.com/pittcat/tgdbdb/master/tgdbinit
sudo wget -O /usr/local/bin/tgdb https://raw.githubusercontent.com/ficoos/tgdbdb/master/tgdb
sudo chmod 777 /usr/local/bin/tgdb
