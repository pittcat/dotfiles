#!/usr/bin/env sh
yay -S conky rofi nautilus rofi-greenclip xorg-xprop okular dunst feh betterlockscreen  zeal tdrop-git polybar-git mathpix-snipping-tool

ln -s ../i3 $HOME/.i3
ln -s $PWD/polybar $HOME/.config/    
mkdir -p $HOME/.config/dunst
ln -s $PWD/dunst/dunstrc ~/.config/dunst/dunstrc    
# Notice for polybar:
# change the interface   
# ip route | grep '^default' | awk '{print $5}'    
# module/networkspeeddown    
# interface = ens33 
# ln -s $PWD/i3/dunst $HOME/.config/