### aurlist gen
pacman -Qqm > aurlist

### pkglist gen
pacman -Qqet > pkglist
pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist))


### 实体机需要删除的软件包
xf86-input-vmmouse
xf86-video-vmware

### 实体机需要多装的软件包

蓝牙:[Blueberry](https://wiki.archlinux.org/index.php/Bluetooth)

网络:[networkmanager](https://wiki.archlinux.org/index.php/NetworkManager#Installation)

### 需要初始化的lang

```
cfamily
bash
rust 
python 
web
```
### 输入法初始化
- 安装fcitx-rime
- 将 https://gitlab.com/pittcat/rime-dict的文件复制到~/.config/fcitx/rime
