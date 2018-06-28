## Requirements
   * conky
   * rofi -->switcher
   * nautilus --> file manager
   * fcitx
   * google-chrome-stable
   * greenclip
   * xorg-xprop
   * okular
   * polybar
   * dunst
   * feh
   * betterlockscreen
## Config
  
   * ln -s $PWD/i3 $HOME/.i3
   * ln -s $PWD/polybar $HOME/.config/    
   * ln -s $PWD/i3/dunst/dunstrc ~/.config/dunst/dunstrc    
   * Notice for polybar:
   change the interface   
   ip route | grep '^default' | awk '{print $5}'    
   [module/networkspeeddown]<br/>
   interface = ens33 <br/>
   * ln -s $PWD/i3/dunst $HOME/.config/
