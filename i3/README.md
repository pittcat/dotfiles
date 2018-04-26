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
## Config
  
   * ln -s $PWD/i3 $HOME/.i3
   * ln -s $PWD/polybar $HOME/.config/polybar<br/>
   * Notice for polybar:
   change the interface<br/>
   ip route | grep '^default' | awk '{print $5}'<br/>
   [module/networkspeeddown]<br/>
   interface = ens33 <br/>
