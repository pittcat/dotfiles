### aurlist gen
pacman -Qqm >> aurlist

### pkglist gen
pacman -Qqet > pkglist
pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist))
