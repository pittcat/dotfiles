#!/usr/bin/env sh
yay -S conky rofi nautilus rofi-greenclip xorg-xprop okular dunst feh betterlockscreen  zeal tdrop-git polybar-git mathpix-snipping-tool sgtk-menu xprop wmctrl slop \
betterlockscreen sgtk-menu wmfocus autotiling


# Notice for polybar:
# change the interface   
# ip route | grep '^default' | awk '{print $5}'    
# module/networkspeeddown    
# interface = ens33 
# ln -s $PWD/i3/dunst $HOME/.config/
