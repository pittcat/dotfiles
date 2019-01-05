#!/usr/bin/env sh
yay -S conky rofi nautilus fcitx google-chrome rofi-greenclip xorg-xprop okular dunst feh betterlockscreen  zeal tdrop-git polybar-git i3-git fcitx-rime fcitx-configtool fcitx-im

ln -s $PWD/i3 $HOME/.i3
ln -s $PWD/i3/polybar $HOME/.config/    
mkdir -p $HOME/.config/dunst
ln -s $PWD/i3/dunst/dunstrc ~/.config/dunst/dunstrc    
# Notice for polybar:
# change the interface   
# ip route | grep '^default' | awk '{print $5}'    
# module/networkspeeddown    
# interface = ens33 
# ln -s $PWD/i3/dunst $HOME/.config/
