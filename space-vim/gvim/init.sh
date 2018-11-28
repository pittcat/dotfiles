#!/usr/bin/env sh
if hash yay 2>/dev/null; then
  yay -S nvim-qt
fi
ln -s $PWD/ginit.vim $HOME/.config/nvim/
