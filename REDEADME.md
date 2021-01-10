

## 安装步骤
### 安装常用的软件包
1. sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist))
2. yay -S --needed $(comm -12 <(pacman -Slq | sort) <(sort aurlist))
3. 初始化vim zsh tmux i3wm 等等
bash setup.sh
stow homeconf tmux zsh

4.  初始化一些语言的包

需要初始化的lang:

```
cfamily
bash
rust 
python 
web
```


### 实体机需要删除的软件包
xf86-input-vmmouse
xf86-video-vmware

### 实体机需要多装的软件包

蓝牙:[Blueberry](https://wiki.archlinux.org/index.php/Bluetooth)

网络:[networkmanager](https://wiki.archlinux.org/index.php/NetworkManager#Installation)

### 输入法初始化
- 将 /config/rime-dict的文件复制到~/.local/share/fcitx5/rime


## aurlist pkglist gen
pacman -Qqm > aurlist

pacman -Qqet > pkglist

