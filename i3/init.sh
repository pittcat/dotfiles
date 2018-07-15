#!/usr/bin/env sh
sudo trizen -S conky rofi nautilus fcitx google-chrome rofi-greenclip xorg-xprop okular polybar dunst feh betterlockscreen  zeal

ln -s $PWD/i3 $HOME/.i3
ln -s $PWD/polybar $HOME/.config/    
ln -s $PWD/i3/dunst/dunstrc ~/.config/dunst/dunstrc    
# Notice for polybar:
# change the interface   
# ip route | grep '^default' | awk '{print $5}'    
# module/networkspeeddown    
# interface = ens33 
ln -s $PWD/i3/dunst $HOME/.config/
