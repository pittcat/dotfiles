#! /usr/bin/env bash

yay -S lldb
git clone https://github.com/snare/voltron

./install.sh -b lldb
cd ..
sudo rm -r voltron

pip install --user tmuxp
