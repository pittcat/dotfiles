#!/usr/bin/env sh
if hash trizen 2>/dev/null; then
  trizen -S nvim-qt
fi
ln -s $PWD/ginit.vim $HOME/.config/nvim/
