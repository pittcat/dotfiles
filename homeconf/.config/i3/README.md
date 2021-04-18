###  Notice for polybar:
 change the interface   
 ip route | grep '^default' | awk '{print $5}'    
 module/networkspeeddown    
 interface = ens33 
 ln -s $PWD/i3/dunst $HOME/.config/

### Thuna

add snippets
```
[Desktop Entry]
_Name=Thunar File Manager
_Comment=Browse the filesystem with the file manager
_GenericName=File Manager
Exec=thunar %F
Icon=Thunar
Terminal=false
StartupNotify=true
Type=Application
Categories=System;Utility;Core;GTK;FileTools;FileManager;

# vi:set encoding=UTF-8:
```
to /home/pittcat/.local/share/applications/Thunar.desktop
