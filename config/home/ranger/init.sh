#!/usr/bin/env sh
sudo pacman -S ranger

if [ -d $HOME/.config/ranger/colorschemes ];then
  cp $PWD/colorthemes/bluish.py  $HOME/.config/ranger/colorschemes
else
  mkdir -p $HOME/.config/ranger/colorschemes
  cp $PWD/colorthemes/bluish.py  $HOME/.config/ranger/colorschemes
fi

ln -s $PWD/rc.conf $HOME/.config/ranger/

