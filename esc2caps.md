## add snippets to /etc/X11/xorg.conf.d/00-keyboard.conf 
Section "InputClass"
        Identifier      "system-keyboard"
        MatchIsKeyboard     "on"
        Option          "XkbLayout" "us"
        Option          "XkbModel"  "pc104"
        Option          "XkbOptions" "caps:swapescape"
EndSection  