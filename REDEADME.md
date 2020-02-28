### aurlist gen
pacman -Qqm > aurlist

### pkglist gen
pacman -Qqet > pkglist
pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist))


### remove
xf86-input-vmmouse
xf86-video-intel
xf86-video-vmware
